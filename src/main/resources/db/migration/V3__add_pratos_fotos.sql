-- ================================================================
--  V3: Novos pratos com fotos coerentes
-- ================================================================

-- Garantir categorias existem
INSERT IGNORE INTO categoria (nome, descricao, ordem, status, created_at) VALUES
  ('Lanches',    'Hambúrgueres e sanduíches',   1, 'ATIVO', NOW()),
  ('Açaí',       'Bowls de açaí e smoothies',   2, 'ATIVO', NOW()),
  ('Bebidas',    'Sucos, refris e vitaminas',    3, 'ATIVO', NOW()),
  ('Sobremesas', 'Doces e sobremesas geladas',   4, 'ATIVO', NOW()),
  ('Combos',     'Pratos completos com acompanhamento', 5, 'ATIVO', NOW());

-- Atualizar fotos dos pratos existentes para URLs coerentes
UPDATE prato SET foto_url = 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600&q=80'
  WHERE LOWER(nome) LIKE '%hamburguer%' OR LOWER(nome) LIKE '%burger%' OR LOWER(nome) LIKE '%smash%';

UPDATE prato SET foto_url = 'https://images.unsplash.com/photo-1590301157890-4810ed352733?w=600&q=80'
  WHERE LOWER(nome) LIKE '%açaí%' OR LOWER(nome) LIKE '%acai%' OR LOWER(nome) LIKE '%bowl%';

UPDATE prato SET foto_url = 'https://images.unsplash.com/photo-1569050467447-ce54b3bbc37d?w=600&q=80'
  WHERE LOWER(nome) LIKE '%batata%' OR LOWER(nome) LIKE '%frita%';

UPDATE prato SET foto_url = 'https://images.unsplash.com/photo-1527477396000-e27163b481c2?w=600&q=80'
  WHERE LOWER(nome) LIKE '%chicken%' OR LOWER(nome) LIKE '%frango%' OR LOWER(nome) LIKE '%crispy%';

-- Novos pratos com fotos coerentes
INSERT IGNORE INTO prato (nome, descricao, foto_url, preco_venda, tempo_preparo_min, status, categoria_id, created_at)
SELECT
  'Double Smash Burger',
  'Dois blends bovinos smashados, queijo cheddar duplo, cebola caramelizada e molho especial da casa.',
  'https://images.unsplash.com/photo-1553979459-d2229ba7433b?w=600&q=80',
  52.90, 25, 'ATIVO',
  (SELECT id FROM categoria WHERE nome = 'Lanches' LIMIT 1),
  NOW()
WHERE NOT EXISTS (SELECT 1 FROM prato WHERE nome = 'Double Smash Burger');

INSERT IGNORE INTO prato (nome, descricao, foto_url, preco_venda, tempo_preparo_min, status, categoria_id, created_at)
SELECT
  'Chicken Bacon Burger',
  'Frango crocante empanado, bacon defumado, queijo suíço e maionese de ervas.',
  'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=600&q=80',
  44.90, 22, 'ATIVO',
  (SELECT id FROM categoria WHERE nome = 'Lanches' LIMIT 1),
  NOW()
WHERE NOT EXISTS (SELECT 1 FROM prato WHERE nome = 'Chicken Bacon Burger');

INSERT IGNORE INTO prato (nome, descricao, foto_url, preco_venda, tempo_preparo_min, status, categoria_id, created_at)
SELECT
  'Bowl de Açaí 700g',
  'Açaí premium 700g com granola crocante, banana fatiada, morango e mel.',
  'https://images.unsplash.com/photo-1590301157890-4810ed352733?w=600&q=80',
  36.90, 10, 'ATIVO',
  (SELECT id FROM categoria WHERE nome = 'Açaí' LIMIT 1),
  NOW()
WHERE NOT EXISTS (SELECT 1 FROM prato WHERE nome = 'Bowl de Açaí 700g');

