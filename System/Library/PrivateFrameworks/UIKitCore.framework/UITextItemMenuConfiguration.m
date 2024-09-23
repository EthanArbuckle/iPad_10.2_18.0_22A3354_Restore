@implementation UITextItemMenuConfiguration

- (id)_initWithPreview:(id)a3 menu:(id)a4
{
  id v7;
  id v8;
  UITextItemMenuConfiguration *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UITextItemMenuConfiguration;
  v9 = -[UITextItemMenuConfiguration init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preview, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (UITextItemMenuConfiguration)configurationWithMenu:(UIMenu *)menu
{
  UIMenu *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = menu;
  v5 = objc_alloc((Class)a1);
  +[UITextItemMenuPreview defaultPreview](UITextItemMenuPreview, "defaultPreview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "_initWithPreview:menu:", v6, v4);

  return (UITextItemMenuConfiguration *)v7;
}

+ (UITextItemMenuConfiguration)configurationWithPreview:(UITextItemMenuPreview *)preview menu:(UIMenu *)menu
{
  UIMenu *v6;
  UITextItemMenuPreview *v7;
  void *v8;

  v6 = menu;
  v7 = preview;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPreview:menu:", v7, v6);

  return (UITextItemMenuConfiguration *)v8;
}

- (int64_t)preferredExpression
{
  return self->_preferredExpression;
}

- (void)setPreferredExpression:(int64_t)a3
{
  self->_preferredExpression = a3;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (UITextItemMenuPreview)preview
{
  return self->_preview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_menu, 0);
}

@end
