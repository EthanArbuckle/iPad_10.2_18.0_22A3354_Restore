@implementation AEHighlightColorEditorController

- (void)releaseOutlets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AEHighlightColorEditorController;
  -[AEAnnotationPopoverViewController releaseOutlets](&v7, "releaseOutlets");
  -[AEHighlightColorEditorController setCalloutBar:](self, "setCalloutBar:", 0);
  -[AEHighlightColorEditorController setColorControls:](self, "setColorControls:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController addNoteButton](self, "addNoteButton"));
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[AEHighlightColorEditorController setAddNoteButton:](self, "setAddNoteButton:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController deleteButton](self, "deleteButton"));
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[AEHighlightColorEditorController setDeleteButton:](self, "setDeleteButton:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController rightArrowButton](self, "rightArrowButton"));
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[AEHighlightColorEditorController setRightArrowButton:](self, "setRightArrowButton:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController shareButton](self, "shareButton"));
  objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[AEHighlightColorEditorController setShareButton:](self, "setShareButton:", 0);
  -[AEHighlightColorEditorController setAlertController:](self, "setAlertController:", 0);
}

- (void)loadView
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 435.0, 55.0);
  -[AEHighlightColorEditorController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  IMCalloutBar *v3;
  void *v4;
  IMCalloutBar *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  AEFingerPotView *v11;
  double x;
  double y;
  double width;
  double height;
  AEFingerPotView *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  AEFingerPotView *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  UIButton *v28;
  UIButton *mAddNoteButton;
  UIButton *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  UIButton *v35;
  UIButton *mShareButton;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  void *v55;
  id v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  unsigned int v62;
  objc_super v63;
  CGRect v64;
  CGRect v65;

  v63.receiver = self;
  v63.super_class = (Class)AEHighlightColorEditorController;
  -[AEAnnotationPopoverViewController viewDidLoad](&v63, "viewDidLoad");
  v3 = [IMCalloutBar alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = -[IMCalloutBar initWithFrame:](v3, "initWithFrame:");

  -[IMCalloutBar setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v7, "editorController:isRightArrowEnabledForAnnotation:") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController annotation](self, "annotation"));
    v62 = objc_msgSend(v7, "editorController:isRightArrowEnabledForAnnotation:", self, v8);

  }
  else
  {
    v62 = 1;
  }
  if (-[AEHighlightColorEditorController p_shouldShowCompactMenu](self, "p_shouldShowCompactMenu"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController annotationTheme](self, "annotationTheme"));
    v10 = -[AEHighlightColorEditorController p_buttonTagForTheme:](self, "p_buttonTagForTheme:", v9);

    v11 = [AEFingerPotView alloc];
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v16 = -[AEFingerPotView initWithFrame:](v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController p_paletteImageForTag:pageTheme:](self, "p_paletteImageForTag:pageTheme:", v10, -[AEHighlightColorEditorController pageTheme](self, "pageTheme")));
    -[AEFingerPotView setImage:forState:](v16, "setImage:forState:", v17, 0);

    -[AEFingerPotView addTarget:action:forControlEvents:](v16, "addTarget:action:forControlEvents:", self, "showColorControlsMenu:", 64);
    -[AEFingerPotView setFrame:](v16, "setFrame:", 0.0, 0.0, 40.0, 38.0);
    v18 = IMCommonCoreBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Colors\\U2026"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    -[AEFingerPotView setAccessibilityLabel:](v16, "setAccessibilityLabel:", v20);

  }
  else
  {
    v16 = (AEFingerPotView *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController colorControls](self, "colorControls"));
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  objc_msgSend(v6, "addObject:", v16);
  v21 = -[AEFingerPotView initWithFrame:]([AEFingerPotView alloc], "initWithFrame:", x, y, width, height);
  v22 = IMCommonCoreBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("ib_text_pop_icon_trash"), v23));
  -[AEFingerPotView setImage:forState:](v21, "setImage:forState:", v24, 0);

  -[AEFingerPotView addTarget:action:forControlEvents:](v21, "addTarget:action:forControlEvents:", self, "handleDeleteButtonTap:", 64);
  -[AEFingerPotView setFrame:](v21, "setFrame:", 0.0, 0.0, 40.0, 38.0);
  v25 = IMCommonCoreBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Remove Highlight"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  -[AEFingerPotView setAccessibilityLabel:](v21, "setAccessibilityLabel:", v27);

  -[AEHighlightColorEditorController setDeleteButton:](self, "setDeleteButton:", v21);
  objc_msgSend(v6, "addObject:", v21);
  v28 = (UIButton *)objc_claimAutoreleasedReturnValue(+[IMCalloutButton buttonWithType:](IMCalloutButton, "buttonWithType:", 0));
  mAddNoteButton = self->mAddNoteButton;
  self->mAddNoteButton = v28;

  v30 = self->mAddNoteButton;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController p_noteGlyphForTag:pageTheme:](self, "p_noteGlyphForTag:pageTheme:", 1, -[AEHighlightColorEditorController pageTheme](self, "pageTheme")));
  -[UIButton setImage:forState:](v30, "setImage:forState:", v31, 0);

  -[UIButton addTarget:action:forControlEvents:](self->mAddNoteButton, "addTarget:action:forControlEvents:", self, "handleAddNoteButton:", 64);
  -[UIButton setFrame:](self->mAddNoteButton, "setFrame:", 0.0, 0.0, 40.0, 38.0);
  v32 = IMCommonCoreBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Note"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  -[UIButton setAccessibilityLabel:](self->mAddNoteButton, "setAccessibilityLabel:", v34);

  objc_msgSend(v6, "addObject:", self->mAddNoteButton);
  if (-[AEHighlightColorEditorController p_shouldShowShareButton](self, "p_shouldShowShareButton"))
  {
    v35 = (UIButton *)objc_claimAutoreleasedReturnValue(+[IMCalloutButton buttonWithType:](IMCalloutButton, "buttonWithType:", 0));
    mShareButton = self->mShareButton;
    self->mShareButton = v35;

    v37 = IMCommonCoreBundle();
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("ib_text_pop_icon_actions"), v38));

    -[UIButton setImage:forState:](self->mShareButton, "setImage:forState:", v39, 0);
    -[UIButton addTarget:action:forControlEvents:](self->mShareButton, "addTarget:action:forControlEvents:", self, "handleShareButton:", 64);
    -[UIButton setFrame:](self->mShareButton, "setFrame:", 0.0, 0.0, 40.0, 38.0);
    v40 = IMCommonCoreBundle();
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("Share"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    -[UIButton setAccessibilityLabel:](self->mShareButton, "setAccessibilityLabel:", v42);

    objc_msgSend(v6, "addObject:", self->mShareButton);
  }
  if (v62)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[IMCalloutButton buttonWithType:](IMCalloutButton, "buttonWithType:", 0));
    v44 = IMCommonCoreBundle();
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("ib_text_pop_icon_more"), v45));
    objc_msgSend(v43, "setImage:forState:", v46, 0);

    objc_msgSend(v43, "addTarget:action:forControlEvents:", self, "handleRightArrowButton:", 64);
    objc_msgSend(v43, "setFrame:", 0.0, 0.0, 40.0, 38.0);
    v47 = IMCommonCoreBundle();
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("More"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    objc_msgSend(v43, "setAccessibilityLabel:", v49);

    -[AEHighlightColorEditorController setRightArrowButton:](self, "setRightArrowButton:", v43);
    objc_msgSend(v6, "addObject:", v43);

  }
  -[IMCalloutBar setControls:](v5, "setControls:", v6);
  -[IMCalloutBar sizeThatFitsControls:](v5, "sizeThatFitsControls:", v6);
  v51 = v50;
  v53 = v52;
  if (-[AEHighlightColorEditorController p_shouldShowCompactMenu](self, "p_shouldShowCompactMenu"))
  {
    v54 = objc_alloc((Class)NSArray);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController colorControls](self, "colorControls"));
    v56 = objc_msgSend(v54, "initWithObjects:", v55, 0);

    -[IMCalloutBar sizeThatFitsControls:](v5, "sizeThatFitsControls:", v56);
    if (v51 < v57)
      v51 = v57;

  }
  -[IMCalloutBar setFrame:](v5, "setFrame:", 0.0, 0.0, v51, v53);
  -[IMCalloutBar frame](v5, "frame");
  v58 = CGRectGetWidth(v64);
  -[IMCalloutBar frame](v5, "frame");
  v59 = CGRectGetHeight(v65);
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController view](self, "view"));
  objc_msgSend(v60, "setFrame:", 0.0, 0.0, v58, v59);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController view](self, "view"));
  objc_msgSend(v61, "addSubview:", v5);

  -[AEHighlightColorEditorController setCalloutBar:](self, "setCalloutBar:", v5);
  -[AEHighlightColorEditorController p_updateAppearance](self, "p_updateAppearance");

}

