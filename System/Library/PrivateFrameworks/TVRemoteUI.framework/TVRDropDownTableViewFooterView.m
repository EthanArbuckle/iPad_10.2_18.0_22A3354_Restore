@implementation TVRDropDownTableViewFooterView

- (TVRDropDownTableViewFooterView)initWithReuseIdentifier:(id)a3
{
  TVRDropDownTableViewFooterView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVRDropDownTableViewFooterView;
  v3 = -[TVRDropDownTableViewFooterView initWithReuseIdentifier:](&v6, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    +[TVRMaterialView seperatorMaterialView](TVRMaterialView, "seperatorMaterialView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRDropDownTableViewFooterView setBackgroundView:](v3, "setBackgroundView:", v4);

  }
  return v3;
}

@end
