@implementation SearchUIToggleButtonItem

- (void)buttonPressed
{
  id v3;

  -[SearchUIButtonItem setStatus:](self, "setStatus:", -[SearchUIButtonItem status](self, "status") == 0);
  -[SearchUIButtonItem delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateDidChangeForButtonItem:", self);

}

- (id)offStateTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "untoggledTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[SearchUIToggleButtonItem untoggledTitle](self, "untoggledTitle");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)untoggledTitle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIToggleButtonItem;
  -[SearchUIButtonItem offStateTitle](&v3, sel_offStateTitle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)onStateTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggledTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[SearchUIToggleButtonItem toggledTitle](self, "toggledTitle");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)toggledTitle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIToggleButtonItem;
  -[SearchUIButtonItem onStateTitle](&v3, sel_onStateTitle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)offStateImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "untoggledImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUIToggleButtonItem;
    -[SearchUIButtonItem offStateImage](&v10, sel_offStateImage);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)onStateImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggledImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUIToggleButtonItem;
    -[SearchUIButtonItem onStateImage](&v10, sel_onStateImage);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)allowsContextMenu
{
  return 0;
}

@end