- (BOOL)p_shouldShowShareButton
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "editorController:shareAnnotation:") & 1) != 0
    && (objc_opt_respondsToSelector(v3, "editorController:isSharingEnabledForAnnotation:") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController annotation](self, "annotation"));
    v5 = objc_msgSend(v3, "editorController:isSharingEnabledForAnnotation:", self, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)p_shouldShowCompactMenu
{
  if ((-[AEHighlightColorEditorController im_isCompactWidth](self, "im_isCompactWidth") & 1) != 0)
    return 1;
  else
    return -[AEHighlightColorEditorController p_shouldShowShareButton](self, "p_shouldShowShareButton");
}

- (UIView)colorControls
{
  UIView *mColorControls;
  UIView *v4;
  UIView *v5;
  void *v6;
  double v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double y;
  double width;
  double height;
  void *i;
  char *v16;
  AEFingerPotView *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  mColorControls = self->mColorControls;
  if (!mColorControls)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    v5 = self->mColorControls;
    self->mColorControls = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("Yellow"), CFSTR("Green"), CFSTR("Blue"), CFSTR("Pink"), CFSTR("Purple"), CFSTR("Underline"), 0));
    v21 = 0u;
    v22 = 0u;
    if (-[AEHighlightColorEditorController p_shouldShowCompactMenu](self, "p_shouldShowCompactMenu"))
      v7 = 0.0;
    else
      v7 = 2.0;
    v23 = 0uLL;
    v24 = 0uLL;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v16 = (char *)objc_msgSend(v8, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i)) + 1;
          v17 = -[AEFingerPotView initWithFrame:]([AEFingerPotView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController p_colorControlImageForTag:pageTheme:](self, "p_colorControlImageForTag:pageTheme:", v16, -[AEHighlightColorEditorController pageTheme](self, "pageTheme")));
          -[AEFingerPotView setMenuImage:](v17, "setMenuImage:", v18);

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[AEHighlightColorEditorController localizedColorNameStringForStyle:](AEHighlightColorEditorController, "localizedColorNameStringForStyle:", v16));
          -[AEFingerPotView setAccessibilityLabel:](v17, "setAccessibilityLabel:", v19);

          -[AEFingerPotView addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", self, "useColorOf:", 64);
          -[AEFingerPotView setFrame:](v17, "setFrame:", v7, 0.0, 38.0, 38.0);
          -[AEFingerPotView setTag:](v17, "setTag:", v16);
          -[UIView addSubview:](self->mColorControls, "addSubview:", v17);
          v7 = v7 + 42.0;

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    -[UIView setFrame:](self->mColorControls, "setFrame:", 0.0, 0.0, v7 + -5.0, 38.0);
    mColorControls = self->mColorControls;
  }
  return mColorControls;
}

