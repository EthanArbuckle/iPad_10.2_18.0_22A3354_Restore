@implementation WFIconButton

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFIconButton;
  v4 = a3;
  -[WFIconButton traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[WFIconButton traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WFShouldRedrawIconForTraitCollectionChange(v5, v4);

  if (v6)
    -[WFIconButton redrawIcon](self, "redrawIcon");
}

@end
