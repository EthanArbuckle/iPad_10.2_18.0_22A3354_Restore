@implementation MFMoreTriageInteraction

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018DFB0;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA260 != -1)
    dispatch_once(&qword_1005AA260, block);
  return (id)qword_1005AA258;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  return (id)objc_claimAutoreleasedReturnValue(+[MFMoreTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:interactionStyle:](MFMoreTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:interactionStyle:", a3, a4, a5, a6, 0));
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 interactionStyle:(unint64_t)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v11 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___MFMoreTriageInteraction;
  v12 = objc_msgSendSuper2(&v17, "interactionWithMessageListItems:undoManager:origin:actor:", v11, 0, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "displayMessage"));
  objc_msgSend(v13, "setDisplayMessage:", v15);

  objc_msgSend(v13, "setStyle:", a7);
  return v13;
}

- (void)_dispatchInteractionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void **v7;
  uint64_t v8;
  void (*v9)(id *, void *);
  void *v10;
  MFMoreTriageInteraction *v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMoreTriageInteraction displayMessage](self, "displayMessage"));
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10018E254;
  v10 = &unk_1005220D8;
  objc_copyWeak(&v13, &location);
  v11 = self;
  v6 = v4;
  v12 = v6;
  objc_msgSend(v5, "addSuccessBlock:", &v7);
  objc_msgSend(v5, "addFailureBlock:", &stru_1005220F8, v7, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (id)title
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = -[MFMoreTriageInteraction style](self, "style");
  if (v2 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("REPLY"), &stru_100531B00, CFSTR("Main")));
  }
  else
  {
    if (v2)
    {
      v5 = 0;
      return v5;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SWIPE_MORE"), &stru_100531B00, CFSTR("Main")));
  }
  v5 = (void *)v4;

  return v5;
}

- (id)_iconImageName
{
  unint64_t v2;
  id *v3;

  v2 = -[MFMoreTriageInteraction style](self, "style");
  if (!v2)
  {
    v3 = (id *)&MFImageGlyphMessageListMore;
    return *v3;
  }
  if (v2 == 1)
  {
    v3 = (id *)&MFImageGlyphReplyFill;
    return *v3;
  }
  return 0;
}

- (id)color
{
  unint64_t v3;
  void *v4;
  UIColor *v5;
  objc_super v7;

  v3 = -[MFMoreTriageInteraction style](self, "style");
  if (v3 == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)MFMoreTriageInteraction;
    v5 = -[MFTriageInteraction color](&v7, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else if (v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailMoreButtonGrayColor](UIColor, "mailMoreButtonGrayColor"));
  }
  return v4;
}

- (BOOL)supportsSelectAll
{
  return 0;
}

- (BOOL)shouldDelayContextualActionHandlerCompletion
{
  return 1;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (EFFuture)displayMessage
{
  return self->_displayMessage;
}

- (void)setDisplayMessage:(id)a3
{
  objc_storeStrong((id *)&self->_displayMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMessage, 0);
}

@end