- (int64_t)p_buttonTagForTheme:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v5 = objc_opt_class(AEAnnotationThemeBlue, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v7 = 3;
  }
  else
  {
    v8 = objc_opt_class(AEAnnotationThemeGreen, v6);
    if ((objc_opt_isKindOfClass(v3, v8) & 1) != 0)
    {
      v7 = 2;
    }
    else
    {
      v10 = objc_opt_class(AEAnnotationThemeYellow, v9);
      if ((objc_opt_isKindOfClass(v3, v10) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        v12 = objc_opt_class(3153920, v11);
        if ((objc_opt_isKindOfClass(v3, v12) & 1) != 0)
        {
          v7 = 4;
        }
        else
        {
          v14 = objc_opt_class(AEAnnotationThemePurple, v13);
          if ((objc_opt_isKindOfClass(v3, v14) & 1) != 0)
          {
            v7 = 5;
          }
          else
          {
            v16 = objc_opt_class(AEAnnotationThemeUnderline, v15);
            if ((objc_opt_isKindOfClass(v3, v16) & 1) != 0)
              v7 = 6;
            else
              v7 = 0;
          }
        }
      }
    }
  }

  return v7;
}

- (void)p_updateAppearance
{
  void *v3;
  int64_t v4;
  uint64_t i;
  void *v6;
  UIButton *mAddNoteButton;
  void *v8;
  _BOOL8 v9;
  id v10;

  if (-[AEHighlightColorEditorController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController annotationTheme](self, "annotationTheme"));
    v4 = -[AEHighlightColorEditorController p_buttonTagForTheme:](self, "p_buttonTagForTheme:", v3);

    for (i = 1; i != 7; ++i)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView viewWithTag:](self->mColorControls, "viewWithTag:", i));
      objc_msgSend(v6, "setSelected:", v4 == i);

    }
    mAddNoteButton = self->mAddNoteButton;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController p_noteGlyphForTag:pageTheme:](self, "p_noteGlyphForTag:pageTheme:", v4, -[AEHighlightColorEditorController pageTheme](self, "pageTheme")));
    -[UIButton setImage:forState:](mAddNoteButton, "setImage:forState:", v8, 0);

    v9 = self->super.mPosition == 1;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController calloutBar](self, "calloutBar"));
    objc_msgSend(v10, "setUp:", v9);

  }
}

