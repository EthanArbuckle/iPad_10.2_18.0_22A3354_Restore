@implementation UITextMagnifierCommonRenderer

- (void)loadImages
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  UITextMagnifierCommonRenderer *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!self->m_loaded)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->m_images, v17);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->m_offsets, v16);
    v15 = self;
    -[UITextMagnifierCommonRenderer visualsForMagnifier](self, "visualsForMagnifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v3, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", CFSTR("UITextMagnifierFilename"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            _UIImageWithName(v10);
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v13 = (void *)v12;
              objc_msgSend(v17, "setObject:forKey:", v12, v8);
              objc_msgSend(v9, "objectForKey:", CFSTR("UITextMagnifierOffset"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
                objc_msgSend(v16, "setObject:forKey:", v14, v8);

            }
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v5);
    }

    v15->m_loaded = 1;
  }
}

- (void)performOperations:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[UITextMagnifierCommonRenderer magnifier](self, "magnifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", 1, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0x7FFFFFFFFFFFFFFFLL;
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0x7FFFFFFFFFFFFFFFLL;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __51__UITextMagnifierCommonRenderer_performOperations___block_invoke;
    v21[3] = &unk_1E16E5910;
    v23 = &v29;
    v22 = v7;
    v24 = &v25;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v21);
    if (v30[3] == 0x7FFFFFFFFFFFFFFFLL || v26[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndex:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v10, "insertObject:atIndex:", v11, v26[3] + 1);

    }
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v10 = v9;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v33, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v16, "_appearsInLoupe", (_QWORD)v17))
          v4[2](v4, v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v33, 16);
    }
    while (v13);
  }

}

