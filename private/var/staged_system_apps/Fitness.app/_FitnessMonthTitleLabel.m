@implementation _FitnessMonthTitleLabel

- (_FitnessMonthTitleLabel)init
{
  _FitnessMonthTitleLabel *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_FitnessMonthTitleLabel;
  v2 = -[_FitnessMonthTitleLabel init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 22.0));
    -[_FitnessMonthTitleLabel setFont:](v2, "setFont:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[_FitnessMonthTitleLabel setTextColor:](v2, "setTextColor:", v4);

    -[_FitnessMonthTitleLabel setTextAlignment:](v2, "setTextAlignment:", 1);
    -[_FitnessMonthTitleLabel setHidden:](v2, "setHidden:", 1);
  }
  return v2;
}

- (void)setDate:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = HKLocalizedStringForDateAndTemplate(a3, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedCapitalizedString"));

  -[_FitnessMonthTitleLabel setText:](self, "setText:", v6);
  -[_FitnessMonthTitleLabel sizeToFit](self, "sizeToFit");

}

@end
