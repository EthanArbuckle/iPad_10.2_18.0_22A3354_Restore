@implementation _UISecureController

- (_UISecureController)initWithCategory:(id)a3 control:(id)a4
{
  id v7;
  id v8;
  _UISecureController *v9;
  _UISecureController *v10;
  _UISSecureControlSizeSpec *lastSizeSpec;
  id WeakRetained;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISecureController;
  v9 = -[_UISecureController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    v10->_cornerStyle = 2;
    v10->_cornerRadius = 0.0;
    v10->_baseForegroundColor = 0;
    v10->_baseBackgroundColor = 0;
    v10->_imagePlacement = 2;
    v10->_enchanted = 0;
    v10->_intrinsicContentSize = (CGSize)*MEMORY[0x1E0C9D820];
    objc_storeWeak((id *)&v10->_secureControl, v8);
    objc_storeWeak((id *)&v10->_slotView, 0);
    lastSizeSpec = v10->_lastSizeSpec;
    v10->_lastSizeSpec = 0;

    WeakRetained = objc_loadWeakRetained((id *)&v10->_secureControl);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_baseForegroundColor);
  CGColorRelease(self->_baseBackgroundColor);
  v3.receiver = self;
  v3.super_class = (Class)_UISecureController;
  -[_UISecureController dealloc](&v3, sel_dealloc);
}

- (unsigned)secureName
{
  return -[_UISSecureControlCategory secureName](self->_category, "secureName");
}

- (void)updateSlotView
{
  _UISlotView **p_slotView;
  _UISlotView *WeakRetained;
  id v5;
  _UISlotView *obj;

  p_slotView = &self->_slotView;
  WeakRetained = (_UISlotView *)objc_loadWeakRetained((id *)&self->_slotView);
  if (WeakRetained)
  {
    obj = WeakRetained;
    -[_UISlotView _updateContent](WeakRetained, "_updateContent");
  }
  else
  {
    obj = objc_alloc_init(_UISlotView);
    -[_UISlotView _setContentDelegate:](obj, "_setContentDelegate:", self);
    v5 = objc_loadWeakRetained((id *)&self->_secureControl);
    -[_UISlotView _overlayView:centerInView:](obj, "_overlayView:centerInView:", v5, v5);

    objc_storeWeak((id *)p_slotView, obj);
    -[_UISecureController updateState](self, "updateState");
  }

}

- (void)updateState
{
  id WeakRetained;
  _UISecureControl **p_secureControl;
  id v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  int v12;
  double v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_slotView);
  if (WeakRetained)
  {
    v14 = WeakRetained;
    if (self->_enchanted)
    {
      p_secureControl = &self->_secureControl;
      v5 = objc_loadWeakRetained((id *)p_secureControl);
      if ((objc_msgSend(v5, "isEnabled") & 1) != 0)
      {
        v6 = objc_loadWeakRetained((id *)p_secureControl);
        v7 = objc_msgSend(v6, "isInternallyEnabled");

        if (v7)
        {
          v8 = objc_loadWeakRetained((id *)p_secureControl);
          objc_msgSend(v8, "traitCollection");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "userInterfaceStyle") == 2;

          v11 = objc_loadWeakRetained((id *)p_secureControl);
          v12 = objc_msgSend(v11, "isHighlighted");
          v13 = dbl_186679260[v10];
          if (!v12)
            v13 = 1.0;
          objc_msgSend(v14, "setAlpha:", v13);

          goto LABEL_10;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v14, "setAlpha:", 0.25);
LABEL_10:
    WeakRetained = v14;
  }

}

