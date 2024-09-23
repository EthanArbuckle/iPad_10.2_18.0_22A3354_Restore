@implementation RAPReportComposerCommentViewController

- (RAPReportComposerCommentViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  RAPReportComposerCommentViewController *v10;
  RAPReportComposerCommentViewController *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerCommentViewController;
  v10 = -[RAPReportTableViewController initWithReport:question:completion:](&v15, "initWithReport:question:completion:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController sendButtonItem](v11, "sendButtonItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

  }
  return v11;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPReportComposerCommentViewController;
  -[RAPReportComposerCommentViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("RAPReportComposerCommentViewControllerDidAppearNotification"), self);

}

- (int)analyticTarget
{
  return 1135;
}

- (RAPReportComposerCommentTableViewCell)rapReportComposerCommentTableViewCell
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerCommentViewController tableView](self, "tableView", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visibleCells"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(RAPReportComposerCommentTableViewCell);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (RAPReportComposerCommentTableViewCell *)v4;
}

- (id)tableParts
{
  RAPReportComposerCommentPart *v3;
  void *v4;
  RAPReportComposerCommentPart *v5;
  RAPReportComposerCommentPart *commentPart;
  void *v8;
  RAPReportComposerCommentPart *v9;
  void **v10;
  RAPReportComposerCommentPart *v11;
  void *v12;
  void *v13;
  RAPReportComposerCommentPart *v14;
  RAPReportComposerCommentPart *v15;
  _QWORD v16[2];

  if (!self->_commentPart)
  {
    v3 = [RAPReportComposerCommentPart alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestionProtocol commentQuestion](self->_question, "commentQuestion"));
    v5 = -[RAPReportComposerCommentPart initWithCommentQuestion:](v3, "initWithCommentQuestion:", v4);
    commentPart = self->_commentPart;
    self->_commentPart = v5;

  }
  if (MapsFeature_IsEnabled_RAPCommunityID(self, a2))
  {
    if ((-[RAPCommentQuestionProtocol isAnonymous](self->_question, "isAnonymous") & 1) != 0)
    {
      v15 = self->_commentPart;
      return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController userInfoPart](self, "userInfoPart"));
    v11 = self->_commentPart;
    v16[0] = v8;
    v16[1] = v11;
    v10 = (void **)v16;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController userInfoPart](self, "userInfoPart"));
    v9 = self->_commentPart;
    v13 = v8;
    v14 = v9;
    v10 = &v13;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2, v13, v14));

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
