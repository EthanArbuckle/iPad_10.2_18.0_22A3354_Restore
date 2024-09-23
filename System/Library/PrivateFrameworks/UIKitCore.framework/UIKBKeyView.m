@implementation UIKBKeyView

- (BOOL)_canDrawContent
{
  return 1;
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (v7)
    objc_storeStrong((id *)&self->m_key, a4);
  if (v8)
    objc_storeStrong((id *)&self->m_keyplane, a3);
  -[UIView setOpaque:](self, "setOpaque:", -[UIKBKeyView _viewShouldBeOpaque](self, "_viewShouldBeOpaque"));

}

- (void)setFactory:(id)a3
{
  objc_storeStrong((id *)&self->m_factory, a3);
}

- (void)setDrawFrame:(CGRect)a3
{
  self->m_drawFrame = a3;
}

+ (BOOL)wantsScreenTraits
{
  return 0;
}

- (void)removeFromSuperview
{
  void *v3;
  objc_super v4;

  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decrementExpectedRender:", self);

  v4.receiver = self;
  v4.super_class = (Class)UIKBKeyView;
  -[UIView removeFromSuperview](&v4, sel_removeFromSuperview);
}

- (UIKBKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  UIKBKeyView *v14;
  UIKBKeyView *v15;
  void *v16;
  int v17;
  uint64_t v18;
  UIKBKeyView *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)UIKBKeyView;
  v14 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    -[UIView setEnabled:](v14, "setEnabled:", 0);
    v15->_cachedBackgroundOpacity = 1.0;
    objc_storeStrong((id *)&v15->m_keyplane, a4);
    objc_storeStrong((id *)&v15->m_key, a5);
    -[UIView setOpaque:](v15, "setOpaque:", -[UIKBKeyView _viewShouldBeOpaque](v15, "_viewShouldBeOpaque"));
    v15->_containedInDynamicKey = 0;
    if (objc_msgSend(v13, "interactionType") == 6)
    {
      objc_msgSend(v13, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "rangeOfString:", CFSTR("HWR")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = objc_msgSend(v13, "displayTypeHint");

        if (v17 != 11)
        {
          if (+[UIKeyboardImpl rivenTranslationPreference](UIKeyboardImpl, "rivenTranslationPreference"))
            v18 = 9;
          else
            v18 = 0;
          -[UIKBTree setDisplayTypeHint:](v15->m_key, "setDisplayTypeHint:", v18);
        }
      }
      else
      {

      }
    }
    v19 = v15;
  }

  return v15;
}

- (BOOL)_viewShouldBeOpaque
{
  return 0;
}

- (BOOL)keepNonPersistent
{
  return 0;
}

