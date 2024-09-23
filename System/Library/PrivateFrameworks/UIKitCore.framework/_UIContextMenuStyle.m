@implementation _UIContextMenuStyle

+ (id)defaultStyle
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _OWORD v11[2];
  uint64_t v12;

  v2 = (_QWORD *)objc_opt_new();
  objc_msgSend(v2, "setPreferredLayout:", 100);
  v12 = 0;
  v11[0] = _UIContextMenuNullAnchor;
  v11[1] = unk_186677FF0;
  objc_msgSend(v2, "set_preferredAnchor:", v11);
  objc_msgSend(v2, "set_preferredMenuAttachmentPoint:", 1.79769313e308, 1.79769313e308);
  v2[11] = 0x7FFFFFFFFFFFFFFFLL;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;

    objc_msgSend(v2, "setPreferredBackgroundInsets:", -v9, -v7, -v9, -v7);
  }
  return v2;
}

- (void)setPrefersCenteredPreviewWhenActionsAreAbsent:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  _OWORD v6[2];
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v3 = a3;
  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  -[_UIContextMenuStyle _preferredAnchor](self, "_preferredAnchor");
  v5 = 1;
  if (v3)
    v5 = 2;
  v10 = v5;
  v7 = v5;
  v6[0] = v8;
  v6[1] = v9;
  -[_UIContextMenuStyle set_preferredAnchor:](self, "set_preferredAnchor:", v6);
}

- (BOOL)prefersCenteredPreviewWhenActionsAreAbsent
{
  uint64_t v3;

  -[_UIContextMenuStyle _preferredAnchor](self, "_preferredAnchor");
  return v3 != 1;
}

- (void)setPrefersStackedHierarchy:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;

  v3 = a3;
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContextMenuStyle.m"), 68, CFSTR("This may only be used by SpringBoard."));

  }
  if (self->_prefersStackedHierarchy != v3)
    self->_prefersStackedHierarchy = v3;
}

- (void)setPreferredAttachmentEdge:(unint64_t)a3
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50___UIContextMenuStyle_setPreferredAttachmentEdge___block_invoke;
  v5[3] = &unk_1E16B1888;
  v5[4] = self;
  v5[5] = a2;
  if (setPreferredAttachmentEdge__onceToken != -1)
    dispatch_once(&setPreferredAttachmentEdge__onceToken, v5);
  if (self->_preferredAttachmentEdge != a3)
    self->_preferredAttachmentEdge = a3;
}