- (BOOL)canPresentInPosition:(int)a3
{
  return a3 < 2;
}

- (void)willShow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AEHighlightColorEditorController;
  -[AEAnnotationPopoverViewController willShow](&v4, "willShow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController calloutBar](self, "calloutBar"));
  objc_msgSend(v3, "setBlurDisabled:", 1);

}

- (void)didShow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AEHighlightColorEditorController;
  -[AEAnnotationPopoverViewController didShow](&v4, "didShow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController calloutBar](self, "calloutBar"));
  objc_msgSend(v3, "setBlurDisabled:", 0);

}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MidX;
  void *v20;
  objc_super v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)AEHighlightColorEditorController;
  v9 = a4;
  -[AEAnnotationPopoverViewController presentFromRect:view:](&v21, "presentFromRect:view:", v9, x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController calloutBar](self, "calloutBar", v21.receiver, v21.super_class));
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v22.origin.x = v12;
  v22.origin.y = v14;
  v22.size.width = v16;
  v22.size.height = v18;
  MidX = CGRectGetMidX(v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController calloutBar](self, "calloutBar"));
  objc_msgSend(v20, "setArrowX:", MidX);

}

- (void)setPosition:(int)a3
{
  self->super.mPosition = a3;
  -[AEHighlightColorEditorController p_updateAppearance](self, "p_updateAppearance");
}

+ (id)localizedColorNameStringForStyle:(int64_t)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  switch(a3)
  {
    case 1:
      v3 = IMCommonCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      v5 = v4;
      v6 = CFSTR("Yellow");
      goto LABEL_9;
    case 2:
      v8 = IMCommonCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v5 = v4;
      v6 = CFSTR("Green");
      goto LABEL_9;
    case 3:
      v9 = IMCommonCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v5 = v4;
      v6 = CFSTR("Blue");
      goto LABEL_9;
    case 4:
      v10 = IMCommonCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v5 = v4;
      v6 = CFSTR("Pink");
      goto LABEL_9;
    case 5:
      v11 = IMCommonCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v5 = v4;
      v6 = CFSTR("Purple");
      goto LABEL_9;
    case 6:
      v12 = IMCommonCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v5 = v4;
      v6 = CFSTR("Underline");
LABEL_9:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_296430, CFSTR("BCCommonCoreLocalizable")));

      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

+ (id)p_themeForStyle:(int64_t)a3 pageTheme:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  switch(a3)
  {
    case 1:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme yellowTheme:](AEAnnotationTheme, "yellowTheme:", a4, v4, v5));
      break;
    case 2:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme greenTheme:](AEAnnotationTheme, "greenTheme:", a4, v4, v5));
      break;
    case 3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme blueTheme:](AEAnnotationTheme, "blueTheme:", a4, v4, v5));
      break;
    case 4:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme pinkTheme:](AEAnnotationTheme, "pinkTheme:", a4, v4, v5));
      break;
    case 5:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme purpleTheme:](AEAnnotationTheme, "purpleTheme:", a4, v4, v5));
      break;
    case 6:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme underlineTheme:](AEAnnotationTheme, "underlineTheme:", a4, v4, v5));
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (id)p_themeForStyle:(int64_t)a3 pageTheme:(int64_t)a4
{
  return +[AEHighlightColorEditorController p_themeForStyle:pageTheme:](AEHighlightColorEditorController, "p_themeForStyle:pageTheme:", a3, a4);
}

- (void)p_setStyle:(int64_t)a3 forAnnotation:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController annotationTheme](self, "annotationTheme"));
  v8 = objc_msgSend(v7, "pageTheme");

  v10 = (id)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController p_themeForStyle:pageTheme:](self, "p_themeForStyle:pageTheme:", a3, v8));
  -[AEAnnotationPopoverViewController setAnnotationTheme:](self, "setAnnotationTheme:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](self, "delegate"));
  objc_msgSend(v9, "editorController:setTheme:forAnnotation:", self, v10, v6);

}

