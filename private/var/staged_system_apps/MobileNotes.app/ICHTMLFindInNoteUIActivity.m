@implementation ICHTMLFindInNoteUIActivity

- (ICHTMLFindInNoteUIActivity)initWithDelegate:(id)a3
{
  id v4;
  ICHTMLFindInNoteUIActivity *v5;
  ICHTMLFindInNoteUIActivity *v6;
  ICHTMLFindInNoteUIActivity *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICHTMLFindInNoteUIActivity;
  v5 = -[ICHTMLFindInNoteUIActivity init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.findInNote");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Find in Note"), &stru_1005704B8, 0));

  return v3;
}

- (int64_t)activityCategory
{
  return 0;
}

- (id)_systemImageName
{
  return CFSTR("magnifyingglass");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v3 = objc_claimAutoreleasedReturnValue(-[ICHTMLFindInNoteUIActivity delegate](self, "delegate"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICHTMLFindInNoteUIActivity delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "performFindInNoteUIActivity:");

    if ((v6 & 1) != 0)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[ICHTMLFindInNoteUIActivity delegate](self, "delegate"));
      objc_msgSend(v7, "performFindInNoteUIActivity:", self);

    }
  }
}

- (ICHTMLFindInNoteUIActivityDelegate)delegate
{
  return (ICHTMLFindInNoteUIActivityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
