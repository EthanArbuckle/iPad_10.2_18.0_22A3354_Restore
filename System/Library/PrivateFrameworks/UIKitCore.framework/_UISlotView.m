@implementation _UISlotView

- (_UISlotView)init
{
  char *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UISlotView;
  v2 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    _UIKitBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredLocalizations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 52);
    *((_QWORD *)v2 + 52) = v5;

    v7 = (void *)*((_QWORD *)v2 + 53);
    *((_QWORD *)v2 + 53) = &__block_literal_global_539;

    v8 = (void *)*((_QWORD *)v2 + 54);
    *((_QWORD *)v2 + 54) = 0;

    -[_UISlotView _slotStyle](v2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 56);
    *((_QWORD *)v2 + 56) = v9;

    *(_OWORD *)(v2 + 456) = *MEMORY[0x1E0C9D820];
    v11 = (void *)*((_QWORD *)v2 + 59);
    *((_QWORD *)v2 + 59) = 0;

    *((_QWORD *)v2 + 60) = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__slotStyleDidChange_, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  }
  return (_UISlotView *)v2;
}

- (id)_slotStyle
{
  void *v1;
  uint64_t v2;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL8 v27;
  void *v28;
  void *v29;
  _QWORD v31[2];
  BOOL (*v32)(_QWORD *);
  void *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  _QWORD v42[2];
  void (*v43)(_QWORD *, void *);
  void *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  __CFString *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = -1;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = -1;
  v75 = 0;
  v76 = (double *)&v75;
  v77 = 0x2020000000;
  v78 = 0;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = -1;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = -1;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__196;
  v65 = __Block_byref_object_dispose__196;
  v66 = CFSTR("_UICTContentSizeCategoryUnspecified");
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = -1;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v43 = __25___UISlotView__slotStyle__block_invoke;
  v44 = &unk_1E16E4838;
  v45 = &v83;
  v46 = &v79;
  v47 = &v75;
  v48 = &v71;
  v49 = &v67;
  v50 = &v61;
  v51 = &v57;
  v52 = &v53;
  v29 = v1;
  __25___UISlotView__slotStyle__block_invoke(v42, v1);
  v31[0] = v2;
  v31[1] = 3221225472;
  v32 = __25___UISlotView__slotStyle__block_invoke_2;
  v33 = &unk_1E16E4860;
  v34 = &v83;
  v35 = &v79;
  v36 = &v75;
  v37 = &v71;
  v38 = &v67;
  v39 = &v61;
  v40 = &v57;
  v41 = &v53;
  if (__25___UISlotView__slotStyle__block_invoke_2(v31))
  {
    objc_msgSend(a1, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v43(v42, v5);

    }
    if (((unsigned int (*)(_QWORD *))v32)(v31))
    {
      objc_msgSend(v4, "windowScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "traitCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v43(v42, v8);

      }
      if (((unsigned int (*)(_QWORD *))v32)(v31))
      {
        objc_msgSend(v7, "screen");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "traitCollection");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v43(v42, v11);

        }
        if (((unsigned int (*)(_QWORD *))v32)(v31))
        {
          +[UIScreen mainScreen](UIScreen, "mainScreen");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12 && v12 != v10)
          {
            objc_msgSend(v12, "traitCollection");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v43(v42, v14);

          }
        }

      }
    }

  }
  v28 = (void *)MEMORY[0x1E0DC5C60];
  v27 = _AXSButtonShapesEnabled() != 0;
  v15 = _UISSlotAccessibilityContrastFromAccessibilityContrast(v84[3]);
  v16 = _UISSlotDisplayRangeFromDisplayGamut(v80[3]);
  v17 = _UISSlotDisplayScaleFromDisplayScale(v76[3]);
  v18 = _UISSlotLayoutDirectionFromTraitEnvironmentLayoutDirection(v72[3]);
  v19 = _UISSlotLegibilityWeightFromLegibilityWeight(v68[3]);
  v20 = a1[52];
  v21 = _UISSlotContentSizeCategoryFromContentSizeCategory((void *)v62[5]);
  objc_msgSend(a1, "tintColor");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = objc_msgSend(v22, "CGColor");
  v24 = _UISSlotUserInterfaceIdiomFromUserInterfaceIdiom(v58[3]);
  objc_msgSend(v28, "slotStyleWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:", v27, v15, v16, v17, v18, v19, v20, v21, v23, v24, _UISSlotUserInterfaceStyleFromUserInterfaceStyle(v54[3]));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);

  return v25;
}

- (void)dealloc
{
  UISSlotAnyContent *slotContent;
  void *v4;
  void *v5;
  objc_super v6;

  slotContent = self->_slotContent;
  +[_UISlotView _sharedLayerContext]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISSlotAnyContent deleteFromLayerContext:](slotContent, "deleteFromLayerContext:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  v6.receiver = self;
  v6.super_class = (Class)_UISlotView;
  -[UIView dealloc](&v6, sel_dealloc);
}

