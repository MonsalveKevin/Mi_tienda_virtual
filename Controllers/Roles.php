<?php

class Roles extends Controllers {
    public function __construct() {
        parent::__construct();
    }

    public function Roles()
    {
        $data['page_id'] = 3;
        $data['page_tag'] = "Roles";
        $data['page_title'] = "Roles de usuario";
        $data['page_name'] = "roles";
        $this->views->getView($this, 'roles',$data); 
    }
}

?>