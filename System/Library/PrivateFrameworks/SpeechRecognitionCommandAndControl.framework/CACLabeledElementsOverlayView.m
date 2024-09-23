@implementation CACLabeledElementsOverlayView

- (CACLabeledElementsOverlayView)initWithFrame:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CACLabeledElementsOverlayView *v11;
  void *v12;
  uint64_t v13;
  UIView *badgesContainer;
  uint64_t v15;
  UIView *contrastBadgesContainer;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  Boolean keyExistsAndHasValidFormat;
  objc_super v49;
  _QWORD v50[10];

  v50[8] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = (v6 + -160.0) * 0.5;
  v10 = v8 + -160.0;
  v49.receiver = self;
  v49.super_class = (Class)CACLabeledElementsOverlayView;
  v11 = -[CACLabeledElementsOverlayView initWithFrame:](&v49, sel_initWithFrame_, v9, v10, 160.0, 160.0);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElementsOverlayView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 0, v9, v10, 160.0, 160.0);
    v13 = objc_claimAutoreleasedReturnValue();
    badgesContainer = v11->_badgesContainer;
    v11->_badgesContainer = (UIView *)v13;

    +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 1, v9, v10, 160.0, 160.0);
    v15 = objc_claimAutoreleasedReturnValue();
    contrastBadgesContainer = v11->_contrastBadgesContainer;
    v11->_contrastBadgesContainer = (UIView *)v15;

    -[CACLabeledElementsOverlayView contrastBadgesContainer](v11, "contrastBadgesContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElementsOverlayView addSubview:](v11, "addSubview:", v17);

    -[CACLabeledElementsOverlayView badgesContainer](v11, "badgesContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElementsOverlayView addSubview:](v11, "addSubview:", v18);

    keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(CFSTR("CACShowElementRectanglesWithNumbers"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"), &keyExistsAndHasValidFormat))
    {
      v19 = keyExistsAndHasValidFormat == 0;
    }
    else
    {
      v19 = 1;
    }
    v20 = !v19;
    -[CACLabeledElementsOverlayView setDisplayElementRectangles:](v11, "setDisplayElementRectangles:", v20);
    v38 = (void *)MEMORY[0x24BDD1628];
    -[UIView topAnchor](v11->_badgesContainer, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElementsOverlayView topAnchor](v11, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v45;
    -[UIView bottomAnchor](v11->_badgesContainer, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElementsOverlayView bottomAnchor](v11, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v42;
    -[UIView leadingAnchor](v11->_badgesContainer, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElementsOverlayView leadingAnchor](v11, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v39;
    -[UIView trailingAnchor](v11->_badgesContainer, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElementsOverlayView trailingAnchor](v11, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v35;
    -[UIView topAnchor](v11->_contrastBadgesContainer, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElementsOverlayView topAnchor](v11, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v32;
    -[UIView bottomAnchor](v11->_contrastBadgesContainer, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElementsOverlayView bottomAnchor](v11, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v50[5] = v22;
    -[UIView leadingAnchor](v11->_contrastBadgesContainer, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElementsOverlayView leadingAnchor](v11, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v50[6] = v25;
    -[UIView trailingAnchor](v11->_contrastBadgesContainer, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElementsOverlayView trailingAnchor](v11, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50[7] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateConstraints:", v29);

  }
  return v11;
}

- (void)clearLabeledElements
{
  CACLabeledElementsOverlayView *v2;
  NSMutableArray *labeledElements;
  uint64_t v4;
  NSMutableArray *v5;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  labeledElements = v2->_labeledElements;
  if (labeledElements)
  {
    -[NSMutableArray removeAllObjects](labeledElements, "removeAllObjects");
  }
  else
  {
    v4 = objc_opt_new();
    v5 = v2->_labeledElements;
    v2->_labeledElements = (NSMutableArray *)v4;

  }
  objc_sync_exit(v2);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__CACLabeledElementsOverlayView_clearLabeledElements__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __53__CACLabeledElementsOverlayView_clearLabeledElements__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "badgesContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "contrastBadgesContainer", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "removeFromSuperview");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (void)addLabeledElements:(id)a3
{
  id v4;
  CACLabeledElementsOverlayView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  -[NSMutableArray addObjectsFromArray:](v5->_labeledElements, "addObjectsFromArray:", v6);

  objc_sync_exit(v5);
  v7 = (void *)MEMORY[0x24BDBCEA0];
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bestLocaleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeWithLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v11, "setNumberStyle:", 1);
  objc_msgSend(v11, "setLocale:", v10);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__CACLabeledElementsOverlayView_addLabeledElements___block_invoke;
  v13[3] = &unk_24F2AAD70;
  v13[4] = v5;
  v14 = v11;
  v12 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

}

void __52__CACLabeledElementsOverlayView_addLabeledElements___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CACLabeledBadgeView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CACLabeledBadgeView *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 416);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v34 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(v6, "numberedLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "numberFromString:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "stringFromNumber:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "labelRectangle");
        v11 = [CACLabeledBadgeView alloc];
        objc_msgSend(v6, "labelRectangle");
        v16 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v11, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v10, objc_msgSend(v6, "arrowOrientation"), objc_msgSend(v6, "badgePresentation"), objc_msgSend(v6, "badgeIndicatorMask"), v12, v13, v14, v15);
        objc_msgSend(*(id *)(a1 + 32), "badgesContainer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSubview:", v16);

        objc_msgSend(v27, "addObject:", v16);
        if (objc_msgSend(*(id *)(a1 + 32), "displayElementRectangles"))
        {
          v18 = *(void **)(a1 + 32);
          objc_msgSend(v6, "interfaceOrientedRectangle");
          objc_msgSend(v18, "_viewShowingDebuggingRect:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addSubview:", v19);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v3);
  }

  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = v27;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "contrastedCopy");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "contrastBadgesContainer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addSubview:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v22);
    }

  }
}

- (id)_viewShowingDebuggingRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGSize v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;
  v16.width = width;
  v16.height = height;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v9);

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", 0.0, 0.0, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendPath:", v11);

  objc_msgSend(v10, "closePath");
  objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "set");

  objc_msgSend(v10, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v13);
  objc_msgSend(v14, "setFrame:", x, y, width, height);

  return v14;
}

- (BOOL)displayElementRectangles
{
  return self->_displayElementRectangles;
}

- (void)setDisplayElementRectangles:(BOOL)a3
{
  self->_displayElementRectangles = a3;
}

- (UIView)badgesContainer
{
  return self->_badgesContainer;
}

- (void)setBadgesContainer:(id)a3
{
  objc_storeStrong((id *)&self->_badgesContainer, a3);
}

- (UIView)contrastBadgesContainer
{
  return self->_contrastBadgesContainer;
}

- (void)setContrastBadgesContainer:(id)a3
{
  objc_storeStrong((id *)&self->_contrastBadgesContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contrastBadgesContainer, 0);
  objc_storeStrong((id *)&self->_badgesContainer, 0);
  objc_storeStrong((id *)&self->_labeledElements, 0);
}

void __52__CACLabeledElementsOverlayView_addLabeledElements___block_invoke_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;
  CGRect v8;

  objc_msgSend(a2, "labelRectangle");
  NSStringFromCGRect(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_229A40000, a4, OS_LOG_TYPE_ERROR, "Frame for labeled element was invalid - %@", a1, 0xCu);

}

@end
