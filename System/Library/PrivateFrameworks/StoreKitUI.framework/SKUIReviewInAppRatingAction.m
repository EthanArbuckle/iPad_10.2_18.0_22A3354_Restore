@implementation SKUIReviewInAppRatingAction

+ (id)actionWithCustomContentViewController:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___SKUIReviewInAppRatingAction;
  objc_msgSendSuper2(&v5, sel_actionWithCustomContentViewController_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCustomEnabledState:", objc_msgSend(v3, "isEnabled"));
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKUIReviewInAppRatingAction;
  -[UIInterfaceAction setEnabled:](&v5, sel_setEnabled_);
  -[SKUIReviewInAppRatingAction setCustomEnabledState:](self, "setCustomEnabledState:", v3);
}

- (void)setCustomEnabledState:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  id v9;

  v3 = a3;
  -[UIInterfaceAction customContentViewController](self, "customContentViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[UIInterfaceAction customContentViewController](self, "customContentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIInterfaceAction customContentViewController](self, "customContentViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEnabled:", v3);

    }
  }
}

- (id)beforeDismissHandler
{
  return self->_beforeDismissHandler;
}

- (void)setBeforeDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)afterDismissHandler
{
  return self->_afterDismissHandler;
}

- (void)setAfterDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_afterDismissHandler, 0);
  objc_storeStrong(&self->_beforeDismissHandler, 0);
}

@end