- (void)displayLayer:(id)a3
{
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
  id v18;
  void *v19;
  void *v20;
  double cachedBackgroundOpacity;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t *v30;
  void **v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  UIKBKeyView *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  _QWORD v66[2];
  _QWORD v67[4];

  v67[2] = *MEMORY[0x1E0C80C00];
  -[UIView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "decrementExpectedRender:", self);

    return;
  }
  if (self->m_key && -[UIKBKeyView _shouldUpdateLayers](self, "_shouldUpdateLayers"))
  {
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContents:", 0);

    -[UIKBKeyView factory](self, "factory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitsForKey:onKeyplane:", self->m_key, self->m_keyplane);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "hashString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBKeyView setCachedTraitsHashString:](self, "setCachedTraitsHashString:", v8);

    objc_msgSend(v7, "symbolStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBKeyView setCachedAnchorCorner:](self, "setCachedAnchorCorner:", objc_msgSend(v9, "anchorCorner"));

    -[UIKBKeyView factory](self, "factory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "renderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBKeyView setCachedShiftState:](self, "setCachedShiftState:", objc_msgSend(v11, "shiftState"));

    objc_msgSend(v7, "symbolStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBKeyView setCachedSelector:](self, "setCachedSelector:", objc_msgSend(v12, "selector"));

    -[UIKBKeyView factory](self, "factory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBKeyView setCachedControlKeyRenderingPreference:](self, "setCachedControlKeyRenderingPreference:", objc_msgSend(v13, "preferStringKeycapOverImage"));

    -[UIKBKeyView renderFlagsForTraits:](self, "renderFlagsForTraits:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree layoutName](self->m_keyplane, "layoutName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayImagesForView:fromLayout:imageFlags:", self, v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __28__UIKBKeyView_displayLayer___block_invoke;
    v49[3] = &unk_1E16D39D8;
    v18 = v17;
    v50 = v18;
    v51 = self;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v49);
    -[UIView layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsGroupBlending:", 0);

    -[UIKBKeyView layerForRenderFlags:](self, "layerForRenderFlags:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    cachedBackgroundOpacity = self->_cachedBackgroundOpacity;
    -[UIKBKeyView renderConfig](self, "renderConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "lightKeyboard"))
    {
      if (objc_msgSend(v7, "blendForm") == 1 || objc_msgSend(v7, "blendForm") == 2)
      {

LABEL_8:
        -[UIKBKeyView renderConfig](self, "renderConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lightKeycapOpacity");
        goto LABEL_12;
      }
      v38 = objc_msgSend(v7, "blendForm");

      if (v38 == 7)
        goto LABEL_8;
    }
    else
    {

    }
    -[UIKBKeyView renderConfig](self, "renderConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "keycapOpacity");
LABEL_12:
    v25 = v24;

    v26 = cachedBackgroundOpacity * v25;
    *(float *)&v26 = cachedBackgroundOpacity * v25;
    objc_msgSend(v20, "setOpacity:", v26);
    if (objc_msgSend(v7, "blendForm") == 3)
    {
      v27 = *MEMORY[0x1E0CD2EA0];
      v66[0] = &unk_1E1A982C8;
      v66[1] = &unk_1E1A982E0;
      v28 = *MEMORY[0x1E0CD2BD0];
      v67[0] = v27;
      v67[1] = v28;
      v29 = (void *)MEMORY[0x1E0C99D80];
      v30 = v67;
      v31 = (void **)v66;
LABEL_14:
      v32 = 2;
LABEL_20:
      objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    if (objc_msgSend(v7, "blendForm") == 4)
    {
      v64 = &unk_1E1A982F8;
      v65 = *MEMORY[0x1E0CD2C50];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self, "layer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAllowsGroupBlending:", 1);

LABEL_21:
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __28__UIKBKeyView_displayLayer___block_invoke_2;
      v46[3] = &unk_1E16D3A00;
      v46[4] = self;
      v47 = v33;
      v48 = v7;
      v35 = v7;
      v36 = v33;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v46);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      self->_renderedKeyState = -[UIKBTree state](self->m_key, "state");
      -[UIKBKeyView setCachedTraitsHashString:](self, "setCachedTraitsHashString:", 0);

      goto LABEL_22;
    }
    if (objc_msgSend(v7, "blendForm") == 5)
    {
      v62 = &unk_1E1A982F8;
      v63 = *MEMORY[0x1E0CD2EA0];
      v29 = (void *)MEMORY[0x1E0C99D80];
      v30 = &v63;
      v31 = &v62;
LABEL_19:
      v32 = 1;
      goto LABEL_20;
    }
    if (objc_msgSend(v7, "blendForm") == 9)
    {
      v39 = *MEMORY[0x1E0CD2EA0];
      v60[0] = &unk_1E1A982C8;
      v60[1] = &unk_1E1A982E0;
      v40 = *MEMORY[0x1E0CD2E98];
      v61[0] = v39;
      v61[1] = v40;
      v29 = (void *)MEMORY[0x1E0C99D80];
      v30 = v61;
      v31 = (void **)v60;
      goto LABEL_14;
    }
    if (objc_msgSend(v7, "blendForm") == 8)
    {
      -[UIKBKeyView factory](self, "factory");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "useBlueThemingForKey:", self->m_key);

      if ((v42 & 1) == 0)
      {
        v43 = *MEMORY[0x1E0CD2F08];
        v58[0] = &unk_1E1A982C8;
        v58[1] = &unk_1E1A982E0;
        v44 = *MEMORY[0x1E0CD2E98];
        v59[0] = v43;
        v59[1] = v44;
        v29 = (void *)MEMORY[0x1E0C99D80];
        v30 = v59;
        v31 = (void **)v58;
        goto LABEL_14;
      }
    }
    else
    {
      if (objc_msgSend(v7, "blendForm") == 6)
      {
        v56 = &unk_1E1A982C8;
        v57 = *MEMORY[0x1E0CD2BD0];
        v29 = (void *)MEMORY[0x1E0C99D80];
        v30 = &v57;
        v31 = &v56;
        goto LABEL_19;
      }
      if (objc_msgSend(v7, "controlOpacities")
        && (objc_msgSend(v7, "blendForm") == 1 || objc_msgSend(v7, "blendForm") == 7))
      {
        v54 = &unk_1E1A982C8;
        v55 = *MEMORY[0x1E0CD2BC0];
        v29 = (void *)MEMORY[0x1E0C99D80];
        v30 = &v55;
        v31 = &v54;
        goto LABEL_19;
      }
      if ((objc_msgSend(v7, "controlOpacities") & 1) == 0 && objc_msgSend(v7, "blendForm") == 2)
      {
        v52 = &unk_1E1A982E0;
        v53 = *MEMORY[0x1E0CD2BC0];
        v29 = (void *)MEMORY[0x1E0C99D80];
        v30 = &v53;
        v31 = &v52;
        goto LABEL_19;
      }
    }
    v33 = 0;
    goto LABEL_21;
  }
LABEL_22:
  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "decrementExpectedRender:", self);

}

- (UIKBRenderFactory)factory
{
  UIKBRenderFactory *m_factory;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIKBRenderFactory *v8;
  UIKBRenderFactory *v9;
  UIKBScreenTraits *screenTraits;
  double v11;
  double v12;
  UIKBRenderFactory *v13;

  m_factory = self->m_factory;
  if (!m_factory)
  {
    -[UIKBKeyView renderConfig](self, "renderConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKeyboardType:", objc_msgSend(v7, "keyboardType"));

    objc_msgSend(v5, "setIsFloating:", -[UIKBTree isFloating](self->m_keyplane, "isFloating"));
    +[UIKBRenderFactory factoryForVisualStyle:renderingContext:](UIKBRenderFactory, "factoryForVisualStyle:renderingContext:", -[UIKBTree visualStyling](self->m_keyplane, "visualStyling"), v5);
    v8 = (UIKBRenderFactory *)objc_claimAutoreleasedReturnValue();
    v9 = self->m_factory;
    self->m_factory = v8;

    -[UIView contentScaleFactor](self, "contentScaleFactor");
    -[UIKBRenderFactory setScale:](self->m_factory, "setScale:");
    screenTraits = self->_screenTraits;
    if (screenTraits)
    {
      -[UIKBScreenTraits stretchFactor](screenTraits, "stretchFactor");
      v13 = self->m_factory;
    }
    else
    {
      v13 = self->m_factory;
      v11 = 1.0;
      v12 = 1.0;
    }
    -[UIKBRenderFactory setStretchFactor:](v13, "setStretchFactor:", v11, v12);

    m_factory = self->m_factory;
  }
  return m_factory;
}

- (id)renderFlagsForTraits:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;

  v4 = a3;
  if (objc_msgSend(v4, "blendForm") == 1)
  {
    v5 = -[UIKBTree state](self->m_key, "state");
    if (-[UIKBTree displayType](self->m_key, "displayType") == 3)
    {
      v6 = &unk_1E1A938A8;
      v7 = &unk_1E1A938C0;
      v8 = (v5 & 3) == 0;
LABEL_4:
      if (v8)
        v9 = v7;
      else
        v9 = v6;
      goto LABEL_35;
    }
    if (-[UIKBTree displayType](self->m_key, "displayType") == 23)
    {
      if (v5 == 8)
      {
        v9 = &unk_1E1A938D8;
        goto LABEL_35;
      }
      v6 = &unk_1E1A938F0;
      v7 = &unk_1E1A93908;
      v8 = (v5 & 0x64) == 0;
      goto LABEL_4;
    }
    if (objc_msgSend(v4, "renderSecondarySymbolsSeparately"))
    {
      objc_msgSend(v4, "secondarySymbolStyles");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17 == 1)
      {
        v15 = &unk_1E1A93920;
        goto LABEL_23;
      }
      objc_msgSend(v4, "secondarySymbolStyles");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v25 != 2)
      {
        v9 = &unk_1E1A93920;
        goto LABEL_35;
      }
      v22 = &unk_1E1A93920;
      v23 = &unk_1E1A93938;
      goto LABEL_33;
    }
    v10 = objc_msgSend(v4, "controlOpacities");
    v11 = &unk_1E1A93968;
    v12 = &unk_1E1A93950;
  }
  else
  {
    if (objc_msgSend(v4, "blendForm") != 2)
    {
      if ((-[UIKBKeyView cachedRenderFlags](self, "cachedRenderFlags") & 4) != 0 && objc_msgSend(v4, "blendForm") != 3)
      {
        objc_msgSend(v4, "renderFlags");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v4, "renderFlags");
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        if (!objc_msgSend(v4, "renderSecondarySymbolsSeparately"))
        {
          v9 = &unk_1E1A93A10;
          goto LABEL_35;
        }
        objc_msgSend(v4, "secondarySymbolStyles");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

        if (v28 == 1)
        {
          v15 = &unk_1E1A939E0;
          goto LABEL_23;
        }
        objc_msgSend(v4, "secondarySymbolStyles");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");

        if (v30 != 2)
        {
          v9 = &unk_1E1A939E0;
          goto LABEL_35;
        }
        v22 = &unk_1E1A939E0;
        v23 = &unk_1E1A939F8;
      }
      else
      {
        if (!objc_msgSend(v4, "renderSecondarySymbolsSeparately"))
          goto LABEL_30;
        objc_msgSend(v4, "secondarySymbolStyles");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14 == 1)
        {
          v15 = &unk_1E1A939B0;
LABEL_23:
          objc_msgSend(v15, "arrayByAddingObject:", &unk_1E1A98310);
          v18 = objc_claimAutoreleasedReturnValue();
LABEL_34:
          v9 = (void *)v18;
          goto LABEL_35;
        }
        objc_msgSend(v4, "secondarySymbolStyles");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21 != 2)
        {
LABEL_30:
          v9 = &unk_1E1A939B0;
          goto LABEL_35;
        }
        v22 = &unk_1E1A939B0;
        v23 = &unk_1E1A939C8;
      }