- (void)setAllowsBackgroundInteractionAcrossProccesses:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (!+[UIKeyboard isInputUIProcess](UIKeyboard, "isInputUIProcess"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContextMenuStyle.m"), 95, CFSTR("This may only be used by InputUI"));

  }
  if ((((-[_UIContextMenuStyle _backgroundInteractionStyle](self, "_backgroundInteractionStyle") != 2) ^ v3) & 1) == 0)
  {
    if (v3)
      v6 = 2;
    else
      v6 = 0;
    -[_UIContextMenuStyle set_backgroundInteractionStyle:](self, "set_backgroundInteractionStyle:", v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v12[2];
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[_UIContextMenuStyle containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setContainerView:", v5);

  objc_msgSend((id)v4, "setPreferredLayout:", -[_UIContextMenuStyle preferredLayout](self, "preferredLayout"));
  objc_msgSend((id)v4, "setHasInteractivePreview:", -[_UIContextMenuStyle hasInteractivePreview](self, "hasInteractivePreview"));
  objc_msgSend((id)v4, "setPreventPreviewRasterization:", -[_UIContextMenuStyle preventPreviewRasterization](self, "preventPreviewRasterization"));
  objc_msgSend((id)v4, "setPreviewOverlapsMenu:", -[_UIContextMenuStyle previewOverlapsMenu](self, "previewOverlapsMenu"));
  objc_msgSend((id)v4, "setIgnoresContainerSizeChange:", -[_UIContextMenuStyle ignoresContainerSizeChange](self, "ignoresContainerSizeChange"));
  -[_UIContextMenuStyle preferredEdgeInsets](self, "preferredEdgeInsets");
  objc_msgSend((id)v4, "setPreferredEdgeInsets:");
  -[_UIContextMenuStyle preferredBackgroundEffects](self, "preferredBackgroundEffects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend((id)v4, "setPreferredBackgroundEffects:", v7);

  -[_UIContextMenuStyle preferredBackgroundColor](self, "preferredBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend((id)v4, "setPreferredBackgroundColor:", v9);

  -[_UIContextMenuStyle preferredBackgroundInsets](self, "preferredBackgroundInsets");
  objc_msgSend((id)v4, "setPreferredBackgroundInsets:");
  objc_msgSend((id)v4, "setKeepsInputViewsVisible:", -[_UIContextMenuStyle keepsInputViewsVisible](self, "keepsInputViewsVisible"));
  objc_msgSend((id)v4, "setIgnoresDefaultSizingRules:", -[_UIContextMenuStyle ignoresDefaultSizingRules](self, "ignoresDefaultSizingRules"));
  -[_UIContextMenuStyle _preferredAnchor](self, "_preferredAnchor");
  v12[0] = v14;
  v12[1] = v15;
  v13 = v16;
  objc_msgSend((id)v4, "set_preferredAnchor:", v12);
  -[_UIContextMenuStyle _preferredMenuAttachmentPoint](self, "_preferredMenuAttachmentPoint");
  objc_msgSend((id)v4, "set_preferredMenuAttachmentPoint:");
  objc_msgSend((id)v4, "set_allowsImmediateSelection:", -[_UIContextMenuStyle _allowsImmediateSelection](self, "_allowsImmediateSelection"));
  objc_msgSend((id)v4, "set_shouldAvoidInputViews:", -[_UIContextMenuStyle _shouldAvoidInputViews](self, "_shouldAvoidInputViews"));
  objc_msgSend((id)v4, "set_orderMenuBasedOnPriority:", -[_UIContextMenuStyle _orderMenuBasedOnPriority](self, "_orderMenuBasedOnPriority"));
  objc_msgSend((id)v4, "set_backgroundInteractionStyle:", -[_UIContextMenuStyle _backgroundInteractionStyle](self, "_backgroundInteractionStyle"));
  -[_UIContextMenuStyle _parentTraitEnvironmentForUserInterfaceStyle](self, "_parentTraitEnvironmentForUserInterfaceStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "set_parentTraitEnvironmentForUserInterfaceStyle:", v10);

  -[_UIContextMenuStyle _preferredMenuWidth](self, "_preferredMenuWidth");
  objc_msgSend((id)v4, "set_preferredMenuWidth:");
  *(_BYTE *)(v4 + 17) = -[_UIContextMenuStyle prefersStackedHierarchy](self, "prefersStackedHierarchy");
  *(_QWORD *)(v4 + 88) = -[_UIContextMenuStyle preferredAttachmentEdge](self, "preferredAttachmentEdge");
  return (id)v4;
}

- (BOOL)_layoutAllowsPreview
{
  return -[_UIContextMenuStyle preferredLayout](self, "preferredLayout") < 2;
}

- (BOOL)_layoutAllowsMenu
{
  unint64_t v2;

  v2 = -[_UIContextMenuStyle preferredLayout](self, "preferredLayout");
  return v2 < 2 || v2 == 3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (unint64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (void)setPreferredLayout:(unint64_t)a3
{
  self->_preferredLayout = a3;
}

- (UIEdgeInsets)preferredEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_preferredEdgeInsets.top;
  left = self->_preferredEdgeInsets.left;
  bottom = self->_preferredEdgeInsets.bottom;
  right = self->_preferredEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPreferredEdgeInsets:(UIEdgeInsets)a3
{
  self->_preferredEdgeInsets = a3;
}

- (BOOL)hasInteractivePreview
{
  return self->_hasInteractivePreview;
}

- (void)setHasInteractivePreview:(BOOL)a3
{
  self->_hasInteractivePreview = a3;
}

- (BOOL)preventPreviewRasterization
{
  return self->_preventPreviewRasterization;
}

- (void)setPreventPreviewRasterization:(BOOL)a3
{
  self->_preventPreviewRasterization = a3;
}

- (BOOL)previewOverlapsMenu
{
  return self->_previewOverlapsMenu;
}

- (void)setPreviewOverlapsMenu:(BOOL)a3
{
  self->_previewOverlapsMenu = a3;
}

- (BOOL)ignoresContainerSizeChange
{
  return self->_ignoresContainerSizeChange;
}

- (void)setIgnoresContainerSizeChange:(BOOL)a3
{
  self->_ignoresContainerSizeChange = a3;
}

- (BOOL)keepsInputViewsVisible
{
  return self->_keepsInputViewsVisible;
}

- (void)setKeepsInputViewsVisible:(BOOL)a3
{
  self->_keepsInputViewsVisible = a3;
}

- (BOOL)ignoresDefaultSizingRules
{
  return self->_ignoresDefaultSizingRules;
}

- (void)setIgnoresDefaultSizingRules:(BOOL)a3
{
  self->_ignoresDefaultSizingRules = a3;
}

- (UITraitCollection)preferredTraitCollection
{
  return self->_preferredTraitCollection;
}

- (void)setPreferredTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_preferredTraitCollection, a3);
}

- (NSArray)preferredBackgroundEffects
{
  return self->_preferredBackgroundEffects;
}

- (void)setPreferredBackgroundEffects:(id)a3
{
  objc_storeStrong((id *)&self->_preferredBackgroundEffects, a3);
}

- (UIColor)preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (void)setPreferredBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_preferredBackgroundColor, a3);
}

- (UIEdgeInsets)preferredBackgroundInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_preferredBackgroundInsets.top;
  left = self->_preferredBackgroundInsets.left;
  bottom = self->_preferredBackgroundInsets.bottom;
  right = self->_preferredBackgroundInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPreferredBackgroundInsets:(UIEdgeInsets)a3
{
  self->_preferredBackgroundInsets = a3;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)_preferredAnchor
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var2;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[5].var1;
  return self;
}

- (void)set_preferredAnchor:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  self->gravity = a3->var4;
  *(_OWORD *)&self->attachment = v3;
  *(_OWORD *)&self->attachmentOffset = v4;
}

- (CGPoint)_preferredMenuAttachmentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->__preferredMenuAttachmentPoint.x;
  y = self->__preferredMenuAttachmentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)set_preferredMenuAttachmentPoint:(CGPoint)a3
{
  self->__preferredMenuAttachmentPoint = a3;
}

- (BOOL)_allowsImmediateSelection
{
  return self->__allowsImmediateSelection;
}

- (void)set_allowsImmediateSelection:(BOOL)a3
{
  self->__allowsImmediateSelection = a3;
}

- (BOOL)_shouldAvoidInputViews
{
  return self->__shouldAvoidInputViews;
}

- (void)set_shouldAvoidInputViews:(BOOL)a3
{
  self->__shouldAvoidInputViews = a3;
}

- (BOOL)_orderMenuBasedOnPriority
{
  return self->__orderMenuBasedOnPriority;
}

- (void)set_orderMenuBasedOnPriority:(BOOL)a3
{
  self->__orderMenuBasedOnPriority = a3;
}

- (int64_t)_backgroundInteractionStyle
{
  return self->__backgroundInteractionStyle;
}

- (void)set_backgroundInteractionStyle:(int64_t)a3
{
  self->__backgroundInteractionStyle = a3;
}

- (_UITraitEnvironmentInternal)_parentTraitEnvironmentForUserInterfaceStyle
{
  return (_UITraitEnvironmentInternal *)objc_loadWeakRetained((id *)&self->__parentTraitEnvironmentForUserInterfaceStyle);
}

- (void)set_parentTraitEnvironmentForUserInterfaceStyle:(id)a3
{
  objc_storeWeak((id *)&self->__parentTraitEnvironmentForUserInterfaceStyle, a3);
}

- (double)_preferredMenuWidth
{
  return self->__preferredMenuWidth;
}

- (void)set_preferredMenuWidth:(double)a3
{
  self->__preferredMenuWidth = a3;
}

- (BOOL)prefersStackedHierarchy
{
  return self->_prefersStackedHierarchy;
}

- (unint64_t)preferredAttachmentEdge
{
  return self->_preferredAttachmentEdge;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__parentTraitEnvironmentForUserInterfaceStyle);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundEffects, 0);
  objc_storeStrong((id *)&self->_preferredTraitCollection, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
