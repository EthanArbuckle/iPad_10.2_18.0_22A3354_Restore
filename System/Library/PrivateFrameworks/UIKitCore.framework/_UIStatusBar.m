@implementation _UIStatusBar

+ (CGSize)intrinsicContentSizeForTargetScreen:(id)a3 orientation:(int64_t)a4 onLockScreen:(BOOL)a5 isAzulBLinked:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id VisualProviderClassForScreen;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  VisualProviderClassForScreen = _UIStatusBarGetVisualProviderClassForScreen(v10, 0);
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(VisualProviderClassForScreen, "intrinsicLockScreenContentSizeForOrientation:", a4);
  else
    objc_msgSend(VisualProviderClassForScreen, "intrinsicContentSizeForOrientation:", a4);
  v14 = v12;
  v15 = v13;
  if (v6)
  {
    objc_msgSend(a1, "_effectiveScaleForVisualProviderClass:targetScreen:", VisualProviderClassForScreen, v10);
    v15 = round(v15 * v16);
  }

  v17 = v14;
  v18 = v15;
  result.height = v18;
  result.width = v17;
  return result;
}

+ (double)_effectiveScaleForVisualProviderClass:(Class)a3 targetScreen:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  v6 = 1.0;
  if (-[objc_class scalesWithScreenNativeScale](a3, "scalesWithScreenNativeScale"))
  {
    objc_msgSend(v5, "_nativeScale");
    v8 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[objc_class referenceScreenScale](a3, "referenceScreenScale");
    else
      objc_msgSend(v5, "_scale");
    if (v8 != 0.0 && vabdd_f64(v9, v8) > 0.00000011920929)
      v6 = v9 / v8;
  }

  return v6;
}

+ (id)stringForStatusBarStyle:(int64_t)a3
{
  id result;
  __CFString *v4;

  result = 0;
  switch(a3)
  {
    case 0:
      result = CFSTR("_UIStatusBarResolvedStyleDefault");
      break;
    case 1:
      result = CFSTR("_UIStatusBarResolvedStyleLightContent");
      break;
    case 2:
      result = CFSTR("_UIStatusBarResolvedStyleDarkContent");
      break;
    case 3:
      return result;
    case 4:
      result = CFSTR("_UIStatusBarResolvedStyleInherited");
      break;
    default:
      v4 = CFSTR("_UIStatusBarResolvedStyleAutomaticWithDarkBias");
      if (a3 != 128)
        v4 = 0;
      if (a3 == 64)
        result = CFSTR("_UIStatusBarResolvedStyleAutomaticWithLightBias");
      else
        result = v4;
      break;
  }
  return result;
}

+ (void)registerSensorActivityIndicator:(id)a3 forScreen:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = _MergedGlobals_23_5;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&_MergedGlobals_23_5, &__block_literal_global_491);
  v8 = (void *)qword_1ECD7B7B8;
  sensorActivityScreenIdentifier(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v7, v9);
}

+ (id)sensorActivityIndicatorForScreen:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)qword_1ECD7B7B8;
  sensorActivityScreenIdentifier(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_forceLayoutEngineSolutionInRationalEdges
{
  return 1;
}

- (_UIStatusBar)initWithStyle:(int64_t)a3
{
  _UIStatusBar *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _UIStatusBarDataAggregator *v8;
  uint64_t v9;
  _UIStatusBarDataAggregator *dataAggregator;
  _UIStatusBarActionGestureRecognizer *v11;
  uint64_t v12;
  UIGestureRecognizer *actionGestureRecognizer;
  UIAccessibilityHUDGestureManager *v14;
  UIAccessibilityHUDGestureManager *accessibilityHUDGestureManager;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_UIStatusBar;
  v4 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, 0.0, 0.0, 600.0, 50.0);
  v4->_style = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBar setItems:](v4, "setItems:", v5);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBar setDisplayItemStates:](v4, "setDisplayItemStates:", v6);

  -[UIView _setHostsLayoutEngine:](v4, "_setHostsLayoutEngine:", 1);
  v7 = _UIGetUIStatusBarForcedMode();
  if (v7 != -1)
    v4->_mode = v7;
  objc_initWeak(&location, v4);
  v8 = [_UIStatusBarDataAggregator alloc];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __30___UIStatusBar_initWithStyle___block_invoke;
  v20 = &unk_1E16E2168;
  objc_copyWeak(&v21, &location);
  v9 = -[_UIStatusBarDataAggregator initWithUpdateBlock:](v8, "initWithUpdateBlock:", &v17);
  dataAggregator = v4->_dataAggregator;
  v4->_dataAggregator = (_UIStatusBarDataAggregator *)v9;

  v11 = [_UIStatusBarActionGestureRecognizer alloc];
  v12 = -[UIGestureRecognizer initWithTarget:action:](v11, "initWithTarget:action:", v4, sel_statusBarGesture_, v17, v18, v19, v20);
  actionGestureRecognizer = v4->_actionGestureRecognizer;
  v4->_actionGestureRecognizer = (UIGestureRecognizer *)v12;

  -[UIGestureRecognizer setDelegate:](v4->_actionGestureRecognizer, "setDelegate:", v4);
  -[UIGestureRecognizer setAllowedPressTypes:](v4->_actionGestureRecognizer, "setAllowedPressTypes:", &unk_1E1A94AF0);
  -[UIGestureRecognizer setAllowedTouchTypes:](v4->_actionGestureRecognizer, "setAllowedTouchTypes:", &unk_1E1A94B08);
  -[UIView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_actionGestureRecognizer);
  v14 = -[UIAccessibilityHUDGestureManager initWithView:delegate:]([UIAccessibilityHUDGestureManager alloc], "initWithView:delegate:", v4, v4);
  accessibilityHUDGestureManager = v4->_accessibilityHUDGestureManager;
  v4->_accessibilityHUDGestureManager = v14;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return v4;
}

