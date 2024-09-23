@implementation BKDebugViewEntry

+ (id)entryWithTitle:(id)a3 action:(id)a4
{
  return objc_msgSend(a1, "entryWithTitle:model:action:", a3, 0, a4);
}

+ (id)entryWithTitle:(id)a3 model:(id)a4
{
  return objc_msgSend(a1, "entryWithTitle:model:action:", a3, a4, 0);
}

+ (id)entryWithTitle:(id)a3 model:(id)a4 action:(id)a5
{
  id v7;
  id v8;
  id v9;
  BKDebugViewEntry *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(BKDebugViewEntry);
  -[BKDebugViewEntry setTitle:](v10, "setTitle:", v9);

  -[BKDebugViewEntry setModel:](v10, "setModel:", v8);
  -[BKDebugViewEntry setAction:](v10, "setAction:", v7);

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BKDebugViewCellModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
