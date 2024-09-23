@implementation MFFlagTriageInteraction

+ (unint64_t)defaultColor
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("kDefaultFlagColor")));

  if (v3)
    v4 = (unint64_t)objc_msgSend(v3, "integerValue");
  else
    v4 = 1;

  return v4;
}

+ (void)setDefaultColor:(unint64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("kDefaultFlagColor"));

}

- (id)triageAction
{
  MSTriageAction *triageAction;
  id v4;
  void *v5;
  MSTriageAction *v6;
  MSTriageAction *v7;

  triageAction = self->_triageAction;
  if (!triageAction)
  {
    v4 = objc_alloc((Class)MSFlagTriageAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
    v6 = (MSTriageAction *)objc_msgSend(v4, "initWithMessageListSelection:origin:actor:delegate:reason:", v5, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), self, -[MFFlagChangeTriageInteraction reason](self, "reason"));
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }
  return triageAction;
}

- (id)title
{
  void *v3;
  unsigned int v4;
  int64_t v5;

  v3 = (void *)objc_opt_class(self);
  v4 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  if (-[MFTriageInteraction isSelectAll](self, "isSelectAll")
    || !-[MFTriageInteraction titleIncludesCount](self, "titleIncludesCount"))
  {
    v5 = 1;
  }
  else
  {
    v5 = -[MFTriageInteraction messageCount](self, "messageCount");
  }
  return objc_msgSend(v3, "titleForFlagAction:messageCount:", v4 ^ 1, v5);
}

+ (id)titleForFlagAction:(BOOL)a3 messageCount:(unint64_t)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if (a4 == 1)
  {
    if (v5)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_FLAGGED"), &stru_100531B00, CFSTR("Main")));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_UNFLAGGED"), &stru_100531B00, CFSTR("Main")));
    v10 = (void *)v8;
  }
  else
  {
    if (v5)
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_FLAGGED%1$lu"), &stru_100531B00, CFSTR("Main")));
    else
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MARK_EMAIL_UNFLAGGED%1$lu"), &stru_100531B00, CFSTR("Main")));
    v11 = (void *)v9;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, a4));
    v7 = v11;
  }

  return v10;
}

- (id)shortTitle
{
  unsigned int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SWIPE_UNFLAG"), &stru_100531B00, CFSTR("Main")));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SWIPE_FLAG"), &stru_100531B00, CFSTR("Main")));
  v6 = (void *)v5;

  return v6;
}

- (id)undoTitle
{
  unsigned int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OPERATION_UNFLAG_DESC"), &stru_100531B00, CFSTR("Main")));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OPERATION_FLAG_DESC"), &stru_100531B00, CFSTR("Main")));
  v6 = (void *)v5;

  return v6;
}

- (id)color
{
  void *v2;
  void *v3;
  void *v4;
  MFFlagTriageInteraction *v5;
  unsigned int v6;
  id v7;
  void *v8;

  v5 = self;
  v6 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  if (v6)
  {
    v5 = (MFFlagTriageInteraction *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](v5, "messageListItemSelection"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFFlagTriageInteraction messageListItems](v5, "messageListItems"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "flagColors"));
    v7 = objc_msgSend(v4, "firstIndex");
  }
  else
  {
    v7 = +[MFFlagTriageInteraction defaultColor](MFFlagTriageInteraction, "defaultColor");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mf_colorFromFlagColor:](UIColor, "mf_colorFromFlagColor:", v7));
  if (v6)
  {

  }
  return v8;
}

- (id)_swipeColor
{
  UIColor *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFFlagTriageInteraction;
  v2 = -[MFTriageInteraction _swipeColor](&v8, "_swipeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailFlaggedColorRed](UIColor, "mailFlaggedColorRed"));
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor mailFlaggedColorIncreasedContrastRed](UIColor, "mailFlaggedColorIncreasedContrastRed"));

    v3 = (void *)v6;
  }
  return v3;
}

- (id)_iconImageName
{
  unsigned int v2;
  id *v3;

  v2 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  v3 = (id *)&MFImageGlyphUnflag;
  if (!v2)
    v3 = (id *)&MFImageGlyphFlag;
  return *v3;
}

- (id)_previewImageName
{
  unsigned int v2;
  id *v3;

  v2 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  v3 = (id *)&MFImageGlyphUnflag;
  if (!v2)
    v3 = (id *)&MFImageGlyphFlag;
  return *v3;
}

- (id)cardActionWithCompletion:(id)a3
{
  id v4;
  unsigned int v5;
  id *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void **v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  MFFlagTriageInteraction *v16;
  id v17;

  v4 = a3;
  v5 = -[MFFlagChangeTriageInteraction flagState](self, "flagState");
  v6 = (id *)&MFImageGlyphUnflag;
  if (!v5)
    v6 = (id *)&MFImageGlyphFlag;
  v7 = *v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction cardTitle](self, "cardTitle"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1001639C4;
  v15 = &unk_1005208A8;
  v16 = self;
  v9 = v4;
  v17 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MFCardAction cardActionWithTitle:shortTitle:imageName:tintColor:handler:](MFCardAction, "cardActionWithTitle:shortTitle:imageName:tintColor:handler:", v8, 0, v7, 0, &v12));

  objc_msgSend(v10, "setAccessibilityIdentifer:", MSAccessibilityIdentifierActionsViewControllerFlag, v12, v13, v14, v15, v16);
  return v10;
}

- (BOOL)isPermitted
{
  return 1;
}

- (BOOL)shouldOverrideFlageStateForTriageAction:(id)a3
{
  void *v4;
  char v5;

  if (-[MFTriageInteraction shouldOverrideFlagState](self, "shouldOverrideFlagState", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction delegate](self, "delegate"));
    v5 = objc_opt_respondsToSelector(v4, "flagStateForFlagChangeTriageInteraction:");

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)overrideFlagStateForTriageAction:(id)a3
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "flagStateForFlagChangeTriageInteraction:") & 1) != 0)
    v5 = objc_msgSend(v4, "flagStateForFlagChangeTriageInteraction:", self);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)defaultFlagColorForTriageAction:(id)a3
{
  return (unint64_t)objc_msgSend((id)objc_opt_class(self), "defaultColor");
}

- (void)setTriageAction:(id)a3
{
  objc_storeStrong((id *)&self->_triageAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end