LABEL_33:
      objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v23);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    v10 = objc_msgSend(v4, "controlOpacities");
    v11 = &unk_1E1A93998;
    v12 = &unk_1E1A93980;
  }
  if (v10)
    v9 = v12;
  else
    v9 = v11;
LABEL_35:

  return v9;
}

- (int64_t)cachedRenderFlags
{
  __CFBoolean *m_allowsCaching;
  unsigned int v4;
  BOOL v5;
  __CFBoolean **v6;
  int v7;
  int64_t result;
  void *v9;
  char v10;
  void *v11;
  int v12;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  int v18;

  m_allowsCaching = self->m_allowsCaching;
  if (!m_allowsCaching)
  {
    v4 = -[UIKBTree displayType](self->m_key, "displayType");
    v5 = v4 > 0x37 || ((1 << v4) & 0x80003000001000) == 0;
    if (!v5
      || ((v14 = v4, v15 = -[UIKBTree visualStyling](self->m_keyplane, "visualStyling") & 0xFF00, v14 != 56)
        ? (v16 = v15 == 32512)
        : (v16 = 1),
          v16
       || v14 == 4
       && (-[UIKBKeyView renderConfig](self, "renderConfig"),
           v17 = (void *)objc_claimAutoreleasedReturnValue(),
           v18 = objc_msgSend(v17, "animatedBackground"),
           v17,
           v18)))
    {
      v6 = (__CFBoolean **)MEMORY[0x1E0C9AE40];
    }
    else
    {
      v6 = (__CFBoolean **)MEMORY[0x1E0C9AE50];
    }
    m_allowsCaching = *v6;
    self->m_allowsCaching = m_allowsCaching;
  }
  if (m_allowsCaching == (__CFBoolean *)*MEMORY[0x1E0C9AE40])
    return 0;
  v7 = -[UIKBTree state](self->m_key, "state");
  result = 255;
  if (v7 > 15)
  {
    if (v7 > 31)
    {
      if (v7 == 32 || v7 == 64)
        return result;
    }
    else if (v7 == 16 || v7 == 20)
    {
LABEL_22:
      if (-[UIKBKeyView containedInDynamicKey](self, "containedInDynamicKey"))
        return 3;
      else
        return 0;
    }
    return 0;
  }
  switch(v7)
  {
    case 1:
    case 8:
      return result;
    case 2:
      -[UIKBTree name](self->m_key, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("LanguageIndicator"));

      if ((v10 & 1) != 0)
        return 0;
      if (-[UIKBTree displayType](self->m_key, "displayType") != 13)
        return 255;
      -[UIKBTree overrideDisplayString](self->m_key, "overrideDisplayString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("emoji"));

      if (v12)
        return 3;
      else
        return 255;
    case 4:
      if (-[UIKBTree displayType](self->m_key, "displayType") == 14
        || -[UIKBTree displayType](self->m_key, "displayType") == 11
        || -[UIKBTree displayType](self->m_key, "displayType") == 47
        || -[UIKBTree displayType](self->m_key, "displayType") == 48
        || -[UIKBTree interactionType](self->m_key, "interactionType") == 16)
      {
        return 255;
      }
      if (-[UIKBTree interactionType](self->m_key, "interactionType") != 2
        || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        goto LABEL_22;
      }
      result = 3;
      break;
    default:
      return 0;
  }
  return result;
}

- (void)setCachedTraitsHashString:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTraitsHashString, a3);
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *keyLayers;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int renderedKeyState;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSMutableDictionary *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[3];
  char v28;

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  -[UIKBKeyView factory](self, "factory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitsForKey:onKeyplane:", self->m_key, self->m_keyplane);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBKeyView renderFlagsForTraits:](self, "renderFlagsForTraits:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  keyLayers = self->_keyLayers;
  if (!keyLayers)
    goto LABEL_5;
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](keyLayers, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToSet:", v10);

  if (!v11
    || -[UIKBKeyView requiresSublayers](self, "requiresSublayers")
    && (renderedKeyState = self->_renderedKeyState, renderedKeyState != -[UIKBTree state](self->m_key, "state")))
  {
LABEL_5:
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __32__UIKBKeyView_prepareForDisplay__block_invoke;
    v23[3] = &unk_1E16D3960;
    v23[4] = self;
    v26 = v27;
    v16 = v13;
    v24 = v16;
    v17 = v14;
    v25 = v17;
    objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v23);
    v18 = self->_keyLayers;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __32__UIKBKeyView_prepareForDisplay__block_invoke_2;
    v21[3] = &unk_1E16D3988;
    v19 = v17;
    v22 = v19;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v21);
    objc_storeStrong((id *)&self->_keyLayers, v13);
    if (!self->_renderedKeyState)
    {
      +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "incrementExpectedRender:", self);

    }
  }

  _Block_object_dispose(v27, 8);
}