void __51__UITextMagnifierCommonRenderer_performOperations___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;

  v5 = a2;
  v6 = v5;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL && (id)a1[4] == v5)
  {
    v10 = v5;
    NSClassFromString(CFSTR("SBIsolationTankWindow"));
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v8 = a1[5];
LABEL_8:
      *(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) = a3;
      goto LABEL_9;
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v6;
    NSClassFromString(CFSTR("SBHomeScreenWindow"));
    v9 = objc_opt_isKindOfClass();
    v6 = v11;
    if ((v9 & 1) != 0)
    {
      v8 = a1[6];
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)didMoveToSuperview
{
  if (dyld_program_sdk_at_least())
    -[UITextMagnifierCommonRenderer update](self, "update");
}

- (id)backgroundColourIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  if (!objc_msgSend((id)UIApp, "_isSpringBoard"))
    goto LABEL_7;
  -[UITextMagnifierCommonRenderer magnifier](self, "magnifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", 1, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__UITextMagnifierCommonRenderer_backgroundColourIfNecessary__block_invoke;
  v15[3] = &unk_1E16E5910;
  v17 = &v23;
  v8 = v5;
  v16 = v8;
  v18 = &v19;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v15);
  if (v24[3] == 0x7FFFFFFFFFFFFFFFLL || v20[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 1;
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  if (v9)
  {
LABEL_7:
    -[UIView _window](self, "_window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "_isHostedInAnotherProcess"))
    {
LABEL_8:
      +[UIColor darkGrayColor](UIColor, "darkGrayColor");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v5 = (void *)v11;
    }
    else
    {
      objc_msgSend(v10, "windowScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_backgroundStyle");

      v5 = 0;
      switch(v14)
      {
        case 1:
        case 6:
          +[UIColor grayColor](UIColor, "grayColor");
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        case 2:
        case 3:
          +[UIColor lightGrayColor](UIColor, "lightGrayColor");
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        case 4:
        case 5:
          goto LABEL_8;
        default:
          break;
      }
    }

  }
  return v5;
}

void __60__UITextMagnifierCommonRenderer_backgroundColourIfNecessary__block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;

  v5 = a2;
  v6 = v5;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL && (id)a1[4] == v5)
  {
    v10 = v5;
    NSClassFromString(CFSTR("SBIsolationTankWindow"));
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v8 = a1[5];
LABEL_8:
      *(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) = a3;
      goto LABEL_9;
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v6;
    NSClassFromString(CFSTR("SBHomeScreenWindow"));
    v9 = objc_opt_isKindOfClass();
    v6 = v11;
    if ((v9 & 1) != 0)
    {
      v8 = a1[6];
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)update
{
  void *v3;
  void *v4;
  int v5;
  __CFString *v6;
  NSDictionary *m_images;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSDictionary *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  NSDictionary *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  CALayer *v30;
  CALayer *m_back;
  void *v32;
  id v33;
  CALayer *v34;
  CALayer *m_mask;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  CALayer *m_content;
  void *v41;
  void *v42;
  CALayer *v43;
  CALayer *v44;
  CALayer *v45;
  CALayer *m_front;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void (**v64)(_QWORD, double, double, double, double);
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  double v81;
  double v82;
  double v83;
  _QWORD aBlock[8];
  _QWORD v85[6];

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UITextMagnifierCommonRenderer loadImages](self, "loadImages");
    -[UITextMagnifierCommonRenderer magnifier](self, "magnifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHorizontal");
    v6 = CFSTR("UITextMagnifierVerticalLo");
    if (v5)
      v6 = CFSTR("UITextMagnifierHorizontalLo");
    m_images = self->m_images;
    if (v5)
      v8 = CFSTR("UITextMagnifierHorizontalMask");
    else
      v8 = CFSTR("UITextMagnifierVerticalMask");
    if (v5)
      v9 = CFSTR("UITextMagnifierHorizontalHi");
    else
      v9 = CFSTR("UITextMagnifierVerticalHi");
    v10 = v6;
    -[NSDictionary objectForKey:](m_images, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->m_offsets, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "CGPointValue");
    v14 = v13;
    v16 = v15;

    v17 = self->m_images;
    v18 = v8;
    -[NSDictionary objectForKey:](v17, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->m_offsets, "objectForKey:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "CGPointValue");
    v81 = v21;
    v23 = v22;

    v24 = self->m_images;
    v25 = v9;
    -[NSDictionary objectForKey:](v24, "objectForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->m_offsets, "objectForKey:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "CGPointValue");
    v82 = v29;
    v83 = v28;

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    if (!self->m_back && v11)
    {
      v30 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      m_back = self->m_back;
      self->m_back = v30;

      -[UIView layer](self, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSublayer:", self->m_back);

    }
    v33 = objc_retainAutorelease(v11);
    -[CALayer setContents:](self->m_back, "setContents:", objc_msgSend(v33, "CGImage"));
    if (!self->m_mask)
    {
      v34 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      m_mask = self->m_mask;
      self->m_mask = v34;

      v36 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
      -[CALayer setMask:](self->m_mask, "setMask:", v36);

      -[UIView layer](self, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "insertSublayer:above:", self->m_mask, self->m_back);

    }
    v80 = objc_retainAutorelease(v19);
    v38 = objc_msgSend(v80, "CGImage");
    -[CALayer mask](self->m_mask, "mask");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setContents:", v38);

    m_content = self->m_content;
    if (m_content)
    {
      -[CALayer sublayers](m_content, "sublayers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v41, "copy");
      objc_msgSend(v42, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

    }
    else
    {
      v43 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v44 = self->m_content;
      self->m_content = v43;

      -[CALayer setAnchorPoint:](self->m_content, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      -[CALayer addSublayer:](self->m_mask, "addSublayer:", self->m_content);
    }
    if (!self->m_front)
    {
      v45 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      m_front = self->m_front;
      self->m_front = v45;

      -[UIView layer](self, "layer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "insertSublayer:above:", self->m_front, self->m_mask);

    }
    v79 = objc_retainAutorelease(v26);
    -[CALayer setContents:](self->m_front, "setContents:", objc_msgSend(v79, "CGImage"));
    if (!self->_isRegisteredForGeometryChanges)
    {
      -[UIView _registerForGeometryChanges](self, "_registerForGeometryChanges");
      self->_isRegisteredForGeometryChanges = 1;
    }
    -[UITextMagnifierCommonRenderer backgroundColourIfNecessary](self, "backgroundColourIfNecessary");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v78 = v4;
      v49 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v77 = v48;
      objc_msgSend(v49, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v48), "CGColor"));
      -[UITextMagnifierCommonRenderer magnifier](self, "magnifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "target");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "window");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "screen");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (!v53)
      {
        +[UIScreen mainScreen](UIScreen, "mainScreen");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v54, "bounds");
      objc_msgSend(v49, "setFrame:");
      if (!v53)

      -[CALayer addSublayer:](self->m_content, "addSublayer:", v49);
      v48 = v77;
      v4 = v78;
    }
    v55 = MEMORY[0x1E0C809B0];
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __39__UITextMagnifierCommonRenderer_update__block_invoke;
    v85[3] = &unk_1E16E5938;
    v85[4] = self;
    -[UITextMagnifierCommonRenderer performOperations:](self, "performOperations:", v85);
    -[UIView bounds](self, "bounds");
    v57 = v56;
    v59 = v58;
    v61 = v60;
    v63 = v62;
    aBlock[0] = v55;
    aBlock[1] = 3221225472;
    aBlock[2] = __39__UITextMagnifierCommonRenderer_update__block_invoke_2;
    aBlock[3] = &__block_descriptor_64_e63__CGRect__CGPoint_dd__CGSize_dd__40__0_CGPoint_dd_8_CGSize_dd_24l;
    *(double *)&aBlock[4] = v56;
    *(double *)&aBlock[5] = v58;
    *(double *)&aBlock[6] = v60;
    *(double *)&aBlock[7] = v62;
    v64 = (void (**)(_QWORD, double, double, double, double))_Block_copy(aBlock);
    objc_msgSend(v33, "size");
    v64[2](v64, v14, v16, v65, v66);
    -[CALayer setFrame:](self->m_back, "setFrame:");
    -[CALayer setFrame:](self->m_mask, "setFrame:", v57, v59, v61, v63);
    objc_msgSend(v4, "frame");
    v67 = ((double (*)(void (**)(_QWORD, double, double, double, double), double, double))v64[2])(v64, v81, v23);
    v69 = v68;
    v71 = v70;
    v73 = v72;
    -[CALayer mask](self->m_mask, "mask");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFrame:", v67, v69, v71, v73);

    objc_msgSend(v79, "size");
    v64[2](v64, v83, v82, v75, v76);
    -[CALayer setFrame:](self->m_front, "setFrame:");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
}

void __39__UITextMagnifierCommonRenderer_update__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  v20 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0CD2800]);
  objc_msgSend(v3, "setMatchesOpacity:", 1);
  objc_msgSend(v3, "setMatchesTransform:", 1);
  objc_msgSend(v20, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceLayer:", v4);

  objc_msgSend(v3, "sourceLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anchorPoint");
  objc_msgSend(v3, "setAnchorPoint:");

  objc_msgSend(v3, "sourceLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if ((objc_msgSend(v20, "_isTextEffectsWindow") & 1) == 0
    && objc_msgSend(v20, "_isHostedInAnotherProcess"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "hostedViewOrigin");
    v8 = v8 + v18;
    v10 = v10 + v19;

  }
  objc_msgSend(v3, "setFrame:", v8, v10, v12, v14);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "addSublayer:", v3);

}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CATransform3D v28;
  CATransform3D v29;
  CATransform3D v30;
  CATransform3D v31;

  if ((a3->var0 & 6) != 0)
  {
    -[UITextMagnifierCommonRenderer magnifier](self, "magnifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "offsetFromMagnificationPoint");
    v7 = v6;
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v10 = objc_msgSend(v5, "isHorizontal");
    v11 = -0.0;
    if (v10)
      v12 = v7;
    else
      v12 = -0.0;
    v13 = v9 + v12;
    if (!v10)
      v11 = v7;
    v14 = v8 + v11;
    -[UIView _window](self, "_window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    objc_msgSend(v15, "convertRect:fromView:", self);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v31.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v31.m33 = v24;
    v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v31.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v31.m43 = v25;
    v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v31.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v31.m13 = v26;
    v27 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v31.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v31.m23 = v27;
    *(_OWORD *)&v30.m31 = *(_OWORD *)&v31.m31;
    *(_OWORD *)&v30.m33 = v24;
    *(_OWORD *)&v30.m41 = *(_OWORD *)&v31.m41;
    *(_OWORD *)&v30.m43 = v25;
    *(_OWORD *)&v30.m11 = *(_OWORD *)&v31.m11;
    *(_OWORD *)&v30.m13 = v26;
    *(_OWORD *)&v30.m21 = *(_OWORD *)&v31.m21;
    *(_OWORD *)&v30.m23 = v27;
    CATransform3DTranslate(&v31, &v30, (v14 + v17 + (v21 + v21 / -1.20000005) * 0.5) * -1.20000005, (v13 + v19 + (v23 + v23 / -1.20000005) * 0.5) * -1.20000005, 0.0);
    v29 = v31;
    CATransform3DScale(&v30, &v29, 1.20000005, 1.20000005, 1.0);
    v31 = v30;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v28 = v31;
    -[CALayer setSublayerTransform:](self->m_content, "setSublayerTransform:", &v28);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
}

- (id)visualsForMagnifier
{
  -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_front, 0);
  objc_storeStrong((id *)&self->m_content, 0);
  objc_storeStrong((id *)&self->m_mask, 0);
  objc_storeStrong((id *)&self->m_back, 0);
  objc_storeStrong((id *)&self->m_offsets, 0);
  objc_storeStrong((id *)&self->m_images, 0);
}

@end
