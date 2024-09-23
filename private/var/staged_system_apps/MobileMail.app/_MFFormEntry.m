@implementation _MFFormEntry

- (_MFFormEntry)initWithTextAlignment:(int64_t)a3
{
  _MFFormEntry *v4;
  UILabel *v5;
  UILabel *titleLabel;
  double v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *valueLabel;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_MFFormEntry;
  v4 = -[_MFFormEntry init](&v15, "init");
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v7) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailSubtitleGrayColor](UIColor, "mailSubtitleGrayColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_MFFormEntry labelFont](_MFFormEntry, "labelFont"));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v9);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", a3);
    v10 = (UILabel *)objc_alloc_init((Class)UILabel);
    valueLabel = v4->_valueLabel;
    v4->_valueLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_valueLabel, "setNumberOfLines:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UILabel setTextColor:](v4->_valueLabel, "setTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_MFFormEntry labelFont](_MFFormEntry, "labelFont"));
    -[UILabel setFont:](v4->_valueLabel, "setFont:", v13);

  }
  return v4;
}

+ (id)labelFont
{
  return +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
