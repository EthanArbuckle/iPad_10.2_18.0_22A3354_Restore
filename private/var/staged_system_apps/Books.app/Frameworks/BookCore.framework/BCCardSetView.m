@implementation BCCardSetView

- (BOOL)accessibilityPerformEscape
{
  BCCardSetView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetView accessibilityDelegate](self, "accessibilityDelegate"));
  LOBYTE(v2) = objc_msgSend(v3, "accessibilityDismissCardSetView:", v2);

  return (char)v2;
}

- (id)accessibilityElements
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc((Class)NSMutableArray);
  v11.receiver = self;
  v11.super_class = (Class)BCCardSetView;
  v4 = -[BCCardSetView accessibilityElements](&v11, "accessibilityElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithArray:", v5);

  if (!v6)
    v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetView subviews](self, "subviews"));
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetView accessibilityDelegate](self, "accessibilityDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "additionalAccessibilityElementsForCardSetView"));
  objc_msgSend(v6, "addObjectsFromArray:", v9);

  return v6;
}

- (BCCardSetViewAccessibilityDelegate)accessibilityDelegate
{
  return (BCCardSetViewAccessibilityDelegate *)objc_loadWeakRetained((id *)&self->_accessibilityDelegate);
}

- (void)setAccessibilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessibilityDelegate);
}

@end
