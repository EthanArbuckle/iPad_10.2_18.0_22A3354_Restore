@implementation SBIconGridImage

- (unint64_t)numberOfColumns
{
  void *v2;
  unint64_t v3;

  -[SBIconGridImage listLayout](self, "listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfColumnsForOrientation:", 1);

  return v3;
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (unint64_t)numberOfCells
{
  void *v2;
  unint64_t v3;

  -[SBIconGridImage listLayout](self, "listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBHIconListLayoutMaximumIconCount(v2);

  return v3;
}

+ (CGRect)rectAtIndex:(unint64_t)a3 inLayout:(id)a4 maxCount:(unint64_t)a5
{
  id v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v8 = a4;
  v9 = objc_msgSend(v8, "numberOfColumnsForOrientation:", 1);
  v10 = SBHIconListLayoutFolderIconGridCellSize(v8);
  v12 = v11;
  v13 = SBHIconListLayoutFolderIconGridCellSpacing(v8);
  v15 = v14;
  if (v9)
  {
    v16 = a3 / v9;
    v17 = a3 % v9;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  v18 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  v19 = v9 + ~v17;
  if (v18 != 1)
    v19 = v17;
  v20 = v10 + v13;
  v21 = (v10 + v13) * (double)v19;
  if (v16 == objc_msgSend(a1, "numberOfRowsForNumberOfCells:inLayout:", a5, v8) - 1)
    v21 = v21 + floor(v20 * (double)(v9 - a5 + v16 * v9) * 0.5);

  v22 = v21;
  v23 = (v12 + v15) * (double)v16;
  v24 = v10;
  v25 = v12;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (CGSize)sizeForLayout:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v3 = a3;
  v4 = objc_msgSend(v3, "numberOfRowsForOrientation:", 1);
  v5 = objc_msgSend(v3, "numberOfColumnsForOrientation:", 1);
  v6 = SBHIconListLayoutFolderIconGridCellSize(v3);
  v8 = v7;
  v9 = SBHIconListLayoutFolderIconGridCellSpacing(v3);
  v11 = v10;

  v12 = v9 * (double)(v5 - 1);
  v13 = 0.0;
  if (!v5)
    v12 = 0.0;
  if (v4)
    v13 = v11 * (double)(v4 - 1);
  v14 = v12 + (double)v5 * v6;
  v15 = v13 + (double)v4 * v8;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (unint64_t)numberOfRowsForNumberOfCells:(unint64_t)a3 inLayout:(id)a4
{
  return (a3 - 1) / objc_msgSend(a4, "numberOfColumnsForOrientation:", 1) + 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_imageAppearance, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
}

+ (id)gridImageForLayout:(id)a3 imageAppearance:(id)a4 previousGridImage:(id)a5 previousGridCellIndexToUpdate:(unint64_t)a6 pool:(id)a7 cellImageDrawBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *context;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  id v52;
  _QWORD v53[3];
  int v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;

  v14 = a3;
  v37 = a4;
  v15 = a5;
  v36 = a7;
  v16 = a8;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = v18;

  v20 = SBHIconListLayoutMaximumIconCount(v14);
  objc_msgSend(a1, "sizeForLayout:", v14);
  v22 = v21;
  v24 = v23;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v54 = 0;
  v54 = objc_msgSend(v15, "treatedCells");
  context = (void *)MEMORY[0x1D17DF4E4]();
  v25 = (void *)MEMORY[0x1E0DC3870];
  v26 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __126__SBIconGridImage_gridImageForLayout_imageAppearance_previousGridImage_previousGridCellIndexToUpdate_pool_cellImageDrawBlock___block_invoke;
  v44[3] = &unk_1E8D89E38;
  v27 = v15;
  v45 = v27;
  v50 = v20;
  v51 = a6;
  v52 = a1;
  v46 = v14;
  v48 = v53;
  v28 = v16;
  v47 = v28;
  v49 = &v55;
  v38[0] = v26;
  v38[1] = 3221225472;
  v38[2] = __126__SBIconGridImage_gridImageForLayout_imageAppearance_previousGridImage_previousGridCellIndexToUpdate_pool_cellImageDrawBlock___block_invoke_2;
  v38[3] = &unk_1E8D89E60;
  v43 = a1;
  v29 = v46;
  v39 = v29;
  v30 = v37;
  v40 = v30;
  v31 = v36;
  v41 = v31;
  v42 = v53;
  objc_msgSend(v25, "sbf_imageFromContextWithSize:scale:type:pool:drawing:encapsulation:", 0, v31, v44, v38, v22, v24, v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  if (v27 && !v56[3])
  {
    v33 = v27;

    v32 = v33;
  }
  _Block_object_dispose(v53, 8);
  _Block_object_dispose(&v55, 8);

  return v32;
}

uint64_t __126__SBIconGridImage_gridImageForLayout_imageAppearance_previousGridImage_previousGridCellIndexToUpdate_pool_cellImageDrawBlock___block_invoke(uint64_t a1)
{
  CGContext *CurrentContext;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  CGContext *v11;
  CGRect v12;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
  v3 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v3, "size");
  result = objc_msgSend(v3, "drawInRect:", v4, v5, v6, v7);
  v9 = *(_QWORD *)(a1 + 72);
  if (v9)
  {
    v10 = 0;
    while (1)
    {
      if (!*(_QWORD *)(a1 + 32))
        goto LABEL_7;
      if (v10 == *(_QWORD *)(a1 + 80))
        break;
LABEL_11:
      if (++v10 >= v9)
        return result;
    }
    v11 = UIGraphicsGetCurrentContext();
    objc_msgSend(*(id *)(a1 + 88), "rectAtIndex:inLayout:maxCount:", v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
    CGContextClearRect(v11, v12);
    if (v10 <= 0x1F)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) &= ~(1 << v10);
LABEL_7:
    objc_msgSend(*(id *)(a1 + 88), "rectAtIndex:inLayout:maxCount:", v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    if ((_DWORD)result)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      if (v10 <= 0x1F)
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) &= ~(1 << v10);
    }
    v9 = *(_QWORD *)(a1 + 72);
    goto LABEL_11;
  }
  return result;
}

id __126__SBIconGridImage_gridImageForLayout_imageAppearance_previousGridImage_previousGridCellIndexToUpdate_pool_cellImageDrawBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 64)), "initWithCGImage:scale:orientation:", a2, a3, a4);
  objc_msgSend(v5, "setListLayout:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setImageAppearance:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setPool:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setTreatedCells:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  return v5;
}

