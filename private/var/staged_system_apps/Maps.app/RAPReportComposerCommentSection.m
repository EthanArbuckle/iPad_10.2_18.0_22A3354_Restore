@implementation RAPReportComposerCommentSection

- (RAPCommentPartHeaderView)headerView
{
  RAPCommentPartHeaderView *headerView;
  RAPCommentPartHeaderView *v4;
  RAPCommentPartHeaderView *v5;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = -[RAPCommentPartHeaderView initWithQuestion:reuseIdentifier:]([RAPCommentPartHeaderView alloc], "initWithQuestion:reuseIdentifier:", self->_question, CFSTR("RAPCommentPartHeaderView"));
    v5 = self->_headerView;
    self->_headerView = v4;

    headerView = self->_headerView;
  }
  return headerView;
}

- (RAPReportComposerCommentSection)initWithQuestion:(id)a3
{
  id v5;
  RAPReportComposerCommentSection *v6;
  RAPReportComposerCommentSection *v7;
  id *p_question;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RAPReportComposerCommentSection;
  v6 = -[RAPTablePartSection init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    p_question = (id *)&v6->_question;
    objc_storeStrong((id *)&v6->_question, a3);
    if ((objc_opt_respondsToSelector(*p_question, "addObserver:changeHandler:") & 1) != 0)
      objc_msgSend(*p_question, "addObserver:changeHandler:", v7, &stru_1011DD5A8);
  }

  return v7;
}

- (int64_t)rowsCount
{
  return 1;
}

- (void)registerReuseIdentifiersForCells
{
  -[RAPTablePartSection registerClass:forNamespacedReuseIdentifier:](self, "registerClass:forNamespacedReuseIdentifier:", objc_opt_class(RAPReportComposerCommentTableViewCell), CFSTR("TextViewCell"));
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  RAPCommentQuestion *v6;
  RAPCommentQuestion *v7;
  _QWORD v9[4];
  RAPCommentQuestion *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView", a3));
  objc_msgSend(v4, "setKeyboardDismissMode:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueCellWithNamespacedReuseIdentifier:](self, "dequeueCellWithNamespacedReuseIdentifier:", CFSTR("TextViewCell")));
  objc_msgSend(v5, "setPropertiesFromQuestion:", self->_question);
  v6 = self->_question;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10098D824;
  v9[3] = &unk_1011AE420;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v5, "setTextDidChange:", v9);

  return v5;
}

- (void)beginEditingCommentIfPossible
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, -[RAPTablePartSection sectionIndex](self, "sectionIndex")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10098D920;
  v8[3] = &unk_1011AC8B0;
  v8[4] = self;
  v9 = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10098D968;
  v6[3] = &unk_1011ACCB8;
  v6[4] = self;
  v7 = v9;
  v5 = v9;
  objc_msgSend(v4, "_performBatchUpdates:completion:", v8, v6);

}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