- (void)setCachedShiftState:(unint64_t)a3
{
  self->_cachedShiftState = a3;
}

- (void)setCachedSelector:(int64_t)a3
{
  self->_cachedSelector = a3;
}

- (void)setCachedControlKeyRenderingPreference:(BOOL)a3
{
  self->_cachedControlKeyRenderingPreference = a3;
}

- (void)setCachedAnchorCorner:(unint64_t)a3
{
  self->_cachedAnchorCorner = a3;
}

- (BOOL)_shouldUpdateLayers
{
  int renderedKeyState;

  if (-[UIKBKeyView containedInDynamicKey](self, "containedInDynamicKey"))
    return !-[UIKBKeyView _isActivePopupKey](self, "_isActivePopupKey");
  renderedKeyState = self->_renderedKeyState;
  return renderedKeyState != -[UIKBTree state](self->m_key, "state")
      || (-[UIKBTree state](self->m_key, "state") & 0x10) != 0
      || -[UIKBTree dynamicDisplayTypeHint](self->m_key, "dynamicDisplayTypeHint")
      || self->_singleRerender
      || -[UIKBTree rendering](self->m_key, "rendering") == 38
      || -[UIKBTree rendering](self->m_key, "rendering") == 9;
}

void __28__UIKBKeyView_displayLayer___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(a1[4], "layerForRenderFlags:", objc_msgSend(v10, "unsignedIntegerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1[5], "objectForKey:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "compositingFilter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      objc_msgSend(v5, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 == v7)
      {
LABEL_9:

        goto LABEL_10;
      }
      if (v4 == (void *)*MEMORY[0x1E0CD2F08])
      {
        objc_msgSend(v3, "setCompositingFilter:", 0);
        objc_msgSend(a1[6], "extraFiltersForType:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setFilters:", v9);

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCompositingFilter:", v8);

    }
    else
    {
      objc_msgSend(v3, "setCompositingFilter:", 0);
    }
    objc_msgSend(v3, "setFilters:", 0);
    goto LABEL_9;
  }
LABEL_10:

}

void __28__UIKBKeyView_displayLayer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 40), "layerForRenderFlags:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 546))
  {
    objc_msgSend(v6, "meshTransform");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "state");

      if (v10 != 4)
        objc_msgSend(v7, "setMeshTransform:", 0);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_populateLayer:withContents:", v7, v11);

}

- (id)layerForRenderFlags:(int64_t)a3
{
  NSMutableDictionary *keyLayers;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__121;
  v16 = __Block_byref_object_dispose__121;
  keyLayers = self->_keyLayers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](keyLayers, "objectForKey:", v6);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)v13[5];
  if (!v7)
  {
    v8 = self->_keyLayers;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __35__UIKBKeyView_layerForRenderFlags___block_invoke;
    v11[3] = &unk_1E16D39B0;
    v11[4] = &v12;
    v11[5] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v11);
    v7 = (void *)v13[5];
  }
  v9 = v7;
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)_populateLayer:(id)a3 withContents:(id)a4
{
  id v6;
  id v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double width;
  double height;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  CGAffineTransform *v24;
  __int128 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGRect v34;
  CGRect v35;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    memset(&v33, 0, sizeof(v33));
    objc_msgSend(v6, "affineTransform");
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;

    v32 = v33;
    v34.origin.x = v8;
    v34.origin.y = v9;
    v34.size.width = v12;
    v34.size.height = v14;
    v35 = CGRectApplyAffineTransform(v34, &v32);
    width = v35.size.width;
    height = v35.size.height;
    -[UIView layer](self, "layer", v35.origin.x, v35.origin.y);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = (v18 - width) * 0.5;

    -[UIView layer](self, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = (v21 - height) * 0.5;

    objc_msgSend(v6, "setFrame:", v19, v22, width, height);
    if (v7)
    {
      v23 = objc_retainAutorelease(v7);
      objc_msgSend(v6, "setContents:", objc_msgSend(v23, "CGImage"));
      -[UIView contentScaleFactor](self, "contentScaleFactor");
      objc_msgSend(v6, "setContentsScale:");
      -[UIView contentScaleFactor](self, "contentScaleFactor");
      objc_msgSend(v6, "setRasterizationScale:");
      objc_msgSend(v23, "_imageThatSuppressesAccessibilityHairlineThickening");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setImageOrientation:", objc_msgSend(v7, "imageOrientation"));
      if (objc_msgSend(v7, "imageOrientation") == 1)
      {
        if (v33.d < 0.0)
          goto LABEL_11;
        CGAffineTransformMakeScale(&v31, 1.0, -1.0);
        v30 = v31;
        v24 = &v30;
      }
      else
      {
        if (v33.d > 0.0)
          goto LABEL_11;
        v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v27 = *MEMORY[0x1E0C9BAA8];
        v28 = v25;
        v29 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v24 = (CGAffineTransform *)&v27;
      }
      objc_msgSend(v6, "setAffineTransform:", v24, v27, v28, v29, *(_OWORD *)&v30.a, *(_OWORD *)&v30.c, *(_OWORD *)&v30.tx);
LABEL_11:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "formatColor");
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v6, "setContentsMultiplyColor:", objc_msgSend(v26, "CGColor"));

      }
      else
      {
        objc_msgSend(v6, "setContentsMultiplyColor:", UIKBGetNamedColor(CFSTR("UIKBColorWhite")));
      }
    }
  }

}

