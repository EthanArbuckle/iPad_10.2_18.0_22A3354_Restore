@implementation PXGSingleViewLayout

- (PXGSingleViewLayout)init
{
  PXGSingleViewLayout *v2;
  PXGSingleViewLayout *v3;
  uint64_t v4;
  NSIndexSet *axSpriteIndexes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGSingleViewLayout;
  v2 = -[PXGLayout init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXGLayout setContentSource:](v2, "setContentSource:", v2);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", 0);
    axSpriteIndexes = v3->_axSpriteIndexes;
    v3->_axSpriteIndexes = (NSIndexSet *)v4;

    v3->_cornerRadius = *($1A92715FA36BAB2AB993A583878CDF5D *)off_1E50B8248;
  }
  return v3;
}

- (void)dealloc
{
  UIView *contentView;
  objc_super v4;

  contentView = self->_contentView;
  if (contentView)
    objc_setAssociatedObject(contentView, (const void *)PXGSingleViewLayoutAssociationKey, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)PXGSingleViewLayout;
  -[PXGLayout dealloc](&v4, sel_dealloc);
}

- (void)appearStateDidChange
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGSingleViewLayout;
  -[PXGLayout appearStateDidChange](&v6, sel_appearStateDidChange);
  -[PXGSingleViewLayout delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PXGSingleViewLayout delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appearStateDidChangeForSingleViewLayout:", self);

  }
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGSingleViewLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGSingleViewLayout _invalidateContent](self, "_invalidateContent");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGSingleViewLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXGSingleViewLayout _invalidateContent](self, "_invalidateContent");
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGSingleViewLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXGSingleViewLayout _invalidateContent](self, "_invalidateContent");
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  UIView *object;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    object = v5;
    if (contentView)
      objc_setAssociatedObject(contentView, (const void *)PXGSingleViewLayoutAssociationKey, 0, 0);
    objc_storeStrong((id *)&self->_contentView, a3);
    if (object)
      objc_setAssociatedObject(object, (const void *)PXGSingleViewLayoutAssociationKey, self, 0);
    -[PXGSingleViewLayout _invalidateMediaVersion](self, "_invalidateMediaVersion");
    v5 = object;
  }

}

