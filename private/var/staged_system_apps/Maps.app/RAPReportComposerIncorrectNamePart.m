@implementation RAPReportComposerIncorrectNamePart

- (RAPReportComposerIncorrectNamePart)initWithCorrectableString:(id)a3
{
  id v5;
  RAPReportComposerIncorrectNameSection *v6;
  void *v7;
  RAPReportComposerIncorrectNamePart *v8;
  void *v9;
  void *v10;
  objc_super v12;
  RAPReportComposerIncorrectNameSection *v13;

  v5 = a3;
  v6 = -[RAPReportComposerIncorrectNameSection initWithCorrectableString:required:]([RAPReportComposerIncorrectNameSection alloc], "initWithCorrectableString:required:", v5, 1);
  v13 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v12.receiver = self;
  v12.super_class = (Class)RAPReportComposerIncorrectNamePart;
  v8 = -[RAPTablePart initWithSections:](&v12, "initWithSections:", v7);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_incorrectNameSection, v6);
    objc_storeStrong((id *)&v8->_correctableString, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Name [Labels]"), CFSTR("localized string not found"), 0));
    -[RAPTablePartSection setHeaderTitle:](v8->_incorrectNameSection, "setHeaderTitle:", v10);

  }
  return v8;
}

- (void)setCorrectableString:(id)a3
{
  RAPPlaceCorrectableString *v5;
  RAPPlaceCorrectableString *v6;

  v5 = (RAPPlaceCorrectableString *)a3;
  if (self->_correctableString != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_correctableString, a3);
    -[RAPReportComposerIncorrectNameSection setCurrentLabelCorrectableString:](self->_incorrectNameSection, "setCurrentLabelCorrectableString:", self->_correctableString);
    v5 = v6;
  }

}

- (RAPPlaceCorrectableString)correctableString
{
  return self->_correctableString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctableString, 0);
  objc_storeStrong((id *)&self->_incorrectNameSection, 0);
}

@end
