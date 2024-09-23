@implementation RAPPersonalPlaceCorrectionsWhichOneQuestion

- (RAPPersonalPlaceCorrectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 shortcutType:(int64_t)a5
{
  id v8;
  RAPPersonalPlaceCorrectionsWhichOneQuestion *v9;
  RAPPersonalPlaceCorrectionsWhichOneQuestion *v10;
  uint64_t v11;
  NSArray *mainMenuItems;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RAPPersonalPlaceCorrectionsWhichOneQuestion;
  v9 = -[RAPQuestion initWithReport:parentQuestion:](&v16, "initWithReport:parentQuestion:", v8, a4);
  v10 = v9;
  if (v9)
  {
    v9->_isRefreshing = 0;
    v9->_shortcutType = a5;
    switch(a5)
    {
      case 0:
      case 1:
      case 6:
        v11 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
        mainMenuItems = v10->super._mainMenuItems;
        v10->super._mainMenuItems = (NSArray *)v11;
        goto LABEL_8;
      case 2:
        mainMenuItems = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_context"));
        v13 = objc_claimAutoreleasedReturnValue(-[NSArray homeShortcuts](mainMenuItems, "homeShortcuts"));
        goto LABEL_7;
      case 3:
        mainMenuItems = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_context"));
        v13 = objc_claimAutoreleasedReturnValue(-[NSArray workShortcuts](mainMenuItems, "workShortcuts"));
        goto LABEL_7;
      case 5:
        mainMenuItems = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_context"));
        v13 = objc_claimAutoreleasedReturnValue(-[NSArray schoolShortcuts](mainMenuItems, "schoolShortcuts"));
LABEL_7:
        v14 = (void *)v13;
        -[RAPPersonalPlaceCorrectionsWhichOneQuestion _createQuestionsFromShortcuts:](v10, "_createQuestionsFromShortcuts:", v13);

LABEL_8:
        break;
      default:
        break;
    }
  }

  return v10;
}

- (void)_createQuestionsFromShortcuts:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  RAPPersonalPlaceSelectionQuestion *v12;
  void *v13;
  RAPPersonalPlaceSelectionQuestion *v14;
  NSArray *v15;
  NSArray *mainMenuItems;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
        v12 = [RAPPersonalPlaceSelectionQuestion alloc];
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report", (_QWORD)v17));
        v14 = -[RAPPersonalPlaceSelectionQuestion initWithReport:parentQuestion:shortcut:](v12, "initWithReport:parentQuestion:shortcut:", v13, self, v11);

        objc_msgSend(v5, "addObject:", v14);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (NSArray *)objc_msgSend(v5, "copy");
  mainMenuItems = self->super._mainMenuItems;
  self->super._mainMenuItems = v15;

}

- (void)refreshMainMenuItemsWithCallback:(id)a3
{
  id v4;
  void *shortcutType;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v4 = a3;
  if (!self->_isRefreshing)
  {
    self->_isRefreshing = 1;
    shortcutType = (void *)self->_shortcutType;
    v6 = sub_100B3A5D4();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "oneFavorites"));

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10050E424;
    v9[3] = &unk_1011ADD38;
    v11[1] = shortcutType;
    objc_copyWeak(v11, &location);
    v10 = v4;
    objc_msgSend(v8, "loadAllShortcutsWithHandler:", v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);

  }
}

- (void)_fillSubmissionParameters:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commonContext"));

  if (!v4)
  {
    v5 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v10, "setCommonContext:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion mainMenuItems](self, "mainMenuItems"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commonContext"));
    objc_msgSend(v8, "addUserPath:", 49);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion selectedMenuItem](self, "selectedMenuItem"));
  objc_msgSend(v9, "_fillSubmissionParameters:", v10);

}

- (UIImage)image
{
  return (UIImage *)sub_10050DEB8(self->_shortcutType);
}

- (NSString)localizedTitle
{
  int64_t shortcutType;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  shortcutType = self->_shortcutType;
  switch(shortcutType)
  {
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("School [Report an Issue]");
      break;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Work [Report an Issue]");
      break;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Home [Report an Issue]");
      break;
    default:
      v6 = 0;
      return (NSString *)v6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return (NSString *)v6;
}

- (NSString)localizedDescription
{
  int64_t shortcutType;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  shortcutType = self->_shortcutType;
  switch(shortcutType)
  {
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Refine school location on map [Report an Issue]");
      break;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Refine work location on map [Report an Issue]");
      break;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Refine home location on map [Report an Issue]");
      break;
    default:
      v6 = 0;
      return (NSString *)v6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return (NSString *)v6;
}

- (int64_t)questionCategory
{
  unint64_t v2;
  int64_t v3;
  int64_t v4;

  v2 = self->_shortcutType - 2;
  if (v2 > 3)
  {
    v3 = 0;
    v4 = 0;
  }
  else
  {
    v3 = qword_100E377B8[v2];
    v4 = qword_100E377D8[v2];
  }
  if (-[NSArray count](self->super._mainMenuItems, "count") <= 1)
    return v3;
  else
    return v4;
}

- (int)userAction
{
  unint64_t v2;

  v2 = self->_shortcutType - 2;
  if (v2 > 3)
    return 17099;
  else
    return dword_100E37800[v2];
}

- (BOOL)_isRecursivelyComplete
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion selectedMenuItem](self, "selectedMenuItem"));
  if (objc_msgSend(v3, "isComplete"))
  {
    v6.receiver = self;
    v6.super_class = (Class)RAPPersonalPlaceCorrectionsWhichOneQuestion;
    v4 = -[RAPMenuQuestion _isRecursivelyComplete](&v6, "_isRecursivelyComplete");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)localizedServerControlledDescription
{
  return self->_localizedServerControlledDescription;
}

- (void)setLocalizedServerControlledDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)shortcutType
{
  return self->_shortcutType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedServerControlledDescription, 0);
}

@end
