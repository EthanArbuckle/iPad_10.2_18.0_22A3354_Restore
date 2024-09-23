@implementation RAPReportComposerMenuSection

- (RAPReportComposerMenuSection)initWithMenu:(id)a3 headerText:(id)a4 menuSectionIndex:(unint64_t)a5 selection:(id)a6
{
  id v11;
  id v12;
  id v13;
  RAPReportComposerMenuSection *v14;
  RAPReportComposerMenuSection *v15;
  id v16;
  id selection;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RAPReportComposerMenuSection;
  v14 = -[RAPTablePartSection init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_question, a3);
    v15->_sectionIndex = a5;
    -[RAPTablePartSection setHeaderTitle:](v15, "setHeaderTitle:", v12);
    v16 = objc_msgSend(v13, "copy");
    selection = v15->_selection;
    v15->_selection = v16;

  }
  return v15;
}

- (int64_t)rowsCount
{
  return (int64_t)-[RAPMenu numberOfMenuItemsInSection:](self->_question, "numberOfMenuItemsInSection:", self->_sectionIndex);
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RAPTwoLinesMenuTableViewCell *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = -[RAPMenu shouldShowSubtitles](self->_question, "shouldShowSubtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, self->_sectionIndex));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenu menuItemForIndexPath:](self->_question, "menuItemForIndexPath:", v6));
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTwoLinesMenuTableViewCell reuseIdentifier](RAPTwoLinesMenuTableViewCell, "reuseIdentifier"));
    v10 = (RAPTwoLinesMenuTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v9));

    if (!v10)
      v10 = objc_alloc_init(RAPTwoLinesMenuTableViewCell);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTwoLinesViewModelImpl viewModelFromRAPMenuItem:](RAPTwoLinesViewModelImpl, "viewModelFromRAPMenuItem:", v7));
    -[RAPTwoLinesMenuTableViewCell setViewModel:](v10, "setViewModel:", v11);

  }
  else
  {
    v10 = (RAPTwoLinesMenuTableViewCell *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueDefaultSingleLineTableViewCell](self, "dequeueDefaultSingleLineTableViewCell"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCallout));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTwoLinesMenuTableViewCell textLabel](v10, "textLabel"));
    objc_msgSend(v13, "setFont:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedTitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTwoLinesMenuTableViewCell textLabel](v10, "textLabel"));
    objc_msgSend(v15, "setText:", v14);

    -[RAPTwoLinesMenuTableViewCell setAccessoryType:](v10, "setAccessoryType:", 1);
  }

  return v10;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  void *v5;
  void (**selection)(id, RAPReportComposerMenuSection *, void *);
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, self->_sectionIndex));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenu menuItemForIndexPath:](self->_question, "menuItemForIndexPath:"));
  -[RAPMenu setSelectedMenuItem:](self->_question, "setSelectedMenuItem:", v5);
  selection = (void (**)(id, RAPReportComposerMenuSection *, void *))self->_selection;
  if (selection)
    selection[2](selection, self, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selection, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
