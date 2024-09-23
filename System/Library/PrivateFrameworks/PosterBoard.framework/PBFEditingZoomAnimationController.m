@implementation PBFEditingZoomAnimationController

- (PBFEditingZoomAnimationController)initWithPreviewFrame:(CGRect)a3 previewCornerRadius:(double)a4 previewView:(id)a5 complicationsView:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  PBFEditingZoomAnimationController *v16;
  PBFEditingZoomAnimationController *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PBFEditingZoomAnimationController;
  v16 = -[PBFEditingZoomAnimationController init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_previewFrame.origin.x = x;
    v16->_previewFrame.origin.y = y;
    v16->_previewFrame.size.width = width;
    v16->_previewFrame.size.height = height;
    v16->_previewCornerRadius = a4;
    objc_storeStrong((id *)&v16->_previewView, a5);
    objc_storeStrong((id *)&v17->_complicationsView, a6);
  }

  return v17;
}

- (id)buildZoomingViewWithPreviewView:(id)a3 previewFrame:(CGRect)a4 editingView:(id)a5 complicationsView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  id v14;
  id v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a5;
  v13 = a6;
  v14 = a3;
  objc_msgSend(v14, "setFrame:", x, y, width, height);
  v15 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v15, "setClipsToBounds:", 1);
  objc_msgSend(v15, "addSubview:", v14);

  if (v13)
    objc_msgSend(v15, "addSubview:", v13);
  objc_msgSend(v15, "addSubview:", v12);
  objc_msgSend(v15, "setAccessibilityIgnoresInvertColors:", 1);

  return v15;
}

- (id)buildDimmingView
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setAutoresizingMask:", 18);
  return v3;
}

- (CGRect)previewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previewFrame.origin.x;
  y = self->_previewFrame.origin.y;
  width = self->_previewFrame.size.width;
  height = self->_previewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)previewCornerRadius
{
  return self->_previewCornerRadius;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (UIView)complicationsView
{
  return self->_complicationsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationsView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
}

@end
