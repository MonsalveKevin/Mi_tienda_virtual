<?php

class Home extends Controllers {
    public function __construct() {
        parent::__construct();
    }

    public function home()
    {
        $data['page_id'] = 1;
        $data['page_tag'] = "Inicio";
        $data['page_title'] = "Página principal";
        $data['page_name'] = "inicio";
        $data['page_content'] = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Illum necessitatibus ratione deserunt iusto explicabo eveniet. Accusamus aut eligendi possimus dicta consectetur omnis. Consequatur corporis assumenda dolores laudantium nulla molestiae! Eaque?";
        $this->views->getView($this, 'home',$data); 
    }
}


?>