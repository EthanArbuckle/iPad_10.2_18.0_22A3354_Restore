@implementation _UIPresentationControllerNullVisualStyleProvider

- (int64_t)defaultConcreteTransitionStyleForViewController:(id)a3
{
  return 0;
}

- (_UISheetPresentationMetrics)defaultSheetMetrics
{
  return (_UISheetPresentationMetrics *)+[_UISheetPresentationMetrics _defaultMetrics](_UISheetPresentationMetrics, "_defaultMetrics");
}

- (int64_t)defaultConcretePresentationStyleForViewController:(id)a3
{
  id v4;
  int isKindOfClass;
  void *v6;
  int v7;
  int v8;
  int v9;
  int64_t v10;
  int v11;
  void *v12;

  v4 = a3;
  if (qword_1ECD7F1B8 != -1)
    dispatch_once(&qword_1ECD7F1B8, &__block_literal_global_383);
  if (_MergedGlobals_1153)
  {
    NSClassFromString(CFSTR("ChatKit.AppCardContainerViewController"));
    isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "topViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("CNVisualIdentityItemEditorViewController"));
      v7 = objc_opt_isKindOfClass();

      isKindOfClass |= v7;
    }
  }
  else
  {
    isKindOfClass = 0;
  }
  if (byte_1ECD7F1B1)
  {
    NSClassFromString(CFSTR("PosterBoard.PosterEditingConfirmationViewController"));
    v8 = objc_opt_isKindOfClass();
  }
  else
  {
    v8 = 0;
  }
  if (((isKindOfClass | v8) & 1) == 0)
    goto LABEL_21;
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v9 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1)
    goto LABEL_14;
  v11 = _UIInternalPreference_ForceFormSheetsAsDefault;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_ForceFormSheetsAsDefault)
    goto LABEL_14;
  v10 = 1;
  while (v9 >= v11)
  {
    _UIInternalPreferenceSync(v9, &_UIInternalPreference_ForceFormSheetsAsDefault, (uint64_t)CFSTR("ForceFormSheetsAsDefault"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    v11 = _UIInternalPreference_ForceFormSheetsAsDefault;
    if (v9 == _UIInternalPreference_ForceFormSheetsAsDefault)
      goto LABEL_25;
  }
  if (!byte_1EDDA81B4)
  {
LABEL_14:
    v10 = 1;
  }
  else
  {
LABEL_21:
    -[_UIPresentationControllerNullVisualStyleProvider defaultSheetMetrics](self, "defaultSheetMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "defaultMode"))
      v10 = 2;
    else
      v10 = 1;

  }
LABEL_25:

  return v10;
}

- (id)styleForRootPresentationController:(id)a3
{
  id v3;
  _UIPresentationControllerVisualStyle *v4;

  v3 = a3;
  v4 = -[_UIPresentationControllerVisualStyle initWithPresentationController:]([_UIPresentationControllerVisualStyle alloc], "initWithPresentationController:", v3);

  return v4;
}

- (id)defaultStyleForPresentationController:(id)a3
{
  id v3;
  _UIPresentationControllerVisualStyle *v4;

  v3 = a3;
  v4 = -[_UIPresentationControllerVisualStyle initWithPresentationController:]([_UIPresentationControllerVisualStyle alloc], "initWithPresentationController:", v3);

  return v4;
}

- (id)styleForSheetPresentationController:(id)a3
{
  return 0;
}

- (id)styleForPopoverPresentationController:(id)a3
{
  return 0;
}

- (id)presentationControllerForPresentedViewController:(id)a3 inIdiom:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(-[_UIPresentationControllerNullVisualStyleProvider presentationControllerClassForModalPresentationStyle:inIdiom:](self, "presentationControllerClassForModalPresentationStyle:inIdiom:", objc_msgSend(v6, "modalPresentationStyle"), a4)), "initWithPresentedViewController:presentingViewController:", v6, 0);

  return v7;
}

- (Class)presentationControllerClassForModalPresentationStyle:(int64_t)a3 inIdiom:(int64_t)a4
{
  void *v4;

  v4 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 16:
    case 17:
    case 18:
      goto LABEL_3;
    case 4:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
      return (Class)v4;
    default:
      if (a3 == 100)
      {
LABEL_3:
        objc_opt_class();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return (Class)v4;
}

- (id)styleForAlertPresentationController:(id)a3
{
  return 0;
}

- (id)styleForSearchPresentationController:(id)a3
{
  return 0;
}

- (id)presentationControllerForPresentedViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPresentationControllerNullVisualStyleProvider presentationControllerForPresentedViewController:inIdiom:](self, "presentationControllerForPresentedViewController:inIdiom:", v4, objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
