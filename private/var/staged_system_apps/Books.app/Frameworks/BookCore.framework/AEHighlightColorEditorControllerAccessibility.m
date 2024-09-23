@implementation AEHighlightColorEditorControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AEHighlightColorEditorController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (void)_axEnumerateButtonsUsingBlock:(id)a3
{
  void (**v4)(id, void *, id, _BYTE *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  void *v23;
  int v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unsigned __int8 v33;
  _QWORD v34[4];
  _BYTE v35[128];

  v4 = (void (**)(id, void *, id, _BYTE *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility _imaxColorControls](self, "_imaxColorControls"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility _imaxAddNoteButton](self, "_imaxAddNoteButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility _imaxDeleteButton](self, "_imaxDeleteButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility _imaxShareButton](self, "_imaxShareButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility _imaxRightArrowButton](self, "_imaxRightArrowButton"));
  v33 = 0;
  v10 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
  {
    v26 = v8;
    v27 = v7;
    v28 = v6;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imaxValueForKey:", CFSTR("tag")));
        v4[2](v4, v16, objc_msgSend(v17, "unsignedIntegerValue"), &v33);

        if (v33)
          break;
        if (v13 == (id)++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          if (v13)
            goto LABEL_4;
          break;
        }
      }
    }

    v7 = v27;
    v6 = v28;
    v8 = v26;
  }
  v18 = v6;
  v34[0] = v18;
  v19 = v7;
  v34[1] = v19;
  v20 = v8;
  v34[2] = v20;
  v21 = v9;
  v34[3] = v21;
  if (!v33)
  {
    v22 = 0;
    do
    {
      v23 = (void *)v34[v22];
      if (v23)
      {
        v4[2](v4, v23, 0, &v33);
        v24 = v33;
      }
      else
      {
        v24 = 0;
      }
      if (v22 > 2)
        break;
      ++v22;
    }
    while (!v24);
  }
  for (i = 3; i != -1; --i)

}

- (void)_axClearReferencesToSelfInButtons
{
  -[AEHighlightColorEditorControllerAccessibility _axEnumerateButtonsUsingBlock:](self, "_axEnumerateButtonsUsingBlock:", &stru_28EEF0);
}

- (void)dealloc
{
  objc_super v3;

  -[AEHighlightColorEditorControllerAccessibility _axClearReferencesToSelfInButtons](self, "_axClearReferencesToSelfInButtons");
  v3.receiver = self;
  v3.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  -[AEHighlightColorEditorControllerAccessibility dealloc](&v3, "dealloc");
}

- (void)releaseOutlets
{
  objc_super v3;

  -[AEHighlightColorEditorControllerAccessibility _axClearReferencesToSelfInButtons](self, "_axClearReferencesToSelfInButtons");
  v3.receiver = self;
  v3.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  -[AEHighlightColorEditorControllerAccessibility releaseOutlets](&v3, "releaseOutlets");
}

- (void)showColorControlsMenu:(id)a3
{
  void *v4;
  void *v5;
  UIAccessibilityNotifications v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  -[AEHighlightColorEditorControllerAccessibility showColorControlsMenu:](&v8, "showColorControlsMenu:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("colorControls")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imaxValueForKey:", CFSTR("subviews")));

  if (objc_msgSend(v5, "count"))
  {
    v6 = IMAccessibilityMoveToElementNotification;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
    UIAccessibilityPostNotification(v6, v7);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  _QWORD v31[5];
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  -[AEHighlightColorEditorControllerAccessibility viewDidLoad](&v32, "viewDidLoad");
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_78A80;
  v31[3] = &unk_28EF18;
  v31[4] = self;
  -[AEHighlightColorEditorControllerAccessibility _axEnumerateButtonsUsingBlock:](self, "_axEnumerateButtonsUsingBlock:", v31);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("calloutBar")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imaxValueForKey:", CFSTR("controls")));

  if (-[AEHighlightColorEditorControllerAccessibility imaxBoolValueForKey:](self, "imaxBoolValueForKey:", CFSTR("p_shouldShowCompactMenu")))
  {
    v30 = 0;
    v5 = (objc_class *)objc_opt_class(UIView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
    v7 = __IMAccessibilityCastAsClass(v5, v6, 1, &v30);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v30)
      abort();
    v9 = IMAXLocString(CFSTR("highlight.colors"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "setAccessibilityLabel:", v10);

    objc_msgSend(v8, "setIsAccessibilityElement:", 1);
    objc_msgSend(v8, "setAccessibilityTraits:", IMAccessibilityTraitMenuItem);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("annotation")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imaxValueForKey:", CFSTR("annotationNote")));
  v13 = objc_msgSend(v12, "length");

  if (v13)
    v14 = CFSTR("edit.annotation");
  else
    v14 = CFSTR("create.annotation");
  v15 = IMAXLocString(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility _imaxAddNoteButton](self, "_imaxAddNoteButton"));
  objc_msgSend(v17, "setAccessibilityLabel:", v16);

  v18 = IMAccessibilityTraitMenuItem;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility _imaxAddNoteButton](self, "_imaxAddNoteButton"));
  objc_msgSend(v19, "setAccessibilityTraits:", v18);

  v20 = IMAXLocString(CFSTR("delete.annotation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility _imaxDeleteButton](self, "_imaxDeleteButton"));
  objc_msgSend(v22, "setAccessibilityLabel:", v21);

  v23 = IMAccessibilityTraitMenuItem;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility _imaxDeleteButton](self, "_imaxDeleteButton"));
  objc_msgSend(v24, "setAccessibilityTraits:", v23);

  v25 = IMAXLocString(CFSTR("show.next.items.menu.button"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility _imaxRightArrowButton](self, "_imaxRightArrowButton"));
  objc_msgSend(v27, "setAccessibilityLabel:", v26);

  v28 = IMAccessibilityTraitMenuItem;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility _imaxRightArrowButton](self, "_imaxRightArrowButton"));
  objc_msgSend(v29, "setAccessibilityTraits:", v28);

}