- (NSString)description
{
  _UIStatusBarVisualProvider *visualProvider;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  visualProvider = self->_visualProvider;
  if (visualProvider)
  {
    v7 = CFSTR("visualProvider");
    v8[0] = visualProvider;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDescriptionBuilder descriptionForObject:namesAndObjects:](UIDescriptionBuilder, "descriptionForObject:namesAndObjects:", self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v5;
  }
  else
  {
    +[UIDescriptionBuilder descriptionForObject:namesAndObjects:](UIDescriptionBuilder, "descriptionForObject:namesAndObjects:", self, 0);
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_setVisualProviderClassName:(id)a3
{
  NSString *v5;
  Class v6;
  void *v7;
  NSString *v8;

  v5 = (NSString *)a3;
  v8 = v5;
  if (!v5)
    goto LABEL_4;
  v6 = NSClassFromString(v5);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBar.m"), 227, CFSTR("No visual provider class with name %@"), v8);

LABEL_4:
    v6 = 0;
  }
  -[_UIStatusBar _setVisualProviderClass:](self, "_setVisualProviderClass:", v6);

}

- (NSString)_visualProviderClassName
{
  objc_class *v2;

  v2 = -[_UIStatusBar _visualProviderClass](self, "_visualProviderClass");
  if (v2)
  {
    NSStringFromClass(v2);
    v2 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (_UIStatusBarVisualProvider)visualProvider
{
  -[_UIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  return self->_visualProvider;
}

- (UIScreen)_effectiveTargetScreen
{
  UIScreen *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = self->_targetScreen;
  if (!v3)
  {
    -[UIView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v3 = (UIScreen *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[UIView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      if (v6 == 3)
        +[UIScreen _carScreen](UIScreen, "_carScreen");
      else
        +[UIScreen mainScreen](UIScreen, "mainScreen");
      v3 = (UIScreen *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (void)_prepareVisualProviderIfNeeded
{
  objc_class *visualProviderClass;
  void *v4;
  void *v5;
  objc_class *v6;
  Class v7;
  int v8;
  int v9;
  int v10;
  _UIStatusBarVisualProvider *v11;
  _UIStatusBarVisualProvider *visualProvider;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  _UIStatusBarForegroundView *v28;
  _UIStatusBarForegroundView *v29;
  UIPointerInteraction *v30;
  UIPointerInteraction *pointerInteraction;
  void *v32;
  void *v33;
  _UIStatusBarVisualProvider *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSDictionary *regions;
  id v39;
  _QWORD v40[5];
  _QWORD v41[5];
  id v42;

  if (!self->_visualProvider)
  {
    visualProviderClass = self->_visualProviderClass;
    if (!visualProviderClass)
    {
      -[_UIStatusBar _effectiveTargetScreen](self, "_effectiveTargetScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBar visualProviderInfo](self, "visualProviderInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _UIStatusBarGetVisualProviderClassForScreen(v4, v5);
      v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v7 = self->_visualProviderClass;
      self->_visualProviderClass = v6;

      if (-[objc_class scalesWithScreenNativeScale](self->_visualProviderClass, "scalesWithScreenNativeScale"))v8 = 2;
      else
        v8 = 0;
      self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFFD | v8);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = 4;
      else
        v9 = 0;
      self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFFB | v9);
      if (-[objc_class requiresIterativeOverflowLayout](self->_visualProviderClass, "requiresIterativeOverflowLayout"))v10 = 8;
      else
        v10 = 0;
      self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFF7 | v10);

      visualProviderClass = self->_visualProviderClass;
    }
    v11 = (_UIStatusBarVisualProvider *)objc_alloc_init(visualProviderClass);
    visualProvider = self->_visualProvider;
    self->_visualProvider = v11;

    -[_UIStatusBarVisualProvider setStatusBar:](self->_visualProvider, "setStatusBar:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 16;
    else
      v13 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFEF | v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 32;
    else
      v14 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFDF | v14);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 64;
    else
      v15 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFBF | v15);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 128;
    else
      v16 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFF7F | v16);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 256;
    else
      v17 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFEFF | v17);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 512;
    else
      v18 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFDFF | v18);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 1024;
    else
      v19 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFBFF | v19);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = 2048;
    else
      v20 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFF7FF | v20);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = 4096;
    else
      v21 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFEFFF | v21);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = 0x2000;
    else
      v22 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFDFFF | v22);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = 0x4000;
    else
      v23 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFBFFF | v23);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = 0x8000;
    else
      v24 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFF7FFF | v24);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = 0x10000;
    else
      v25 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFEFFFF | v25);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = 0x20000;
    else
      v26 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFDFFFF | v26);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = 0x40000;
    else
      v27 = 0;
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFBFFFF | v27);
    -[_UIStatusBar _updateActionGestureRecognizerAllowableTouchTypesIfNeeded](self, "_updateActionGestureRecognizerAllowableTouchTypesIfNeeded");
  }
  if (!self->_foregroundView)
  {
    v28 = [_UIStatusBarForegroundView alloc];
    -[UIView bounds](self, "bounds");
    v29 = -[UIView initWithFrame:](v28, "initWithFrame:");
    -[_UIStatusBar setForegroundView:](self, "setForegroundView:", v29);

    v30 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", self);
    pointerInteraction = self->_pointerInteraction;
    self->_pointerInteraction = v30;

    -[_UIStatusBar foregroundView](self, "foregroundView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addInteraction:", self->_pointerInteraction);

    -[UIView addSubview:](self, "addSubview:", self->_foregroundView);
  }
  if (!-[NSDictionary count](self->_regions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = self->_visualProvider;
    -[_UIStatusBar containerView](self, "containerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider setupInContainerView:](v34, "setupInContainerView:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __46___UIStatusBar__prepareVisualProviderIfNeeded__block_invoke;
    v41[3] = &unk_1E16E2190;
    v41[4] = self;
    v39 = v33;
    v42 = v39;
    objc_msgSend(v36, "enumerateObjectsUsingBlock:", v41);
    objc_storeStrong((id *)&self->_regions, v33);
    regions = self->_regions;
    v40[0] = v37;
    v40[1] = 3221225472;
    v40[2] = __46___UIStatusBar__prepareVisualProviderIfNeeded__block_invoke_2;
    v40[3] = &unk_1E16E21B8;
    v40[4] = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v40);
    +[_UIStatusBarDisplayItemState setupRelationsBetweenDisplayItemStates:visualProvider:](_UIStatusBarDisplayItemState, "setupRelationsBetweenDisplayItemStates:visualProvider:", self->_displayItemStates, self->_visualProvider);
    if (self->_mode)
    {
      if ((*(_BYTE *)&self->_statusBarFlags & 0x10) != 0)
        -[_UIStatusBarVisualProvider modeUpdatedFromMode:](self->_visualProvider, "modeUpdatedFromMode:", 0);
    }
    -[_UIStatusBar _updateStyleAttributes](self, "_updateStyleAttributes");

  }
}

- (void)resetVisualProvider
{
  NSDictionary *regions;
  NSMutableDictionary *v4;
  NSMutableDictionary *displayItemStates;

  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_regions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_69_0);
  regions = self->_regions;
  self->_regions = (NSDictionary *)MEMORY[0x1E0C9AA70];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  displayItemStates = self->_displayItemStates;
  self->_displayItemStates = v4;

}

- (void)setMode:(int64_t)a3
{
  int64_t mode;
  _QWORD v6[5];

  if (_UIGetUIStatusBarForcedMode() == -1)
  {
    mode = self->_mode;
    if (mode != a3)
    {
      self->_mode = a3;
      if (self->_visualProvider)
      {
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __24___UIStatusBar_setMode___block_invoke;
        v6[3] = &unk_1E16B1B28;
        v6[4] = self;
        -[_UIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v6);
        if ((*(_BYTE *)&self->_statusBarFlags & 0x10) != 0)
          -[_UIStatusBarVisualProvider modeUpdatedFromMode:](self->_visualProvider, "modeUpdatedFromMode:", mode);
      }
    }
    *(_DWORD *)&self->_statusBarFlags |= 1u;
  }
}

- (void)setOrientation:(int64_t)a3
{
  _UIStatusBarVisualProvider *visualProvider;

  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    visualProvider = self->_visualProvider;
    if (visualProvider)
    {
      if ((*(_BYTE *)&self->_statusBarFlags & 0x20) != 0)
        -[_UIStatusBarVisualProvider orientationUpdatedFromOrientation:](visualProvider, "orientationUpdatedFromOrientation:");
    }
  }
  *(_DWORD *)&self->_statusBarFlags |= 1u;
}