- (void)setCornerStyle:(int64_t)a3
{
  id WeakRetained;

  if (self->_cornerStyle != a3)
  {
    self->_cornerStyle = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_secureControl);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (void)setCornerRadius:(double)a3
{
  id WeakRetained;

  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_secureControl);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (void)setBaseForegroundColor:(CGColor *)a3
{
  CGColor *baseForegroundColor;
  id WeakRetained;

  baseForegroundColor = self->_baseForegroundColor;
  if (baseForegroundColor != a3)
  {
    CGColorRelease(baseForegroundColor);
    self->_baseForegroundColor = CGColorRetain(a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_secureControl);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (void)setBaseBackgroundColor:(CGColor *)a3
{
  CGColor *baseBackgroundColor;
  id WeakRetained;

  baseBackgroundColor = self->_baseBackgroundColor;
  if (baseBackgroundColor != a3)
  {
    CGColorRelease(baseBackgroundColor);
    self->_baseBackgroundColor = CGColorRetain(a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_secureControl);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (void)setImagePlacement:(unint64_t)a3
{
  id WeakRetained;

  if (self->_imagePlacement != a3)
  {
    self->_imagePlacement = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_secureControl);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (id)_synchronousRemoteObjectProxyWithSelector:(uint64_t)a1
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(WeakRetained, "synchronousSecureControlService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_getAssociatedObject(v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__48;
    v14 = __Block_byref_object_dispose__48;
    v15 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65___UISecureController__synchronousRemoteObjectProxyWithSelector___block_invoke;
    v9[3] = &unk_1E16BE688;
    v9[4] = &v10;
    objc_msgSend(v4, (SEL)a2, v9);
    objc_setAssociatedObject(v4, a2, (id)v11[5], (void *)1);
    v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

  }
  return v7;
}

- (void)_updateSizeSpec:(double)a3 intrinsicContentSize:(double)a4
{
  id WeakRetained;
  id v9;

  v9 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 24), a2);
    *(double *)(a1 + 88) = a3;
    *(double *)(a1 + 96) = a4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");

  }
}

- (id)currentTagForSlotView:(id)a3
{
  id v4;
  int64_t cornerStyle;
  double cornerRadius;
  CGColor *baseForegroundColor;
  CGColor *baseBackgroundColor;
  _UISecureControl **p_secureControl;
  unint64_t imagePlacement;
  unint64_t v11;
  unint64_t *p_imagePlacement;
  id WeakRetained;
  double v14;
  double v15;
  void *v16;

  v4 = objc_alloc(MEMORY[0x1E0DC5C88]);
  cornerStyle = self->_cornerStyle;
  cornerRadius = self->_cornerRadius;
  baseForegroundColor = self->_baseForegroundColor;
  baseBackgroundColor = self->_baseBackgroundColor;
  p_secureControl = &self->_secureControl;
  p_imagePlacement = &self->_imagePlacement;
  imagePlacement = self->_imagePlacement;
  v11 = p_imagePlacement[1];
  WeakRetained = objc_loadWeakRetained((id *)p_secureControl);
  objc_msgSend(WeakRetained, "bounds");
  v16 = (void *)objc_msgSend(v4, "initWithCategory:cornerStyle:cornerRadius:baseForegroundColor:baseBackgroundColor:imagePlacement:size:", v11, cornerStyle, baseForegroundColor, baseBackgroundColor, imagePlacement, cornerRadius, v14, v15);

  return v16;
}

- (BOOL)slotView:(id)a3 shouldSetInitialContentForStyle:(id)a4 tag:(id)a5
{
  return 0;
}

- (id)slotView:(id)a3 initialContentForStyle:(id)a4 tag:(id)a5
{
  return 0;
}

- (BOOL)slotView:(id)a3 shouldSetFinalContentForStyle:(id)a4 tag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  double v14;
  double v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((-[_UISSecureControlSizeSpec isEquivalentToStyle:tag:](self->_lastSizeSpec, "isEquivalentToStyle:tag:", v9, v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC5C80], "specWithStyle:tag:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[_UISecureController _synchronousRemoteObjectProxyWithSelector:]((uint64_t)self, sel_getSizeToolWithReply_);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_shouldLayoutSynchronously)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke;
      v25[3] = &unk_1E16BE6B0;
      objc_copyWeak(&v27, &location);
      v26 = v11;
      objc_msgSend(v12, "getIntrinsicContentSizeForSpec:reply:", v26, v25);

      objc_destroyWeak(&v27);
    }
    else
    {
      dispatch_get_global_queue(33, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_2;
      v21 = &unk_1E16BE700;
      v22 = v12;
      v23 = v11;
      objc_copyWeak(&v24, &location);
      dispatch_async(v13, &v18);

      objc_destroyWeak(&v24);
    }

    objc_destroyWeak(&location);
  }
  objc_msgSend(v10, "size", v18, v19, v20, v21);
  v16 = v15 > 0.0 && v14 > 0.0;

  return v16;
}

- (id)slotMachineForFinalContentInSlotView:(id)a3
{
  return -[_UISecureController _synchronousRemoteObjectProxyWithSelector:]((uint64_t)self, sel_getSlotMachineWithReply_);
}

- (BOOL)shouldGetFinalContentSynchronouslyInSlotView:(id)a3
{
  return self->_shouldLayoutSynchronously;
}

- (id)slotView:(id)a3 replacementForFinalContent:(id)a4 style:(id)a5 tag:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (v9)
  {
    self->_enchanted = 1;
    -[_UISecureController updateState](self, "updateState");
    v12 = v9;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0DC5BF0]);
    objc_msgSend(v11, "size");
    v16 = (void *)objc_msgSend(v13, "initWithRectSize:fillColor:", objc_msgSend(v10, "tintColor"), v14, v15);
    self->_enchanted = 0;
    -[_UISecureController updateState](self, "updateState");
    objc_msgSend(MEMORY[0x1E0DC5C48], "contentWithDrawing:style:", v16, v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGColor)baseForegroundColor
{
  return self->_baseForegroundColor;
}

- (CGColor)baseBackgroundColor
{
  return self->_baseBackgroundColor;
}

- (unint64_t)imagePlacement
{
  return self->_imagePlacement;
}

- (BOOL)shouldLayoutSynchronously
{
  return self->_shouldLayoutSynchronously;
}

- (void)setShouldLayoutSynchronously:(BOOL)a3
{
  self->_shouldLayoutSynchronously = a3;
}

- (_UISSecureControlCategory)category
{
  return self->_category;
}

- (BOOL)enchanted
{
  return self->_enchanted;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_lastSizeSpec, 0);
  objc_destroyWeak((id *)&self->_slotView);
  objc_destroyWeak((id *)&self->_secureControl);
}

@end
