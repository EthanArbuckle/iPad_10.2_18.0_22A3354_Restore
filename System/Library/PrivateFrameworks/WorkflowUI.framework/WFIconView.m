@implementation WFIconView

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFIconView;
  v4 = a3;
  -[WFIconView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[WFIconView traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WFShouldRedrawIconForTraitCollectionChange(v5, v4);

  if (v6)
    -[WFIconView redrawIcon](self, "redrawIcon");
}

@end
