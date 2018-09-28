<?php
/**
 * Created by PhpStorm.
 * User: aluno
 * Date: 10/09/2018
 * Time: 21:17
 */

require_once ("db/connection.php");
require_once ("classes/familyBag.php");

class familyBagDAO
{

    public function remover($familyBag)
    {
        global $pdo;
        try{
            $statement = $pdo->prepare("DELETE FROM  tb_family_bag WHERE id_family_bag = :id");
            $statement->bindValue(":id", $familyBag->getIdFamilyBag());
            if ($statement->execute()) {
                return "<script> alert('Registro foi excluido com exito !'); </script>";
            }else {
                throw new PDOException("<script> alert('Não foi possivel executar a declaração SQL !');</script>");
            }
        }catch (PDOException $erro) {
            return "Erro: " . $erro->getMessage();
        }
    }

    public function salvar($familyBag)
    {
        global $pdo;
        try{
            if ($familyBag->getIdFamilyBag() != "") {
                $statement = $pdo->prepare("UPDATE tb_family_bag SET str_reference_month=:str_reference_month, str_reference_year=:str_reference_year, str_competence_month=:str_competence_month, str_competence_year=:str_competence_year, dt_date=:dt_date, db_value=:db_value, tb_beneficiaries_id_beneficiaries=:tb_beneficiaries_id_beneficiaries, tb_city_id_city=:tb_city_id_city WHERE id_family_bag = :id ;");
                $statement->bindValue(":id", $familyBag->getIdFamilyBag());
            } else{
                $statement = $pdo->prepare("INSERT INTO tb_family_bag (str_reference_month, str_reference_year, str_competence_month, str_competence_year, db_value, dt_date, tb_beneficiaries_id_beneficiaries, tb_city_id_city) VALUES (:str_reference_month, :str_reference_year, :str_competence_month, :str_competence_year, :db_value, :dt_date, :tb_beneficiaries_id_beneficiaries, :tb_city_id_city)");
            }

            $statement->bindValue(":str_reference_month", $familyBag->getStrReferenceMonth());
            $statement->bindValue(":str_reference_year", $familyBag->getStrReferenceYear());
            $statement->bindValue(":str_competence_month", $familyBag->getStrCompetenceMonth());
            $statement->bindValue(":str_competence_year", $familyBag->getStrCompetenceYear());
            $statement->bindValue(":db_value", $familyBag->getDbValue());
            $statement->bindValue(":dt_date", $familyBag->getDtDate());
            $statement->bindValue(":tb_beneficiaries_id_beneficiaries", $familyBag->getTbBeneficiariesIdBeneficiaries());
            $statement->bindValue(":tb_city_id_city", $familyBag->getTbCityIdCity());

            if ($statement->execute()) {
                if ($statement->rowCount() > 0) {
                    return "<script> alert('Dados cadastrados com sucesso! ');</script>";
                }else {
                    return "<script> alert('Erro ao tentar efetivar cadastro! ');</script>";
                }
            }else {
                throw new PDOException("<script> alert('Não foi possível executar a declaração SQL !'); </script>");
            }
        }catch (PDOException $erro) {
            return "Erro: " . $erro->getMessage();
        }
    }

    public function atualizar($familyBag)
    {
        global $pdo;
        try {
            $statement = $pdo->prepare("SELECT id_family_bag, str_reference_month, str_reference_year, str_competence_month, str_competence_year, db_value, dt_date, tb_beneficiaries_id_beneficiaries, tb_city_id_city FROM tb_family_bag WHERE id_family_bag = :id");
            $statement->bindValue(":id", $familyBag->getIdFamilyBag());
            if ($statement->execute()) {
                $rs = $statement->fetch(PDO::FETCH_OBJ);
                $familyBag->setIdFamilyBag($rs->id_family_bag);
                $familyBag->setStrReferenceMonth($rs->str_reference_month);
                $familyBag->setStrReferenceYear($rs->str_reference_year);
                $familyBag->setStrCompetenceMonth($rs->str_competence_month);
                $familyBag->setStrCompetenceYear($rs->str_competence_year);
                $familyBag->setDbValue($rs->db_value);
                $familyBag->setDtDate($rs->dt_date);
                $familyBag->setTbBeneficiariesIdBeneficiaries($rs->tb_beneficiaries_id_beneficiaries);
                $familyBag->setTbCityIdCity($rs->tb_city_id_city);

                return $familyBag;
            }else {
                throw new PDOException("<script> alert('Não foi possível executar a declaração SQL !'); </script>");
            }
        }catch (PDOException $erro) {
            return "Erro: " . $erro->getMessage();
        }
    }