- (void)p_removeAnnotation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](self, "delegate"));
  objc_msgSend(v5, "editorController:deleteAnnotation:", self, v4);

}

- (void)p_postDeleteConfirmation
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v3 = IMCommonCoreBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Delete Highlight"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v6 = IMCommonCoreBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("The associated note will also be deleted."), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v9 = IMCommonCoreBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v12 = IMCommonCoreBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v8, 1));
  -[AEHighlightColorEditorController setAlertController:](self, "setAlertController:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, 0));
  objc_msgSend(v15, "addAction:", v16);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_154548;
  v18[3] = &unk_292828;
  v18[4] = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 2, v18));
  objc_msgSend(v15, "addAction:", v17);

  -[AEHighlightColorEditorController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController alertController](self, "alertController"));
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  -[AEHighlightColorEditorController setAlertController:](self, "setAlertController:", 0);
  v6.receiver = self;
  v6.super_class = (Class)AEHighlightColorEditorController;
  -[AEAnnotationPopoverViewController setDelegate:](&v6, "setDelegate:", v4);

}

- (void)useColorOf:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(a3, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController annotation](self, "annotation"));
  -[AEHighlightColorEditorController p_setStyle:forAnnotation:](self, "p_setStyle:forAnnotation:", v4, v5);

  -[AEHighlightColorEditorController p_updateAppearance](self, "p_updateAppearance");
}

- (void)showColorControlsMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_alloc((Class)NSArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController colorControls](self, "colorControls"));
  v7 = objc_msgSend(v4, "initWithObjects:", v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController calloutBar](self, "calloutBar"));
  objc_msgSend(v6, "setControls:", v7);

}

- (void)handleAddNoteButton:(id)a3
{
  void *v4;
  id v5;

  -[AEAnnotationPopoverViewController hide](self, "hide", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController annotation](self, "annotation"));
  objc_msgSend(v5, "editorController:editNote:", self, v4);

}

- (void)handleShareButton:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "editorController:shareAnnotation:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController annotation](self, "annotation"));
    objc_msgSend(v6, "editorController:shareAnnotation:", self, v7);

  }
  -[AEAnnotationPopoverViewController hide](self, "hide");
}

- (void)handleDeleteButtonTap:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController annotation](self, "annotation", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationNote"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[AEHighlightColorEditorController p_postDeleteConfirmation](self, "p_postDeleteConfirmation");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController annotation](self, "annotation"));
    -[AEHighlightColorEditorController p_removeAnnotation:](self, "p_removeAnnotation:", v7);

  }
  -[AEAnnotationPopoverViewController hide](self, "hide");
}

- (void)handleRightArrowButton:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](self, "delegate", a3));
  -[AEAnnotationPopoverViewController hide](self, "hide");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController annotation](self, "annotation"));
  objc_msgSend(v5, "editorController:showEditMenuForAnnotation:", self, v4);

}

+ (id)highlightImageForContextMenuForStyle:(int64_t)a3 pageTheme:(int64_t)a4
{
  return +[AEHighlightColorEditorController highlightImageForContextMenuForStyle:pageTheme:size:](AEHighlightColorEditorController, "highlightImageForContextMenuForStyle:pageTheme:size:", a3, a4, 15.0);
}

+ (id)highlightImageForContextMenuForStyle:(int64_t)a3 pageTheme:(int64_t)a4 size:(double)a5
{
  void *v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
  v9 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v8, a5, a5);
  if (a3 == 6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AEHighlightColorEditorController p_underlineForegroundImageForContextMenu](AEHighlightColorEditorController, "p_underlineForegroundImageForContextMenu"));
  }
  else
  {
    v11 = (unint64_t)a4 < 2;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AEHighlightColorEditorController p_themeForStyle:pageTheme:](AEHighlightColorEditorController, "p_themeForStyle:pageTheme:", a3, a4));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "highlightColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bkaxAdjustedForIncreaseContrastAdjustingDarker:", v11));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_154A08;
    v17[3] = &unk_292850;
    v19 = 0;
    v20 = 0;
    v18 = v14;
    v21 = a5;
    v22 = a5;
    v15 = v14;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithActions:", v17));

  }
  return v10;
}

