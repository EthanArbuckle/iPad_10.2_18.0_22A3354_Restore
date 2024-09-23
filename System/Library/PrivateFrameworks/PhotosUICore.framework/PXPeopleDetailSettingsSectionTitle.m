@implementation PXPeopleDetailSettingsSectionTitle

- (PXPeopleDetailSettingsSectionTitle)initWithFrame:(CGRect)a3
{
  PXPeopleDetailSettingsSectionTitle *v3;
  uint64_t v4;
  UILabel *textLabel;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPeopleDetailSettingsSectionTitle;
  v3 = -[PXPeopleDetailSettingsSectionTitle initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 10.0, 0.0, 300.0, 30.0);
    textLabel = v3->_textLabel;
    v3->_textLabel = (UILabel *)v4;

    -[PXPeopleDetailSettingsSectionTitle contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_textLabel);

  }
  return v3;
}

- (NSString)title
{
  return -[UILabel text](self->_textLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_textLabel, "setText:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