- (void)setRenderConfig:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  int v8;
  __int16 v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[UIKBKeyView renderConfig](self, "renderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIKBKeyView renderConfig](self, "renderConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "lightKeyboard");
    v8 = v7 ^ objc_msgSend(v21, "lightKeyboard");

  }
  else
  {
    v8 = 1;
  }

  v9 = (__int16)-[UIKBTree visualStyling](self->m_keyplane, "visualStyling");
  if ((v8 & 1) == 0 && (v9 & 0xFF00) == 0x7F00)
  {
    -[UIKBKeyView renderConfig](self, "renderConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keycapOpacity");
    v12 = v11;
    objc_msgSend(v21, "keycapOpacity");
    v8 = v12 != v13;

  }
  objc_storeStrong((id *)&self->m_renderConfig, a3);
  v14 = v21;
  if (v21)
  {
    -[UIKBKeyView popupMenu](self, "popupMenu");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBKeyView renderConfig](self, "renderConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRenderConfig:", v16);

    -[UIKBRenderFactory renderingContext](self->m_factory, "renderingContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBKeyView renderConfig](self, "renderConfig");
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRenderFactory renderingContext](self->m_factory, "renderingContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRenderConfig:", v18);

    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setIsFloating:", -[UIKBTree isFloating](self->m_keyplane, "isFloating"));
      -[UIKBRenderFactory setRenderingContext:](self->m_factory, "setRenderingContext:", v18);
    }

    v14 = v21;
    if (v8)
    {
      self->_renderedKeyState = 0;
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
      v14 = v21;
    }
  }

}

- (UIKeyboardMenuView)popupMenu
{
  return (UIKeyboardMenuView *)objc_loadWeakRetained((id *)&self->_popupMenu);
}

- (id)cacheKeysForRenderFlags:(id)a3
{
  id v4;
  int64_t v5;
  _BOOL4 v6;
  UIKBTree *v7;
  uint64_t v8;
  uint64_t v9;
  UIKBTree *m_key;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v53;
  _BOOL4 v54;
  void *v55;
  id v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UIKBKeyView cachedRenderFlags](self, "cachedRenderFlags");
  v6 = -[UIKBTree interactionType](self->m_key, "interactionType") == 2 && -[UIKBTree state](self->m_key, "state") == 16;
  v54 = v6;
  if (!-[UIKBKeyView renderAsMask](self, "renderAsMask") || v6)
  {
    if (!v5)
    {
LABEL_57:
      v56 = 0;
      goto LABEL_58;
    }
    if (v5 == 255)
    {
      +[UIKBCacheToken tokenForKey:style:](UIKBCacheToken, "tokenForKey:style:", self->m_key, -[UIKBTree visualStyling](self->m_keyplane, "visualStyling"));
    }
    else
    {
      m_key = self->m_key;
      v11 = (uint64_t)-[UIKBTree visualStyling](self->m_keyplane, "visualStyling");
      -[UIKBKeyView displayInsets](self, "displayInsets");
      +[UIKBCacheToken tokenForKey:style:displayInsets:](UIKBCacheToken, "tokenForKey:style:displayInsets:", m_key, v11);
    }
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = self->m_key;
    v8 = (uint64_t)-[UIKBTree visualStyling](self->m_keyplane, "visualStyling");
    -[UIKBKeyView displayInsets](self, "displayInsets");
    +[UIKBCacheToken tokenForKeyMask:style:displayInsets:](UIKBCacheToken, "tokenForKeyMask:style:displayInsets:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v9;
  if (!v9)
    goto LABEL_57;
  if (-[UIKBTree isRightToLeftSensitive](self->m_key, "isRightToLeftSensitive"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentLinguisticInputMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "annotateWithBool:", objc_msgSend(v13, "isDefaultRightToLeft"));

  }
  if ((objc_msgSend(v55, "styling") & 0x3F) == 3)
    objc_msgSend(v55, "annotateWithBool:", UIKeyboardCarPlayIsRightHandDrive());
  if (-[UIKBKeyView cachedSelector](self, "cachedSelector"))
    objc_msgSend(v55, "annotateWithInt:", -[UIKBKeyView cachedSelector](self, "cachedSelector"));
  if ((objc_msgSend(v55, "styling") & 0x3F) == 0x17 || (objc_msgSend(v55, "styling") & 0x3F) == 0x18)
  {
    if (-[UIKBKeyView cachedAnchorCorner](self, "cachedAnchorCorner"))
      objc_msgSend(v55, "annotateWithInt:", -[UIKBKeyView cachedAnchorCorner](self, "cachedAnchorCorner"));
    if (-[UIKBKeyView cachedShiftState](self, "cachedShiftState") <= 4)
      objc_msgSend(v55, "annotateWithInt:", -[UIKBKeyView cachedShiftState](self, "cachedShiftState"));
    if (-[UIKBKeyView cachedControlKeyRenderingPreference](self, "cachedControlKeyRenderingPreference"))
      objc_msgSend(v55, "annotateWithBool:", -[UIKBKeyView cachedControlKeyRenderingPreference](self, "cachedControlKeyRenderingPreference"));
  }
  if (-[UIKBTree displayType](self->m_key, "displayType") == 7)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferencesActions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLForPreferenceKey:", CFSTR("GesturesEnabled"));

    if (v16)
      objc_msgSend(v55, "annotateWithBool:", -[UIKBTree isShiftKeyplane](self->m_keyplane, "isShiftKeyplane"));
  }
  v17 = v55;
  if (((-[UIKBTree visualStyling](self->m_keyplane, "visualStyling") & 0x3F) == 1
     || (-[UIKBTree visualStyling](self->m_keyplane, "visualStyling") & 0x3F) == 0x17
     || (-[UIKBTree visualStyling](self->m_keyplane, "visualStyling") & 0x3F) == 0x18
     || (-[UIKBTree visualStyling](self->m_keyplane, "visualStyling") & 0x3F) == 0x19
     || (-[UIKBTree visualStyling](self->m_keyplane, "visualStyling") & 0x3F) == 0x1A)
    && (-[UIKBTree visualStyling](self->m_keyplane, "visualStyling") & 0xFF0000) == 0xB0000)
  {
    -[UIKBTree frame](self->m_key, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[UIKBTree paddedFrame](self->m_key, "paddedFrame");
    v65.origin.x = v26;
    v65.origin.y = v27;
    v65.size.width = v28;
    v65.size.height = v29;
    v64.origin.x = v19;
    v64.origin.y = v21;
    v64.size.width = v23;
    v64.size.height = v25;
    objc_msgSend(v55, "annotateWithBool:", CGRectEqualToRect(v64, v65));
  }
  -[UIKBKeyView renderConfig](self, "renderConfig");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "controlKeyBackgroundName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[UIKBKeyView renderConfig](self, "renderConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "controlKeyBackgroundName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "annotateWithInt:", objc_msgSend(v33, "hash"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v56 = (id)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v53 = v4;
  obj = v4;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  v35 = v54;
  if (v34)
  {
    v36 = v34;
    v37 = *(_QWORD *)v59;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v59 != v37)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v38);
        v40 = objc_msgSend(v39, "integerValue");
        if (-[UIKBKeyView renderAsMask](self, "renderAsMask") && !v35)
        {
          objc_msgSend(v17, "string");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v46)
            goto LABEL_51;
LABEL_50:
          objc_msgSend(v56, "setObject:forKey:", v46, v39);

          goto LABEL_51;
        }
        v41 = v40 & v5;
        if (!v41)
          goto LABEL_51;
        if (-[UIKBKeyView allowBackgroundCachingForRenderFlags:](self, "allowBackgroundCachingForRenderFlags:", v41))
        {
          v42 = v5;
          -[UIKBKeyView renderConfig](self, "renderConfig");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIKBKeyView cachedTraitsHashString](self, "cachedTraitsHashString");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKBRenderFactory cacheKeyForString:withRenderFlags:renderingContext:](UIKBRenderFactory, "cacheKeyForString:withRenderFlags:renderingContext:", v45, v41, v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v42;
          v35 = v54;
          v17 = v55;
          if (v46)
            goto LABEL_50;
        }
        else
        {
          v47 = objc_msgSend(v39, "integerValue");
          -[UIKBKeyView renderConfig](self, "renderConfig");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "lightKeyboard");
          v50 = v47;
          v17 = v55;
          objc_msgSend(v55, "stringForRenderFlags:lightKeyboard:", v50, v49);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
            goto LABEL_50;
        }
