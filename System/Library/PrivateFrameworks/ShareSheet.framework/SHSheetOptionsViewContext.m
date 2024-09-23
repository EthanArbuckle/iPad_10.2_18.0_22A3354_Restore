@implementation SHSheetOptionsViewContext

- (SHSheetOptionsViewContext)initWithCustomizationGroups:(id)a3
{
  id v4;
  SHSheetOptionsViewContext *v5;
  uint64_t v6;
  NSArray *customizationGroups;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetOptionsViewContext;
  v5 = -[SHSheetOptionsViewContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    customizationGroups = v5->_customizationGroups;
    v5->_customizationGroups = (NSArray *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)SHSheetOptionsViewContext;
  -[SHSheetOptionsViewContext description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetOptionsViewContext customizationGroups](self, "customizationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetOptionsViewContext itemPreviewViewController](self, "itemPreviewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ customizationGroups:%@ itemPreviewViewController:%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)customizationGroups
{
  return self->_customizationGroups;
}

- (void)setCustomizationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIViewController)itemPreviewViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_itemPreviewViewController);
}

- (void)setItemPreviewViewController:(id)a3
{
  objc_storeWeak((id *)&self->_itemPreviewViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemPreviewViewController);
  objc_storeStrong((id *)&self->_customizationGroups, 0);
}

@end
