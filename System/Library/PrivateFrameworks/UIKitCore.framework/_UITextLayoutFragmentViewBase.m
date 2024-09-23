@implementation _UITextLayoutFragmentViewBase

- (_UITextLayoutFragmentViewBase)initWithLayoutFragment:(id)a3 containerOrigin:(CGPoint)a4 containerSize:(CGSize)a5 clipRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v16;
  _UITextLayoutFragmentViewBase *v17;
  _UITextLayoutFragmentViewBase *v18;
  int v19;
  int v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_super v27;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5.height;
  v11 = a5.width;
  v12 = a4.y;
  v13 = a4.x;
  v16 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_UITextLayoutFragmentViewBase;
  v17 = -[UIView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v18 = v17;
  if (v17)
  {
    -[UIView setOpaque:](v17, "setOpaque:", 0);
    -[UIView setContentMode:](v18, "setContentMode:", 3);
    objc_storeStrong((id *)&v18->_layoutFragment, a3);
    v18->_containerOrigin.x = v13;
    v18->_containerOrigin.y = v12;
    v18->_containerSize.width = v11;
    v18->_containerSize.height = v10;
    v18->_clipRect.origin.x = x;
    v18->_clipRect.origin.y = y;
    v18->_clipRect.size.width = width;
    v18->_clipRect.size.height = height;
    -[_UITextLayoutFragmentViewBase _updateGeometry](v18, "_updateGeometry");
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v19 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v21 = _UIInternalPreference_TextLayoutFragmentShowFrames;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_TextLayoutFragmentShowFrames)
      {
        while (v19 >= v21)
        {
          _UIInternalPreferenceSync(v19, &_UIInternalPreference_TextLayoutFragmentShowFrames, (uint64_t)CFSTR("TextLayoutFragmentShowFrames"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v21 = _UIInternalPreference_TextLayoutFragmentShowFrames;
          if (v19 == _UIInternalPreference_TextLayoutFragmentShowFrames)
            goto LABEL_5;
        }
        if (byte_1ECD75E74)
        {
          +[UIColor systemTealColor](UIColor, "systemTealColor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "colorWithAlphaComponent:", 0.5);
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v24 = objc_msgSend(v23, "CGColor");
          -[UIView layer](v18, "layer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setBorderColor:", v24);

          -[UIView layer](v18, "layer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setBorderWidth:", 1.0);

        }
      }
    }
  }
LABEL_5:

  return v18;
}

- (CGRect)_activeLayoutFragmentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[NSTextLayoutFragment layoutFragmentFrame](self->_layoutFragment, "layoutFragmentFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)_activeContainerOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_containerOrigin.x;
  y = self->_containerOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)_activeClipRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clipRect.origin.x;
  y = self->_clipRect.origin.y;
  width = self->_clipRect.size.width;
  height = self->_clipRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_updateGeometry
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
  _BOOL4 v15;
  double x;
  double y;
  double width;
  double height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double MinX;
  double v41;
  double v42;
  _QWORD v43[13];
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  -[_UITextLayoutFragmentViewBase _activeLayoutFragmentFrame](self, "_activeLayoutFragmentFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v12 = UIRectIntegralWithScale(v4, v6, v8, v10, v11);
  v14 = v13;
  v15 = +[_UITextKit2LayoutController coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled](_UITextKit2LayoutController, "coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled");
  -[NSTextLayoutFragment renderingSurfaceBounds](self->_layoutFragment, "renderingSurfaceBounds");
  v45 = CGRectIntegral(v44);
  x = v45.origin.x;
  y = v45.origin.y;
  width = v45.size.width;
  height = v45.size.height;
  -[_UITextLayoutFragmentViewBase _activeContainerOrigin](self, "_activeContainerOrigin");
  v22 = -0.0;
  if (v15)
    v23 = v12;
  else
    v23 = -0.0;
  v24 = v23 + x;
  if (!v15)
    v22 = v12;
  v41 = y;
  v42 = v24;
  v25 = v24 + v22 + v20;
  v26 = y + v14 + v21;
  -[_UITextLayoutFragmentViewBase _activeClipRect](self, "_activeClipRect");
  v50.origin.x = v27;
  v50.origin.y = v28;
  v50.size.width = v29;
  v50.size.height = v30;
  v46.origin.x = v25;
  v46.origin.y = v26;
  v46.size.width = width;
  v46.size.height = height;
  v47 = CGRectIntersection(v46, v50);
  v31 = v47.origin.x;
  v32 = v47.origin.y;
  v33 = v47.size.width;
  v34 = v47.size.height;
  if (!CGRectIsNull(v47))
  {
    v48.origin.x = v31;
    v48.origin.y = v32;
    v48.size.width = v33;
    v48.size.height = v34;
    MinX = CGRectGetMinX(v48);
    v49.origin.x = v25;
    v49.origin.y = v26;
    v49.size.width = width;
    v49.size.height = height;
    v42 = v42 + MinX - CGRectGetMinX(v49);
    v25 = v31;
    v26 = v32;
    width = v33;
    height = v34;
  }
  -[UIView _currentScreenScale](self, "_currentScreenScale", *(_QWORD *)&MinX);
  v36 = UIRectIntegralWithScale(v25, v26, width, height, v35);
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __48___UITextLayoutFragmentViewBase__updateGeometry__block_invoke;
  v43[3] = &unk_1E16B5328;
  v43[4] = self;
  *(double *)&v43[5] = v36;
  v43[6] = v37;
  v43[7] = v38;
  v43[8] = v39;
  *(double *)&v43[9] = v42;
  *(double *)&v43[10] = v41;
  v43[11] = v38;
  v43[12] = v39;
  -[UIView _performChangesDeferringAutoresizingMaskConstraintsUpdate:](self, v43);
}

- (void)_updateTextAttachmentGeometry
{
  _QWORD v2[5];

  self->_textAttachmentGeometryNeedsUpdate = 0;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62___UITextLayoutFragmentViewBase__updateTextAttachmentGeometry__block_invoke;
  v2[3] = &unk_1E16B5350;
  v2[4] = self;
  -[_UITextLayoutFragmentViewBase enumerateTextAttachmentViewsUsingBlock:](self, "enumerateTextAttachmentViewsUsingBlock:", v2);
}

- (void)performChanges:(id)a3
{
  (*((void (**)(id, _UITextLayoutFragmentViewBase *))a3 + 2))(a3, self);
  -[_UITextLayoutFragmentViewBase _updateGeometry](self, "_updateGeometry");
}

- (void)enumerateTextAttachmentViewsUsingBlock:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v6 = a3;
  -[NSTextLayoutFragment textElement](self->_layoutFragment, "textElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSTextLayoutFragment textAttachmentViewProviders](self->_layoutFragment, "textAttachmentViewProviders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72___UITextLayoutFragmentViewBase_enumerateTextAttachmentViewsUsingBlock___block_invoke;
    v7[3] = &unk_1E16B5378;
    v7[4] = self;
    v8 = v6;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextLayoutFragmentViewBase;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_UITextLayoutFragmentViewBase _updateTextAttachmentGeometry](self, "_updateTextAttachmentGeometry");
  else
    self->_textAttachmentGeometryNeedsUpdate = 1;
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextLayoutFragmentViewBase;
  -[UIView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  if (self->_textAttachmentGeometryNeedsUpdate)
  {
    -[UIView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      -[_UITextLayoutFragmentViewBase _updateTextAttachmentGeometry](self, "_updateTextAttachmentGeometry");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UITextLayoutFragmentViewBase *v5;
  _UITextLayoutFragmentViewBase *v6;
  _UITextLayoutFragmentViewBase *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UITextLayoutFragmentViewBase;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UITextLayoutFragmentViewBase *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (NSTextLayoutFragment)layoutFragment
{
  return self->_layoutFragment;
}

- (CGPoint)containerOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_containerOrigin.x;
  y = self->_containerOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContainerOrigin:(CGPoint)a3
{
  self->_containerOrigin = a3;
}

- (CGSize)containerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerSize.width;
  height = self->_containerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  self->_containerSize = a3;
}

- (CGRect)clipRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clipRect.origin.x;
  y = self->_clipRect.origin.y;
  width = self->_clipRect.size.width;
  height = self->_clipRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClipRect:(CGRect)a3
{
  self->_clipRect = a3;
}

- (CGRect)clipFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clipFrame.origin.x;
  y = self->_clipFrame.origin.y;
  width = self->_clipFrame.size.width;
  height = self->_clipFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutFragment, 0);
}

@end