+ (id)_sharedLayerContext
{
  objc_opt_self();
  if (_MergedGlobals_5_13 != -1)
    dispatch_once(&_MergedGlobals_5_13, &__block_literal_global_19_5);
  return (id)qword_1ECD7ABC0;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (void)displayLayer:(id)a3
{
  uint64_t v4;
  id v5;
  char v6;
  double v7;
  id v8;

  v4 = *MEMORY[0x1E0CD2F78];
  v5 = a3;
  objc_msgSend(v5, "setContentsGravity:", v4);
  v6 = objc_opt_respondsToSelector();
  v7 = 1.0;
  if ((v6 & 1) != 0)
    v7 = (double)-[UISSlotAnyContent contentScale](self->_slotContent, "contentScale", 1.0);
  objc_msgSend(v5, "setContentsScale:", v7);
  -[UISSlotAnyContent image](self->_slotContent, "image");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContents:", v8);

}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicContentSize.width;
  height = self->_intrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_slotStyleDidChange
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  BOOL v7;
  char v8;
  id v9;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 424);
    -[_UISlotView _slotStyle]((_QWORD *)a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(id *)(a1 + 448);
    v6 = v4;
    v9 = v6;
    if (v5 == v6)
    {

    }
    else
    {
      if (v6)
        v7 = v5 == 0;
      else
        v7 = 1;
      if (v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v5, "isEqual:", v6);

        if ((v8 & 1) != 0)
          goto LABEL_12;
      }
      objc_storeStrong((id *)(a1 + 448), v4);
      objc_msgSend((id)a1, "_updateContent");
    }
LABEL_12:

  }
}

- (id)_slotAnyContentProvider
{
  return _Block_copy(self->_slotAnyContentProvider);
}

- (void)_setSlotAnyContentProvider:(id)a3
{
  void *v4;
  id slotAnyContentProvider;

  v4 = _Block_copy(a3);
  slotAnyContentProvider = self->_slotAnyContentProvider;
  self->_slotAnyContentProvider = v4;

  -[_UISlotView _updateContent](self, "_updateContent");
}

- (id)_slotStyleResolver
{
  return _Block_copy(self->_slotStyleResolver);
}

- (void)_setSlotStyleResolver:(id)a3
{
  void *v4;
  id slotStyleResolver;
  UISSlotStyle *v6;
  UISSlotStyle *currentSlotStyle;

  v4 = _Block_copy(a3);
  slotStyleResolver = self->_slotStyleResolver;
  self->_slotStyleResolver = v4;

  (*((void (**)(void))self->_slotStyleResolver + 2))();
  v6 = (UISSlotStyle *)objc_claimAutoreleasedReturnValue();
  currentSlotStyle = self->_currentSlotStyle;
  self->_currentSlotStyle = v6;

}

- (_UISlotViewContentDelegate)_contentDelegate
{
  return (_UISlotViewContentDelegate *)objc_loadWeakRetained((id *)&self->_contentDelegate);
}

- (void)_setContentDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_contentDelegate, v4);
    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35___UISlotView__setContentDelegate___block_invoke;
    v9[3] = &unk_1E16E4770;
    objc_copyWeak(&v10, &location);
    -[_UISlotView _setSlotStyleResolver:](self, "_setSlotStyleResolver:", v9);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __35___UISlotView__setContentDelegate___block_invoke_2;
    v7[3] = &unk_1E16E4810;
    objc_copyWeak(&v8, &location);
    -[_UISlotView _setSlotAnyContentProvider:](self, "_setSlotAnyContentProvider:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)_overlayView:(id)a3 centerInView:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UIView superview](self, "superview");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", self);
    v9 = (void *)MEMORY[0x1E0D156E0];
    -[UIView centerXAnchor](self, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    -[UIView centerYAnchor](self, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v16);

  }
}

- (void)_updateContent
{
  void *v3;
  void (**slotAnyContentProvider)(id, uint64_t, UISSlotStyle *, _QWORD *);
  void *v5;
  uint64_t v6;
  UISSlotStyle *currentSlotStyle;
  _QWORD v8[4];
  id v9[2];
  id location;

  if (self->_slotAnyContentProvider)
  {
    objc_initWeak(&location, self);
    v3 = (void *)(self->_currentGeneration + 1);
    self->_currentGeneration = (unint64_t)v3;
    slotAnyContentProvider = (void (**)(id, uint64_t, UISSlotStyle *, _QWORD *))self->_slotAnyContentProvider;
    +[_UISlotView _sharedLayerContext]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "contextId");
    currentSlotStyle = self->_currentSlotStyle;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29___UISlotView__updateContent__block_invoke;
    v8[3] = &unk_1E16E4888;
    objc_copyWeak(v9, &location);
    v9[1] = v3;
    slotAnyContentProvider[2](slotAnyContentProvider, v6, currentSlotStyle, v8);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotContent, 0);
  objc_storeStrong((id *)&self->_currentSlotStyle, 0);
  objc_destroyWeak((id *)&self->_contentDelegate);
  objc_storeStrong(&self->_slotAnyContentProvider, 0);
  objc_storeStrong(&self->_slotStyleResolver, 0);
  objc_storeStrong((id *)&self->_localization, 0);
}

@end