LABEL_51:
        ++v38;
      }
      while (v36 != v38);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      v36 = v51;
    }
    while (v51);
  }

  v4 = v53;
LABEL_58:

  return v56;
}

- (UIKBRenderConfig)renderConfig
{
  return self->m_renderConfig;
}

- (BOOL)renderAsMask
{
  return self->_renderAsMask;
}

- (BOOL)allowBackgroundCachingForRenderFlags:(int64_t)a3
{
  BOOL v5;
  void *v6;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    || -[UIKBKeyView containedInDynamicKey](self, "containedInDynamicKey")
    && -[UIKBKeyView _isActivePopupKey](self, "_isActivePopupKey"))
  {
    return 0;
  }
  -[UIKBKeyView cachedTraitsHashString](self, "cachedTraitsHashString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)a3 < 4 && v6 != 0;

  return v5;
}

- (NSString)cachedTraitsHashString
{
  return self->_cachedTraitsHashString;
}

- (BOOL)containedInDynamicKey
{
  return self->_containedInDynamicKey;
}

- (int64_t)cachedSelector
{
  return self->_cachedSelector;
}

void __23__UIKBKeyView_dimKeys___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  BOOL v7;
  void *v8;
  float v9;
  id v10;

  v10 = a3;
  v7 = (*(_QWORD *)(a1 + 48) & objc_msgSend(a2, "integerValue")) == 0;
  v8 = v10;
  if (!v7)
  {
    objc_msgSend(v10, "floatValue");
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      *(double *)(*(_QWORD *)(a1 + 32) + 536) = v9;
    objc_msgSend(*(id *)(a1 + 40), "setOpacity:");
    *a4 = 1;
    v8 = v10;
  }

}

void __32__UIKBKeyView_prepareForDisplay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(v8, "unsignedIntegerValue");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[_UIKBKeyViewLayer layer](_UIKBKeyViewLayer, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v8);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSublayer:atIndex:", v6, 0);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
}

- (void)dimKeys:(id)a3
{
  id v4;
  NSMutableDictionary *keyLayers;
  id v6;
  _QWORD v7[4];
  id v8;
  UIKBKeyView *v9;

  v4 = a3;
  keyLayers = self->_keyLayers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __23__UIKBKeyView_dimKeys___block_invoke;
  v7[3] = &unk_1E16D38F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyLayers, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (UIKBTree)key
{
  return self->m_key;
}

- (BOOL)isDynamicKey
{
  return 0;
}

void __23__UIKBKeyView_dimKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __23__UIKBKeyView_dimKeys___block_invoke_2;
  v9[3] = &unk_1E16D38D0;
  v10 = v5;
  v11 = v6;
  v7 = *(void **)(a1 + 32);
  v9[4] = *(_QWORD *)(a1 + 40);
  v8 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

}

- (UIKBKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  UIKBKeyView *v15;
  UIKBKeyView *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a6;
  v15 = -[UIKBKeyView initWithFrame:keyplane:key:](self, "initWithFrame:keyplane:key:", a4, a5, x, y, width, height);
  v16 = v15;
  if (v15)
    objc_storeStrong((id *)&v15->_screenTraits, a6);

  return v16;
}

- (void)updateKeySelectedVariantIndex:(int64_t)a3
{
  -[UIKBTree setSelectedVariantIndex:](self->m_key, "setSelectedVariantIndex:", a3);
}

- (void)updateKeySubtrees:(id)a3
{
  -[UIKBTree setSubtrees:](self->m_key, "setSubtrees:", a3);
}

- (void)dealloc
{
  void *v3;
  CGColor *activeBackgroundColor;
  id activeCompositingFilter;
  id v6;
  objc_super v7;

  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decrementExpectedRender:", self);

  activeBackgroundColor = self->_activeBackgroundColor;
  if (activeBackgroundColor)
  {
    CGColorRelease(activeBackgroundColor);
    self->_activeBackgroundColor = 0;
  }
  activeCompositingFilter = self->_activeCompositingFilter;
  if (activeCompositingFilter)
  {
    CFRelease(activeCompositingFilter);
    v6 = self->_activeCompositingFilter;
    self->_activeCompositingFilter = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)UIKBKeyView;
  -[UIView dealloc](&v7, sel_dealloc);
}

- (int)textEffectsVisibilityLevel
{
  void *v2;
  int v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDictationPopoverPresented");

  if (v3)
    return 301;
  else
    return 200;
}

