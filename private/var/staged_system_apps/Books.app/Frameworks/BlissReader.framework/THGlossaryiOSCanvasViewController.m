@implementation THGlossaryiOSCanvasViewController

- (BOOL)shouldPreventGestureFromEditingController:(id)a3
{
  return 1;
}

- (void)setUpGestureRecognizers
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];

  v13.receiver = self;
  v13.super_class = (Class)THGlossaryiOSCanvasViewController;
  -[THGlossaryiOSCanvasViewController setUpGestureRecognizers](&v13, "setUpGestureRecognizers");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(-[THGlossaryiOSCanvasViewController view](self, "view", 0), "gestureRecognizers");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7);
        if (v8 != -[THGlossaryiOSCanvasViewController hyperlinkGestureRecognizer](self, "hyperlinkGestureRecognizer"))
          objc_msgSend(v8, "requireGestureRecognizerToFail:", -[THGlossaryiOSCanvasViewController hyperlinkGestureRecognizer](self, "hyperlinkGestureRecognizer"));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }
}

- (THGlossaryiOSCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  THGlossaryiOSCanvasViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THGlossaryiOSCanvasViewController;
  v4 = -[THGlossaryiOSCanvasViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", a3, a4);
  if (v4)
    -[THGlossaryiOSCanvasViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  return v4;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[THGlossaryiOSCanvasViewController _applyCorrectAppearance](self, "_applyCorrectAppearance", a3, a4);
}

- (void)_applyCorrectAppearance
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  UIColor *v7;
  id v8;

  v3 = objc_opt_class(TSDCanvasView);
  *(_QWORD *)&v5 = TSUDynamicCast(v3, -[THGlossaryiOSCanvasViewController view](self, "view")).n128_u64[0];
  if (v4)
  {
    v6 = v4;
    v7 = (UIColor *)-[IMTheme backgroundColorForTraitEnvironment:](-[THGlossaryiOSCanvasViewController theme](self, "theme", v5), "backgroundColorForTraitEnvironment:", self);
    if (!v7)
      v7 = +[UIColor whiteColor](UIColor, "whiteColor");
    objc_msgSend(v6, "setBackgroundColor:", v7);
    objc_msgSend(objc_msgSend(v6, "enclosingScrollView"), "setBackgroundColor:", v7);
    v8 = objc_msgSend(v6, "rootCanvasView");
    objc_msgSend(v8, "setBackgroundColor:", v7);
    objc_msgSend(objc_msgSend(v8, "enclosingScrollView"), "setBackgroundColor:", v7);
  }
}

- (id)hitRep:(CGPoint)a3 allowsAllReps:(BOOL)a4
{
  id v5;
  uint64_t v6;

  v5 = objc_msgSend(-[THGlossaryiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", a3.x, a3.y);
  if (!a4)
  {
    v6 = objc_opt_class(TSWPRep);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
      return 0;
  }
  return v5;
}

- (id)hitRep:(CGPoint)a3
{
  return -[THGlossaryiOSCanvasViewController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 0, a3.x, a3.y);
}

- (void)setTheme:(id)a3
{
  id v5;

  if ((-[IMTheme isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {
    v5 = a3;

    self->_theme = (IMTheme *)a3;
    -[THGlossaryiOSCanvasViewController _applyCorrectAppearance](self, "_applyCorrectAppearance");
  }
}

- (void)dealloc
{
  objc_super v3;

  self->_theme = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryiOSCanvasViewController;
  -[THGlossaryiOSCanvasViewController dealloc](&v3, "dealloc");
}

- (IMTheme)theme
{
  return self->_theme;
}

@end