- (void)setAvoidanceFrame:(CGRect)a3
{
  -[_UIStatusBar setAvoidanceFrame:animationSettings:options:](self, "setAvoidanceFrame:animationSettings:options:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect *p_avoidanceFrame;
  double v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  -[_UIStatusBar _effectiveScaleTransform](self, "_effectiveScaleTransform");
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v23 = CGRectApplyAffineTransform(v22, &v21);
  v12 = v23.origin.x;
  v13 = v23.origin.y;
  v14 = v23.size.width;
  v15 = v23.size.height;
  p_avoidanceFrame = &self->_avoidanceFrame;
  if (!CGRectEqualToRect(v23, self->_avoidanceFrame))
  {
    v17 = p_avoidanceFrame->origin.x;
    v18 = self->_avoidanceFrame.origin.y;
    v19 = self->_avoidanceFrame.size.width;
    v20 = self->_avoidanceFrame.size.height;
    p_avoidanceFrame->origin.x = v12;
    self->_avoidanceFrame.origin.y = v13;
    self->_avoidanceFrame.size.width = v14;
    self->_avoidanceFrame.size.height = v15;
    if ((*(_BYTE *)&self->_statusBarFlags & 0x40) != 0)
      -[_UIStatusBarVisualProvider avoidanceFrameUpdatedFromFrame:withAnimationSettings:options:](self->_visualProvider, "avoidanceFrameUpdatedFromFrame:withAnimationSettings:options:", v11, a5, v17, v18, v19, v20);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[5];
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBar;
  -[UIView traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  if (self->_visualProvider)
  {
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");
    if (v6 != objc_msgSend(v4, "userInterfaceStyle")
      || (v7 = objc_msgSend(v5, "userInterfaceIdiom"), v7 != objc_msgSend(v4, "userInterfaceIdiom"))
      || (v8 = objc_msgSend(v5, "layoutDirection"), v8 != objc_msgSend(v4, "layoutDirection"))
      || (objc_msgSend(v5, "displayScale"), v10 = v9, objc_msgSend(v4, "displayScale"), v10 != v11))
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __41___UIStatusBar_traitCollectionDidChange___block_invoke;
      v12[3] = &unk_1E16B1B28;
      v12[4] = self;
      -[_UIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v12);
    }

  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  if (-[UIView semanticContentAttribute](self, "semanticContentAttribute") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIStatusBar;
    -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_, a3);
    if (self)
      _UIViewInvalidateTraitCollectionAndSchedulePropagation((uint64_t)self, 1);
  }
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  void *v4;
  void *v5;

  -[UIView traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), 0x1E1A994C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_performWithInheritedAnimation:(id)a3
{
  void *v3;
  void (**v4)(_QWORD);
  _BOOL8 v5;
  BOOL v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CD28B0];
  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(v3, "begin");
  v5 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  v6 = +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock");
  v7 = (void *)MEMORY[0x1E0CD28B0];
  if (v6)
  {
    +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
    objc_msgSend(v7, "setAnimationDuration:");
    v8 = (void *)MEMORY[0x1E0CD28B0];
    v9 = +[UIView _currentAnimationCurve](UIView, "_currentAnimationCurve");
    _UIGetAnimationCurveSpline(v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAnimationTimingFunction:", v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
  }
  v4[2](v4);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v5);
}

- (void)setStyle:(int64_t)a3
{
  int64_t style;
  _QWORD v5[5];

  style = self->_style;
  if (style != a3)
  {
    self->_style = a3;
    if (self->_visualProvider)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __25___UIStatusBar_setStyle___block_invoke;
      v5[3] = &unk_1E16B1B28;
      v5[4] = self;
      -[_UIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v5);
      if ((*(_BYTE *)&self->_statusBarFlags & 0x80) != 0)
        -[_UIStatusBarVisualProvider styleUpdatedFromStyle:](self->_visualProvider, "styleUpdatedFromStyle:", style);
    }
  }
}

- (void)setForegroundColor:(id)a3
{
  id v5;
  UIColor *foregroundColor;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;
  BOOL v10;
  _QWORD v11[5];

  v5 = a3;
  foregroundColor = self->_foregroundColor;
  v7 = (UIColor *)v5;
  v8 = foregroundColor;
  if (v8 == v7)
  {

  }
  else
  {
    v9 = v8;
    if (v7 && v8)
    {
      v10 = -[UIColor isEqual:](v7, "isEqual:", v8);

      if (v10)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    if (self->_visualProvider)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __35___UIStatusBar_setForegroundColor___block_invoke;
      v11[3] = &unk_1E16B1B28;
      v11[4] = self;
      -[_UIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v11);
    }
  }
LABEL_10:

}

- (void)setStyleAttributes:(id)a3
{
  _UIStatusBarStyleAttributes *v5;
  _UIStatusBarStyleAttributes *styleAttributes;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqual:", self->_styleAttributes) & 1) == 0)
  {
    v5 = (_UIStatusBarStyleAttributes *)objc_msgSend(v9, "copy");
    styleAttributes = self->_styleAttributes;
    self->_styleAttributes = v5;

    -[_UIStatusBarStyleAttributes traitCollection](self->_styleAttributes, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBar.m"), 555, CFSTR("Style attributes should have a traitCollection"));

    }
    -[_UIStatusBar _updateDisplayedItemsWithData:styleAttributes:extraAnimations:](self, "_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", 0, v9, MEMORY[0x1E0C9AA60]);
  }

}

- (int64_t)_effectiveStyleFromStyle:(int64_t)a3
{
  int64_t v3;
  void *v4;

  v3 = a3;
  if (!a3)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceStyle") == 2)
      v3 = 1;
    else
      v3 = 2;

  }
  return v3;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!self)
  {
    v11 = styleAttributesForStyle____s_category;
    if (!styleAttributesForStyle____s_category)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&styleAttributesForStyle____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v13, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v6);

  v7 = (void *)_UISetCurrentFallbackEnvironment(self);
  -[_UIStatusBarVisualProvider styleAttributesForStyle:](self->_visualProvider, "styleAttributesForStyle:", -[_UIStatusBar _effectiveStyleFromStyle:](self, "_effectiveStyleFromStyle:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _UIRestorePreviousFallbackEnvironment(v7);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v5);

  return v8;
}

- (void)_updateStyleAttributes
{
  int64_t style;
  uint64_t v4;
  id v5;

  style = self->_style;
  if (style == 2)
    v4 = 1;
  else
    v4 = 2 * (style == 1);
  -[UIView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v4);
  -[_UIStatusBar styleAttributesForStyle:](self, "styleAttributesForStyle:", self->_style);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBar setStyleAttributes:](self, "setStyleAttributes:", v5);

}

- (void)updateWithData:(id)a3
{
  -[_UIStatusBar _updateWithData:completionHandler:](self, "_updateWithData:completionHandler:", a3, 0);
}

- (void)setOverlayData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "isEmpty"))
  {

    v10 = 0;
  }
  -[_UIStatusBar overlayData](self, "overlayData");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v10 != v4)
  {
    -[_UIStatusBarDataAggregator overlayData](self->_dataAggregator, "overlayData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_UIStatusBarDataAggregator overlayData](self->_dataAggregator, "overlayData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataByApplyingOverlay:", self->_currentData);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v10;
      if (v10)
      {
        if (v8)
        {
          objc_msgSend(v8, "applyUpdate:", v10);
LABEL_12:
          -[_UIStatusBarDataAggregator setOverlayData:](self->_dataAggregator, "setOverlayData:", 0);
          -[_UIStatusBarDataAggregator updateWithData:](self->_dataAggregator, "updateWithData:", v8);
          -[_UIStatusBarDataAggregator setOverlayData:](self->_dataAggregator, "setOverlayData:", v10);

          v5 = v10;
          goto LABEL_13;
        }
LABEL_9:
        v10 = v9;
        v8 = v9;
        goto LABEL_12;
      }
    }
    else
    {
      v9 = v10;
      if (v10)
        goto LABEL_9;
      v8 = 0;
    }
    v10 = v9;
    goto LABEL_12;
  }
LABEL_13:

}

- (_UIStatusBarData)overlayData
{
  return -[_UIStatusBarDataAggregator overlayData](self->_dataAggregator, "overlayData");
}

- (void)_updateWithData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _UIStatusBarData *currentData;
  _UIStatusBarData *v10;
  _UIStatusBarData *v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  _UIStatusBar *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_UIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  v8 = _updateWithData_completionHandler____s_category;
  if (!_updateWithData_completionHandler____s_category)
  {
    v8 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&_updateWithData_completionHandler____s_category);
  }
  if ((*(_BYTE *)v8 & 1) != 0)
  {
    v12 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      -[_UIStatusBarDataAggregator delayedEntryKeys](self->_dataAggregator, "delayedEntryKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v19 = self;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Status bar %p update with data: %@, animated: %@, delayedKeys: %@", buf, 0x2Au);

    }
  }
  -[_UIStatusBar setUpdateCompletionHandler:](self, "setUpdateCompletionHandler:", v7);
  currentData = self->_currentData;
  if (currentData)
  {
    -[_UIStatusBarData applyUpdate:](currentData, "applyUpdate:", v6);
    -[_UIStatusBarDataAggregator updateWithData:](self->_dataAggregator, "updateWithData:", v6);
  }
  else
  {
    v10 = (_UIStatusBarData *)objc_msgSend(v6, "copy");
    v11 = self->_currentData;
    self->_currentData = v10;

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50___UIStatusBar__updateWithData_completionHandler___block_invoke;
    v16[3] = &unk_1E16B1B50;
    v16[4] = self;
    v17 = v6;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);

  }
}

- (void)_updateWithAggregatedData:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  $C136912CCF4AA723A1C7FFC3680A3D65 statusBarFlags;
  void *v8;
  void (**v9)(_QWORD);
  id updateCompletionHandler;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  const __CFString *v14;
  _BYTE v15[22];
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "copy");
  if ((*((_BYTE *)&self->_statusBarFlags + 1) & 1) != 0)
  {
    -[_UIStatusBarVisualProvider willUpdateWithData:](self->_visualProvider, "willUpdateWithData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (self->_currentAggregatedData)
    -[_UIStatusBarData applyUpdate:](self->_currentAggregatedData, "applyUpdate:", v4);
  else
    objc_storeStrong((id *)&self->_currentAggregatedData, v4);
  v6 = _updateWithAggregatedData____s_category;
  if (!_updateWithAggregatedData____s_category)
  {
    v6 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&_updateWithAggregatedData____s_category);
  }
  if ((*(_BYTE *)v6 & 1) != 0)
  {
    v11 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
      v14 = CFSTR("NO");
      *(_DWORD *)v15 = 134218498;
      *(_QWORD *)&v15[4] = self;
      *(_WORD *)&v15[12] = 2112;
      if (v13)
        v14 = CFSTR("YES");
      *(_QWORD *)&v15[14] = v4;
      v16 = 2112;
      v17 = v14;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Status bar %p now applying update: %@, animated: %@", v15, 0x20u);

    }
  }
  -[_UIStatusBar _updateDisplayedItemsWithData:styleAttributes:extraAnimations:](self, "_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", v4, 0, v5, *(_OWORD *)v15);
  statusBarFlags = self->_statusBarFlags;
  if ((*(_WORD *)&statusBarFlags & 0x200) != 0)
  {
    -[_UIStatusBarVisualProvider dataUpdated:](self->_visualProvider, "dataUpdated:", v4);
    statusBarFlags = self->_statusBarFlags;
  }
  self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&statusBarFlags | 1);
  -[UIPointerInteraction invalidate](self->_pointerInteraction, "invalidate");
  -[_UIStatusBar updateCompletionHandler](self, "updateCompletionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void (**)(_QWORD))_Block_copy(self->_updateCompletionHandler);
    updateCompletionHandler = self->_updateCompletionHandler;
    self->_updateCompletionHandler = 0;

    v9[2](v9);
  }

}

- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableDictionary *displayItemStates;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSMutableDictionary *items;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v31 = a5;
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      __UIFaultDebugAssertLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!self)
  {
    v27 = _updateDisplayedItemsWithData_styleAttributes_extraAnimations____s_category;
    if (!_updateDisplayedItemsWithData_styleAttributes_extraAnimations____s_category)
    {
      v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v27, (unint64_t *)&_updateDisplayedItemsWithData_styleAttributes_extraAnimations____s_category);
    }
    v28 = *(NSObject **)(v27 + 8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v10);

  v29 = (void *)_UISetCurrentFallbackEnvironment(self);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_displayItemStates, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_88_5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&self->_statusBarFlags |= 0x80000u;
  displayItemStates = self->_displayItemStates;
  v13 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_2;
  v36[3] = &unk_1E16E2220;
  v14 = v8;
  v37 = v14;
  v15 = v9;
  v38 = v15;
  v16 = v11;
  v39 = v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](displayItemStates, "enumerateKeysAndObjectsUsingBlock:", v36);
  items = self->_items;
  v34[0] = v13;
  v34[1] = 3221225472;
  v34[2] = __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_3;
  v34[3] = &unk_1E16E2248;
  v18 = v14;
  v35 = v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](items, "enumerateKeysAndObjectsUsingBlock:", v34);
  *(_DWORD *)&self->_statusBarFlags &= ~0x80000u;
  objc_msgSend(v16, "addObjectsFromArray:", v31);
  _UIStatusBarGetPriorityComparator();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v16, "sortedArrayUsingComparator:", v19);

  -[_UIStatusBar _prepareAnimations:](self, "_prepareAnimations:", v16);
  if (objc_msgSend(v16, "count"))
  {
    v33[0] = v13;
    v33[1] = 3221225472;
    v33[2] = __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_4;
    v33[3] = &unk_1E16B1B28;
    v33[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v33);
    if ((*(_DWORD *)&self->_statusBarFlags & 0x100008) != 0)
    {
      -[_UIStatusBar _rearrangeOverflowedItems](self, "_rearrangeOverflowedItems");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        do
        {
          objc_msgSend(v22, "prepareForOverflowDataUpdate");
          objc_msgSend(v22, "updateWithData:styleAttributes:", v18, v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIStatusBar _prepareAnimations:](self, "_prepareAnimations:", v23);
          objc_msgSend(v16, "addObjectsFromArray:", v23);
          v32[0] = v13;
          v32[1] = 3221225472;
          v32[2] = __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_5;
          v32[3] = &unk_1E16B1B28;
          v32[4] = self;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v32);

          -[_UIStatusBar _rearrangeOverflowedItems](self, "_rearrangeOverflowedItems");
          v24 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v24;
        }
        while (v24);
      }
    }
    -[_UIStatusBar _performAnimations:](self, "_performAnimations:", v16);
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  }
  else
  {
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    if ((*(_DWORD *)&self->_statusBarFlags & 0x100008) != 0)
    {
      do
      {
        -[UIView layoutIfNeeded](self, "layoutIfNeeded");
        -[_UIStatusBar _rearrangeOverflowedItems](self, "_rearrangeOverflowedItems");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (v25);
    }
    *(_DWORD *)&self->_statusBarFlags |= 1u;
  }
  -[_UIStatusBar _fixupDisplayItemAttributes](self, "_fixupDisplayItemAttributes");
  _UIRestorePreviousFallbackEnvironment(v29);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v30);

}

- (void)_prepareAnimations:(id)a3
{
  id v4;
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  id updateCompletionHandler;
  NSObject *v19;
  id obj;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_UIStatusBarAnimation prepareAnimations:forStatusBar:](_UIStatusBarAnimation, "prepareAnimations:forStatusBar:", v4, self);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v4;
  v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    obj = v5;
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v7, "effectiveDelayedItemIdentifiers", obj);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          v22 = v7;
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                -[_UIStatusBar itemWithIdentifier:](self, "itemWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "dependentEntryKeys");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "unionSet:", v16);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v12);
          }

          if (objc_msgSend(v9, "count"))
            -[_UIStatusBar _delayUpdatesWithKeys:fromAnimation:](self, "_delayUpdatesWithKeys:fromAnimation:", v9, v22);

        }
      }
      v5 = obj;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  if (self->_updateCompletionHandler && objc_msgSend(v5, "count"))
  {
    v17 = _Block_copy(self->_updateCompletionHandler);
    updateCompletionHandler = self->_updateCompletionHandler;
    self->_updateCompletionHandler = 0;

    v19 = dispatch_group_create();
    +[_UIStatusBarAnimation _addAnimations:toDispatchGroup:](_UIStatusBarAnimation, "_addAnimations:toDispatchGroup:", v5, v19);
    dispatch_group_notify(v19, MEMORY[0x1E0C80D38], v17);

  }
}

- (void)_delayUpdatesWithKeys:(id)a3 fromAnimation:(id)a4
{
  id v6;
  _UIStatusBarDataAggregator *dataAggregator;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  dataAggregator = self->_dataAggregator;
  v8 = a4;
  -[_UIStatusBarDataAggregator beginDelayingUpdatesForEntryKeys:](dataAggregator, "beginDelayingUpdatesForEntryKeys:", v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52___UIStatusBar__delayUpdatesWithKeys_fromAnimation___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "addTotalCompletionHandler:", v10);

}

- (void)updateWithAnimations:(id)a3
{
  -[_UIStatusBar _updateDisplayedItemsWithData:styleAttributes:extraAnimations:](self, "_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", 0, 0, a3);
}

- (void)updateForcingIterativeOverflow
{
  *(_DWORD *)&self->_statusBarFlags |= 0x100000u;
  -[_UIStatusBar updateWithAnimations:](self, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);
  *(_DWORD *)&self->_statusBarFlags &= ~0x100000u;
}

- (void)_performAnimations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == 1
          && (objc_msgSend(v9, "displayItemIdentifier"),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              -[_UIStatusBar displayItemWithIdentifier:](self, "displayItemWithIdentifier:", v10),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              v12 = objc_msgSend(v11, "visible"),
              v11,
              v10,
              !v12))
        {
          objc_msgSend(v9, "cancel");
        }
        else
        {
          objc_msgSend(v9, "performForStatusBar:", self);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)_fixupDisplayItemAttributes
{
  id v3;
  uint64_t v4;

  v3 = (id)_statusBarRunningAnimations;
  v4 = objc_msgSend(v3, "count");

  if (!v4
    && ((*((_BYTE *)&self->_statusBarFlags + 1) & 4) == 0
     || -[_UIStatusBarVisualProvider canFixupDisplayItemAttributes](self->_visualProvider, "canFixupDisplayItemAttributes")))
  {
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_regions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_93_3);
  }
}

- (CGAffineTransform)_effectiveScaleTransform
{
  CGAffineTransform *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  __int128 v13;

  if ((LOBYTE(self[8].ty) & 2) != 0)
  {
    v4 = self;
    -[CGAffineTransform _screen](self, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_nativeScale");
    v7 = v6;

    if ((LOBYTE(v4[8].ty) & 4) != 0)
    {
      objc_msgSend(*(id *)&v4[12].a, "referenceScreenScale");
      v10 = v11;
    }
    else
    {
      -[CGAffineTransform _screen](v4, "_screen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_scale");
      v10 = v9;

    }
    self = (CGAffineTransform *)-[CGAffineTransform mode](v4, "mode");
    if (self != (CGAffineTransform *)1 && v7 != 0.0 && vabdd_f64(v10, v7) > 0.00000011920929)
      return CGAffineTransformMakeScale(retstr, v10 / v7, v10 / v7);
  }
  v12 = MEMORY[0x1E0C9BAA8];
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
  return self;
}

- (void)resizeSubviewsWithOldSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  UIView *foregroundView;
  $C136912CCF4AA723A1C7FFC3680A3D65 statusBarFlags;
  _OWORD v11[6];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)_UIStatusBar;
  -[UIView resizeSubviewsWithOldSize:](&v12, sel_resizeSubviewsWithOldSize_);
  -[UIView bounds](self, "bounds");
  if (width != v7 || height != v6)
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_displayItemStates, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_98_2);
  -[_UIStatusBar _effectiveScaleTransform](self, "_effectiveScaleTransform");
  foregroundView = self->_foregroundView;
  v11[0] = v11[3];
  v11[1] = v11[4];
  v11[2] = v11[5];
  -[UIView setTransform:](foregroundView, "setTransform:", v11);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_foregroundView, "setFrame:");
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  statusBarFlags = self->_statusBarFlags;
  self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&statusBarFlags | 1);
  if ((*(_WORD *)&statusBarFlags & 0x800) != 0)
    -[_UIStatusBarVisualProvider sizeUpdatedFromSize:](self->_visualProvider, "sizeUpdatedFromSize:", width, height);
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBar;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
  if ((*((_BYTE *)&self->_statusBarFlags + 2) & 8) == 0)
    -[_UIStatusBar _updateRegionItems](self, "_updateRegionItems");
}

