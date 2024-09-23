@implementation MFFlagColorTriageInteraction

- (id)undoTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFFlagColorTriageInteraction flagColor](self, "flagColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OPERATION_FLAG_COLOR_DESC"), &stru_100531B00, CFSTR("Main")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFFlagColorTriageInteraction _localizedColorNameFromFlagColor:](self, "_localizedColorNameFromFlagColor:", objc_msgSend(v3, "unsignedIntegerValue")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OPERATION_UNFLAG_DESC"), &stru_100531B00, CFSTR("Main")));
  }

  return v7;
}

- (void)setFlagColor:(id)a3
{
  NSNumber *v5;
  void *v6;
  NSNumber *v7;

  v5 = (NSNumber *)a3;
  if (self->_flagColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_flagColor, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFFlagColorTriageInteraction triageAction](self, "triageAction"));
    objc_msgSend(v6, "setFlagColor:", v7);

    v5 = v7;
  }

}

- (id)_localizedColorNameFromFlagColor:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  __CFString *v5;

  switch(a3)
  {
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FLAG_COLOR_RED"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_10;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FLAG_COLOR_ORANGE"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_10;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FLAG_COLOR_YELLOW"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_10;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FLAG_COLOR_GREEN"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_10;
    case 4uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FLAG_COLOR_BLUE"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_10;
    case 5uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FLAG_COLOR_PURPLE"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_10;
    case 6uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FLAG_COLOR_GRAY"), &stru_100531B00, CFSTR("Main")));
LABEL_10:
      v5 = (__CFString *)v4;

      break;
    default:
      v5 = &stru_100531B00;
      break;
  }
  return v5;
}

- (id)triageAction
{
  MSTriageAction *colorTriageAction;
  id v4;
  void *v5;
  id v6;
  void *v7;
  MSTriageAction *v8;

  colorTriageAction = self->_colorTriageAction;
  if (!colorTriageAction)
  {
    v4 = objc_alloc((Class)MSFlagTriageAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
    v6 = objc_msgSend(v4, "initWithMessageListSelection:origin:actor:delegate:reason:", v5, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), self, -[MFFlagChangeTriageInteraction reason](self, "reason"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFFlagColorTriageInteraction flagColor](self, "flagColor"));
    objc_msgSend(v6, "setFlagColor:", v7);

    v8 = self->_colorTriageAction;
    self->_colorTriageAction = (MSTriageAction *)v6;

    colorTriageAction = self->_colorTriageAction;
  }
  return colorTriageAction;
}

- (id)cardActionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  MFFlagColorTriageInteraction *v19;
  id v20;

  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100164178;
  v18 = &unk_1005208A8;
  v19 = self;
  v4 = a3;
  v20 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFFlagColorCardAction cardActionWithTitle:shortTitle:imageName:tintColor:handlerEnabled:handler:](MFFlagColorCardAction, "cardActionWithTitle:shortTitle:imageName:tintColor:handlerEnabled:handler:", 0, 0, 0, 0, 0, &v15));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection", v15, v16, v17, v18, v19));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flags"));
  v10 = objc_msgSend(v9, "flagged");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flagColors"));
    v12 = v11;
    if (v11)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "firstIndex")));
    else
      v13 = 0;
    objc_msgSend(v5, "setFlagColor:", v13);
    if (v12)

  }
  return v5;
}

- (void)setTriageAction:(id)a3
{
  objc_storeStrong((id *)&self->_colorTriageAction, a3);
}

- (NSNumber)flagColor
{
  return self->_flagColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagColor, 0);
  objc_storeStrong((id *)&self->_colorTriageAction, 0);
}

@end
