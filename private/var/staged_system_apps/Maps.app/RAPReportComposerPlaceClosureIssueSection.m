@implementation RAPReportComposerPlaceClosureIssueSection

- (RAPReportComposerPlaceClosureIssueSection)initWithQuestion:(id)a3 selection:(id)a4
{
  id v7;
  id v8;
  RAPReportComposerPlaceClosureIssueSection *v9;
  RAPReportComposerPlaceClosureIssueSection *v10;
  id *p_question;
  void *v12;
  id v13;
  id selection;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPReportComposerPlaceClosureIssueSection;
  v9 = -[RAPTablePartSection init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    p_question = (id *)&v9->_question;
    objc_storeStrong((id *)&v9->_question, a3);
    objc_msgSend(*p_question, "addObserver:changeHandler:", v10, &stru_1011ADFB0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_question, "localizedSelectableIssueLabel"));
    -[RAPTablePartSection setHeaderTitle:](v10, "setHeaderTitle:", v12);

    v13 = objc_msgSend(v8, "copy");
    selection = v10->_selection;
    v10->_selection = v13;

  }
  return v10;
}

- (int64_t)rowsCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion selectableIssues](self->_question, "selectableIssues"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueDefaultSingleLineTableViewCell](self, "dequeueDefaultSingleLineTableViewCell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion selectableIssues](self->_question, "selectableIssues"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
  objc_msgSend(v9, "setText:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion selectedIssue](self->_question, "selectedIssue"));
  if (v10 == v7)
    v11 = 3;
  else
    v11 = 0;
  objc_msgSend(v5, "setAccessoryType:", v11);
  objc_msgSend(v5, "setSelectionStyle:", 0);

  return v5;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  void *v6;
  void (**selection)(void);
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion selectableIssues](self->_question, "selectableIssues", a3, a4));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

  -[RAPPlaceClosureQuestion setSelectedIssue:](self->_question, "setSelectedIssue:", v8);
  selection = (void (**)(void))self->_selection;
  if (selection)
    selection[2]();

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selection, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
