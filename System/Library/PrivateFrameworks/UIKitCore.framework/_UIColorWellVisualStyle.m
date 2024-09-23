@implementation _UIColorWellVisualStyle

- (_UIColorWellVisualStyle)initWithColorWell:(id)a3
{
  id v4;
  _UIColorWellVisualStyle *v5;
  _UIColorWellVisualStyle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIColorWellVisualStyle;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
    -[_UIColorWellVisualStyle setColorWell:](v5, "setColorWell:", v4);

  return v6;
}

- (void)setSelectedColor:(id)a3 notifyingPicker:(BOOL)a4
{
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIColorWellVisualStyle.m"), 21, CFSTR("%@ should provide an implementation for %@"), v7, v8);

}

- (CGSize)intrinsicSizeWithinSize:(CGSize)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIColorWellVisualStyle.m"), 25, CFSTR("%@ should provide an implementation for %@"), v7, v8);

  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v10;
  result.width = v9;
  return result;
}

- (_UIColorWellControl)colorWell
{
  return (_UIColorWellControl *)objc_loadWeakRetained((id *)&self->_colorWell);
}

- (void)setColorWell:(id)a3
{
  objc_storeWeak((id *)&self->_colorWell, a3);
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColor, a3);
}

- (NSString)pickerTitle
{
  return self->_pickerTitle;
}

- (void)setPickerTitle:(id)a3
{
  objc_storeStrong((id *)&self->_pickerTitle, a3);
}

- (BOOL)supportsAlpha
{
  return self->_supportsAlpha;
}

- (void)setSupportsAlpha:(BOOL)a3
{
  self->_supportsAlpha = a3;
}

- (BOOL)wantsSystemDragAndDrop
{
  return self->_wantsSystemDragAndDrop;
}

- (void)setWantsSystemDragAndDrop:(BOOL)a3
{
  self->_wantsSystemDragAndDrop = a3;
}

- (BOOL)wantsExtraTouchInsets
{
  return self->_wantsExtraTouchInsets;
}

- (void)setWantsExtraTouchInsets:(BOOL)a3
{
  self->_wantsExtraTouchInsets = a3;
}

- (UIDragPreviewParameters)dragPreviewParameters
{
  return self->_dragPreviewParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragPreviewParameters, 0);
  objc_storeStrong((id *)&self->_pickerTitle, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_destroyWeak((id *)&self->_colorWell);
}

@end