INSERT IGNORE INTO prato (nome, descricao, foto_url, preco_venda, tempo_preparo_min, status, categoria_id, created_at)
SELECT
  'Açaí Tradicional 500g',
  'Açaí puro 500g cremoso com granola, banana e leite condensado.',
  'https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?w=600&q=80',
  28.90, 8, 'ATIVO',
  (SELECT id FROM categoria WHERE nome = 'Açaí' LIMIT 1),
  NOW()
WHERE NOT EXISTS (SELECT 1 FROM prato WHERE nome = 'Açaí Tradicional 500g');

INSERT IGNORE INTO prato (nome, descricao, foto_url, preco_venda, tempo_preparo_min, status, categoria_id, created_at)
SELECT
  'Batata Rústica Temperada',
  'Batatas rústicas assadas com tempero especial, alecrim e páprica defumada.',
  'https://images.unsplash.com/photo-1623238913973-21e45cabe783?w=600&q=80',
  22.90, 18, 'ATIVO',
  (SELECT id FROM categoria WHERE nome = 'Lanches' LIMIT 1),
  NOW()
WHERE NOT EXISTS (SELECT 1 FROM prato WHERE nome = 'Batata Rústica Temperada');

INSERT IGNORE INTO prato (nome, descricao, foto_url, preco_venda, tempo_preparo_min, status, categoria_id, created_at)
SELECT
  'Milk Shake Chocolate',
  'Milk shake cremoso de chocolate belga com chantilly e granulado.',
  'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600&q=80',
  24.90, 8, 'ATIVO',
  (SELECT id FROM categoria WHERE nome = 'Bebidas' LIMIT 1),
  NOW()
WHERE NOT EXISTS (SELECT 1 FROM prato WHERE nome = 'Milk Shake Chocolate');

INSERT IGNORE INTO prato (nome, descricao, foto_url, preco_venda, tempo_preparo_min, status, categoria_id, created_at)
SELECT
  'Suco Natural 500ml',
  'Suco natural de laranja, limão ou maracujá feito na hora.',
  'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=600&q=80',
  14.90, 5, 'ATIVO',
  (SELECT id FROM categoria WHERE nome = 'Bebidas' LIMIT 1),
  NOW()
WHERE NOT EXISTS (SELECT 1 FROM prato WHERE nome = 'Suco Natural 500ml');

INSERT IGNORE INTO prato (nome, descricao, foto_url, preco_venda, tempo_preparo_min, status, categoria_id, created_at)
SELECT
  'Combo Burger + Batata + Suco',
  'Hambúrguer artesanal + porção de batata frita + suco natural 500ml.',
  'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=600&q=80',
  59.90, 30, 'ATIVO',
  (SELECT id FROM categoria WHERE nome = 'Combos' LIMIT 1),
  NOW()
WHERE NOT EXISTS (SELECT 1 FROM prato WHERE nome = 'Combo Burger + Batata + Suco');

INSERT IGNORE INTO prato (nome, descricao, foto_url, preco_venda, tempo_preparo_min, status, categoria_id, created_at)
SELECT
  'Combo Açaí + Lanche',
  'Bowl de açaí 500g + hambúrguer artesanal clássico.',
  'https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?w=600&q=80',
  62.90, 25, 'ATIVO',
  (SELECT id FROM categoria WHERE nome = 'Combos' LIMIT 1),
  NOW()
WHERE NOT EXISTS (SELECT 1 FROM prato WHERE nome = 'Combo Açaí + Lanche');

INSERT IGNORE INTO prato (nome, descricao, foto_url, preco_venda, tempo_preparo_min, status, categoria_id, created_at)
SELECT
  'Brownie com Sorvete',
  'Brownie quentinho de chocolate com sorvete de creme e calda de chocolate.',
  'https://images.unsplash.com/photo-1564355808539-22fda35bed7e?w=600&q=80',
  19.90, 10, 'ATIVO',
  (SELECT id FROM categoria WHERE nome = 'Sobremesas' LIMIT 1),
  NOW()
WHERE NOT EXISTS (SELECT 1 FROM prato WHERE nome = 'Brownie com Sorvete');
