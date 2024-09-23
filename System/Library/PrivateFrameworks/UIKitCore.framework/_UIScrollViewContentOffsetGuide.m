@implementation _UIScrollViewContentOffsetGuide

- (id)nsli_minYVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nsli_minYVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nsli_minXVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nsli_minXVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setOwningView:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIScrollViewContentOffsetGuide;
  -[UILayoutGuide _setOwningView:](&v3, sel__setOwningView_, a3);
}

- (id)nsli_boundsHeightVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nsli_contentYOffsetVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nsli_boundsWidthVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nsli_contentXOffsetVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_minXVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_minXVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_minYVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_minYVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_boundsWidthVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nsli_contentXOffsetVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_boundsHeightVariable
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nsli_contentYOffsetVariable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_uili_requiresObservationForVariable:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  char v8;
  void *v9;

  v4 = a3;
  -[_UIScrollViewContentOffsetGuide _minXVariable](self, "_minXVariable");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

    goto LABEL_5;
  }
  v6 = (void *)v5;
  -[_UIScrollViewContentOffsetGuide _minYVariable](self, "_minYVariable");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
LABEL_5:
    -[UILayoutGuide owningView](self, "owningView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "_uili_requiresObservationForVariable:", v4);

    goto LABEL_6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

@end