- (id)p_colorForTag:(int64_t)a3 pageTheme:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v9;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_154C54;
  block[3] = &unk_28B960;
  block[4] = self;
  if (qword_3114B0 != -1)
    dispatch_once(&qword_3114B0, block);
  v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        v7 = (void *)qword_311430;
        goto LABEL_24;
      case 1:
        v7 = (void *)qword_311438;
        goto LABEL_24;
      case 2:
        v7 = (void *)qword_311440;
        goto LABEL_24;
      case 3:
        v7 = (void *)qword_311448;
        goto LABEL_24;
      case 4:
        v7 = (void *)qword_311428;
        goto LABEL_24;
      case 5:
        v7 = (void *)qword_311450;
        goto LABEL_24;
      case 6:
        v7 = (void *)qword_311460;
        goto LABEL_24;
      case 7:
        v7 = (void *)qword_311470;
        goto LABEL_24;
      case 8:
        v7 = (void *)qword_311480;
        goto LABEL_24;
      case 9:
        v7 = (void *)qword_311490;
        goto LABEL_24;
      case 10:
        v7 = (void *)qword_3114A0;
        goto LABEL_24;
      case 11:
        v7 = (void *)qword_311458;
        goto LABEL_24;
      case 12:
        v7 = (void *)qword_311468;
        goto LABEL_24;
      case 13:
        v7 = (void *)qword_311478;
        goto LABEL_24;
      case 14:
        v7 = (void *)qword_311488;
        goto LABEL_24;
      case 15:
        v7 = (void *)qword_311498;
        goto LABEL_24;
      case 16:
        v7 = (void *)qword_3114A8;
LABEL_24:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9));

        return v6;
      default:
        return 0;
    }
  }
  return v6;
}

- (void)p_drawColorControlCircleWithFrame:(CGRect)a3 color:(id)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  CGContext *CurrentContext;
  void *v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v9 = CGRectGetWidth(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v10 = CGRectGetHeight(v15);
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(v8, "setStroke");
  objc_msgSend(v8, "setFill");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", x, y, v11, v11));
  objc_msgSend(v13, "stroke");
  objc_msgSend(v13, "fill");

  CGContextRestoreGState(CurrentContext);
}

- (id)p_colorControlImageForColor:(id)a3 withForegroundImage:(id)a4
{
  id v6;
  id v7;
  UIImage *ImageFromCurrentImageContext;
  void *v9;
  CGSize v11;

  v6 = a4;
  v7 = a3;
  v11.width = 38.0;
  v11.height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  -[AEHighlightColorEditorController p_drawColorControlCircleWithFrame:color:](self, "p_drawColorControlCircleWithFrame:color:", v7, 6.0, 6.0, 26.0, 26.0);

  objc_msgSend(v6, "drawAtPoint:", 6.0, 6.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v9;
}

- (id)p_colorControlImageForColor:(id)a3
{
  return -[AEHighlightColorEditorController p_colorControlImageForColor:withForegroundImage:](self, "p_colorControlImageForColor:withForegroundImage:", a3, 0);
}

+ (id)p_underlineForegroundImageForContextMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  v10[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v10[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 13.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationByApplyingConfiguration:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("underline"), v7));

  return v8;
}

+ (id)p_underlineForegroundImageForPageTheme:(int64_t)a3
{
  __CFString *v3;
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = CFSTR("ib_text_pop_icon_highlight_underline");
  if (a3 == 3)
    v3 = CFSTR("ib_text_pop_icon_highlight_underline_night");
  v4 = v3;
  v5 = IMCommonCoreBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", v4, v6));

  return v7;
}

- (id)p_colorControlUnderlineImageForPageTheme:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController p_colorForTag:pageTheme:](self, "p_colorForTag:pageTheme:", 6, a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEHighlightColorEditorController p_underlineForegroundImageForPageTheme:](AEHighlightColorEditorController, "p_underlineForegroundImageForPageTheme:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController p_colorControlImageForColor:withForegroundImage:](self, "p_colorControlImageForColor:withForegroundImage:", v5, v6));

  return v7;
}

- (id)p_colorControlImageForTag:(int64_t)a3 pageTheme:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v9;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1555F0;
  block[3] = &unk_28B960;
  block[4] = self;
  if (qword_3114E0 != -1)
    dispatch_once(&qword_3114E0, block);
  v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        v7 = (void *)qword_3114C0;
        goto LABEL_12;
      case 1:
        v7 = (void *)qword_3114C8;
        goto LABEL_12;
      case 2:
        v7 = (void *)qword_3114D0;
        goto LABEL_12;
      case 3:
        v7 = (void *)qword_3114D8;
        goto LABEL_12;
      case 4:
        v7 = (void *)qword_3114B8;
