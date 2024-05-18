create database loja_de_roupas;

use loja_de_roupas;

create table produtos (
  id int auto_increment primary key,
  nome varchar(255) not null,
  preco decimal(10, 2) not null
);

create table estoque (
  id int auto_increment primary key,
  id_produto int not null,
  quantidade int not null,
  foreign key (id_produto) 
	references produtos(id)
);

insert into produtos (nome, preco) 
values 
	('Camiseta', 29.90),
	('Calça', 79.90);

insert into estoque (id_produto, quantidade) 
values 
	(1, 100),
	(2, 50);
    
select * from produtos;
select * from estoque;

DELIMITER //
create trigger atualizar_preco
after insert on estoque
for each row 
begin
  if (new.quantidade < 10) then
    update produtos set preco = preco * 1.10 where id = new.id_produto;
  end if;
end;//
DELIMITER ;


insert into estoque (id_produto, quantidade) 
values 
	(1, 5);

select * from produtos where id = 1;

delete from estoque where id_produto = 1 and quantidade = 5;