- (CGRect)variantFrame
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[UIKBKeyView key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "popupDirection");

  -[UIKBKeyView drawFrame](self, "drawFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (v4 != 3)
  {
    -[UIKBKeyView key](self, "key");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v6 = v6 + 0.0;
    v8 = v8 + 0.0;
    v12 = v12 - (v14 + 0.0);

  }
  v15 = v6;
  v16 = v8;
  v17 = v10;
  v18 = v12;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  UIKBKeyView *v5;
  id v6;

  +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v5 = (UIKBKeyView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    objc_msgSend(v6, "hide");

}

- (unint64_t)focusableVariantCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[UIKBKeyView key](self, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtrees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)subTreeHitTest:(CGPoint)a3
{
  return 0;
}

- (int64_t)didInputSubTree:(id)a3
{
  return 0;
}

- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- (void)hideKeyCap:(BOOL)a3
{
  NSMutableDictionary *keyLayers;
  _QWORD v4[4];
  BOOL v5;

  keyLayers = self->_keyLayers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__UIKBKeyView_hideKeyCap___block_invoke;
  v4[3] = &__block_descriptor_33_e34_v32__0__NSNumber_8__CALayer_16_B24l;
  v5 = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyLayers, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __26__UIKBKeyView_hideKeyCap___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(a2, "integerValue") & 0x34) != 0)
  {
    objc_msgSend(v7, "setHidden:", *(unsigned __int8 *)(a1 + 32));
    *a4 = 1;
  }

}

- (void)orientKeyCap:(int64_t)a3
{
  NSMutableDictionary *keyLayers;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  keyLayers = self->_keyLayers;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __28__UIKBKeyView_orientKeyCap___block_invoke;
  v16[3] = &__block_descriptor_40_e34_v32__0__NSNumber_8__CALayer_16_B24l;
  v16[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyLayers, "enumerateKeysAndObjectsUsingBlock:", v16);
  -[UIKBKeyView updateKeycapLayerOrientation](self, "updateKeycapLayerOrientation");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIView subviews](self, "subviews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v11, "orientKeyCap:", a3);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

}

void __28__UIKBKeyView_orientKeyCap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "integerValue") & 0x34) != 0)
    objc_msgSend(v5, "setImageOrientation:", *(_QWORD *)(a1 + 32));

}

- (UIEdgeInsets)displayInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  -[UIKBKeyView drawFrame](self, "drawFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIKBTree paddedFrame](self->m_key, "paddedFrame");
  v12 = v6 - v11;
  v14 = v11 + v13 - (v6 + v10);
  v16 = v4 - v15;
  v18 = v15 + v17 - (v4 + v8);
  v19 = v12;
  v20 = v14;
  result.right = v18;
  result.bottom = v20;
  result.left = v16;
  result.top = v19;
  return result;
}

- (NSString)cacheKey
{
  void *v3;
  void *v4;

  if ((-[UIKBKeyView cachedRenderFlags](self, "cachedRenderFlags") & 4) != 0)
  {
    +[UIKBCacheToken tokenForKey:style:](UIKBCacheToken, "tokenForKey:style:", self->m_key, -[UIKBTree visualStyling](self->m_keyplane, "visualStyling"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)hasRendered
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int renderedKeyState;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIView layer](self, "layer", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "contents");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  renderedKeyState = self->_renderedKeyState;
  if (renderedKeyState == -[UIKBTree state](self->m_key, "state"))
    return v5;
  else
    return 0;
}

- (BOOL)requiresSublayers
{
  return 1;
}

void __32__UIKBKeyView_prepareForDisplay__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(v4, "removeFromSuperlayer");

}

void __35__UIKBKeyView_layerForRenderFlags___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if ((*(_QWORD *)(a1 + 40) & ~objc_msgSend(a2, "unsignedIntegerValue")) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (BOOL)_isActivePopupKey
{
  void *v3;
  char v4;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    || -[UIKBTree state](self->m_key, "state") != 4
    || -[UIKBTree interactionType](self->m_key, "interactionType") != 2)
  {
    return 0;
  }
  -[UIKBKeyView factory](self, "factory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsPaddleForKey:", self->m_key);

  return v4;
}

- (int64_t)imageOrientationForLayer:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "imageOrientation");
  else
    v4 = 0;

  return v4;
}

- (BOOL)cacheDeferable
{
  return 0;
}

- (BOOL)displaysColorImage
{
  return -[UIKBTree displayType](self->m_key, "displayType") == 57;
}

