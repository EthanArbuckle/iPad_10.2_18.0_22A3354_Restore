@implementation PKDashboardHeaderTextItem

+ (id)itemWithHeaderText:(id)a3
{
  return +[PKDashboardHeaderTextItem itemWithHeaderText:style:](PKDashboardHeaderTextItem, "itemWithHeaderText:style:", a3, 0);
}

+ (id)itemWithHeaderText:(id)a3 style:(unint64_t)a4
{
  id v5;
  PKDashboardHeaderTextItem *v6;

  v5 = a3;
  v6 = objc_alloc_init(PKDashboardHeaderTextItem);
  -[PKDashboardHeaderTextItem setTitle:](v6, "setTitle:", v5);

  -[PKDashboardHeaderTextItem setStyle:](v6, "setStyle:", a4);
  -[PKDashboardHeaderTextItem setUseActionInsets:](v6, "setUseActionInsets:", 1);
  return v6;
}

+ (id)identifier
{
  return CFSTR("headerTextItem");
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIImage)actionImage
{
  return self->_actionImage;
}

- (void)setActionImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIColor)actionColor
{
  return self->_actionColor;
}

- (void)setActionColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)actionStyle
{
  return self->_actionStyle;
}

- (void)setActionStyle:(unint64_t)a3
{
  self->_actionStyle = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)useActionInsets
{
  return self->_useActionInsets;
}

- (void)setUseActionInsets:(BOOL)a3
{
  self->_useActionInsets = a3;
}

- (BOOL)preferBaselineAlignment
{
  return self->_preferBaselineAlignment;
}

- (void)setPreferBaselineAlignment:(BOOL)a3
{
  self->_preferBaselineAlignment = a3;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionColor, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
