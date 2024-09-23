@implementation RAPReportComposerIncorrectNameSection

- (RAPReportComposerIncorrectNameSection)initWithCorrectableString:(id)a3
{
  return -[RAPReportComposerIncorrectNameSection initWithCorrectableString:required:](self, "initWithCorrectableString:required:", a3, 1);
}

- (RAPReportComposerIncorrectNameSection)initWithCorrectableString:(id)a3 required:(BOOL)a4
{
  id v6;
  RAPReportComposerIncorrectNameSection *v7;
  RAPReportComposerIncorrectNameSection *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RAPReportComposerIncorrectNameSection;
  v7 = -[RAPTablePartSection init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    v7->_isRequired = a4;
    -[RAPReportComposerIncorrectNameSection setCurrentLabelCorrectableString:](v7, "setCurrentLabelCorrectableString:", v6);
  }

  return v8;
}

- (void)setCurrentLabelCorrectableString:(id)a3
{
  RAPPlaceCorrectableString *v5;
  RAPPlaceCorrectableString *currentLabelCorrectableString;
  void *v7;
  RAPPlaceCorrectableString *v8;

  v5 = (RAPPlaceCorrectableString *)a3;
  currentLabelCorrectableString = self->_currentLabelCorrectableString;
  if (currentLabelCorrectableString != v5)
  {
    v8 = v5;
    if (currentLabelCorrectableString)
      -[RAPPlaceCorrectableString removeObserver:](currentLabelCorrectableString, "removeObserver:", self);
    objc_storeStrong((id *)&self->_currentLabelCorrectableString, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self->_currentLabelCorrectableString, "value"));
    -[RAPTextTableViewCell setValue:](self->_cell, "setValue:", v7);

    v5 = v8;
  }

}

- (int64_t)rowsCount
{
  return 1;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  RAPTextTableViewCell *v4;
  RAPTextTableViewCell *cell;
  void *v6;
  void *v7;
  void *v8;

  if (!self->_cell)
  {
    v4 = -[RAPTextTableViewCell initWithStyle:reuseIdentifier:]([RAPTextTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    cell = self->_cell;
    self->_cell = v4;

    -[RAPTextTableViewCell setSelectionStyle:](self->_cell, "setSelectionStyle:", 0);
    -[RAPTextTableViewCell setCorrectableItemKind:](self->_cell, "setCorrectableItemKind:", -[RAPPlaceCorrectableString kind](self->_currentLabelCorrectableString, "kind"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self->_currentLabelCorrectableString, "value"));
    -[RAPTextTableViewCell setValue:](self->_cell, "setValue:", v6);

    -[RAPTextTableViewCell setDelegate:](self->_cell, "setDelegate:", self);
    if (self->_isRequired)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Required [Report a Problem]"), CFSTR("localized string not found"), 0));
      -[RAPTextTableViewCell setPlaceholder:](self->_cell, "setPlaceholder:", v8);

    }
  }
  return self->_cell;
}

- (void)valueForCorrectableItemKind:(int64_t)a3 changedTo:(id)a4
{
  -[RAPPlaceCorrectableString setValue:](self->_currentLabelCorrectableString, "setValue:", a4);
}

- (RAPPlaceCorrectableString)currentLabelCorrectableString
{
  return self->_currentLabelCorrectableString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLabelCorrectableString, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