- (void)layoutSubviews
{
  id v3;
  NSDictionary *regions;
  id v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBar;
  v3 = -[UIView layoutSubviews](&v7, sel_layoutSubviews);
  __30___UIStatusBar_layoutSubviews__block_invoke((uint64_t)v3, self->_foregroundView);
  regions = self->_regions;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30___UIStatusBar_layoutSubviews__block_invoke_2;
  v6[3] = &__block_descriptor_40_e45_v32__0__NSString_8___UIStatusBarRegion_16_B24lu32l8;
  v6[4] = &__block_literal_global_104_0;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v6);
  -[UIView layoutIfNeeded](self->_foregroundView, "layoutIfNeeded");
  if ((*(_DWORD *)&self->_statusBarFlags & 0x100008) == 0)
    v5 = -[_UIStatusBar _rearrangeOverflowedItems](self, "_rearrangeOverflowedItems");
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_updateRegionItems
{
  _UIStatusBar *v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  char v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  _UIStatusBar *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!self->_currentData)
    return;
  v2 = self;
  v3 = 520;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_displayItemStates, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_106_0);
  -[NSDictionary keysSortedByValueUsingComparator:](v2->_regions, "keysSortedByValueUsingComparator:", &__block_literal_global_108_1);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (!v40)
    goto LABEL_35;
  v38 = 0;
  v39 = *(_QWORD *)v55;
  v45 = v2;
  do
  {
    for (i = 0; i != v40; i = v23 + 1)
    {
      if (*(_QWORD *)v55 != v39)
        objc_enumerationMutation(obj);
      v42 = i;
      v5 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
      -[NSDictionary objectForKeyedSubscript:](v2->_regions, "objectForKeyedSubscript:", v5);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      -[_UIStatusBarVisualProvider orderedDisplayItemPlacementsInRegionWithIdentifier:](v2->_visualProvider, "orderedDisplayItemPlacementsInRegionWithIdentifier:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v44 = v7;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      v43 = v6;
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v51 != v10)
              objc_enumerationMutation(v44);
            v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
            objc_msgSend(v12, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v3;
            objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v3), "objectForKeyedSubscript:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isCurrentPlacement:", v12);

            if (v16)
            {
              +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UIStatusBar itemWithIdentifier:](v2, "itemWithIdentifier:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "displayItemForIdentifier:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              v6 = v43;
              objc_msgSend(v20, "setPlacement:", v12);
              objc_msgSend(v43, "addObject:", v20);

              v2 = v45;
            }

            v3 = v14;
          }
          v9 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        }
        while (v9);
      }
      objc_msgSend(v41, "displayItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v6, "isEqual:", v21);

      if ((v22 & 1) != 0)
      {
        v23 = v42;
LABEL_19:
        v24 = v43;
        goto LABEL_23;
      }
      v23 = v42;
      if ((*((_BYTE *)&v2->_statusBarFlags + 1) & 0x10) == 0)
        goto LABEL_19;
      v24 = v43;
      -[_UIStatusBarVisualProvider region:willSetDisplayItems:](v2->_visualProvider, "region:willSetDisplayItems:", v41, v43);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25 != v43)
      {
        v27 = objc_msgSend(v25, "mutableCopy");

        v24 = (void *)v27;
      }

LABEL_23:
      objc_msgSend(v41, "setDisplayItems:", v24);
      objc_msgSend(v41, "displayItems");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "minusOrderedSet:", v28);

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v29 = v24;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v47;
        do
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v47 != v32)
              objc_enumerationMutation(v29);
            v34 = *(Class *)((char *)&v45->super.super.super.isa + v3);
            objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "updateToNextEnabledPlacement");

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        }
        while (v31);
        v38 = 1;
        v2 = v45;
      }

    }
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  }
  while (v40);
  if ((v38 & 1) != 0)
    -[_UIStatusBar _updateRegionItems](v2, "_updateRegionItems");
LABEL_35:
  if ((*((_BYTE *)&v2->_statusBarFlags + 1) & 0x20) != 0)
    -[_UIStatusBarVisualProvider statusBarRegionsUpdated](v2->_visualProvider, "statusBarRegionsUpdated");

}

- (id)_rearrangeOverflowedItems
{
  NSDictionary *regions;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  CGRect v15;

  -[UIView frame](self, "frame");
  if (CGRectIsEmpty(v15))
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__179;
  v13 = __Block_byref_object_dispose__179;
  v14 = 0;
  regions = self->_regions;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41___UIStatusBar__rearrangeOverflowedItems__block_invoke;
  v8[3] = &unk_1E16E22F0;
  v8[4] = self;
  v8[5] = &v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v8);
  v5 = (void *)v10[5];
  if (v5)
  {
    objc_msgSend(v5, "updateToNextEnabledPlacement");
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v6 = (void *)v10[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v9, 8);

  return v7;
}

