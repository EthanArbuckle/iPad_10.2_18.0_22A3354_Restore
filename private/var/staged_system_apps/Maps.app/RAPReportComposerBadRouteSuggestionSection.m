@implementation RAPReportComposerBadRouteSuggestionSection

- (RAPReportComposerBadRouteSuggestionSection)initWithQuestion:(id)a3 selection:(id)a4
{
  id v7;
  id v8;
  RAPReportComposerBadRouteSuggestionSection *v9;
  RAPReportComposerBadRouteSuggestionSection *v10;
  id v11;
  id selection;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPReportComposerBadRouteSuggestionSection;
  v9 = -[RAPTablePartSection init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_question, a3);
    v11 = objc_retainBlock(v8);
    selection = v10->_selection;
    v10->_selection = v11;

    -[RAPQuestion addObserver:changeHandler:](v10->_question, "addObserver:changeHandler:", v10, &stru_1011DCC78);
  }

  return v10;
}

- (int64_t)rowsCount
{
  return 1;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueDefaultSingleLineTableViewCell](self, "dequeueDefaultSingleLineTableViewCell", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsCategoryQuestion betterRouteAvailableMenuItem](self->_question, "betterRouteAvailableMenuItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v4, "setAccessoryType:", 1);
  return v4;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  void (**selection)(id, id);
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPDirectionsCategoryQuestion betterRouteAvailableMenuItem](self->_question, "betterRouteAvailableMenuItem", a3, a4));
  -[RAPMenuQuestion setSelectedMenuItem:](self->_question, "setSelectedMenuItem:");
  selection = (void (**)(id, id))self->_selection;
  if (selection)
    selection[2](selection, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selection, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
