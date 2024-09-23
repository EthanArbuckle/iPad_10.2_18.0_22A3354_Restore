@implementation PXToastConfiguration

- (PXToastConfiguration)init
{
  PXToastConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXToastConfiguration;
  result = -[PXToastConfiguration init](&v3, sel_init);
  if (result)
    result->_bottomMargin = 120.0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXToastConfiguration message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessage:", v5);

  -[PXToastConfiguration iconSystemImageName](self, "iconSystemImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconSystemImageName:", v6);

  -[PXToastConfiguration autoDismissalDelay](self, "autoDismissalDelay");
  objc_msgSend(v4, "setAutoDismissalDelay:");
  objc_msgSend(v4, "setCanSwipeToDismiss:", -[PXToastConfiguration canSwipeToDismiss](self, "canSwipeToDismiss"));
  -[PXToastConfiguration contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentView:", v7);

  -[PXToastConfiguration sourceView](self, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceView:", v8);

  -[PXToastConfiguration bottomMargin](self, "bottomMargin");
  objc_msgSend(v4, "setBottomMargin:");
  return v4;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)iconSystemImageName
{
  return self->_iconSystemImageName;
}

- (void)setIconSystemImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)autoDismissalDelay
{
  return self->_autoDismissalDelay;
}

- (void)setAutoDismissalDelay:(double)a3
{
  self->_autoDismissalDelay = a3;
}

- (BOOL)canSwipeToDismiss
{
  return self->_canSwipeToDismiss;
}

- (void)setCanSwipeToDismiss:(BOOL)a3
{
  self->_canSwipeToDismiss = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_iconSystemImageName, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
