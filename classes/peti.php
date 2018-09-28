<?php
/**
 * Created by PhpStorm.
 * User: aluno
 * Date: 10/09/2018
 * Time: 19:55
 */

class peti
{

    private $id_peti;
    private $str_month;
    private $str_year;
    private $db_value;
    private $str_situation;
    private $tb_beneficiaries_id_beneficiaries;
    private $tb_city_id_city;

    /**
     * peti constructor.
     * @param $id_peti
     * @param $str_month
     * @param $str_year
     * @param $db_value
     * @param $str_situation
     * @param $tb_beneficiaries_id_beneficiaries
     * @param $tb_city_id_city
     */
    public function __construct($id_peti, $str_month, $str_year, $db_value, $str_situation, $tb_beneficiaries_id_beneficiaries, $tb_city_id_city)
    {
        $this->id_peti = $id_peti;
        $this->str_month = $str_month;
        $this->str_year = $str_year;
        $this->db_value = $db_value;
        $this->str_situation = $str_situation;
        $this->tb_beneficiaries_id_beneficiaries = $tb_beneficiaries_id_beneficiaries;
        $this->tb_city_id_city = $tb_city_id_city;
    }

    /**
     * @return mixed
     */
    public function getIdPeti()
    {
        return $this->id_peti;
    }

    /**
     * @param mixed $id_peti
     */
    public function setIdPeti($id_peti): void
    {
        $this->id_peti = $id_peti;
    }

    /**
     * @return mixed
     */
    public function getStrMonth()
    {
        return $this->str_month;
    }

    /**
     * @param mixed $str_month
     */
    public function setStrMonth($str_month): void
    {
        $this->str_month = $str_month;
    }

    /**
     * @return mixed
     */
    public function getStrYear()
    {
        return $this->str_year;
    }

    /**
     * @param mixed $str_year
     */
    public function setStrYear($str_year): void
    {
        $this->str_year = $str_year;
    }

    /**
     * @return mixed
     */
    public function getDbValue()
    {
        return $this->db_value;
    }

    /**
     * @param mixed $db_value
     */
    public function setDbValue($db_value): void
    {
        $this->db_value = $db_value;
    }

    /**
     * @return mixed
     */
    public function getStrSituation()
    {
        return $this->str_situation;
    }

    /**
     * @param mixed $str_situation
     */
    public function setStrSituation($str_situation): void
    {
        $this->str_situation = $str_situation;
    }

    /**
     * @return mixed
     */
    public function getTbBeneficiariesIdBeneficiaries()
    {
        return $this->tb_beneficiaries_id_beneficiaries;
    }

    /**
     * @param mixed $tb_beneficiaries_id_beneficiaries
     */
    public function setTbBeneficiariesIdBeneficiaries($tb_beneficiaries_id_beneficiaries): void
    {
        $this->tb_beneficiaries_id_beneficiaries = $tb_beneficiaries_id_beneficiaries;
    }

    /**
     * @return mixed
     */
    public function getTbCityIdCity()
    {
        return $this->tb_city_id_city;
    }

    /**
     * @param mixed $tb_city_id_city
     */
    public function setTbCityIdCity($tb_city_id_city): void
    {
        $this->tb_city_id_city = $tb_city_id_city;
    }


}