- (int64_t)assetIdiom
{
  void *v3;
  char v4;
  void *v6;
  int64_t v7;

  -[UIKBKeyView renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFloating");

  if ((v4 & 1) != 0)
    return 0;
  -[UIKBKeyView factory](self, "factory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assetIdiom");

  return v7;
}

- (void)drawContentsOfRenderers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  CGContext *v17;
  void *v18;
  CGAffineTransform transform;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKBKeyView factory](self, "factory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitsForKey:onKeyplane:", self->m_key, self->m_keyplane);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIKBKeyView renderAsMask](self, "renderAsMask"))
    objc_msgSend(v6, "modifyForMasking");
  -[UIKBKeyView factory](self, "factory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayContentsForKey:", self->m_key);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    LOBYTE(v11) = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        if ((v11 & 1) != 0)
          v11 = 1;
        else
          v11 = !-[UIKBKeyView allowBackgroundCachingForRenderFlags:](self, "allowBackgroundCachingForRenderFlags:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "renderFlags"));
        objc_msgSend(v6, "hashString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "loadCachedImageForHashString:", v15);

        if ((v16 & 1) == 0)
        {
          if (v11)
            objc_msgSend(v14, "setDisableInternalCaching:", 1);
          if (objc_msgSend(v14, "context"))
          {
            CGContextSaveGState((CGContextRef)objc_msgSend(v14, "context"));
            v17 = (CGContext *)objc_msgSend(v14, "context");
            CGAffineTransformMakeTranslation(&transform, -self->m_drawFrame.origin.x, -self->m_drawFrame.origin.y);
            CGContextConcatCTM(v17, &transform);
          }
          objc_msgSend(v14, "renderKeyContents:withTraits:", v18, v6);
          if (objc_msgSend(v14, "context"))
            CGContextRestoreGState((CGContextRef)objc_msgSend(v14, "context"));
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

}

- (id)_generateBackdropAndBorderMaskImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIKBKeyView setRenderAsMask:](self, "setRenderAsMask:", 1);
  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree layoutName](self->m_keyplane, "layoutName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayImagesForView:fromLayout:imageFlags:", self, v4, &unk_1E1A93A28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBKeyView setRenderAsMask:](self, "setRenderAsMask:", 0);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectForKey:", &unk_1E1A98340);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)configureBackdropView:(id)a3 forRenderConfig:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  int v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  char v33;
  void *v34;
  id v35;

  v35 = a3;
  v6 = a4;
  -[UIKBKeyView contentsKeyView](self, "contentsKeyView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView keyplane](self, "keyplane");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v6;
  if ((objc_msgSend(v8, "visualStyling") & 0xFF00) == 0x7F00)
  {
    v9 = 1;
  }
  else
  {
    -[UIKBKeyView keyplane](self, "keyplane");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "visualStyle") == 5 || (objc_msgSend(v6, "emptyBackground") & 1) != 0)
      v9 = 1;
    else
      v9 = objc_msgSend(v6, "animatedBackground");

  }
  -[UIKBKeyView key](self, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "interactionType");

  -[UIKBKeyView key](self, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v13, "state");

  -[UIKBKeyView key](self, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "state");

  -[UIKBKeyView key](self, "key");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "state");

  -[UIKBKeyView key](self, "key");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v18, "displayTypeHint");

  -[UIKBKeyView key](self, "key");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "interactionType") == 9)
  {
    v20 = 1;
  }
  else
  {
    -[UIKBKeyView key](self, "key");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "interactionType") == 5)
    {
      v20 = 1;
    }
    else
    {
      -[UIKBKeyView key](self, "key");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v22, "interactionType") == 6;

    }
  }

  if (v12 == 16)
  {
    objc_msgSend(v7, "key");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "state") == 20;

  }
  else
  {
    v24 = 0;
  }
  v25 = v9 & (v17 >> 4) & v20 | v24;
  if (v25 == 1)
  {
    -[UIView bounds](self, "bounds");
    objc_msgSend(v35, "setFrame:");
    -[UIView bounds](self, "bounds");
    objc_msgSend(v7, "setFrame:");
  }
  v26 = v35;
  if ((v17 & 0x10) == 0)
    goto LABEL_37;
  v27 = objc_msgSend(v34, "lightKeyboard") ^ 1;
  v26 = v35;
  if (v12 == 16)
    v27 = 1;
  if (((v27 | v20) & 1) == 0)
  {
LABEL_37:
    if (v33 & 4 | v15 & 8)
    {
      if (v32 != 10)
      {
        v28 = objc_msgSend(v34, "lightKeyboard") ^ 1;
        v26 = v35;
        if (((v28 | v9) & 1) == 0)
          goto LABEL_26;
      }
    }
    else if ((v9 & 1) == 0)
    {
LABEL_26:
      objc_msgSend(v26, "imageForCorners");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      goto LABEL_29;
    }
  }
  objc_msgSend(v26, "_maskImage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 1;
LABEL_29:
  if (((v29 != 0) & ~v25) != 0)
  {
    v31 = v29;
  }
  else
  {
    objc_msgSend(v7, "_generateBackdropAndBorderMaskImage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      objc_msgSend(v35, "_setMaskImage:", v31);
    else
      objc_msgSend(v35, "setImageForCorners:", v31);
  }

}

- (void)changeBackgroundToEnabled
{
  CGColor *v3;
  void *v4;
  CGColor *activeBackgroundColor;
  id activeCompositingFilter;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_singleRerender)
  {
    -[UIKBKeyView layerForRenderFlags:](self, "layerForRenderFlags:", 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (CGColor *)objc_msgSend(v11, "contentsMultiplyColor");
    objc_msgSend(v11, "compositingFilter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      activeBackgroundColor = self->_activeBackgroundColor;
      if (activeBackgroundColor)
        CGColorRelease(activeBackgroundColor);
      self->_activeBackgroundColor = CGColorRetain(v3);
    }
    if (v4)
    {
      activeCompositingFilter = self->_activeCompositingFilter;
      if (activeCompositingFilter)
        CFRelease(activeCompositingFilter);
      CFRetain(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_activeCompositingFilter;
      self->_activeCompositingFilter = v7;

    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[UIKBKeyView factory](self, "factory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultKeyBackgroundColorName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentsMultiplyColor:", UIKBGetNamedColor(v10));

    objc_msgSend(v11, "setCompositingFilter:", 0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    self->_singleRerender = 1;

  }
}

- (void)changeBackgroundToActiveIfNecessary
{
  void *v3;
  id activeCompositingFilter;
  id v5;

  if (self->_singleRerender)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[UIKBKeyView layerForRenderFlags:](self, "layerForRenderFlags:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    if (self->_activeBackgroundColor)
    {
      objc_msgSend(v3, "setContentsMultiplyColor:");
      CGColorRelease(self->_activeBackgroundColor);
      self->_activeBackgroundColor = 0;
    }
    if (self->_activeCompositingFilter)
    {
      objc_msgSend(v5, "setCompositingFilter:");
      CFRelease(self->_activeCompositingFilter);
      activeCompositingFilter = self->_activeCompositingFilter;
      self->_activeCompositingFilter = 0;

    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    self->_singleRerender = 0;

  }
}

- (void)resetRenderedKeyState
{
  self->_renderedKeyState = 0;
}

- (UIKBTree)keyplane
{
  return self->m_keyplane;
}

- (CGRect)drawFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->m_drawFrame.origin.x;
  y = self->m_drawFrame.origin.y;
  width = self->m_drawFrame.size.width;
  height = self->m_drawFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)cachedAnchorCorner
{
  return self->_cachedAnchorCorner;
}

- (unint64_t)cachedShiftState
{
  return self->_cachedShiftState;
}

- (BOOL)cachedControlKeyRenderingPreference
{
  return self->_cachedControlKeyRenderingPreference;
}

- (void)setPopupMenu:(id)a3
{
  objc_storeWeak((id *)&self->_popupMenu, a3);
}

- (double)endingTransitionDuration
{
  return self->_endingTransitionDuration;
}

- (void)setEndingTransitionDuration:(double)a3
{
  self->_endingTransitionDuration = a3;
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void)setScreenTraits:(id)a3
{
  objc_storeStrong((id *)&self->_screenTraits, a3);
}

- (void)setRenderAsMask:(BOOL)a3
{
  self->_renderAsMask = a3;
}

- (void)setContainedInDynamicKey:(BOOL)a3
{
  self->_containedInDynamicKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_destroyWeak((id *)&self->_popupMenu);
  objc_storeStrong(&self->_activeCompositingFilter, 0);
  objc_storeStrong((id *)&self->_cachedTraitsHashString, 0);
  objc_storeStrong((id *)&self->_keyLayers, 0);
  objc_storeStrong((id *)&self->m_factory, 0);
  objc_storeStrong((id *)&self->m_renderConfig, 0);
  objc_storeStrong((id *)&self->m_key, 0);
  objc_storeStrong((id *)&self->m_keyplane, 0);
}

@end