LABEL_12:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9));

        return v6;
      default:
        return 0;
    }
  }
  return v6;
}

- (void)p_drawCrescentWithCircleRect:(CGRect)a3 color:(id)a4 leftShift:(double)a5 addRadius:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  id v12;
  CGContext *CurrentContext;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double MaxX;
  double v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  void *v25;
  double MidY;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v28 = CGRectGetMidX(v31) - a5;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MidY = CGRectGetMidY(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v27 = a6;
  v29 = height;
  v30 = CGRectGetHeight(v33) * 0.5 + a6;
  v34.origin.x = x - a5;
  v34.origin.y = y;
  v14 = y;
  v34.size.width = width;
  v15 = width;
  v34.size.height = height;
  v35 = CGRectInset(v34, -a6, -a6);
  v16 = v35.origin.x;
  v17 = v35.origin.y;
  v18 = v35.size.height;
  MaxX = CGRectGetMaxX(v35);
  v36.origin.x = x;
  v36.origin.y = v14;
  v36.size.width = v15;
  v36.size.height = height;
  v20 = CGRectGetMaxX(v36);
  if (MaxX < v20)
    MaxX = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v28, MidY, v30, -1.57079633, 1.57079633, *(_QWORD *)&MidY));
  v37.origin.x = v16;
  v37.origin.y = v17;
  v37.size.width = MaxX;
  v37.size.height = v18;
  v22 = CGRectGetMaxX(v37) + v27;
  v38.origin.x = v16;
  v38.origin.y = v17;
  v38.size.width = MaxX;
  v38.size.height = v18;
  objc_msgSend(v21, "addLineToPoint:", v22, CGRectGetMaxY(v38));
  v39.origin.x = v16;
  v39.origin.y = v17;
  v39.size.width = MaxX;
  v39.size.height = v18;
  v23 = CGRectGetMaxX(v39) + v27;
  v40.origin.x = v16;
  v40.origin.y = v17;
  v40.size.width = MaxX;
  v40.size.height = v18;
  objc_msgSend(v21, "addLineToPoint:", v23, CGRectGetMinY(v40));
  v41.origin.x = v16;
  v41.origin.y = v17;
  v41.size.width = MaxX;
  v41.size.height = v18;
  v24 = v30 + CGRectGetMinX(v41);
  v42.origin.x = v16;
  v42.origin.y = v17;
  v42.size.width = MaxX;
  v42.size.height = v18;
  objc_msgSend(v21, "addLineToPoint:", v24, CGRectGetMinY(v42));
  objc_msgSend(v21, "closePath");
  objc_msgSend(v21, "addClip");
  objc_msgSend(v12, "setStroke");
  objc_msgSend(v12, "setFill");

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", x, v14, v15, v29));
  objc_msgSend(v25, "stroke");
  objc_msgSend(v25, "fill");

  CGContextRestoreGState(CurrentContext);
}

- (id)p_paletteImageWithFrontColor:(id)a3 middleColor:(id)a4 backColor:(id)a5 frontForegroundImage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  UIImage *ImageFromCurrentImageContext;
  void *v16;
  CGSize v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  if (isRetina())
    v14 = 1.5;
  else
    v14 = 2.0;
  v18.width = 40.0;
  v18.height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  -[AEHighlightColorEditorController p_drawCrescentWithCircleRect:color:leftShift:addRadius:](self, "p_drawCrescentWithCircleRect:color:leftShift:addRadius:", v11, 11.5, 5.0, 27.0, 27.0, 5.0, v14);

  -[AEHighlightColorEditorController p_drawCrescentWithCircleRect:color:leftShift:addRadius:](self, "p_drawCrescentWithCircleRect:color:leftShift:addRadius:", v12, 6.5, 5.0, 27.0, 27.0, 5.0, v14);
  -[AEHighlightColorEditorController p_drawColorControlCircleWithFrame:color:](self, "p_drawColorControlCircleWithFrame:color:", v13, 1.5, 5.0, 27.0, 27.0);

  objc_msgSend(v10, "drawInRect:", 1.5, 5.0, 27.0, 27.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v16;
}