    public function tabelapaginada()
    {
        //carrega o banco
        global $pdo;

        //endereço atual da página
        $endereco = $_SERVER ['PHP_SELF'];

        /* Constantes de configuração */
        define('QTDE_REGISTROS', 10);
        define('RANGE_PAGINAS', 2);

        /* Recebe o número da página via parâmetro na URL */
        $pagina_atual = (isset($_GET['page']) && is_numeric($_GET['page'])) ? $_GET['page'] : 1;

        /* Calcula a linha inicial da consulta */
        $linha_inicial = ($pagina_atual - 1) * QTDE_REGISTROS;

        /* Instrução de consulta para paginação com MySQL */
        $sql = "SELECT id_family_bag, str_reference_month, str_reference_year, str_competence_month, str_competence_year, db_value, dt_date, tb_beneficiaries_id_beneficiaries, tb_city_id_city FROM tb_family_bag LIMIT {$linha_inicial}, " . QTDE_REGISTROS;
        $statement = $pdo->prepare($sql);
        $statement->execute();
        $dados = $statement->fetchAll(PDO::FETCH_OBJ);

        /* Conta quantos registos existem na tabela */
        $sqlContador = "SELECT COUNT(*) AS total_registros FROM tb_family_bag";
        $statement = $pdo->prepare($sqlContador);
        $statement->execute();
        $valor = $statement->fetch(PDO::FETCH_OBJ);

        /* Idêntifica a primeira página */
        $primeira_pagina = 1;

        /* Cálcula qual será a última página */
        $ultima_pagina = ceil($valor->total_registros / QTDE_REGISTROS);

        /* Cálcula qual será a página anterior em relação a página atual em exibição */
        $pagina_anterior = ($pagina_atual > 1) ? $pagina_atual - 1 : 0;

        /* Cálcula qual será a pŕoxima página em relação a página atual em exibição */
        $proxima_pagina = ($pagina_atual < $ultima_pagina) ? $pagina_atual + 1 : 0;

        /* Cálcula qual será a página inicial do nosso range */
        $range_inicial = (($pagina_atual - RANGE_PAGINAS) >= 1) ? $pagina_atual - RANGE_PAGINAS : 1;

        /* Cálcula qual será a página final do nosso range */
        $range_final = (($pagina_atual + RANGE_PAGINAS) <= $ultima_pagina) ? $pagina_atual + RANGE_PAGINAS : $ultima_pagina;

        /* Verifica se vai exibir o botão "Primeiro" e "Pŕoximo" */
        $exibir_botao_inicio = ($range_inicial < $pagina_atual) ? 'mostrar' : 'esconder';

        /* Verifica se vai exibir o botão "Anterior" e "Último" */
        $exibir_botao_final = ($range_final > $pagina_atual) ? 'mostrar' : 'esconder';

        if (!empty($dados)):
            echo "
            <table class='table table-striped table-bordered'>
            <thead>
            <th style='text-align: center; font-weight: bolder;'>Code</th>
            <th style='text-align: center; font-weight: bolder;'>Reference Month</th>
            <th style='text-align: center; font-weight: bolder;'>Reference Year</th>
            <th style='text-align: center; font-weight: bolder;'>Competence Month</th>
            <th style='text-align: center; font-weight: bolder;'>Competence Year</th>
            <th style='text-align: center; font-weight: bolder;'>Value</th>
            <th style='text-align: center; font-weight: bolder;'>Date</th>
            <th style='text-align: center; font-weight: bolder;'>Beneficiaries</th>
            <th style='text-align: center; font-weight: bolder;'>City</th>
            <th style='text-align: center; font-weight: bolder;' colspan='2'>Actions</th>
            </thead>
            <tbody>";
            foreach ($dados as $family):
                echo "<tr>
                    <td style='text-align: center'>$family->id_family_bag</td> 
                    <td style='text-align: center'>$family->str_reference_month</td> 
                    <td style='text-align: center'>$family->str_reference_year</td>
                    <td style='text-align: center'>$family->str_competence_month</td> 
                    <td style='text-align: center'>$family->str_competence_year</td> 
                    <td style='text-align: center'>$family->db_value</td>
                    <td style='text-align: center'>$family->dt_date</td>  
                    <td style='text-align: center'>$family->tb_beneficiaries_id_beneficiaries</td> 
                    <td style='text-align: center'>$family->tb_city_id_city</td> 
                    <td style='text-align: center'><a href='?act=upd&id=$family->id_family_bag' title='Alterar'><i class='ti-reload'></i></a></td>
                    <td style='text-align: center'><a href='?act=del&id=$family->id_family_bag' title='Remover'><i class='ti-close'></i></a></td>
                    </tr>";
            endforeach;
            echo "
              </tbody> 
                    </table>
                    
                    <div class='box-paginacao' style='text-align: center'>
                    <a class='box-navegacao  $exibir_botao_inicio' href='$endereco?page=$primeira_pagina' title='Primeira Página'> FIRST  |</a>
                    <a class='box-navegacao  $exibir_botao_inicio' href='$endereco?page=$pagina_anterior' title='Página Anterior'> PREVIOUS  |</a>
              ";

            /* Loop para montar a páginação central com os números */
            for ($i =$range_inicial; $i <= $range_final; $i++):
                $destaque = ($i == $pagina_atual) ? 'destaque' : '';
                echo "<a class='box-numero $destaque' href='$endereco?page=$i'> ( $i ) </a>";
            endfor;

            echo "<a class='box-navegacao $exibir_botao_final' href='$endereco?page=$proxima_pagina' title='Próxima Página'>| NEXT  </a>
                  <a class='box-navegacao $exibir_botao_final' href='$endereco?page=$ultima_pagina'  title='Última Página'>| LAST  </a>
                  
         </div>";

        else:
            echo "<p class='bg-danger'>Nenhum registro foi encontrado!</p>
        ";
        endif;

    }

}