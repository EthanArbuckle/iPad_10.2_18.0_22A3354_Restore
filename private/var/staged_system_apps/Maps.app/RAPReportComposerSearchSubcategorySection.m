@implementation RAPReportComposerSearchSubcategorySection

- (RAPReportComposerSearchSubcategorySection)initWithQuestion:(id)a3 selection:(id)a4
{
  id v7;
  id v8;
  RAPReportComposerSearchSubcategorySection *v9;
  RAPReportComposerSearchSubcategorySection *v10;
  id v11;
  id selection;
  id v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPReportComposerSearchSubcategorySection;
  v9 = -[RAPTablePartSection init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_question, a3);
    v11 = objc_retainBlock(v8);
    selection = v10->_selection;
    v10->_selection = v11;

    v13 = objc_msgSend((id)objc_opt_class(v7), "localizedHeaderText");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[RAPTablePartSection setHeaderTitle:](v10, "setHeaderTitle:", v14);

    -[RAPMenu addObserver:changeHandler:](v10->_question, "addObserver:changeHandler:", v10, &stru_1011E7390);
  }

  return v10;
}

- (int64_t)rowsCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenu allMenuItems](self->_question, "allMenuItems"));
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

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueDefaultSingleLineTableViewCell](self, "dequeueDefaultSingleLineTableViewCell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenu allMenuItems](self->_question, "allMenuItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v5, "setAccessoryType:", 1);
  return v5;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  void *v6;
  void (**selection)(id, id);
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenu allMenuItems](self->_question, "allMenuItems", a3, a4));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

  -[RAPMenu setSelectedMenuItem:](self->_question, "setSelectedMenuItem:", v8);
  selection = (void (**)(id, id))self->_selection;
  if (selection)
    selection[2](selection, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selection, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
