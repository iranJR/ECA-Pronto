<?php
/**
 * Created by PhpStorm.
 * User: aluno
 * Date: 13/09/2018
 * Time: 17:34
 */

require_once "classes/template.php";

require_once "dao/familyBagDAO.php";
require_once "classes/familyBag.php";

$object = new familyBagDAO();

$template = new Template();

$template->header();
$template->sidebar();
$template->mainpanel();

// Verificar se foi enviando dados via POST

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = (isset($_POST["id"]) && $_POST["id"] != null) ? $_POST["id"] : "";
    $str_reference_month = (isset($_POST["str_reference_month"]) && $_POST["str_reference_month"] != null) ? $_POST["str_reference_month"] : "";
    $str_reference_year = (isset($_POST["str_reference_year"]) && $_POST["str_reference_year"] != null) ? $_POST["str_reference_year"] : "";
    $str_competence_month = (isset($_POST["str_competence_month"]) && $_POST["str_competence_month"] != null) ? $_POST["str_competence_month"] : "";
    $str_competence_year = (isset($_POST["str_competence_year"]) && $_POST["str_competence_year"] != null) ? $_POST["str_competence_year"] : "";
    $dt_date = (isset($_POST["dt_date"]) && $_POST["dt_date"] != null) ? $_POST["dt_date"] : "";
    $db_value = (isset($_POST["db_value"]) && $_POST["db_value"] != null) ? $_POST["db_value"] : "";
    $tb_beneficiaries_id_beneficiaries = (isset($_POST["tb_beneficiaries_id_beneficiaries"]) && $_POST["tb_beneficiaries_id_beneficiaries"] != null) ? $_POST["tb_beneficiaries_id_beneficiaries"] : "";
    $tb_city_id_city = (isset($_POST["tb_city_id_city"]) && $_POST["tb_city_id_city"] != null) ? $_POST["tb_city_id_city"] : "";

} elseif (!isset($id)) {
    // Se não se não foi setado nenhum valor para variável $id
    $id = (isset($_GET["id"]) && $_GET["id"] != null) ? $_GET["id"] : "";
    $str_reference_month = null;
    $str_reference_year = null;
    $str_competence_month = null;
    $str_competence_year = null;
    $dt_date = null;
    $db_value = null;
    $tb_beneficiaries_id_beneficiaries = null;
    $tb_city_id_city = null;

}

if (isset($_REQUEST["act"]) && $_REQUEST["act"] == "upd" && $id != "") {

    $familyBag =  new familyBag($id, '','','','','', '','','');

    $resultado = $object->atualizar($familyBag);
    $str_reference_month = $resultado->getStrReferenceMonth();
    $str_reference_year = $resultado->getStrReferenceYear();
    $str_competence_month = $resultado->getStrCompetenceMonth();
    $str_competence_year = $resultado->getStrCompetenceYear();
    $dt_date = $resultado->getDtDate();
    $db_value = $resultado->getDbValue();
    $tb_beneficiaries_id_beneficiaries = $resultado->getTbBeneficiariesIdBeneficiaries();
    $tb_city_id_city = $resultado->getTbCityIdCity();
}

if (isset($_REQUEST["act"]) && $_REQUEST["act"] == "save" && $str_reference_month != "" && $str_reference_year != "" && $str_competence_month != "" && $str_competence_year != "" && $dt_date != "" && $db_value != "" && $tb_beneficiaries_id_beneficiaries != "" && $tb_city_id_city != ""){
    $familyBag =  new familyBag($id, $str_reference_month, $str_reference_year, $str_competence_month, $str_competence_year, $dt_date, $db_value, $tb_beneficiaries_id_beneficiaries, $tb_city_id_city);

    $msg = $object->salvar($familyBag);
    $id = null;
    $str_reference_month = null;
    $str_reference_year = null;
    $str_competence_month = null;
    $str_competence_year = null;
    $dt_date = null;
    $db_value = null;
    $tb_beneficiaries_id_beneficiaries = null;
    $tb_city_id_city = null;

}

if (isset($_REQUEST["act"]) && $_REQUEST["act"] == "del" && $id != "") {
    $familyBag =  new familyBag($id,'','','','','', '', '', '');
    $msg = $object->remover($familyBag);
    $id = null;
}

?>