+ (id)gridImageForLayout:(id)a3 imageAppearance:(id)a4 cellImageDrawBlock:(id)a5
{
  return (id)objc_msgSend(a1, "gridImageForLayout:imageAppearance:previousGridImage:previousGridCellIndexToUpdate:pool:cellImageDrawBlock:", a3, a4, 0, 0x7FFFFFFFFFFFFFFFLL, 0, a5);
}

+ (id)gridImageForLayout:(id)a3 imageAppearance:(id)a4 pool:(id)a5 cellImageDrawBlock:(id)a6
{
  return (id)objc_msgSend(a1, "gridImageForLayout:imageAppearance:previousGridImage:previousGridCellIndexToUpdate:pool:cellImageDrawBlock:", a3, a4, 0, 0x7FFFFFFFFFFFFFFFLL, a5, a6);
}

- (id)gridImageByPatchingCellAtIndex:(unint64_t)a3 cellImageProviderBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = (void *)objc_opt_class();
  -[SBIconGridImage listLayout](self, "listLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconGridImage imageAppearance](self, "imageAppearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconGridImage pool](self, "pool");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gridImageForLayout:imageAppearance:previousGridImage:previousGridCellIndexToUpdate:pool:cellImageDrawBlock:", v8, v9, self, a3, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)numberOfRows
{
  void *v2;
  unint64_t v3;

  -[SBIconGridImage listLayout](self, "listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfRowsForOrientation:", 1);

  return v3;
}

- (id)iconImageAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  CGImage *v16;
  void *v17;
  double v18;
  CGFloat v19;
  CGImageRef v20;
  CGImage *v21;
  void *v22;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;

  v5 = (void *)objc_opt_class();
  -[SBIconGridImage listLayout](self, "listLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rectAtIndex:inLayout:maxCount:", a3, v6, -[SBIconGridImage numberOfCells](self, "numberOfCells"));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = -[SBIconGridImage CGImage](objc_retainAutorelease(self), "CGImage");
  if (!v15)
    goto LABEL_4;
  v16 = (CGImage *)v15;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = v18;

  CGAffineTransformMakeScale(&v24, v19, v19);
  v25.origin.x = v8;
  v25.origin.y = v10;
  v25.size.width = v12;
  v25.size.height = v14;
  v26 = CGRectApplyAffineTransform(v25, &v24);
  v20 = CGImageCreateWithImageInRect(v16, v26);
  if (v20)
  {
    v21 = v20;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v20, 0, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v21);
  }
  else
  {
LABEL_4:
    v22 = 0;
  }
  return v22;
}

- (BOOL)isIconImageTreatedAtIndex:(unint64_t)a3
{
  _BOOL4 v3;

  if (a3 <= 0x20)
    return (self->_treatedCells >> a3) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (void)setListLayout:(id)a3
{
  objc_storeStrong((id *)&self->_listLayout, a3);
}

- (SBHIconImageAppearance)imageAppearance
{
  return self->_imageAppearance;
}

- (void)setImageAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (CPMemoryPool)pool
{
  return self->_pool;
}

- (void)setPool:(id)a3
{
  objc_storeStrong((id *)&self->_pool, a3);
}

- (unsigned)treatedCells
{
  return self->_treatedCells;
}

- (void)setTreatedCells:(unsigned int)a3
{
  self->_treatedCells = a3;
}

@end
