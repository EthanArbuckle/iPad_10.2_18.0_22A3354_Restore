@implementation RAPReportComposerLabelStatusSection

- (RAPReportComposerLabelStatusSection)initWithCorrectableFlag:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  RAPReportComposerLabelStatusSection *v9;
  objc_super v11;
  void *v12;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Remove Label [RAP]"), CFSTR("localized string not found"), 0));

  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v11.receiver = self;
  v11.super_class = (Class)RAPReportComposerLabelStatusSection;
  v9 = -[RAPTableCheckmarkRadioSection initWithOwner:initialValues:initialSelectedValue:configureForValue:selection:](&v11, "initWithOwner:initialValues:initialSelectedValue:configureForValue:selection:", 0, v8, 0, 0, 0);

  if (v9)
    objc_storeStrong((id *)&v9->_correctableFlag, a3);

  return v9;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueDefaultSingleLineTableViewCell](self, "dequeueDefaultSingleLineTableViewCell", a3));
  objc_msgSend(v4, "setSelectionStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Remove Label [RAP]"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
  objc_msgSend(v7, "setText:", v6);

  if (-[RAPPlaceCorrectableFlag value](self->_correctableFlag, "value"))
    v8 = 3;
  else
    v8 = 0;
  objc_msgSend(v4, "setAccessoryType:", v8);
  return v4;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1);

  -[RAPPlaceCorrectableFlag setValue:](self->_correctableFlag, "setValue:", -[RAPPlaceCorrectableFlag value](self->_correctableFlag, "value") ^ 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v5));

  if (-[RAPPlaceCorrectableFlag value](self->_correctableFlag, "value"))
    v8 = 3;
  else
    v8 = 0;
  objc_msgSend(v9, "setAccessoryType:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctableFlag, 0);
}

@end