- (void)didShow
{
  id v3;
  _QWORD v4[6];
  uint64_t v5;
  id *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  -[AEHighlightColorEditorControllerAccessibility didShow](&v17, "didShow");
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_78C54;
  v15 = sub_78C64;
  v16 = 0;
  v5 = 0;
  v6 = (id *)&v5;
  v7 = 0x3032000000;
  v8 = sub_78C54;
  v9 = sub_78C64;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_78C6C;
  v4[3] = &unk_28EF40;
  v4[4] = &v11;
  v4[5] = &v5;
  -[AEHighlightColorEditorControllerAccessibility _axEnumerateButtonsUsingBlock:](self, "_axEnumerateButtonsUsingBlock:", v4);
  v3 = v6[5];
  if (!v3)
  {
    objc_storeStrong(v6 + 5, (id)v12[5]);
    v3 = v6[5];
  }
  UIAccessibilityPostNotification(IMAccessibilityMoveToElementNotification, v3);
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(&v11, 8);
}

- (void)p_updateAppearance
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  -[AEHighlightColorEditorControllerAccessibility p_updateAppearance](&v3, "p_updateAppearance");
  -[AEHighlightColorEditorControllerAccessibility _axEnumerateButtonsUsingBlock:](self, "_axEnumerateButtonsUsingBlock:", &stru_28EF60);
}

- (id)_imaxColorControls
{
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = (objc_class *)objc_opt_class(UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("colorControls")));
  v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();
  return v6;
}

- (id)_imaxAddNoteButton
{
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("addNoteButton")));
  v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();
  return v6;
}

- (id)_imaxDeleteButton
{
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("deleteButton")));
  v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();
  return v6;
}

- (id)_imaxShareButton
{
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("shareButton")));
  v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();
  return v6;
}

- (id)_imaxRightArrowButton
{
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("rightArrowButton")));
  v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();
  return v6;
}

@end