- (CGRect)_extendedHoverFrameForActionable:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIUserInterfaceLayoutDirection v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "absoluteHoverFrame");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  if (!CGRectIsNull(v24))
  {
    objc_msgSend(v4, "extendedHoverInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    if (v17 == UIUserInterfaceLayoutDirectionRightToLeft)
      v18 = v16;
    else
      v18 = v12;
    if (v17 == UIUserInterfaceLayoutDirectionRightToLeft)
      v19 = v12;
    else
      v19 = v16;
    x = x + v18;
    y = y + v10;
    width = width - (v18 + v19);
    height = height - (v10 + v14);
  }

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_cursorLocation:(CGPoint)a3 isInsideActionable:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[_UIStatusBar _frameForActionable:](self, "_frameForActionable:", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)_cursorLocation:(CGPoint)a3 isInsideHoverableActionable:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat width;
  CGFloat height;
  BOOL v13;
  BOOL v14;
  CGPoint v16;
  CGRect v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(v7, "hoverView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBar _extendedHoverFrameForActionable:](self, "_extendedHoverFrameForActionable:", v7);
  v9 = v17.origin.x;
  v10 = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  if (CGRectIsNull(v17))
  {
    v13 = -[_UIStatusBar _cursorLocation:isInsideActionable:](self, "_cursorLocation:isInsideActionable:", v7, x, y);
  }
  else
  {
    v18.origin.x = v9;
    v18.origin.y = v10;
    v18.size.width = width;
    v18.size.height = height;
    v16.x = x;
    v16.y = y;
    v13 = CGRectContainsPoint(v18, v16);
  }
  v14 = v13;

  return v14;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int (**regionActionValidationBlock)(void);
  NSDictionary *regions;
  double x;
  double y;
  double width;
  double height;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, void *, _BYTE *);
  void *v26;
  _UIStatusBar *v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  CGRect v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  regionActionValidationBlock = (unsigned int (**)(void))self->_regionActionValidationBlock;
  if (regionActionValidationBlock && !regionActionValidationBlock[2]())
  {
    v21 = 0;
  }
  else
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__179;
    v41 = __Block_byref_object_dispose__179;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__179;
    v35 = __Block_byref_object_dispose__179;
    regions = self->_regions;
    v36 = 0;
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __66___UIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
    v26 = &unk_1E16E2340;
    v27 = self;
    v28 = v9;
    v29 = &v37;
    v30 = &v31;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", &v23);
    if (v38[5])
    {
      -[_UIStatusBar _extendedHoverFrameForActionable:](self, "_extendedHoverFrameForActionable:", v23, v24, v25, v26, v27);
      x = v43.origin.x;
      y = v43.origin.y;
      width = v43.size.width;
      height = v43.size.height;
      if (CGRectIsNull(v43))
      {
        -[_UIStatusBar _pressFrameForActionable:](self, "_pressFrameForActionable:", v38[5]);
        x = v17;
        y = v18;
        width = v19;
        height = v20;
      }
      +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v32[5], x, y, width, height);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

  }
  return v21;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "identifier", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v6;
  if (v6)
  {
    -[_UIStatusBar regionWithIdentifier:](self, "regionWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[_UIStatusBar displayItemWithIdentifier:](self, "displayItemWithIdentifier:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeWeak((id *)&self->_hoveredActionable, v7);

  }
  else
  {
    objc_storeWeak((id *)&self->_hoveredActionable, 0);
  }

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  objc_storeWeak((id *)&self->_hoveredActionable, 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  _UIStatusBarActionable **p_hoveredActionable;
  id WeakRetained;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UITargetedPreview *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  char v37;
  void *v38;
  double v39;
  void *v40;
  CGRect v42;
  CGRect v43;

  p_hoveredActionable = &self->_hoveredActionable;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hoveredActionable);
  objc_msgSend(WeakRetained, "hoverView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)p_hoveredActionable);
    objc_msgSend(v8, "absoluteHoverFrame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = objc_loadWeakRetained((id *)p_hoveredActionable);
    v18 = objc_msgSend(v17, "hoverHighlightsAsRegion");

    v42.origin.x = v10;
    v42.origin.y = v12;
    v42.size.width = v14;
    v42.size.height = v16;
    if (CGRectIsNull(v42))
    {
      objc_msgSend(v7, "frame");
      v10 = v19;
      v12 = v20;
      v14 = v21;
      v16 = v22;
      v23 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", v7);
      if ((v18 & 1) == 0)
      {
LABEL_4:
        +[UIPointerEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0.0;
LABEL_12:
        +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v25);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v24, v40);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
    else
    {
      v27 = (void *)objc_opt_new();
      -[UIView convertRect:toView:](self, "convertRect:toView:", v7, v10, v12, v14, v16);
      +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setVisiblePath:", v28);

      v23 = -[UITargetedPreview initWithView:parameters:]([UITargetedPreview alloc], "initWithView:parameters:", v7, v27);
      if ((v18 & 1) == 0)
        goto LABEL_4;
    }
    +[UIPointerEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBar visualProvider](self, "visualProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "conformsToProtocol:", &unk_1EE013508);

    if (v30)
    {
      -[_UIStatusBar visualProvider](self, "visualProvider");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionCursorInsets");
      v10 = v10 + v32;
      v12 = v12 + v33;
      v14 = v14 - (v32 + v34);
      v16 = v16 - (v33 + v35);

      -[_UIStatusBar visualProvider](self, "visualProvider");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend((id)objc_opt_class(), "regionCursorIsPill");

      if ((v37 & 1) == 0)
      {
        -[_UIStatusBar visualProvider](self, "visualProvider");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "regionCursorCornerRadius");
        v25 = v39;

        goto LABEL_12;
      }
    }
    else
    {
      v10 = v10 + -8.0;
      v12 = v12 + -2.0;
      v14 = v14 + 16.0;
      v16 = v16 + 4.0;
    }
    v43.origin.x = v10;
    v43.origin.y = v12;
    v43.size.width = v14;
    v43.size.height = v16;
    v25 = CGRectGetHeight(v43) * 0.5;
    goto LABEL_12;
  }
  v26 = 0;
LABEL_13:

  return v26;
}

- (CGRect)_frameForActionable:(id)a3
{
  id v4;
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
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "actionInsets");
  -[_UIStatusBar _frameForActionable:actionInsets:](self, "_frameForActionable:actionInsets:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_pressFrameForActionable:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UIStatusBar _frameForActionable:actionInsets:](self, "_frameForActionable:actionInsets:", a3, 0.0, 0.0, 0.0, 0.0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_frameForActionable:(id)a3 actionInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  objc_msgSend(v9, "layoutItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_ui_bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v9, "layoutItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "_ui_view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertRect:toView:", self, v12, v14, v16, v18);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v30 = UIRectIntegralWithScale(left + v22, top + v24, v26 - (left + right), v28 - (top + bottom), v29);
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)_updateActionGestureRecognizerAllowableTouchTypesIfNeeded
{
  _UIStatusBarVisualProvider *visualProvider;
  void *v4;

  visualProvider = self->_visualProvider;
  if (visualProvider)
  {
    if (-[_UIStatusBarVisualProvider supportsIndirectPointerTouchActions](visualProvider, "supportsIndirectPointerTouchActions"))v4 = &unk_1E1A94B20;
    else
      v4 = &unk_1E1A94B08;
    -[UIGestureRecognizer setAllowedTouchTypes:](self->_actionGestureRecognizer, "setAllowedTouchTypes:", v4);
  }
}

- (BOOL)_gestureRecognizer:(id)a3 isInsideActionable:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = -[_UIStatusBar _gestureRecognizer:touchInsideActionable:](self, "_gestureRecognizer:touchInsideActionable:", v6, v7)|| -[_UIStatusBar _gestureRecognizer:pressInsideActionable:](self, "_gestureRecognizer:pressInsideActionable:", v6, v7);

  return v8;
}

- (BOOL)_gestureRecognizer:(id)a3 touchInsideActionable:(id)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGPoint v20;
  CGRect v21;

  v6 = a4;
  objc_msgSend(a3, "locationInView:", self);
  v8 = v7;
  v10 = v9;
  -[_UIStatusBar _frameForActionable:](self, "_frameForActionable:", v6);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v21.origin.x = v12;
  v21.origin.y = v14;
  v21.size.width = v16;
  v21.size.height = v18;
  v20.x = v8;
  v20.y = v10;
  return CGRectContainsPoint(v21, v20);
}

- (BOOL)_gestureRecognizer:(id)a3 pressInsideActionable:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGRect v22;
  CGRect v23;

  v5 = a4;
  -[UIView _focusSystem](self, "_focusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "focusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "focusItemContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBar _pressFrameForActionable:](self, "_pressFrameForActionable:", v5);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v7, "frame");
  v23.origin.x = v17;
  v23.origin.y = v18;
  v23.size.width = v19;
  v23.size.height = v20;
  v22.origin.x = v10;
  v22.origin.y = v12;
  v22.size.width = v14;
  v22.size.height = v16;
  LOBYTE(self) = CGRectContainsRect(v22, v23);

  return (char)self;
}

- (void)statusBarGesture:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _UIStatusBarActionable **p_targetActionable;
  id WeakRetained;
  _BOOL4 v9;
  id v10;
  id v11;
  $C136912CCF4AA723A1C7FFC3680A3D65 statusBarFlags;
  _UIStatusBarVisualProvider *visualProvider;
  id v14;
  void *v15;
  _UIStatusBarVisualProvider *v16;
  id v17;
  id v18;

  v18 = a3;
  v4 = objc_msgSend(v18, "state");
  v5 = v4;
  v6 = v4 - 1;
  if ((unint64_t)(v4 - 1) > 2)
  {
    if ((unint64_t)(v4 - 3) > 2)
    {
      v10 = 0;
      goto LABEL_19;
    }
    v10 = 0;
  }
  else
  {
    p_targetActionable = &self->_targetActionable;
    WeakRetained = objc_loadWeakRetained((id *)&self->_targetActionable);
    v9 = -[_UIStatusBar _gestureRecognizer:isInsideActionable:](self, "_gestureRecognizer:isInsideActionable:", v18, WeakRetained);

    if (v9)
      v10 = objc_loadWeakRetained((id *)&self->_targetActionable);
    else
      v10 = 0;
    if (v6 <= 1)
    {
      v11 = objc_loadWeakRetained((id *)&self->_targetActionable);
      if (v11)
      {
        statusBarFlags = self->_statusBarFlags;

        if ((*(_WORD *)&statusBarFlags & 0x4000) != 0)
        {
          visualProvider = self->_visualProvider;
          v14 = objc_loadWeakRetained((id *)p_targetActionable);
          -[_UIStatusBarVisualProvider actionable:highlighted:initialPress:](visualProvider, "actionable:highlighted:initialPress:", v14, v10 != 0, v5 == 1);

        }
      }
      goto LABEL_19;
    }
    objc_msgSend(v10, "hoverAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15
      || (objc_msgSend(v10, "action"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (-[_UIStatusBar action](self, "action"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v15, "performWithStatusBar:completionHandler:", self, 0);

    }
  }
  if ((*((_BYTE *)&self->_statusBarFlags + 1) & 0x40) != 0)
  {
    v16 = self->_visualProvider;
    v17 = objc_loadWeakRetained((id *)&self->_targetActionable);
    -[_UIStatusBarVisualProvider actionable:highlighted:initialPress:](v16, "actionable:highlighted:initialPress:", v17, 0, 0);

  }
  objc_storeWeak((id *)&self->_targetActionable, 0);
LABEL_19:

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSDictionary *regions;
  id v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hoveredActionable);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_hoveredActionable);
    objc_storeWeak((id *)&self->_targetActionable, v6);

  }
  else
  {
    regions = self->_regions;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45___UIStatusBar_gestureRecognizerShouldBegin___block_invoke;
    v11[3] = &unk_1E16E2390;
    v11[4] = self;
    v12 = v4;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  v8 = objc_loadWeakRetained((id *)&self->_targetActionable);
  v9 = v8 != 0;

  return v9;
}