- (id)p_buildPaletteImageForFrontTag:(int64_t)a3 middleTag:(int64_t)a4 backTag:(int64_t)a5 pageTheme:(int64_t)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController p_colorForTag:pageTheme:](self, "p_colorForTag:pageTheme:", a3, a6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController p_colorForTag:pageTheme:](self, "p_colorForTag:pageTheme:", a4, a6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController p_colorForTag:pageTheme:](self, "p_colorForTag:pageTheme:", a5, a6));
  if (a3 == 6)
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AEHighlightColorEditorController p_underlineForegroundImageForPageTheme:](AEHighlightColorEditorController, "p_underlineForegroundImageForPageTheme:", a6));
  else
    v14 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightColorEditorController p_paletteImageWithFrontColor:middleColor:backColor:frontForegroundImage:](self, "p_paletteImageWithFrontColor:middleColor:backColor:frontForegroundImage:", v11, v12, v13, v14));

  return v15;
}

- (id)p_paletteImageForTag:(int64_t)a3 pageTheme:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v9;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_155EE8;
  block[3] = &unk_28B960;
  block[4] = self;
  if (qword_311510 != -1)
    dispatch_once(&qword_311510, block);
  v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        v7 = (void *)qword_3114F0;
        goto LABEL_12;
      case 1:
        v7 = (void *)qword_3114F8;
        goto LABEL_12;
      case 2:
        v7 = (void *)qword_311500;
        goto LABEL_12;
      case 3:
        v7 = (void *)qword_311508;
        goto LABEL_12;
      case 4:
        v7 = (void *)qword_3114E8;
LABEL_12:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9));

        return v6;
      default:
        return 0;
    }
  }
  return v6;
}

- (id)p_monochromaticImageFromImage:(id)a3 withColor:(id)a4
{
  id v5;
  id v6;
  CGContext *CurrentContext;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  CGImage *v14;
  UIImage *ImageFromCurrentImageContext;
  void *v16;
  CGSize v18;
  CGRect v19;
  CGRect v20;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "size");
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v6, "size");
  v9 = v8;
  objc_msgSend(v6, "size");
  v11 = v10;
  objc_msgSend(v6, "size");
  CGContextTranslateCTM(CurrentContext, 0.0, v12);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v13 = objc_retainAutorelease(v6);
  v14 = (CGImage *)objc_msgSend(v13, "CGImage");

  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v9;
  v19.size.height = v11;
  CGContextClipToMask(CurrentContext, v19, v14);
  objc_msgSend(v5, "setFill");

  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v9;
  v20.size.height = v11;
  CGContextFillRect(CurrentContext, v20);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v16;
}

- (id)p_noteGlyphForTag:(int64_t)a3 pageTheme:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v9;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1563FC;
  block[3] = &unk_28B960;
  block[4] = self;
  if (qword_311540 != -1)
    dispatch_once(&qword_311540, block);
  v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        v7 = (void *)qword_311520;
        goto LABEL_12;
      case 1:
        v7 = (void *)qword_311528;
        goto LABEL_12;
      case 2:
        v7 = (void *)qword_311530;
        goto LABEL_12;
      case 3:
        v7 = (void *)qword_311538;
        goto LABEL_12;
      case 4:
        v7 = (void *)qword_311518;
LABEL_12:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9));

        return v6;
      default:
        return 0;
    }
  }
  return v6;
}

- (IMCalloutBar)calloutBar
{
  return self->mCalloutBar;
}

- (void)setCalloutBar:(id)a3
{
  objc_storeStrong((id *)&self->mCalloutBar, a3);
}

- (void)setColorControls:(id)a3
{
  objc_storeStrong((id *)&self->mColorControls, a3);
}

- (UIButton)addNoteButton
{
  return self->mAddNoteButton;
}

- (void)setAddNoteButton:(id)a3
{
  objc_storeStrong((id *)&self->mAddNoteButton, a3);
}

- (UIButton)deleteButton
{
  return self->mDeleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->mDeleteButton, a3);
}

- (UIButton)rightArrowButton
{
  return self->mRightArrowButton;
}

- (void)setRightArrowButton:(id)a3
{
  objc_storeStrong((id *)&self->mRightArrowButton, a3);
}

- (UIButton)shareButton
{
  return self->mShareButton;
}

- (void)setShareButton:(id)a3
{
  objc_storeStrong((id *)&self->mShareButton, a3);
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int64_t)a3
{
  self->_pageTheme = a3;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->mShareButton, 0);
  objc_storeStrong((id *)&self->mRightArrowButton, 0);
  objc_storeStrong((id *)&self->mDeleteButton, 0);
  objc_storeStrong((id *)&self->mAddNoteButton, 0);
  objc_storeStrong((id *)&self->mColorControls, 0);
  objc_storeStrong((id *)&self->mCalloutBar, 0);
}

@end
