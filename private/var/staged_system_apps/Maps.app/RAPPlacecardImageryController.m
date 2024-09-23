@implementation RAPPlacecardImageryController

- (RAPPlacecardImageryController)initWithReport:(id)a3 layoutManager:(id)a4
{
  id v7;
  id v8;
  RAPPlacecardImageryController *v9;
  RAPPlacecardImageryController *v10;
  RAPPlacecardImageryQuestion *v11;
  void *v12;
  RAPPlacecardImageryQuestion *v13;
  RAPPlacecardImageryQuestion *question;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPPlacecardImageryController;
  v9 = -[RAPPlacecardImageryController init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutManager, a4);
    objc_storeStrong((id *)&v10->_report, a3);
    v11 = [RAPPlacecardImageryQuestion alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlacecardImageryLayoutManager issueItems](v10->_layoutManager, "issueItems"));
    v13 = -[RAPPlacecardImageryQuestion initWithReport:parentQuestion:supportedIssueItems:](v11, "initWithReport:parentQuestion:supportedIssueItems:", v7, 0, v12);
    question = v10->_question;
    v10->_question = v13;

    objc_msgSend(v7, "setInitialQuestion:", v10->_question);
    -[RAPPlacecardImageryController _setupAlertController](v10, "_setupAlertController");
  }

  return v10;
}

- (void)_setupAlertController
{
  UIAlertController *v3;
  UIAlertController *alertController;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[6];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id location;
  _BYTE v29[128];

  v3 = (UIAlertController *)objc_alloc_init((Class)UIAlertController);
  alertController = self->_alertController;
  self->_alertController = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController popoverPresentationController](self->_alertController, "popoverPresentationController"));
  objc_msgSend(v5, "setPermittedArrowDirections:", 3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlacecardImageryQuestion localizedTitle](self->_question, "localizedTitle"));
  -[UIAlertController setTitle:](self->_alertController, "setTitle:", v6);

  objc_initWeak(&location, self);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlacecardImageryLayoutManager issueItems](self->_layoutManager, "issueItems"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedTitle"));
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100956BDC;
        v22[3] = &unk_1011DCB60;
        v22[4] = self;
        v22[5] = v11;
        objc_copyWeak(&v23, &location);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, v22));

        -[UIAlertController addAction:](self->_alertController, "addAction:", v13);
        objc_destroyWeak(&v23);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Cancel [RAP Placecard Imagery]"), CFSTR("localized string not found"), 0));
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_100956C30;
  v20 = &unk_1011AFA88;
  objc_copyWeak(&v21, &location);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, &v17));

  -[UIAlertController addAction:](self->_alertController, "addAction:", v16, v17, v18, v19, v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_invokeCompletionHandlerWithShouldSubmit:(BOOL)a3
{
  void (**completionHandler)(id, BOOL, RAPReport *, RAPPlacecardImageryQuestion *);

  completionHandler = (void (**)(id, BOOL, RAPReport *, RAPPlacecardImageryQuestion *))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, a3, self->_report, self->_question);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
}

@end