- (id)_actionablesForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4 onlyVisible:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v5 = a5;
  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[_UIStatusBarIdentifier displayIdentifierFromStringRepresentation:](_UIStatusBarIdentifier, "displayIdentifierFromStringRepresentation:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }

  }
  if ((*((_BYTE *)&self->_statusBarFlags + 1) & 0x80) != 0)
  {
    -[_UIStatusBarVisualProvider displayItemIdentifiersForPartWithIdentifier:](self->_visualProvider, "displayItemIdentifiersForPartWithIdentifier:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setByAddingObjectsFromSet:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        -[_UIStatusBar displayItemWithIdentifier:](self, "displayItemWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19), (_QWORD)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20 && (!v5 || objc_msgSend(v20, "visible")))
          objc_msgSend(v9, "addObject:", v21);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  if (!objc_msgSend(v9, "count"))
  {
    -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", v8, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unionSet:", v22);

  }
  return v9;
}

- (id)_regionsForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  if (a4)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_statusBarFlags + 2) & 1) != 0)
  {
    -[_UIStatusBarVisualProvider regionIdentifiersForPartWithIdentifier:](self->_visualProvider, "regionIdentifiersForPartWithIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[NSDictionary objectForKeyedSubscript:](self->_regions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v7, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v7;
}

- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_UIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", a4, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setAction:", v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)actionForPartWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setOffset:(UIOffset)a3 forPartWithIdentifier:(id)a4
{
  double vertical;
  double horizontal;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setOffset:", horizontal, vertical);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (UIOffset)offsetForPartWithIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  UIOffset result;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v5 = 0.0;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v9, "offsetable") & 1) != 0)
        {
          objc_msgSend(v9, "offset");
          v5 = v11;
          v10 = v12;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0.0;
LABEL_11:

  v13 = v5;
  v14 = v10;
  result.vertical = v14;
  result.horizontal = v13;
  return result;
}

- (void)setAlpha:(double)a3 forPartWithIdentifier:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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
  -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAlpha:", a3);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (double)alphaForPartWithIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v5 = 1.0;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "contentView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "alpha");
          v5 = v12;

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)setStyle:(int64_t)a3 forPartWithIdentifier:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "style") != a3)
        {
          objc_msgSend(v12, "setStyle:", a3);
          v9 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);

    if ((v9 & 1) != 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __47___UIStatusBar_setStyle_forPartWithIdentifier___block_invoke;
      v13[3] = &unk_1E16B1B28;
      v13[4] = self;
      -[_UIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v13);
    }
  }
  else
  {

  }
}

- (int64_t)styleForPartWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "style");

  return v5;
}

- (void)setEnabledPartIdentifiers:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSDictionary *regions;
  uint64_t v19;
  id v20;
  void *v21;
  NSArray *v22;
  NSArray *obj;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v22 = (NSArray *)a3;
  if (self->_enabledPartIdentifiers != v22)
  {
    objc_storeStrong((id *)&self->_enabledPartIdentifiers, a3);
    -[_UIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v21 = (void *)v5;
      v6 = (void *)MEMORY[0x1E0C99E20];
      -[NSDictionary allKeys](self->_regions, "allKeys");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      obj = v22;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v33 != v10)
              objc_enumerationMutation(obj);
            v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", v12, 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v29;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v29 != v15)
                    objc_enumerationMutation(v13);
                  objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "identifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "removeObject:", v17);

                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
              }
              while (v14);
            }

          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v9);
      }

    }
    else
    {
      v8 = (void *)v5;
    }
    regions = self->_regions;
    v19 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __42___UIStatusBar_setEnabledPartIdentifiers___block_invoke;
    v25[3] = &unk_1E16E22F0;
    v20 = v8;
    v26 = v20;
    v27 = &v36;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v25);
    if (*((_BYTE *)v37 + 24))
    {
      if ((*((_BYTE *)&self->_statusBarFlags + 2) & 2) != 0)
        -[_UIStatusBarVisualProvider statusBarEnabledPartsUpdated](self->_visualProvider, "statusBarEnabledPartsUpdated");
      v24[0] = v19;
      v24[1] = 3221225472;
      v24[2] = __42___UIStatusBar_setEnabledPartIdentifiers___block_invoke_2;
      v24[3] = &unk_1E16B1B28;
      v24[4] = self;
      -[_UIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v24);
    }

    _Block_object_dispose(&v36, 8);
  }

}

- (void)setDisabledPartIdentifiers:(id)a3
{
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  NSArray **p_disabledPartIdentifiers;
  id obj;
  NSArray *v32;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  if (self->_disabledPartIdentifiers != v5)
  {
    obj = a3;
    -[_UIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
    p_disabledPartIdentifiers = &self->_disabledPartIdentifiers;
    v32 = v5;
    -[NSArray arrayByExcludingObjectsInArray:](self->_disabledPartIdentifiers, "arrayByExcludingObjectsInArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v47 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          -[_UIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", v12, 1, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v43;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v43 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "enableWithToken:", 2);
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
            }
            while (v15);
            v9 = 1;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    -[NSArray arrayByExcludingObjectsInArray:](v32, "arrayByExcludingObjectsInArray:", *p_disabledPartIdentifiers);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_disabledPartIdentifiers, obj);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          -[_UIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", v24, 1, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v35;
            do
            {
              for (m = 0; m != v27; ++m)
              {
                if (*(_QWORD *)v35 != v28)
                  objc_enumerationMutation(v25);
                objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * m), "disableWithToken:", 2);
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
            }
            while (v27);
            v9 = 1;
          }

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      }
      while (v21);
    }

    v5 = v32;
    if ((v9 & 1) != 0)
    {
      if ((*((_BYTE *)&self->_statusBarFlags + 2) & 2) != 0)
        -[_UIStatusBarVisualProvider statusBarEnabledPartsUpdated](self->_visualProvider, "statusBarEnabledPartsUpdated");
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __43___UIStatusBar_setDisabledPartIdentifiers___block_invoke;
      v33[3] = &unk_1E16B1B28;
      v33[4] = self;
      -[_UIStatusBar _performWithInheritedAnimation:](self, "_performWithInheritedAnimation:", v33);
    }

  }
}

- (CGRect)frameForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CGFloat *v7;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect result;
  CGRect v78;
  CGRect v79;

  v4 = a4;
  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (CGFloat *)MEMORY[0x1E0C9D628];
  if ((*(_BYTE *)&self->_statusBarFlags & 1) != 0)
  {
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
    *(_DWORD *)&self->_statusBarFlags &= ~1u;
  }
  x = *v7;
  y = v7[1];
  width = v7[2];
  height = v7[3];
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("clockPartIdentifier"))
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    -[_UIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", v6, v4, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v67 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_msgSend(v17, "layoutItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[_UIStatusBarVisualProvider clockBoundsForLayoutItem:](self->_visualProvider, "clockBoundsForLayoutItem:", v17);
          else
            objc_msgSend(v18, "_ui_bounds");
          v23 = v19;
          v24 = v20;
          v25 = v21;
          v26 = v22;
          objc_msgSend(v18, "_ui_view");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v27, v23, v24, v25, v26);
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v35 = v34;

          v73.origin.x = x;
          v73.origin.y = y;
          v73.size.width = width;
          v73.size.height = height;
          v78.origin.x = v29;
          v78.origin.y = v31;
          v78.size.width = v33;
          v78.size.height = v35;
          v74 = CGRectUnion(v73, v78);
          x = v74.origin.x;
          y = v74.origin.y;
          width = v74.size.width;
          height = v74.size.height;

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      }
      while (v14);
    }
  }
  else
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    -[_UIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", v6, v4, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v63 != v38)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "layoutItem");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "_ui_bounds");
          v42 = v41;
          v44 = v43;
          v46 = v45;
          v48 = v47;
          objc_msgSend(v40, "_ui_view");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v49, v42, v44, v46, v48);
          v51 = v50;
          v53 = v52;
          v55 = v54;
          v57 = v56;

          v75.origin.x = x;
          v75.origin.y = y;
          v75.size.width = width;
          v75.size.height = height;
          v79.origin.x = v51;
          v79.origin.y = v53;
          v79.size.width = v55;
          v79.size.height = v57;
          v76 = CGRectUnion(v75, v79);
          x = v76.origin.x;
          y = v76.origin.y;
          width = v76.size.width;
          height = v76.size.height;

        }
        v37 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v37);
    }
  }

  v58 = x;
  v59 = y;
  v60 = width;
  v61 = height;
  result.size.height = v61;
  result.size.width = v60;
  result.origin.y = v59;
  result.origin.x = v58;
  return result;
}

