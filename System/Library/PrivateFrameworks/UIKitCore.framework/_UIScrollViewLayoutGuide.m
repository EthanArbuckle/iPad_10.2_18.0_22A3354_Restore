@implementation _UIScrollViewLayoutGuide

- (id)nsli_boundsHeightVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nsli_contentHeightVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nsli_boundsWidthVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nsli_contentWidthVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setOwningView:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIScrollViewLayoutGuide;
  -[UILayoutGuide _setOwningView:](&v3, sel__setOwningView_, a3);
}

- (id)_boundsWidthVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contentWidthVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_boundsHeightVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contentHeightVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
