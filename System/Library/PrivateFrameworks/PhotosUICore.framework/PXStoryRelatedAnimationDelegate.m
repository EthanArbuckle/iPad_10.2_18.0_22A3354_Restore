@implementation PXStoryRelatedAnimationDelegate

- (PXStoryRelatedAnimationDelegate)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedAnimation.m"), 48, CFSTR("%s is not available as initializer"), "-[PXStoryRelatedAnimationDelegate init]");

  abort();
}

- (PXStoryRelatedAnimationDelegate)initWithSelectedRelatedLayout:(id)a3
{
  id v5;
  PXStoryRelatedAnimationDelegate *v6;
  void *v7;
  id WeakRetained;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  $1A92715FA36BAB2AB993A583878CDF5D v15;
  id v16;
  void *v17;
  PXGItemPlacementContext *v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  void *v26;
  objc_super v27;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedAnimation.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedRelatedLayout != nil"));

  }
  v27.receiver = self;
  v27.super_class = (Class)PXStoryRelatedAnimationDelegate;
  v6 = -[PXStoryRelatedAnimationDelegate init](&v27, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "rootLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_rootLayout, v7);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_rootLayout);
    objc_msgSend(v5, "contentSize");
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    PXRectWithOriginAndSize();
    objc_msgSend(WeakRetained, "convertRect:fromLayout:", v5);
    v6->_selectedRelatedInitialRect.origin.x = v11;
    v6->_selectedRelatedInitialRect.origin.y = v12;
    v6->_selectedRelatedInitialRect.size.width = v13;
    v6->_selectedRelatedInitialRect.size.height = v14;

    v6->_tolerance = 1.0;
    v15 = *($1A92715FA36BAB2AB993A583878CDF5D *)off_1E50B8248;
    v6->_selectedRelatedInitialCornerRadius = *($1A92715FA36BAB2AB993A583878CDF5D *)off_1E50B8248;
    v6->_selectedRelatedFinalCornerRadius = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v5;
      objc_msgSend(v16, "itemReference");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PXGItemPlacementContext initWithOriginOfLayout:atPoint:inCoordinateSpace:]([PXGItemPlacementContext alloc], "initWithOriginOfLayout:atPoint:inCoordinateSpace:", v16, 0, v9, v10);
      objc_msgSend(v16, "itemPlacementControllerForItemReference:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "placementInContext:forItemReference:", v18, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "cornerRadius");
      v6->_selectedRelatedInitialCornerRadius.var0.var0.topLeft = v21;
      v6->_selectedRelatedInitialCornerRadius.var0.var0.topRight = v22;
      v6->_selectedRelatedInitialCornerRadius.var0.var0.bottomLeft = v23;
      v6->_selectedRelatedInitialCornerRadius.var0.var0.bottomRight = v24;

    }
  }

  return v6;
}

- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  id v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;

  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "count"))
  {
    v12 = objc_msgSend(v10, "firstIndex");
    v13 = objc_msgSend(v10, "lastIndex");
    v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    objc_msgSend(v11, "visibleRect");
    if (v12 <= v13)
    {
      do
      {
        v15 = v12;
        v16 = *((_QWORD *)&a8[1].var0 + 5 * v12);
        if ((v16 & 0x10000) != 0)
        {
          v17 = PXRectApproximatelyEqualToRect();
          if ((v16 & 0x20000) == 0 && (v17 & 1) == 0)
            goto LABEL_9;
        }
        else if ((v16 & 0x20000) == 0)
        {
          goto LABEL_9;
        }
        objc_msgSend(v14, "addIndex:", v15);
LABEL_9:
        v12 = v15 + 1;
      }
      while ((int)v15 + 1 <= v13);
    }
    v18 = (void *)objc_msgSend(v14, "copy");

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)animation:(id)a3 prepareWithRootLayout:(id)a4 viewportShift:(CGPoint)a5
{
  PXGLayout **p_rootLayout;
  id v8;
  id WeakRetained;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  id v17;

  p_rootLayout = &self->_rootLayout;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_rootLayout);

  if (WeakRetained != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedAnimation.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootLayout == _rootLayout"));

  }
  PXPointAdd();
  self->_selectedRelatedInitialRect.origin.x = v10;
  self->_selectedRelatedInitialRect.origin.y = v11;
  v17 = objc_loadWeakRetained((id *)p_rootLayout);
  objc_msgSend(v17, "visibleRect");
  self->_selectedRelatedFinalRect.origin.x = v12;
  self->_selectedRelatedFinalRect.origin.y = v13;
  self->_selectedRelatedFinalRect.size.width = v14;
  self->_selectedRelatedFinalRect.size.height = v15;

}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v12;
  double *p_var2;
  float v14;
  float32x2_t v15;
  float32x2_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  float v25;
  CGFloat MidY;
  CGFloat v27;
  float64x2_t v28;
  id v29;
  CGFloat v30;
  CGFloat MidX;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  length = a7.length;
  v29 = a3;
  if (length)
  {
    v12 = a6 + 1;
    p_var2 = &a4->var0.var2;
    do
    {
      if ((*(&v12->var1 + 1) & 3) != 0)
      {
        v14 = a5->var0 * -9999.00025;
        a5->var0 = v14;
      }
      else
      {
        v15 = (float32x2_t)p_var2[1];
        v16 = vmul_f32(v15, (float32x2_t)0x3F0000003F000000);
        v17 = *(p_var2 - 2) - v16.f32[0];
        v18 = *(p_var2 - 1) - v16.f32[1];
        v19 = v15.f32[0];
        v20 = v15.f32[1];
        v32 = CGRectInset(self->_selectedRelatedFinalRect, -self->_tolerance, -self->_tolerance);
        v37.origin.x = v17;
        v37.origin.y = v18;
        v37.size.width = v19;
        v37.size.height = v20;
        if (CGRectContainsRect(v32, v37))
        {
          PXRectNormalize();
          PXRectDenormalize();
          x = v33.origin.x;
          y = v33.origin.y;
          width = v33.size.width;
          height = v33.size.height;
          v25 = *p_var2;
          MidX = CGRectGetMidX(v33);
          v34.origin.x = x;
          v34.origin.y = y;
          v34.size.width = width;
          v34.size.height = height;
          MidY = CGRectGetMidY(v34);
          v35.origin.x = x;
          v35.origin.y = y;
          v35.size.width = width;
          v35.size.height = height;
          v30 = CGRectGetWidth(v35);
          v36.origin.x = x;
          v36.origin.y = y;
          v36.size.width = width;
          v36.size.height = height;
          v27 = CGRectGetHeight(v36);
          v28.f64[0] = v30;
          v28.f64[1] = v27;
          *(p_var2 - 2) = MidX;
          *(p_var2 - 1) = MidY;
          *p_var2 = v25;
          *((float32x2_t *)p_var2 + 1) = vcvt_f32_f64(v28);
          if (PXRectApproximatelyEqualToRect())
            *($1A92715FA36BAB2AB993A583878CDF5D *)&a5->var6 = self->_selectedRelatedInitialCornerRadius;
        }
      }
      v12 = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)((char *)v12 + 40);
      a5 = ($225AF24142A77900D29617A74D173C5F *)((char *)a5 + 160);
      p_var2 += 4;
      --length;
    }
    while (length);
  }

}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v12;
  double *p_var2;
  double v14;
  int v15;
  uint64_t v16;
  float32x2_t v17;
  float32x2_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  float v27;
  CGFloat MidY;
  CGFloat v29;
  float64x2_t v30;
  id v31;
  CGFloat v32;
  CGFloat MidX;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  length = a7.length;
  v31 = a3;
  if (length)
  {
    v12 = a6 + 1;
    p_var2 = &a4->var0.var2;
    v14 = 2.0;
    do
    {
      v16 = *(_QWORD *)&v12->var0;
      v12 = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)((char *)v12 + 40);
      v15 = v16;
      if ((v16 & 0x20000) != 0)
      {
        a5->var0 = -a5->var0;
      }
      else
      {
        if ((v15 & 0x10000) != 0)
          goto LABEL_9;
        v17 = (float32x2_t)p_var2[1];
        v18 = vmul_f32(v17, (float32x2_t)0x3F0000003F000000);
        v19 = *(p_var2 - 2) - v18.f32[0];
        v20 = *(p_var2 - 1) - v18.f32[1];
        v21 = v17.f32[0];
        v22 = v17.f32[1];
        v34 = CGRectInset(self->_selectedRelatedInitialRect, -self->_tolerance, -self->_tolerance);
        v39.origin.x = v19;
        v39.origin.y = v20;
        v39.size.width = v21;
        v39.size.height = v22;
        if (!CGRectContainsRect(v34, v39))
        {
LABEL_9:
          *p_var2 = *p_var2 + v14;
        }
        else
        {
          PXRectNormalize();
          PXRectDenormalize();
          x = v35.origin.x;
          y = v35.origin.y;
          width = v35.size.width;
          height = v35.size.height;
          a5->var0 = 0.0;
          v27 = *p_var2;
          MidX = CGRectGetMidX(v35);
          v36.origin.x = x;
          v36.origin.y = y;
          v36.size.width = width;
          v36.size.height = height;
          MidY = CGRectGetMidY(v36);
          v37.origin.x = x;
          v37.origin.y = y;
          v37.size.width = width;
          v37.size.height = height;
          v32 = CGRectGetWidth(v37);
          v38.origin.x = x;
          v38.origin.y = y;
          v38.size.width = width;
          v38.size.height = height;
          v29 = CGRectGetHeight(v38);
          v30.f64[0] = v32;
          v30.f64[1] = v29;
          *(p_var2 - 2) = MidX;
          *(p_var2 - 1) = MidY;
          *p_var2 = v27;
          *((float32x2_t *)p_var2 + 1) = vcvt_f32_f64(v30);
          v14 = 2.0;
          if (PXRectApproximatelyEqualToRect())
            *($1A92715FA36BAB2AB993A583878CDF5D *)&a5->var6 = self->_selectedRelatedFinalCornerRadius;
        }
      }
      a5 = ($225AF24142A77900D29617A74D173C5F *)((char *)a5 + 160);
      p_var2 += 4;
      --length;
    }
    while (length);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootLayout);
}

@end