- (CGRect)frameForPartWithIdentifier:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UIStatusBar frameForPartWithIdentifier:includeInternalItems:](self, "frameForPartWithIdentifier:includeInternalItems:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (NSString)sensorActivityIndicatorPartIdentifier
{
  return (NSString *)CFSTR("trailingPartIdentifier");
}

+ (CGSize)intrinsicContentSizeForTargetScreen:(id)a3 orientation:(int64_t)a4 onLockScreen:(BOOL)a5
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(a1, "intrinsicContentSizeForTargetScreen:orientation:onLockScreen:isAzulBLinked:", a3, a4, a5, 1);
  result.height = v6;
  result.width = v5;
  return result;
}

- (NSSet)dependentDataEntryKeys
{
  void *v3;
  NSMutableDictionary *displayItemStates;
  id v5;
  void *v6;
  NSSet *v7;
  _QWORD v9[5];
  id v10;

  -[_UIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  displayItemStates = self->_displayItemStates;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38___UIStatusBar_dependentDataEntryKeys__block_invoke;
  v9[3] = &unk_1E16E23B8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](displayItemStates, "enumerateKeysAndObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = (NSSet *)v5;

  return v7;
}

- (UIView)containerView
{
  return self->_foregroundView;
}

- (unsigned)animationContextId
{
  void *v2;
  unsigned int v3;

  -[UIView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_contextId");

  return v3;
}

- (BOOL)areAnimationsEnabled
{
  void *v3;
  void *v4;
  char v5;

  if (!+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    return 0;
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_hasContext");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[_UIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  if (v3)
    v5 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v3);
  else
    v5 = 0;
  objc_msgSend(v4, "intrinsicContentSizeForOrientation:", v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)_itemWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_items, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    +[_UIStatusBarItem createItemForIdentifier:statusBar:](_UIStatusBarItem, "createItemForIdentifier:statusBar:", v6, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*((_BYTE *)&self->_statusBarFlags + 2) & 4) != 0)
      -[_UIStatusBarVisualProvider itemCreated:](self->_visualProvider, "itemCreated:", v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_items, "setObject:forKeyedSubscript:", v7, v6);
  }

  return v7;
}

- (id)itemWithIdentifier:(id)a3
{
  return -[_UIStatusBar _itemWithIdentifier:createIfNeeded:](self, "_itemWithIdentifier:createIfNeeded:", a3, 1);
}

- (id)displayItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBar _itemWithIdentifier:createIfNeeded:](self, "_itemWithIdentifier:createIfNeeded:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "displayItemForIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)regionWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UIStatusBar _prepareVisualProviderIfNeeded](self, "_prepareVisualProviderIfNeeded");
  -[NSDictionary objectForKeyedSubscript:](self->_regions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stateForDisplayItemWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_displayItemStates, "objectForKeyedSubscript:", a3);
}

- (id)itemsDependingOnKeys:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *items;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37___UIStatusBar_itemsDependingOnKeys___block_invoke;
  v12[3] = &unk_1E16E23E0;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](items, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (CGRect)frameForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSMutableDictionary *items;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v4 = a3;
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  items = self->_items;
  +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](items, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "displayItemForIdentifier:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "alpha");
      if (v15 > 0.0)
      {
        objc_msgSend(v14, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v14, "bounds");
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v14);
          v5 = v17;
          v6 = v18;
          v7 = v19;
          v8 = v20;
        }
      }

    }
  }

  v21 = v5;
  v22 = v6;
  v23 = v7;
  v24 = v8;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)displayItemIdentifiersInRegionsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        -[_UIStatusBarVisualProvider orderedDisplayItemPlacementsInRegionWithIdentifier:](self->_visualProvider, "orderedDisplayItemPlacementsInRegionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)itemIdentifiersInRegionsWithIdentifiers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBar displayItemIdentifiersInRegionsWithIdentifiers:](self, "displayItemIdentifiersInRegionsWithIdentifiers:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56___UIStatusBar_itemIdentifiersInRegionsWithIdentifiers___block_invoke;
  v10[3] = &unk_1E16E2408;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  return v8;
}

- (id)dataEntryKeysForItemsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[_UIStatusBar itemWithIdentifier:](self, "itemWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dependentEntryKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  void *v4;
  BOOL v5;

  -[UIView traitCollection](self, "traitCollection", a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") != 3;

  return v5;
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  y = a4.y;
  x = a4.x;
  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[_UIStatusBar regions](self, "regions", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEnabled"))
        {
          objc_msgSend(v12, "displayItemForHUDAtLocation:", x, y);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "view");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_opt_respondsToSelector();

            if ((v16 & 1) != 0)
              goto LABEL_13;
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  v14 = 0;
LABEL_13:

  objc_msgSend(v14, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accessibilityHUDRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldTerminateHUDGestureForOtherGestureRecognizer:(id)a4
{
  return self->_actionGestureRecognizer != a4;
}

- (void)_accessibilityHUDGestureManager:(id)a3 showHUDItem:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  -[_UIStatusBar _statusBarWindowForAccessibilityHUD](self, "_statusBarWindowForAccessibilityHUD");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_showAccessibilityHUDItem:forView:", v5, self);

}

- (void)_dismissAccessibilityHUDForGestureManager:(id)a3
{
  id v3;

  -[_UIStatusBar _statusBarWindowForAccessibilityHUD](self, "_statusBarWindowForAccessibilityHUD", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dismissAccessibilityHUD");

}

- (UIScreen)targetScreen
{
  return self->_targetScreen;
}

- (void)setTargetScreen:(id)a3
{
  objc_storeStrong((id *)&self->_targetScreen, a3);
}

- (NSDictionary)visualProviderInfo
{
  return self->_visualProviderInfo;
}

- (void)setVisualProviderInfo:(id)a3
{
  objc_storeStrong((id *)&self->_visualProviderInfo, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (_UIStatusBarData)currentData
{
  return self->_currentData;
}

- (UIGestureRecognizer)actionGestureRecognizer
{
  return self->_actionGestureRecognizer;
}

- (NSArray)enabledPartIdentifiers
{
  return self->_enabledPartIdentifiers;
}

- (NSArray)disabledPartIdentifiers
{
  return self->_disabledPartIdentifiers;
}

- (CGRect)avoidanceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_avoidanceFrame.origin.x;
  y = self->_avoidanceFrame.origin.y;
  width = self->_avoidanceFrame.size.width;
  height = self->_avoidanceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSMutableDictionary)displayItemStates
{
  return self->_displayItemStates;
}

- (void)setDisplayItemStates:(id)a3
{
  objc_storeStrong((id *)&self->_displayItemStates, a3);
}

- (id)updateCompletionHandler
{
  return self->_updateCompletionHandler;
}

- (void)setUpdateCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (void)setForegroundView:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundView, a3);
}

- (_UIStatusBarActionable)targetActionable
{
  return (_UIStatusBarActionable *)objc_loadWeakRetained((id *)&self->_targetActionable);
}

- (void)setTargetActionable:(id)a3
{
  objc_storeWeak((id *)&self->_targetActionable, a3);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (_UIStatusBarActionable)hoveredActionable
{
  return (_UIStatusBarActionable *)objc_loadWeakRetained((id *)&self->_hoveredActionable);
}

- (void)setHoveredActionable:(id)a3
{
  objc_storeWeak((id *)&self->_hoveredActionable, a3);
}

- (UIAccessibilityHUDGestureManager)accessibilityHUDGestureManager
{
  return self->_accessibilityHUDGestureManager;
}

- (void)setAccessibilityHUDGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityHUDGestureManager, a3);
}

- (Class)_visualProviderClass
{
  return self->_visualProviderClass;
}

- (void)_setVisualProviderClass:(Class)a3
{
  objc_storeStrong((id *)&self->_visualProviderClass, a3);
}

- (NSDictionary)regions
{
  return self->_regions;
}

- (_UIStatusBarDataAggregator)dataAggregator
{
  return self->_dataAggregator;
}

- (_UIStatusBarData)currentAggregatedData
{
  return self->_currentAggregatedData;
}

- (_UIStatusBarStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (_UIStatusBarAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (id)regionActionValidationBlock
{
  return self->_regionActionValidationBlock;
}

- (void)setRegionActionValidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_regionActionValidationBlock, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_currentAggregatedData, 0);
  objc_storeStrong((id *)&self->_dataAggregator, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_visualProviderClass, 0);
  objc_storeStrong((id *)&self->_accessibilityHUDGestureManager, 0);
  objc_destroyWeak((id *)&self->_hoveredActionable);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_destroyWeak((id *)&self->_targetActionable);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong(&self->_updateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_displayItemStates, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_disabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_enabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_visualProviderInfo, 0);
  objc_storeStrong((id *)&self->_targetScreen, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
}

@end
