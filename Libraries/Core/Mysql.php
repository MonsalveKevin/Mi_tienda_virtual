<?php


class Mysql extends Conexion {
    private $conexion;
    private $strQuery;
    private $arrValues;

    function __construct()
    {
        $this->conexion = new Conexion();
        $this->conexion = $this->conexion->conect();
    }

    //Método para insertar un registro en la base de datos
    public function insert(string $query, array $arrValues) {
        $this->strQuery = $query;
        $this->arrValues = $arrValues;

        $insert = $this->conexion->prepare($this->strQuery);
        $reInsert = $insert->execute($this->arrValues);

        if ($reInsert) {
            $lastInsert = $this->conexion->lastInsertId();
        } else {
            $lastInsert = 0;
        }
        return $lastInsert;
    }

    //Método para bucar un registro en la base de datos
    public function select(string $query) {
        $this->strQuery = $query;
        $result = $this->conexion->prepare($this->strQuery);
        $result->execute();
        $data = $result->fetch(PDO::FETCH_ASSOC);
        return $data;
    }

    //Método para devolver todos los registros de la base de datos
    public function selectAll(string $query) {
        $this->strQuery = $query;
        $result = $this->conexion->prepare($this->strQuery);
        $result->execute();
        $data = $result->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }

    //Método para actualizar registros de la base de datos
    public function update(string $query, array $arrValues) {
        $this->strQuery = $query;
        $this->arrValues = $arrValues;
        $update = $this->conexion->prepare($this->strQuery);
        $resExecute = $update->execute($this->arrValues);
        return $resExecute;
    }

    //Método para eliminar registros de la base de datos
    public function delete(string $query) {
        $this->strQuery = $query;
        $result = $this->conexion->prepare($this->strQuery);
        $delete = $result->execute();
        return $delete;
    }
}