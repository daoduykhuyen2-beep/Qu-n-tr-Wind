-- WIND HAIR HOUSE: cập nhật theo IMG_6230(1).JPG, 27/10/2026.
-- Chạy file này trong SQL Editor của đúng dự án Wind đã có schema.sql.
-- Giữ nguyên ID dịch vụ đã có và lịch/hóa đơn cũ; không sửa giá lịch đã chốt.
-- Thời lượng mới là dự kiến để xếp lịch, cần salon rà lại.
-- Tóc nối: giá mỗi tép, bao công nối và nhuộm tóc nối; thời lượng 0 để tư vấn trước.
-- Sấy và duỗi được tách thành các mức giá cụ thể, cần báo giá trước cho khách.
begin;
do $$
declare biz uuid; ids uuid[]; item_id uuid;
begin
  select array_agg(id) into ids from public.businesses where lower(trim(name)) = 'wind hair house';
  if coalesce(cardinality(ids),0) <> 1 then
    raise exception 'Cần đúng một doanh nghiệp tên Wind Hair House; không cập nhật để tránh nhầm dữ liệu';
  end if;
  biz := ids[1];
  select id into item_id from public.services where business_id=biz and name in ('Uốn','Uốn tóc') order by (name='Uốn') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Uốn','Dịch vụ chính',600000,150,'truc_tiep',false,1);
  else
    update public.services set name='Uốn',group_name='Dịch vụ chính',price=600000,commission_type='truc_tiep',sort=1,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Duỗi','Duỗi tóc') order by (name='Duỗi') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Duỗi','Dịch vụ chính',600000,150,'truc_tiep',false,2);
  else
    update public.services set name='Duỗi',group_name='Dịch vụ chính',price=600000,commission_type='truc_tiep',sort=2,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nhuộm','Nhuộm tóc') order by (name='Nhuộm') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nhuộm','Dịch vụ chính',600000,120,'truc_tiep',false,3);
  else
    update public.services set name='Nhuộm',group_name='Dịch vụ chính',price=600000,commission_type='truc_tiep',sort=3,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Tẩy','Tẩy tóc') order by (name='Tẩy') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Tẩy','Dịch vụ chính',600000,120,'truc_tiep',true,4);
  else
    update public.services set name='Tẩy',group_name='Dịch vụ chính',price=600000,commission_type='truc_tiep',sort=4,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nâng sáng') order by (name='Nâng sáng') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nâng sáng','Kỹ thuật màu & tẩy tóc',300000,90,'truc_tiep',false,5);
  else
    update public.services set name='Nâng sáng',group_name='Kỹ thuật màu & tẩy tóc',price=300000,commission_type='truc_tiep',sort=5,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Phủ màu') order by (name='Phủ màu') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Phủ màu','Kỹ thuật màu & tẩy tóc',500000,90,'truc_tiep',false,6);
  else
    update public.services set name='Phủ màu',group_name='Kỹ thuật màu & tẩy tóc',price=500000,commission_type='truc_tiep',sort=6,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Bóc đen / đỏ') order by (name='Bóc đen / đỏ') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Bóc đen / đỏ','Kỹ thuật màu & tẩy tóc',600000,120,'truc_tiep',true,7);
  else
    update public.services set name='Bóc đen / đỏ',group_name='Kỹ thuật màu & tẩy tóc',price=600000,commission_type='truc_tiep',sort=7,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nhuộm nâng tông') order by (name='Nhuộm nâng tông') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nhuộm nâng tông','Kỹ thuật màu & tẩy tóc',600000,120,'truc_tiep',false,8);
  else
    update public.services set name='Nhuộm nâng tông',group_name='Kỹ thuật màu & tẩy tóc',price=600000,commission_type='truc_tiep',sort=8,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Dặm sáng / Highlight (Babylight)','Babylight') order by (name='Dặm sáng / Highlight (Babylight)') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Dặm sáng / Highlight (Babylight)','Kỹ thuật màu & tẩy tóc',900000,180,'truc_tiep',false,9);
  else
    update public.services set name='Dặm sáng / Highlight (Babylight)',group_name='Kỹ thuật màu & tẩy tóc',price=900000,commission_type='truc_tiep',sort=9,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Highlight') order by (name='Highlight') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Highlight','Kỹ thuật màu & tẩy tóc',1100000,180,'truc_tiep',false,10);
  else
    update public.services set name='Highlight',group_name='Kỹ thuật màu & tẩy tóc',price=1100000,commission_type='truc_tiep',sort=10,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Balayage') order by (name='Balayage') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Balayage','Kỹ thuật màu & tẩy tóc',2500000,240,'truc_tiep',true,11);
  else
    update public.services set name='Balayage',group_name='Kỹ thuật màu & tẩy tóc',price=2500000,commission_type='truc_tiep',sort=11,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Gội sạch','Gội') order by (name='Gội sạch') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Gội sạch','Dịch vụ lẻ',60000,30,'ho_tro',false,12);
  else
    update public.services set name='Gội sạch',group_name='Dịch vụ lẻ',price=60000,commission_type='ho_tro',sort=12,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Sấy tạo kiểu — 100.000đ') order by (name='Sấy tạo kiểu — 100.000đ') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Sấy tạo kiểu — 100.000đ','Dịch vụ lẻ',100000,30,'truc_tiep',false,13);
  else
    update public.services set name='Sấy tạo kiểu — 100.000đ',group_name='Dịch vụ lẻ',price=100000,commission_type='truc_tiep',sort=13,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Sấy tạo kiểu — 150.000đ') order by (name='Sấy tạo kiểu — 150.000đ') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Sấy tạo kiểu — 150.000đ','Dịch vụ lẻ',150000,45,'truc_tiep',false,14);
  else
    update public.services set name='Sấy tạo kiểu — 150.000đ',group_name='Dịch vụ lẻ',price=150000,commission_type='truc_tiep',sort=14,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Cắt + gội + tạo kiểu') order by (name='Cắt + gội + tạo kiểu') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Cắt + gội + tạo kiểu','Dịch vụ lẻ',150000,60,'truc_tiep',false,15);
  else
    update public.services set name='Cắt + gội + tạo kiểu',group_name='Dịch vụ lẻ',price=150000,commission_type='truc_tiep',sort=15,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Uốn / nhuộm nam') order by (name='Uốn / nhuộm nam') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Uốn / nhuộm nam','Dịch vụ lẻ',300000,90,'truc_tiep',false,16);
  else
    update public.services set name='Uốn / nhuộm nam',group_name='Dịch vụ lẻ',price=300000,commission_type='truc_tiep',sort=16,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Uốn mái / phá ngôi') order by (name='Uốn mái / phá ngôi') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Uốn mái / phá ngôi','Dịch vụ lẻ',300000,60,'truc_tiep',false,17);
  else
    update public.services set name='Uốn mái / phá ngôi',group_name='Dịch vụ lẻ',price=300000,commission_type='truc_tiep',sort=17,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Dập phồng chân tóc','Uốn / duỗi phồng chân') order by (name='Dập phồng chân tóc') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Dập phồng chân tóc','Dịch vụ lẻ',300000,90,'truc_tiep',false,18);
  else
    update public.services set name='Dập phồng chân tóc',group_name='Dịch vụ lẻ',price=300000,commission_type='truc_tiep',sort=18,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Bảo vệ tóc') order by (name='Bảo vệ tóc') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Bảo vệ tóc','Dịch vụ lẻ',300000,30,'truc_tiep',false,19);
  else
    update public.services set name='Bảo vệ tóc',group_name='Dịch vụ lẻ',price=300000,commission_type='truc_tiep',sort=19,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nhuộm dặm chân tóc','Chấm chân tóc') order by (name='Nhuộm dặm chân tóc') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nhuộm dặm chân tóc','Dịch vụ lẻ',300000,60,'truc_tiep',false,20);
  else
    update public.services set name='Nhuộm dặm chân tóc',group_name='Dịch vụ lẻ',price=300000,commission_type='truc_tiep',sort=20,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Duỗi viền') order by (name='Duỗi viền') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Duỗi viền','Dịch vụ lẻ',350000,60,'truc_tiep',false,21);
  else
    update public.services set name='Duỗi viền',group_name='Dịch vụ lẻ',price=350000,commission_type='truc_tiep',sort=21,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Duỗi chân') order by (name='Duỗi chân') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Duỗi chân','Dịch vụ lẻ',400000,90,'truc_tiep',false,22);
  else
    update public.services set name='Duỗi chân',group_name='Dịch vụ lẻ',price=400000,commission_type='truc_tiep',sort=22,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Phục hồi Mielle Almighty Cocktail') order by (name='Phục hồi Mielle Almighty Cocktail') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Phục hồi Mielle Almighty Cocktail','Phục hồi / chăm sóc tóc',600000,60,'truc_tiep',false,23);
  else
    update public.services set name='Phục hồi Mielle Almighty Cocktail',group_name='Phục hồi / chăm sóc tóc',price=600000,commission_type='truc_tiep',sort=23,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Phục hồi Keratin') order by (name='Phục hồi Keratin') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Phục hồi Keratin','Phục hồi / chăm sóc tóc',1100000,90,'truc_tiep',false,24);
  else
    update public.services set name='Phục hồi Keratin',group_name='Phục hồi / chăm sóc tóc',price=1100000,commission_type='truc_tiep',sort=24,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Phục hồi 3C Labios Collagen') order by (name='Phục hồi 3C Labios Collagen') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Phục hồi 3C Labios Collagen','Phục hồi / chăm sóc tóc',1200000,90,'truc_tiep',false,25);
  else
    update public.services set name='Phục hồi 3C Labios Collagen',group_name='Phục hồi / chăm sóc tóc',price=1200000,commission_type='truc_tiep',sort=25,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Phục hồi Keratherapy') order by (name='Phục hồi Keratherapy') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Phục hồi Keratherapy','Phục hồi / chăm sóc tóc',1600000,90,'truc_tiep',false,26);
  else
    update public.services set name='Phục hồi Keratherapy',group_name='Phục hồi / chăm sóc tóc',price=1600000,commission_type='truc_tiep',sort=26,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Combo cắt + uốn + nhuộm + Mielle') order by (name='Combo cắt + uốn + nhuộm + Mielle') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Combo cắt + uốn + nhuộm + Mielle','Combo tiết kiệm',1500000,240,'truc_tiep',false,27);
  else
    update public.services set name='Combo cắt + uốn + nhuộm + Mielle',group_name='Combo tiết kiệm',price=1500000,commission_type='truc_tiep',sort=27,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Combo cắt + uốn + nhuộm + Milbon') order by (name='Combo cắt + uốn + nhuộm + Milbon') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Combo cắt + uốn + nhuộm + Milbon','Combo tiết kiệm',1800000,255,'truc_tiep',false,28);
  else
    update public.services set name='Combo cắt + uốn + nhuộm + Milbon',group_name='Combo tiết kiệm',price=1800000,commission_type='truc_tiep',sort=28,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Tẩy + nhuộm màu sáng') order by (name='Tẩy + nhuộm màu sáng') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Tẩy + nhuộm màu sáng','Combo tiết kiệm',2100000,240,'truc_tiep',true,29);
  else
    update public.services set name='Tẩy + nhuộm màu sáng',group_name='Combo tiết kiệm',price=2100000,commission_type='truc_tiep',sort=29,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Tẩy + nhuộm màu sáng + Milbon') order by (name='Tẩy + nhuộm màu sáng + Milbon') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Tẩy + nhuộm màu sáng + Milbon','Combo tiết kiệm',2600000,270,'truc_tiep',true,30);
  else
    update public.services set name='Tẩy + nhuộm màu sáng + Milbon',group_name='Combo tiết kiệm',price=2600000,commission_type='truc_tiep',sort=30,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nối tóc lông vũ đen 40cm (giá / tép)') order by (name='Nối tóc lông vũ đen 40cm (giá / tép)') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nối tóc lông vũ đen 40cm (giá / tép)','Tóc nối giá xưởng',14000,0,'noi_tep',true,31);
  else
    update public.services set name='Nối tóc lông vũ đen 40cm (giá / tép)',group_name='Tóc nối giá xưởng',price=14000,commission_type='noi_tep',sort=31,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nối tóc lông vũ tẩy 40cm (giá / tép)') order by (name='Nối tóc lông vũ tẩy 40cm (giá / tép)') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nối tóc lông vũ tẩy 40cm (giá / tép)','Tóc nối giá xưởng',26000,0,'noi_tep',true,32);
  else
    update public.services set name='Nối tóc lông vũ tẩy 40cm (giá / tép)',group_name='Tóc nối giá xưởng',price=26000,commission_type='noi_tep',sort=32,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nối tóc lông vũ đen 50cm (giá / tép)') order by (name='Nối tóc lông vũ đen 50cm (giá / tép)') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nối tóc lông vũ đen 50cm (giá / tép)','Tóc nối giá xưởng',16000,0,'noi_tep',true,33);
  else
    update public.services set name='Nối tóc lông vũ đen 50cm (giá / tép)',group_name='Tóc nối giá xưởng',price=16000,commission_type='noi_tep',sort=33,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nối tóc lông vũ tẩy 50cm (giá / tép)') order by (name='Nối tóc lông vũ tẩy 50cm (giá / tép)') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nối tóc lông vũ tẩy 50cm (giá / tép)','Tóc nối giá xưởng',29000,0,'noi_tep',true,34);
  else
    update public.services set name='Nối tóc lông vũ tẩy 50cm (giá / tép)',group_name='Tóc nối giá xưởng',price=29000,commission_type='noi_tep',sort=34,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nối tóc lông vũ đen 60cm (giá / tép)') order by (name='Nối tóc lông vũ đen 60cm (giá / tép)') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nối tóc lông vũ đen 60cm (giá / tép)','Tóc nối giá xưởng',18000,0,'noi_tep',true,35);
  else
    update public.services set name='Nối tóc lông vũ đen 60cm (giá / tép)',group_name='Tóc nối giá xưởng',price=18000,commission_type='noi_tep',sort=35,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nối tóc lông vũ tẩy 60cm (giá / tép)') order by (name='Nối tóc lông vũ tẩy 60cm (giá / tép)') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nối tóc lông vũ tẩy 60cm (giá / tép)','Tóc nối giá xưởng',33000,0,'noi_tep',true,36);
  else
    update public.services set name='Nối tóc lông vũ tẩy 60cm (giá / tép)',group_name='Tóc nối giá xưởng',price=33000,commission_type='noi_tep',sort=36,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nối tóc lông vũ đen 70cm (giá / tép)') order by (name='Nối tóc lông vũ đen 70cm (giá / tép)') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nối tóc lông vũ đen 70cm (giá / tép)','Tóc nối giá xưởng',20000,0,'noi_tep',true,37);
  else
    update public.services set name='Nối tóc lông vũ đen 70cm (giá / tép)',group_name='Tóc nối giá xưởng',price=20000,commission_type='noi_tep',sort=37,active=true where id=item_id;
  end if;
  select id into item_id from public.services where business_id=biz and name in ('Nối tóc lông vũ tẩy 70cm (giá / tép)') order by (name='Nối tóc lông vũ tẩy 70cm (giá / tép)') desc, id limit 1;
  if item_id is null then
    insert into public.services (business_id,name,group_name,price,duration_min,commission_type,needs_review,sort) values (biz,'Nối tóc lông vũ tẩy 70cm (giá / tép)','Tóc nối giá xưởng',38000,0,'noi_tep',true,38);
  else
    update public.services set name='Nối tóc lông vũ tẩy 70cm (giá / tép)',group_name='Tóc nối giá xưởng',price=38000,commission_type='noi_tep',sort=38,active=true where id=item_id;
  end if;
  update public.services set active=false where business_id=biz and name in ('Phục hồi 3 bước Milbon Deesse''s','Nối tóc lông vũ (theo tép, bao công liên hệ)');
end $$;
commit;

-- Kiểm tra danh mục sau cập nhật:
select s.name,s.group_name,s.price,s.commission_type,s.active from public.services s
join public.businesses b on b.id=s.business_id where lower(trim(b.name))='wind hair house' order by s.sort;

