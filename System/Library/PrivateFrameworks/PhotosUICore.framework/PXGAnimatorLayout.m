@implementation PXGAnimatorLayout

- (void)removeAllFences
{
  id v2;

  -[PXGAnimatorLayout inputLayout](self, "inputLayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllFences");

}

- (CGSize)contentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXGAnimatorLayout inputLayout](self, "inputLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)visibleRect
{
  void *v2;
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
  CGRect result;

  -[PXGAnimatorLayout inputLayout](self, "inputLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)enumerateLayoutsForSpritesInRange:(_PXGSpriteIndexRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  void *v7;
  unint64_t v8;
  id v9;

  v9 = a5;
  -[PXGAnimatorLayout inputLayout](self, "inputLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberOfSprites");
  v8 = PXGSpriteIndexRangeIntersection();
  if (HIDWORD(v8))
    objc_msgSend(v7, "enumerateLayoutsForSpritesInRange:options:usingBlock:", v8, a4, v9);

}

- (PXGLayout)inputLayout
{
  return self->_inputLayout;
}

- (double)cameraConfiguration
{
  void *v2;
  double result;

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    objc_msgSend(v2, "cameraConfiguration");
  }
  else
  {
    result = 0.0;
    a2[11] = 0u;
    a2[12] = 0u;
    a2[9] = 0u;
    a2[10] = 0u;
    a2[7] = 0u;
    a2[8] = 0u;
    a2[5] = 0u;
    a2[6] = 0u;
    a2[3] = 0u;
    a2[4] = 0u;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

- (void)setInputLayout:(id)a3
{
  objc_storeStrong((id *)&self->_inputLayout, a3);
}

- (id)fences
{
  void *v2;
  void *v3;
  void *v4;

  -[PXGAnimatorLayout inputLayout](self, "inputLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (PXGAnimatorLayout)initWithAnimator:(id)a3
{
  id v4;
  PXGAnimatorLayout *v5;
  PXGAnimatorLayout *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGAnimatorLayout;
  v5 = -[PXGAnimatorLayout init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_animator, v4);

  return v6;
}

- (PXGAnimatorLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAnimator.m"), 1089, CFSTR("%s is not available as initializer"), "-[PXGAnimatorLayout init]");

  abort();
}

- (CGSize)referenceSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXGAnimatorLayout inputLayout](self, "inputLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "referenceSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unsigned)numberOfSprites
{
  void *v2;
  unsigned int v3;

  -[PXGAnimatorLayout inputLayout](self, "inputLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSprites");

  return v3;
}

- (void)enumerateDescendantsLayoutsUsingBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXGAnimatorLayout inputLayout](self, "inputLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateDescendantsLayoutsUsingBlock:", v4);

}

- (BOOL)isSpriteIndex:(unsigned int)a3 decoratingSpriteWithIndex:(unsigned int *)a4
{
  uint64_t v5;
  void *v6;

  v5 = *(_QWORD *)&a3;
  -[PXGAnimatorLayout inputLayout](self, "inputLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "isSpriteIndex:decoratingSpriteWithIndex:", v5, a4);

  return (char)a4;
}

- (id)leafSublayoutForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[PXGAnimatorLayout inputLayout](self, "inputLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "numberOfSprites") <= v3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "leafSublayoutForSpriteIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (unsigned)convertSpriteIndex:(unsigned int)a3 fromLayout:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[PXGAnimatorLayout inputLayout](self, "inputLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v7, "convertSpriteIndex:fromLayout:", v4, v6);

  return v4;
}

- (PXGAnimator)animator
{
  return (PXGAnimator *)objc_loadWeakRetained((id *)&self->_animator);
}

- (__n128)setCameraConfiguration:(uint64_t)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  *(_OWORD *)(a1 + 32) = *(_OWORD *)a3;
  v3 = *(_OWORD *)(a3 + 16);
  v4 = *(_OWORD *)(a3 + 32);
  v5 = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  v6 = *(_OWORD *)(a3 + 80);
  v7 = *(_OWORD *)(a3 + 96);
  v8 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(a1 + 160) = v8;
  *(_OWORD *)(a1 + 112) = v6;
  *(_OWORD *)(a1 + 128) = v7;
  result = *(__n128 *)(a3 + 144);
  v10 = *(_OWORD *)(a3 + 160);
  v11 = *(_OWORD *)(a3 + 192);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a3 + 176);
  *(_OWORD *)(a1 + 224) = v11;
  *(__n128 *)(a1 + 176) = result;
  *(_OWORD *)(a1 + 192) = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputLayout, 0);
  objc_destroyWeak((id *)&self->_animator);
}

@end
