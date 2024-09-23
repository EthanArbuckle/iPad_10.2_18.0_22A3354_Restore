@implementation _UIFocusRegionMapSnapshotRequest

+ (id)requestWithRootView:(id)a3 focusSystem:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRootView:focusSystem:", v7, v6);

  return v8;
}

- (_UIFocusRegionMapSnapshotRequest)initWithRootView:(id)a3 focusSystem:(id)a4
{
  id v6;
  id v7;
  _UIFocusRegionMapSnapshotRequest *v8;
  _UIFocusRegionMapSnapshotRequest *v9;
  CGPoint v10;
  CGSize v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIFocusRegionMapSnapshotRequest;
  v8 = -[_UIFocusRegionMapSnapshotRequest init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_rootView, v6);
    objc_storeStrong((id *)&v9->_focusSystem, a4);
    v10 = (CGPoint)*MEMORY[0x1E0C9D648];
    v11 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v9->_snapshotRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v9->_snapshotRect.size = v11;
    v9->_viewSearchRect.origin = v10;
    v9->_viewSearchRect.size = v11;
    v9->_focusedRect.origin = v10;
    v9->_focusedRect.size = v11;
    v9->_focusHeading = 0;
    *(_WORD *)&v9->_includeFocusGuides = 257;
    v9->_clipToSnapshotRect = 1;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIFocusRegionMapSnapshotRequest *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  CGSize size;
  CGSize v9;
  CGSize v10;
  id v11;
  CGSize v12;

  v4 = +[_UIFocusRegionMapSnapshotRequest allocWithZone:](_UIFocusRegionMapSnapshotRequest, "allocWithZone:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_rootView);
  v6 = -[_UIFocusRegionMapSnapshotRequest initWithRootView:focusSystem:](v4, "initWithRootView:focusSystem:", WeakRetained, self->_focusSystem);

  v7 = objc_loadWeakRetained((id *)&self->_rootView);
  objc_storeWeak((id *)(v6 + 16), v7);

  size = self->_snapshotRect.size;
  *(CGPoint *)(v6 + 48) = self->_snapshotRect.origin;
  *(CGSize *)(v6 + 64) = size;
  v9 = self->_viewSearchRect.size;
  *(CGPoint *)(v6 + 80) = self->_viewSearchRect.origin;
  *(CGSize *)(v6 + 96) = v9;
  v10 = self->_focusedRect.size;
  *(CGPoint *)(v6 + 112) = self->_focusedRect.origin;
  *(CGSize *)(v6 + 128) = v10;
  *(_QWORD *)(v6 + 32) = self->_focusHeading;
  *(_BYTE *)(v6 + 8) = self->_includeFocusGuides;
  *(_BYTE *)(v6 + 9) = self->_includeFocusContainerGuides;
  *(_BYTE *)(v6 + 10) = self->_clipToSnapshotRect;
  v11 = objc_loadWeakRetained((id *)&self->_focusableRegionAncestorView);
  objc_storeWeak((id *)(v6 + 40), v11);

  v12 = self->_visualRepresentationMinimumArea.size;
  *(CGPoint *)(v6 + 144) = self->_visualRepresentationMinimumArea.origin;
  *(CGSize *)(v6 + 160) = v12;
  return (id)v6;
}

- (id)takeSnapshot
{
  id v3;
  void *v4;
  _BOOL8 IsEmpty;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  CGRect v11;

  v3 = -[_UIFocusRegionMapSnapshot _initWithRequest:]([_UIFocusRegionMapSnapshot alloc], "_initWithRequest:", self);
  -[_UIFocusRegionMapSnapshotRequest focusSystem](self, "focusSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapSnapshotRequest viewSearchRect](self, "viewSearchRect");
  IsEmpty = CGRectIsEmpty(v11);
  -[_UIFocusRegionMapSnapshotRequest rootView](self, "rootView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    while (objc_msgSend(v7, "_legacy_isEligibleForFocusInteraction")
         && (_UIFocusItemCanBecomeFocused(v7, v4) & 1) == 0)
    {
      objc_msgSend(v7, "superview");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
      if (!v8)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    -[_UIFocusRegionMapSnapshotRequest rootView](self, "rootView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _AXSFullKeyboardAccessEnabled() == 0;
    _UISnapshotVisitFocusRegion(v3, self, v7, 0, v9, IsEmpty);
  }

  objc_msgSend(v3, "_commit");
  return v3;
}

- (UIView)rootView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_rootView);
}

- (void)setRootView:(id)a3
{
  objc_storeWeak((id *)&self->_rootView, a3);
}

- (UIFocusSystem)focusSystem
{
  return self->_focusSystem;
}

- (void)setFocusSystem:(id)a3
{
  objc_storeStrong((id *)&self->_focusSystem, a3);
}

- (CGRect)snapshotRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_snapshotRect.origin.x;
  y = self->_snapshotRect.origin.y;
  width = self->_snapshotRect.size.width;
  height = self->_snapshotRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSnapshotRect:(CGRect)a3
{
  self->_snapshotRect = a3;
}

- (CGRect)viewSearchRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewSearchRect.origin.x;
  y = self->_viewSearchRect.origin.y;
  width = self->_viewSearchRect.size.width;
  height = self->_viewSearchRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setViewSearchRect:(CGRect)a3
{
  self->_viewSearchRect = a3;
}

- (CGRect)focusedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_focusedRect.origin.x;
  y = self->_focusedRect.origin.y;
  width = self->_focusedRect.size.width;
  height = self->_focusedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFocusedRect:(CGRect)a3
{
  self->_focusedRect = a3;
}

- (unint64_t)focusHeading
{
  return self->_focusHeading;
}

- (void)setFocusHeading:(unint64_t)a3
{
  self->_focusHeading = a3;
}

- (BOOL)includeFocusGuides
{
  return self->_includeFocusGuides;
}

- (void)setIncludeFocusGuides:(BOOL)a3
{
  self->_includeFocusGuides = a3;
}

- (BOOL)includeFocusContainerGuides
{
  return self->_includeFocusContainerGuides;
}

- (void)setIncludeFocusContainerGuides:(BOOL)a3
{
  self->_includeFocusContainerGuides = a3;
}

- (BOOL)clipToSnapshotRect
{
  return self->_clipToSnapshotRect;
}

- (void)setClipToSnapshotRect:(BOOL)a3
{
  self->_clipToSnapshotRect = a3;
}

- (UIView)focusableRegionAncestorView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_focusableRegionAncestorView);
}

- (void)setFocusableRegionAncestorView:(id)a3
{
  objc_storeWeak((id *)&self->_focusableRegionAncestorView, a3);
}

- (CGRect)visualRepresentationMinimumArea
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visualRepresentationMinimumArea.origin.x;
  y = self->_visualRepresentationMinimumArea.origin.y;
  width = self->_visualRepresentationMinimumArea.size.width;
  height = self->_visualRepresentationMinimumArea.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisualRepresentationMinimumArea:(CGRect)a3
{
  self->_visualRepresentationMinimumArea = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusableRegionAncestorView);
  objc_storeStrong((id *)&self->_focusSystem, 0);
  objc_destroyWeak((id *)&self->_rootView);
}

@end
