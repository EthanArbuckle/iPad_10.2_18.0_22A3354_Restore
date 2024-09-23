@implementation PXBlockActionConfiguration

- (PXBlockActionConfiguration)initWithBlock:(id)a3
{
  id v4;
  PXBlockActionConfiguration *v5;
  uint64_t v6;
  id actionBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXBlockActionConfiguration;
  v5 = -[PXBlockActionConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    actionBlock = v5->_actionBlock;
    v5->_actionBlock = (id)v6;

  }
  return v5;
}

- (PXBlockActionConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBlockActionConfiguration.m"), 23, CFSTR("%s is not available as initializer"), "-[PXBlockActionConfiguration init]");

  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXBlockActionConfiguration *v4;
  void *v5;
  PXBlockActionConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = [PXBlockActionConfiguration alloc];
  -[PXBlockActionConfiguration actionBlock](self, "actionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXBlockActionConfiguration initWithBlock:](v4, "initWithBlock:", v5);

  -[PXBlockActionConfiguration actionName](self, "actionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBlockActionConfiguration setActionName:](v6, "setActionName:", v7);

  -[PXBlockActionConfiguration image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBlockActionConfiguration setImage:](v6, "setImage:", v8);

  -[PXBlockActionConfiguration canPerformBlock](self, "canPerformBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBlockActionConfiguration setCanPerformBlock:](v6, "setCanPerformBlock:", v9);

  -[PXBlockActionConfiguration setDestructive:](v6, "setDestructive:", -[PXBlockActionConfiguration isDestructive](self, "isDestructive"));
  -[PXBlockActionConfiguration setSelected:](v6, "setSelected:", -[PXBlockActionConfiguration isSelected](self, "isSelected"));
  -[PXBlockActionConfiguration menuElementConstructor](self, "menuElementConstructor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBlockActionConfiguration setMenuElementConstructor:](v6, "setMenuElementConstructor:", v10);

  return v6;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)canPerformBlock
{
  return self->_canPerformBlock;
}

- (void)setCanPerformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (id)menuElementConstructor
{
  return self->_menuElementConstructor;
}

- (void)setMenuElementConstructor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_menuElementConstructor, 0);
  objc_storeStrong(&self->_canPerformBlock, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
}

@end
