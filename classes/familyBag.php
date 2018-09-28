<?php
/**
 * Created by PhpStorm.
 * User: aluno
 * Date: 10/09/2018
 * Time: 19:58
 */

class familyBag
{

    private $id_family_bag;
    private $str_reference_month;
    private $str_reference_year;
    private $str_competence_month;
    private $str_competence_year;
    private $dt_date;
    private $db_value;
    private $tb_beneficiaries_id_beneficiaries;
    private $tb_city_id_city;

    /**
     * familyBag constructor.
     * @param $id_family_bag
     * @param $str_reference_month
     * @param $str_reference_year
     * @param $str_competence_month
     * @param $str_competence_year
     * @param $dt_date
     * @param $db_value
     * @param $tb_beneficiaries_id_beneficiaries
     * @param $tb_city_id_city
     */
    public function __construct($id_family_bag, $str_reference_month, $str_reference_year, $str_competence_month, $str_competence_year, $dt_date, $db_value, $tb_beneficiaries_id_beneficiaries, $tb_city_id_city)
    {
        $this->id_family_bag = $id_family_bag;
        $this->str_reference_month = $str_reference_month;
        $this->str_reference_year = $str_reference_year;
        $this->str_competence_month = $str_competence_month;
        $this->str_competence_year = $str_competence_year;
        $this->dt_date = $dt_date;
        $this->db_value = $db_value;
        $this->tb_beneficiaries_id_beneficiaries = $tb_beneficiaries_id_beneficiaries;
        $this->tb_city_id_city = $tb_city_id_city;
    }

    /**
     * @return mixed
     */
    public function getIdFamilyBag()
    {
        return $this->id_family_bag;
    }

    /**
     * @param mixed $id_family_bag
     */
    public function setIdFamilyBag($id_family_bag): void
    {
        $this->id_family_bag = $id_family_bag;
    }

    /**
     * @return mixed
     */
    public function getStrReferenceMonth()
    {
        return $this->str_reference_month;
    }

    /**
     * @param mixed $str_reference_month
     */
    public function setStrReferenceMonth($str_reference_month): void
    {
        $this->str_reference_month = $str_reference_month;
    }

    /**
     * @return mixed
     */
    public function getStrReferenceYear()
    {
        return $this->str_reference_year;
    }

    /**
     * @param mixed $str_reference_year
     */
    public function setStrReferenceYear($str_reference_year): void
    {
        $this->str_reference_year = $str_reference_year;
    }

    /**
     * @return mixed
     */
    public function getStrCompetenceMonth()
    {
        return $this->str_competence_month;
    }

    /**
     * @param mixed $str_competence_month
     */
    public function setStrCompetenceMonth($str_competence_month): void
    {
        $this->str_competence_month = $str_competence_month;
    }

    /**
     * @return mixed
     */
    public function getStrCompetenceYear()
    {
        return $this->str_competence_year;
    }

    /**
     * @param mixed $str_competence_year
     */
    public function setStrCompetenceYear($str_competence_year): void
    {
        $this->str_competence_year = $str_competence_year;
    }

    /**
     * @return mixed
     */
    public function getDtDate()
    {
        return $this->dt_date;
    }

    /**
     * @param mixed $dt_date
     */
    public function setDtDate($dt_date): void
    {
        $this->dt_date = $dt_date;
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