- (void)setContentViewClass:(Class)a3
{
  Class *p_contentViewClass;

  p_contentViewClass = &self->_contentViewClass;
  if (*p_contentViewClass != a3)
  {
    objc_storeStrong((id *)p_contentViewClass, a3);
    -[PXGSingleViewLayout _invalidateMediaVersion](self, "_invalidateMediaVersion");
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PXGSingleViewLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_padding;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_padding = &self->_padding;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_padding->top = top;
    p_padding->left = left;
    p_padding->bottom = bottom;
    p_padding->right = right;
    -[PXGSingleViewLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setZPosition:(float)a3
{
  if (self->_zPosition != a3)
  {
    self->_zPosition = a3;
    -[PXGSingleViewLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  if (self->_cornerRadius.var0.var0.topLeft != v3
    || self->_cornerRadius.var0.var0.topRight != v4
    || self->_cornerRadius.var0.var0.bottomLeft != v5
    || self->_cornerRadius.var0.var0.bottomRight != v6)
  {
    self->_cornerRadius.var0.var0.topLeft = v3;
    self->_cornerRadius.var0.var0.topRight = v4;
    self->_cornerRadius.var0.var0.bottomLeft = v5;
    self->_cornerRadius.var0.var0.bottomRight = v6;
    -[PXGSingleViewLayout _invalidateContent](self, "_invalidateContent", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
  }
}

- (PXGSpriteReference)viewSpriteReference
{
  return (PXGSpriteReference *)-[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:", -[PXGSingleViewLayout viewSpriteIndex](self, "viewSpriteIndex"));
}

- (unsigned)viewSpriteIndex
{
  return 0;
}

- (void)_invalidateMediaVersion
{
  ++self->_contentSpriteMediaVersion;
  -[PXGSingleViewLayout _invalidateContent](self, "_invalidateContent");
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  PXGHitTestResult *v8;
  void *v11;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSingleViewLayout.m"), 161, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGSingleViewLayout delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || (-[PXGSingleViewLayout delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "singleViewLayout:hitTestResultForSpriteReference:", self, v4),
        v8 = (PXGHitTestResult *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v8 = -[PXGHitTestResult initWithSpriteReference:layout:identifier:userData:]([PXGHitTestResult alloc], "initWithSpriteReference:layout:identifier:userData:", v4, self, CFSTR("PXGHitTestResultGenericSingleView"), 0);
  }

  return v8;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGSingleViewLayout;
  -[PXGLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSingleViewLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGSingleViewLayout.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSingleViewLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGSingleViewLayout.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGSingleViewLayout _updateContent](self, "_updateContent");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSingleViewLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGSingleViewLayout.m"), 179, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXGSingleViewLayout;
  -[PXGLayout update](&v9, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGSingleViewLayout;
  -[PXGLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSingleViewLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGSingleViewLayout.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSingleViewLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGSingleViewLayout.m"), 189, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContent
{
  uint64_t v4;
  void *v5;
  objc_class *v6;
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
  int v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  _QWORD v31[9];
  int v32;

  -[PXGSingleViewLayout contentView](self, "contentView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[PXGSingleViewLayout contentViewClass](self, "contentViewClass");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSingleViewLayout.m"), 193, CFSTR("Content may be specified via contentView or contentViewClass but not both"));

    }
  }
  if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") != 1)
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", 0, 1, 0, 0);
  -[PXGSingleViewLayout padding](self, "padding");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PXGLayout referenceSize](self, "referenceSize");
  PXEdgeInsetsInsetSize();
  v16 = v15;
  v18 = v17;
  -[PXGSingleViewLayout zPosition](self, "zPosition");
  v20 = v19;
  if (-[PXGSingleViewLayout contentViewClass](self, "contentViewClass")
    || (v26 = -[PXGSingleViewLayout style](self, "style"), v26 == 2))
  {
    -[PXGSingleViewLayout delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "singleViewLayout:desiredSizeForReferenceSize:", self, v16, v18);
    v16 = v22;
    v18 = v23;
LABEL_8:

    goto LABEL_9;
  }
  if (v26 == 1)
  {
    -[PXGSingleViewLayout contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v16 = 0.0;
      goto LABEL_8;
    }
    -[PXGSingleViewLayout contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sizeThatFits:", 1.79769313e308, v18);
    v16 = v29;
LABEL_21:

    goto LABEL_8;
  }
  if (!v26)
  {
    -[PXGSingleViewLayout contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v18 = 0.0;
      goto LABEL_8;
    }
    -[PXGSingleViewLayout contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sizeThatFits:", v16, 1.79769313e308);
    v18 = v28;
    goto LABEL_21;
  }
  v16 = *MEMORY[0x1E0C9D820];
  v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
LABEL_9:
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __37__PXGSingleViewLayout__updateContent__block_invoke;
  v31[3] = &unk_1E513BF60;
  *(double *)&v31[5] = v10;
  *(double *)&v31[6] = v8;
  *(double *)&v31[7] = v16;
  *(double *)&v31[8] = v18;
  v32 = v20;
  v31[4] = self;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", 0x100000000, v31);
  v24 = v14 + v10 + v16;
  v25 = 0.0;
  if (v16 <= 0.0)
    v24 = 0.0;
  if (v18 > 0.0)
    v25 = v12 + v8 + v18;
  -[PXGLayout setContentSize:](self, "setContentSize:", v24, v25);
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  objc_class *v4;

  v4 = -[PXGSingleViewLayout contentViewClass](self, "contentViewClass", *(_QWORD *)&a3, a4);
  if (!v4)
    v4 = (objc_class *)objc_opt_class();
  return v4;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  PXGSingleViewUserData *v8;
  PXGSingleViewUserData *v9;
  void *v10;

  if (-[PXGSingleViewLayout contentViewClass](self, "contentViewClass", *(_QWORD *)&a3, a4))
  {
    -[PXGSingleViewLayout delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[PXGSingleViewLayout delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configurationForSingleViewLayout:", self);
      v8 = (PXGSingleViewUserData *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    -[PXGSingleViewUserData setWeakLayout:](v8, "setWeakLayout:", self);
  }
  else
  {
    v9 = [PXGSingleViewUserData alloc];
    -[PXGSingleViewLayout contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXGSingleViewUserData initWithContentView:](v9, "initWithContentView:", v10);

  }
  return v8;
}

- (id)axSpriteIndexes
{
  return self->_axSpriteIndexes;
}

- (id)axSpriteIndexesInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  NSIndexSet *v12;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXGLayout contentSize](self, "contentSize");
  v14.size.width = v10;
  v14.size.height = v11;
  v14.origin.x = v8;
  v14.origin.y = v9;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  if (CGRectIntersectsRect(v14, v15))
    v12 = self->_axSpriteIndexes;
  else
    v12 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB36B8]);
  return v12;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (Class)contentViewClass
{
  return self->_contentViewClass;
}

- (PXGSingleViewLayoutDelegate)delegate
{
  return (PXGSingleViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (float)zPosition
{
  return self->_zPosition;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewClass, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
}

uint64_t __37__PXGSingleViewLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _WORD *a5)
{
  float v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  double v23;
  uint64_t result;
  int v25;
  int v26;
  int v27;
  int v28;
  CGFloat Width;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v9 = *(float *)(a1 + 72);
  v10 = *(double *)(a1 + 40);
  v11 = *(double *)(a1 + 48);
  v12 = *(double *)(a1 + 56);
  v13 = *(double *)(a1 + 64);
  v30.origin.x = v10;
  v30.origin.y = v11;
  v30.size.width = v12;
  v30.size.height = v13;
  MidX = CGRectGetMidX(v30);
  v31.origin.x = v10;
  v31.origin.y = v11;
  v31.size.width = v12;
  v31.size.height = v13;
  MidY = CGRectGetMidY(v31);
  v32.origin.x = v10;
  v32.origin.y = v11;
  v32.size.width = v12;
  v32.size.height = v13;
  Width = CGRectGetWidth(v32);
  v33.origin.x = v10;
  v33.origin.y = v11;
  v33.size.width = v12;
  v33.size.height = v13;
  Height = CGRectGetHeight(v33);
  v17.f64[0] = Width;
  v17.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)(a3 + 8) = MidY;
  *(double *)(a3 + 16) = v9;
  *(float32x2_t *)(a3 + 24) = vcvt_f32_f64(v17);
  v18 = *((_OWORD *)off_1E50B83A0 + 1);
  *(_OWORD *)a4 = *(_OWORD *)off_1E50B83A0;
  *(_OWORD *)(a4 + 16) = v18;
  v19 = *((_OWORD *)off_1E50B83A0 + 5);
  *(_OWORD *)(a4 + 64) = *((_OWORD *)off_1E50B83A0 + 4);
  *(_OWORD *)(a4 + 80) = v19;
  v20 = *((_OWORD *)off_1E50B83A0 + 3);
  *(_OWORD *)(a4 + 32) = *((_OWORD *)off_1E50B83A0 + 2);
  *(_OWORD *)(a4 + 48) = v20;
  v21 = *((_OWORD *)off_1E50B83A0 + 9);
  *(_OWORD *)(a4 + 128) = *((_OWORD *)off_1E50B83A0 + 8);
  *(_OWORD *)(a4 + 144) = v21;
  v22 = *((_OWORD *)off_1E50B83A0 + 7);
  *(_OWORD *)(a4 + 96) = *((_OWORD *)off_1E50B83A0 + 6);
  *(_OWORD *)(a4 + 112) = v22;
  objc_msgSend(*(id *)(a1 + 32), "alpha");
  *(float *)&v23 = v23;
  *(_DWORD *)a4 = LODWORD(v23);
  result = objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
  *(_DWORD *)(a4 + 36) = v25;
  *(_DWORD *)(a4 + 40) = v26;
  *(_DWORD *)(a4 + 44) = v27;
  *(_DWORD *)(a4 + 48) = v28;
  *a5 = 2561;
  a5[16] = *(_WORD *)(*(_QWORD *)(a1 + 32) + 872);
  return result;
}

@end
