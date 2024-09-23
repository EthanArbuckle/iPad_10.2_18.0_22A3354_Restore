@implementation _PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper

- (_PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper)initWithLayout:(id)a3
{
  id v4;
  _PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper;
  v5 = -[PXCuratedLibraryLayoutAnimationHelper initWithLayout:](&v7, sel_initWithLayout_, v4);
  if (v5)
    v5->_userInterfaceDirection = objc_msgSend(v4, "userInterfaceDirection");

  return v5;
}

- (void)setUserData:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper;
  -[PXCuratedLibraryLayoutAnimationHelper setUserData:](&v16, sel_setUserData_, a3);
  -[PXCuratedLibraryLayoutAnimationHelper userData](self, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayoutAnimationHelper.m"), 194, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.userData"), v12, v13);

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PXCuratedLibrarySkimmingSlideshowFromSectionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "px_simpleIndexPathValue");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }
  *(_OWORD *)&self->_fromIndexPath.dataSourceIdentifier = v14;
  *(_OWORD *)&self->_fromIndexPath.item = v15;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PXCuratedLibrarySkimmingSlideshowToSectionKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "px_simpleIndexPathValue");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }
  *(_OWORD *)&self->_toIndexPath.dataSourceIdentifier = v14;
  *(_OWORD *)&self->_toIndexPath.item = v15;

}

- (BOOL)wantsDoubleSidedAnimations
{
  return 1;
}

- (int64_t)animationCurve
{
  return 2;
}

- (double)animationDuration
{
  return 0.666666667;
}

- (BOOL)_shoulAnimateSpriteWithInfo:(id *)a3 matchingSectionIndexPath:(PXSimpleIndexPath *)a4 spriteKind:(unsigned __int8 *)a5
{
  PXGSectionedSpriteTagDecompose();
  return !a4->section && (*a5 & 0xFD) == 1;
}

- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  const $786F7D2F4E5B3A0CBB66DF574B7D98CF *v19;

  v10 = (objc_class *)MEMORY[0x1E0CB3788];
  v11 = a4;
  v12 = objc_alloc_init(v10);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __170___PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper_animation_doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes_rootLayout_presentedGeometries_styles_infos___block_invoke;
  v17[3] = &unk_1E513F058;
  v17[4] = self;
  v19 = a8;
  v13 = v12;
  v18 = v13;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", v17);

  v14 = v18;
  v15 = v13;

  return v15;
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
  -[_PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper _adjustGeometries:styles:infos:spriteIndexRange:appearing:](self, "_adjustGeometries:styles:infos:spriteIndexRange:appearing:", a4, a5, a6, a7, 1);
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
  -[_PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper _adjustGeometries:styles:infos:spriteIndexRange:appearing:](self, "_adjustGeometries:styles:infos:spriteIndexRange:appearing:", a4, a5, a6, a7, 0);
}

- (void)_adjustGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 spriteIndexRange:(_PXGSpriteIndexRange)a6 appearing:(BOOL)a7
{
  uint64_t length;
  int *v8;
  int v9;
  int v10;
  __int128 *v11;
  __int128 v12;
  int v13;
  double v16;
  float v17;
  double v18;
  double *p_var2;
  float *p_var1;
  CGFloat height;
  CGFloat y;
  _OWORD v23[2];
  char v24;
  __int128 v25;
  __int128 v26;
  CGRect v27;
  CGRect v28;

  length = a6.length;
  v8 = &OBJC_IVAR____PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper__fromIndexPath;
  if (a7)
  {
    v8 = &OBJC_IVAR____PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper__toIndexPath;
    v9 = 1;
  }
  else
  {
    v9 = -1;
  }
  if (a7)
    v10 = -1;
  else
    v10 = 1;
  v11 = (__int128 *)((char *)self + *v8);
  v12 = v11[1];
  v25 = *v11;
  v26 = v12;
  if (self->_userInterfaceDirection)
    v13 = v9;
  else
    v13 = v10;
  if (a6.length)
  {
    v16 = (double)v13;
    if (a7)
      v17 = -0.2;
    else
      v17 = 1.0;
    if (a7)
      v18 = -0.1;
    else
      v18 = 0.1;
    p_var2 = &a3->var0.var2;
    p_var1 = &a4->var1.var0.var0.var1;
    do
    {
      v24 = 0;
      v23[0] = v25;
      v23[1] = v26;
      if (-[_PXCuratedLibraryLayoutSkimmingSlideshowAnimationHelper _shoulAnimateSpriteWithInfo:matchingSectionIndexPath:spriteKind:](self, "_shoulAnimateSpriteWithInfo:matchingSectionIndexPath:spriteKind:", a5, v23, &v24))
      {
        if (v24 == 1)
        {
          v27.origin.x = *(p_var1 - 1);
          v27.origin.y = *p_var1;
          v27.size.width = p_var1[1];
          v27.size.height = p_var1[2];
          v28 = CGRectOffset(v27, v16 * v27.size.width * 0.1, 0.0);
          height = v28.size.height;
          y = v28.origin.y;
          *(float32x4_t *)(p_var1 - 1) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v28.origin), (float64x2_t)v28.size);
          *(p_var1 - 2) = v17;
          *p_var2 = v18 + *p_var2;
        }
        else if (v24 == 3)
        {
          *(p_var1 - 2) = -1.0;
        }
      }
      p_var2 += 4;
      a5 = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)((char *)a5 + 40);
      p_var1 += 40;
      --length;
    }
    while (length);
  }
}

@end
