@implementation PXActionItem

- (PXActionItem)initWithTitle:(id)a3 systemImageName:(id)a4 role:(unint64_t)a5 state:(int64_t)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  PXActionItem *v15;
  uint64_t v16;
  NSString *title;
  uint64_t v18;
  NSString *systemImageName;
  uint64_t v20;
  id handler;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PXActionItem;
  v15 = -[PXActionItem init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    title = v15->_title;
    v15->_title = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    systemImageName = v15->_systemImageName;
    v15->_systemImageName = (NSString *)v18;

    v15->_role = a5;
    v15->_state = a6;
    v20 = objc_msgSend(v14, "copy");
    handler = v15->_handler;
    v15->_handler = (id)v20;

  }
  return v15;
}

- (PXActionItem)initWithTitle:(id)a3 systemImageName:(id)a4 role:(unint64_t)a5 handler:(id)a6
{
  return -[PXActionItem initWithTitle:systemImageName:role:state:handler:](self, "initWithTitle:systemImageName:role:state:handler:", a3, a4, a5, 0, a6);
}

- (UIImage)image
{
  return 0;
}

- (PXMenuAction)alternateAction
{
  return 0;
}

- (void)performAction
{
  void (**v2)(void);

  -[PXActionItem handler](self, "handler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (unint64_t)role
{
  return self->_role;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
