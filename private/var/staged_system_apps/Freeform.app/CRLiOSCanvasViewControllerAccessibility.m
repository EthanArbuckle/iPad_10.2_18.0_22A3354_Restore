@implementation CRLiOSCanvasViewControllerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLiOSCanvasViewController");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLiOSCanvasViewControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)_crlaxIsInEyeDropperMode
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414B1B);
}

- (void)_crlaxSetIsInEyeDropperMode:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414B1B, a3);
}

- (BOOL)crlaxIsInEyeDropperMode
{
  return -[CRLiOSCanvasViewControllerAccessibility _crlaxIsInEyeDropperMode](self, "_crlaxIsInEyeDropperMode");
}

- (void)crlaxCancelEyeDropperMode
{
  void *v3;
  id v4;

  if (-[CRLiOSCanvasViewControllerAccessibility crlaxIsInEyeDropperMode](self, "crlaxIsInEyeDropperMode"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Eye dropper mode canceled"), 0, 0));
    CRLAccessibilityPostHighPriorityAnnouncementNotification(self, v3);

  }
}

- (NSArray)crlaxEditMenuItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;

  if (!-[CRLiOSCanvasViewControllerAccessibility _crlaxIsEditMenuAllowedToAppear](self, "_crlaxIsEditMenuAllowedToAppear"))return (NSArray *)0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewControllerAccessibility _crlaxInteractiveCanvasController](self, "_crlaxInteractiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxEditorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxSelectionPath"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewControllerAccessibility crlaxBasicEditMenuItemNames](self, "crlaxBasicEditMenuItemNames"));
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100020860;
    v11[3] = &unk_10122D3B0;
    v11[4] = self;
    v8 = v6;
    v12 = v8;
    v13 = v5;
    if (__CRLAccessibilityPerformSafeBlock((uint64_t)v11))
      abort();

    if (objc_msgSend(v8, "count"))
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return (NSArray *)v9;
}

- (id)crlaxWindow
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  return v4;
}

- (void)showEditMenuForSelectionPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CRLiOSCanvasViewControllerAccessibility *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002095C;
  v7[3] = &unk_10122D3D8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "crlaxPerformBlockPreventingMakingVisible:", v7);

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = objc_msgSend(v3, "isCurrentlyInQuickSelectMode");

  if (!v4)
    return 0;
  v5 = objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend((id)v5, "leaveQuickSelectModeIfNeeded");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  LOBYTE(v5) = objc_msgSend(v6, "isCurrentlyInQuickSelectMode");

  return v5 ^ 1;
}

- (CRLCanvasInteractiveCanvasControllerAccessibility)_crlaxInteractiveCanvasController
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interactiveCanvasController"));

  v5 = (void *)objc_opt_class(CRLCanvasInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasInteractiveCanvasControllerAccessibility *)v8;
}

- (id)crlaxBasicEditMenuItemNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Cut"), 0, 0));
  objc_msgSend(v2, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Copy"), 0, 0));
  objc_msgSend(v2, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Paste"), 0, 0));
  objc_msgSend(v2, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Delete"), 0, 0));
  objc_msgSend(v2, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Duplicate"), 0, 0));
  objc_msgSend(v2, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Lock"), 0, 0));
  objc_msgSend(v2, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Unlock"), 0, 0));
  objc_msgSend(v2, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Back"), 0, 0));
  objc_msgSend(v2, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Front"), 0, 0));
  objc_msgSend(v2, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Select"), 0, 0));
  objc_msgSend(v2, "addObject:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Select All"), 0, 0));
  objc_msgSend(v2, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Deselect All"), 0, 0));
  objc_msgSend(v2, "addObject:", v26);

  v27 = objc_msgSend(v2, "copy");
  return v27;
}

- (SEL)crlaxSelectorForEditMenuItemName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const char *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  unsigned int v40;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Cut"), 0, 0));
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if (v6)
  {
    v7 = "cut:";
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Copy"), 0, 0));
    v10 = objc_msgSend(v3, "isEqualToString:", v9);

    if (v10)
    {
      v7 = "copy:";
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Paste"), 0, 0));
      v13 = objc_msgSend(v3, "isEqualToString:", v12);

      if (v13)
      {
        v7 = "paste:";
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Delete"), 0, 0));
        v16 = objc_msgSend(v3, "isEqualToString:", v15);

        if (v16)
        {
          v7 = "delete:";
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Duplicate"), 0, 0));
          v19 = objc_msgSend(v3, "isEqualToString:", v18);

          if (v19)
          {
            v7 = "duplicate:";
          }
          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Lock"), 0, 0));
            v22 = objc_msgSend(v3, "isEqualToString:", v21);

            if (v22)
            {
              v7 = "lock:";
            }
            else
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Unlock"), 0, 0));
              v25 = objc_msgSend(v3, "isEqualToString:", v24);

              if (v25)
              {
                v7 = "unlock:";
              }
              else
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Back"), 0, 0));
                v28 = objc_msgSend(v3, "isEqualToString:", v27);

                if (v28)
                {
                  v7 = "sendToBack:";
                }
                else
                {
                  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Front"), 0, 0));
                  v31 = objc_msgSend(v3, "isEqualToString:", v30);

                  if (v31)
                  {
                    v7 = "bringToFront:";
                  }
                  else
                  {
                    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Select"), 0, 0));
                    v34 = objc_msgSend(v3, "isEqualToString:", v33);

                    if (v34)
                    {
                      v7 = "select:";
                    }
                    else
                    {
                      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Select All"), 0, 0));
                      v37 = objc_msgSend(v3, "isEqualToString:", v36);

                      if (v37)
                      {
                        v7 = "selectAll:";
                      }
                      else
                      {
                        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Deselect All"), 0, 0));
                        v40 = objc_msgSend(v3, "isEqualToString:", v39);

                        if (v40)
                          v7 = "deselectAll:";
                        else
                          v7 = 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v7;
}

- (id)accessibilityCustomActions
{
  id v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", &__NSArray0__struct);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  if (!objc_msgSend(v4, "allowedToEnterQuickSelectMode"))
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = objc_msgSend(v5, "isCurrentlyInQuickSelectMode");

  if ((v6 & 1) == 0)
  {
    v7 = objc_alloc((Class)UIAccessibilityCustomAction);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Select Objects"), 0, 0));
    v4 = objc_msgSend(v7, "initWithName:image:target:selector:", v9, 0, self, "crlaxEnterQuickSelect");

    objc_msgSend(v3, "addObject:", v4);
LABEL_4:

  }
  return v3;
}

- (void)crlaxEnterQuickSelect
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "enterQuickSelectMode");

}

- (BOOL)_crlaxIsEditMenuAllowedToAppear
{
  void *v2;
  void *v3;
  SEL v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  v4 = NSSelectorFromString(CFSTR("allowEditMenuToAppear"));
  if ((objc_opt_respondsToSelector(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "crlaxBoolValueForKey:", CFSTR("allowEditMenuToAppear"));
  else
    v5 = 1;

  return v5;
}

@end