<div class='content' xmlns="http://www.w3.org/1999/html">
    <div class='container-fluid'>
        <div class='row'>
            <div class='col-md-12'>
                <div class='card'>
                    <div class='header'>
                        <h4 class='title'>Family Bag</h4>
                        <p class='category'>List of Family Bag of the system</p>

                    </div>
                    <div class='content table-responsive'>

                        <form action="?act=save&id=" method="POST" name="form1">

                            <input type="hidden" name="id" value="<?php
                            // Preenche o id no campo id com um valor "value"
                            echo (isset($id) && ($id != null || $id != "")) ? $id : '';
                            ?>"/>
                            Reference Month:
                            <input class="form-control" type="text" name="str_reference_month" value="<?php
                            // Preenche o nome no campo nome com um valor "value"
                            echo (isset($str_reference_month) && ($str_reference_month != null || $str_reference_month != "")) ? $str_reference_month : '';
                            ?>"/>
                            <br/>
                            Reference Year:
                            <input class="form-control" type="text" name="str_reference_year" placeholder="Enter numbers only" value="<?php
                            // Preenche o sigla no campo sigla com um valor "value"
                            echo (isset($str_reference_year) && ($str_reference_year != null || $str_reference_year != "")) ? $str_reference_year : '';
                            ?>"/>
                            Competence Month:
                            <input class="form-control" type="text" name="str_competence_month" value="<?php
                            // Preenche o nome no campo nome com um valor "value"
                            echo (isset($str_competence_month) && ($str_competence_month != null || $str_competence_month != "")) ? $str_competence_month : '';
                            ?>"/>
                            <br/>
                            Competence Year:
                            <input class="form-control" type="text" name="str_competence_year" placeholder="Enter numbers only" value="<?php
                            // Preenche o sigla no campo sigla com um valor "value"
                            echo (isset($str_competence_year) && ($str_competence_year != null || $str_competence_year != "")) ? $str_competence_year : '';
                            ?>"/>
                            Date:
                            <input class="form-control" type="date" name="dt_date" value="<?php
                            // Preenche o sigla no campo sigla com um valor "value"
                            echo (isset($dt_date) && ($dt_date != null || $dt_date != "")) ? $dt_date : '';
                            ?>"/>
                            Value:
                            <input class="form-control" type="text" name="db_value" value="<?php
                            // Preenche o sigla no campo sigla com um valor "value"
                            echo (isset($db_value) && ($db_value != null || $db_value != "")) ? $db_value : '';
                            ?>"/>

                            Beneficiaries:
                            <select class="form-control" name="tb_beneficiaries_id_beneficiaries">
                                <?php
                                $query = "SELECT * FROM tb_beneficiaries order by str_name_person;";
                                $statement = $pdo->prepare($query);
                                if ($statement->execute()) {
                                    $result = $statement->fetchAll(PDO::FETCH_OBJ);
                                    foreach ($result as $rs) {
                                        if ($rs->id_beneficiaries == $tb_beneficiaries_id_beneficiaries) {
                                            echo "<option value='$rs->id_beneficiaries' selected>$rs->str_name_person</option>";
                                        } else {
                                            echo "<option value='$rs->id_beneficiaries'>$rs->str_name_person</option>";
                                        }
                                    }
                                } else {
                                    throw new PDOException("<script> alert('Não foi possível executar a declaração SQL !'); </script>");
                                }
                                ?>
                            </select>
                            <br/>

                            City:
                            <select class="form-control" name="tb_city_id_city">
                                <?php
                                $query = "SELECT * FROM tb_city order by str_name_city;";
                                $statement = $pdo->prepare($query);
                                if ($statement->execute()) {
                                    $result = $statement->fetchAll(PDO::FETCH_OBJ);
                                    foreach ($result as $rs) {
                                        if ($rs->id_city == $tb_city_id_city) {
                                            echo "<option value='$rs->id_city' selected>$rs->str_name_city</option>";
                                        } else {
                                            echo "<option value='$rs->id_city'>$rs->str_name_city</option>";
                                        }
                                    }
                                } else {
                                    throw new PDOException("<script> alert('Não foi possível executar a declaração SQL !'); </script>");
                                }
                                ?>
                            </select>
                            <br/>

                            <input class="btn btn-success" type="submit" value="REGISTER">
                            <hr>
                        </form>


                        <?php
                        echo (isset($msg) && ($msg != null || $msg != "")) ? $msg : '';
                        //chamada a paginação
                        $object->tabelapaginada();

                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
$template->footer();
?>
