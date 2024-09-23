@implementation PXCuratedLibrarySectionGeometryDescriptor

- (PXCuratedLibrarySectionGeometryDescriptor)init
{
  __int128 v3;

  HIDWORD(v3) = *((_DWORD *)off_1E50B8248 + 3);
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)((char *)off_1E50B8248 + 4);
  LODWORD(v3) = *(_DWORD *)off_1E50B8248;
  return -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:](self, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:", 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), *MEMORY[0x1E0C9D628], *(_QWORD *)(MEMORY[0x1E0C9D628] + 8), *(_QWORD *)(MEMORY[0x1E0C9D628] + 16), *(_QWORD *)(MEMORY[0x1E0C9D628] + 24), v3);
}

- (uint64_t)initWithSectionRect:(uint64_t)a3 headerRect:keyAssetRect:headerCornerRadius:headerAsset:
{
  return objc_msgSend(a1, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", a3, 0x7FFFFFFFFFFFFFFFLL);
}

- (id)initWithSectionRect:(double)a3 headerRect:(double)a4 keyAssetRect:(double)a5 headerCornerRadius:(double)a6 headerAsset:(double)a7 visualPosition:(double)a8
{
  id v35;
  id *v36;
  id *v37;
  objc_super v39;

  v35 = a11;
  v39.receiver = a1;
  v39.super_class = (Class)PXCuratedLibrarySectionGeometryDescriptor;
  v36 = (id *)objc_msgSendSuper2(&v39, sel_init);
  v37 = v36;
  if (v36)
  {
    *((double *)v36 + 5) = a2;
    *((double *)v36 + 6) = a3;
    *((double *)v36 + 7) = a4;
    *((double *)v36 + 8) = a5;
    *((double *)v36 + 13) = a6;
    *((double *)v36 + 14) = a7;
    *((double *)v36 + 15) = a8;
    *((double *)v36 + 16) = a9;
    v36[9] = a17;
    v36[10] = a18;
    v36[11] = a19;
    v36[12] = a20;
    *((_DWORD *)v36 + 6) = a21;
    *((_DWORD *)v36 + 7) = a22;
    *((_DWORD *)v36 + 8) = a23;
    *((_DWORD *)v36 + 9) = a24;
    objc_storeStrong(v36 + 1, a11);
    v37[2] = a12;
  }

  return v37;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;

  -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](self, "sectionRect");
  v7 = -[PXCuratedLibrarySectionGeometryDescriptor visualPosition](self, "visualPosition") ^ (uint64_t)v3 ^ (2 * (uint64_t)v4) ^ (4 * (uint64_t)v5) ^ (8 * (uint64_t)v6);
  -[PXCuratedLibrarySectionGeometryDescriptor headerRect](self, "headerRect");
  return v7 ^ (16 * (uint64_t)v8);
}

- (BOOL)isEqual:(id)a3
{
  PXCuratedLibrarySectionGeometryDescriptor *v4;
  PXCuratedLibrarySectionGeometryDescriptor *v5;
  int64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  char v54;
  float v55;
  void *v56;
  void *v57;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v4 = (PXCuratedLibrarySectionGeometryDescriptor *)a3;
  if (v4 == self)
  {
    v54 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXCuratedLibrarySectionGeometryDescriptor visualPosition](self, "visualPosition");
      if (v6 != -[PXCuratedLibrarySectionGeometryDescriptor visualPosition](v5, "visualPosition"))
        goto LABEL_15;
      -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](self, "sectionRect");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](v5, "sectionRect");
      v62.origin.x = v15;
      v62.origin.y = v16;
      v62.size.width = v17;
      v62.size.height = v18;
      v59.origin.x = v8;
      v59.origin.y = v10;
      v59.size.width = v12;
      v59.size.height = v14;
      if (!CGRectEqualToRect(v59, v62))
        goto LABEL_15;
      -[PXCuratedLibrarySectionGeometryDescriptor headerRect](self, "headerRect");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      -[PXCuratedLibrarySectionGeometryDescriptor headerRect](v5, "headerRect");
      v63.origin.x = v27;
      v63.origin.y = v28;
      v63.size.width = v29;
      v63.size.height = v30;
      v60.origin.x = v20;
      v60.origin.y = v22;
      v60.size.width = v24;
      v60.size.height = v26;
      if (!CGRectEqualToRect(v60, v63))
        goto LABEL_15;
      -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](self, "keyAssetRect");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](v5, "keyAssetRect");
      v64.origin.x = v39;
      v64.origin.y = v40;
      v64.size.width = v41;
      v64.size.height = v42;
      v61.origin.x = v32;
      v61.origin.y = v34;
      v61.size.width = v36;
      v61.size.height = v38;
      if (CGRectEqualToRect(v61, v64))
      {
        -[PXCuratedLibrarySectionGeometryDescriptor headerCornerRadius](self, "headerCornerRadius");
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v50 = v49;
        -[PXCuratedLibrarySectionGeometryDescriptor headerCornerRadius](v5, "headerCornerRadius");
        v54 = 0;
        if (v44 == v55 && v46 == v51 && v48 == v52 && v50 == v53)
        {
          -[PXCuratedLibrarySectionGeometryDescriptor headerAsset](self, "headerAsset");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXCuratedLibrarySectionGeometryDescriptor headerAsset](v5, "headerAsset");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56 == v57)
            v54 = 1;
          else
            v54 = objc_msgSend(v56, "isEqual:", v57);

        }
      }
      else
      {
LABEL_15:
        v54 = 0;
      }

    }
    else
    {
      v54 = 0;
    }
  }

  return v54;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](self, "sectionRect");
  NSStringFromCGRect(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionGeometryDescriptor headerRect](self, "headerRect");
  NSStringFromCGRect(v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](self, "keyAssetRect");
  NSStringFromCGRect(v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionGeometryDescriptor headerCornerRadius](self, "headerCornerRadius");
  PXGCornerRadiusDescription();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionGeometryDescriptor headerAsset](self, "headerAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, sectionRect=%@ headerRect=%@ keyAssetRect=%@ headerCornerRadius=%@ headerAsset=%@ visualPosition=%ld>"), v5, self, v6, v7, v8, v9, v10, -[PXCuratedLibrarySectionGeometryDescriptor visualPosition](self, "visualPosition"));

  return v11;
}

- (PXCuratedLibrarySectionGeometryDescriptor)sectionGeometryDescriptorWithVisualPosition:(int64_t)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  void *v30;
  void *v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;

  v5 = objc_alloc((Class)objc_opt_class());
  -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](self, "sectionRect");
  v39 = v7;
  v40 = v6;
  v37 = v9;
  v38 = v8;
  -[PXCuratedLibrarySectionGeometryDescriptor headerRect](self, "headerRect");
  v35 = v11;
  v36 = v10;
  v33 = v13;
  v34 = v12;
  -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](self, "keyAssetRect");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PXCuratedLibrarySectionGeometryDescriptor headerCornerRadius](self, "headerCornerRadius");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[PXCuratedLibrarySectionGeometryDescriptor headerAsset](self, "headerAsset");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v5, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v30, a3, v40, v39, v38, v37, v36, v35, v34, v33, v15, v17, v19, v21, __PAIR64__(v25, v23), __PAIR64__(v29, v27));

  return (PXCuratedLibrarySectionGeometryDescriptor *)v31;
}

- (id)sectionGeometryDescriptorOffsetBy:(CGPoint)a3
{
  CGAffineTransform v5;

  CGAffineTransformMakeTranslation(&v5, a3.x, a3.y);
  -[PXCuratedLibrarySectionGeometryDescriptor sectionGeometryDescriptorTransformedBy:](self, "sectionGeometryDescriptorTransformedBy:", &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionGeometryDescriptorTransformedBy:(CGAffineTransform *)a3
{
  __int128 v4;
  double (**v5)(_QWORD);
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  void *v30;
  void *v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _QWORD aBlock[4];
  __int128 v42;
  __int128 v43;
  __int128 v44;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PXCuratedLibrarySectionGeometryDescriptor_sectionGeometryDescriptorTransformedBy___block_invoke;
  aBlock[3] = &__block_descriptor_80_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v4 = *(_OWORD *)&a3->c;
  v42 = *(_OWORD *)&a3->a;
  v43 = v4;
  v44 = *(_OWORD *)&a3->tx;
  v5 = (double (**)(_QWORD))_Block_copy(aBlock);
  v6 = objc_alloc((Class)objc_opt_class());
  -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](self, "sectionRect");
  v7 = v5[2](v5);
  v39 = v8;
  v40 = v7;
  v37 = v10;
  v38 = v9;
  -[PXCuratedLibrarySectionGeometryDescriptor headerRect](self, "headerRect");
  v11 = v5[2](v5);
  v35 = v12;
  v36 = v11;
  v33 = v14;
  v34 = v13;
  -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](self, "keyAssetRect");
  v15 = v5[2](v5);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PXCuratedLibrarySectionGeometryDescriptor headerCornerRadius](self, "headerCornerRadius");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[PXCuratedLibrarySectionGeometryDescriptor headerAsset](self, "headerAsset");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v6, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v30, -[PXCuratedLibrarySectionGeometryDescriptor visualPosition](self, "visualPosition"), v40, v39, v38, v37, v36, v35, v34, v33, *(_QWORD *)&v15, v17, v19, v21, __PAIR64__(v25, v23), __PAIR64__(v29, v27));

  return v31;
}

- (PXCuratedLibrarySectionGeometryDescriptor)sectionGeometryDescriptorWithMaximumHeightBelowHeader:(double)a3
{
  PXCuratedLibrarySectionGeometryDescriptor *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  void *v45;
  uint64_t v46;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v55;
  double rect;
  double rect_8;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v3 = self;
  -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](v3, "sectionRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](v3, "keyAssetRect");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  rect = v5;
  v58.origin.x = v5;
  rect_8 = v7;
  v58.origin.y = v7;
  v20 = v9;
  v58.size.width = v9;
  v58.size.height = v11;
  MaxY = CGRectGetMaxY(v58);
  v59.origin.x = v13;
  v52 = v19;
  v53 = v15;
  v59.origin.y = v15;
  v59.size.width = v17;
  v59.size.height = v19;
  v22 = MaxY - CGRectGetMaxY(v59);
  if (v22 > a3)
  {
    v23 = v11 + a3 - v22;
    -[PXCuratedLibrarySectionGeometryDescriptor headerRect](v3, "headerRect");
    v26 = v25;
    v27 = v24;
    v48 = v28;
    v30 = v29;
    v55 = v13;
    if (v24 >= 0.0)
      v31 = v24;
    else
      v31 = 0.0;
    v60.origin.x = rect;
    v60.origin.y = rect_8;
    v60.size.width = v9;
    v60.size.height = v23;
    v51 = v23;
    v32 = CGRectGetMaxY(v60);
    v61.origin.x = v26;
    v61.origin.y = v27;
    v61.size.width = v48;
    v61.size.height = v30;
    v33 = v32 - CGRectGetHeight(v61);
    if (v31 >= v33)
      v31 = v33;
    v50 = v31;
    v62.origin.x = rect;
    v62.origin.y = rect_8;
    v62.size.width = v20;
    v62.size.height = v23;
    v34 = CGRectGetMaxY(v62);
    v63.origin.x = v26;
    v63.origin.y = v31;
    v63.size.width = v48;
    v63.size.height = v30;
    v35 = v34 - CGRectGetMinY(v63);
    if (v30 < v35)
      v35 = v30;
    v49 = v35;
    v36 = objc_alloc((Class)objc_opt_class());
    -[PXCuratedLibrarySectionGeometryDescriptor headerCornerRadius](v3, "headerCornerRadius");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    -[PXCuratedLibrarySectionGeometryDescriptor headerAsset](v3, "headerAsset");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v36, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v45, -[PXCuratedLibrarySectionGeometryDescriptor visualPosition](v3, "visualPosition"), rect, rect_8, v20, v51, v26, v50, v48, v49, *(_QWORD *)&v55, *(_QWORD *)&v53, *(_QWORD *)&v17, *(_QWORD *)&v52, __PAIR64__(v40, v38), __PAIR64__(v44, v42));

    v3 = (PXCuratedLibrarySectionGeometryDescriptor *)v46;
  }
  return v3;
}

- (PXCuratedLibrarySectionGeometryDescriptor)sectionGeometryDescriptorWithHeaderRect:(CGRect)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  void *v26;
  double v28;
  double v29;
  double v30;
  double v31;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](self, "sectionRect");
  v30 = v6;
  v31 = v5;
  v28 = v8;
  v29 = v7;
  -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](self, "keyAssetRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PXCuratedLibrarySectionGeometryDescriptor headerCornerRadius](self, "headerCornerRadius");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[PXCuratedLibrarySectionGeometryDescriptor headerAsset](self, "headerAsset");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v4, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v25, -[PXCuratedLibrarySectionGeometryDescriptor visualPosition](self, "visualPosition"), v31, v30, v29, v28, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v10, v12, v14, v16, __PAIR64__(v20, v18), __PAIR64__(v24, v22));

  return (PXCuratedLibrarySectionGeometryDescriptor *)v26;
}

- (CGRect)resizeRect:(CGRect)a3 fromGeometryDesciptor:(id)a4 inContainer:(int64_t)a5 resizing:(unint64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double x;
  double y;
  double width;
  double height;
  void *v48;
  CGRect v50;
  CGRect result;

  v10 = a4;
  v11 = v10;
  if (a6)
  {
    switch(a5)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionGeometryDescriptor.m"), 141, CFSTR("Code which should be unreachable has been reached"));

        abort();
      case 1:
        objc_msgSend(v10, "sectionRect");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](self, "sectionRect");
        goto LABEL_7;
      case 2:
        objc_msgSend(v10, "headerRect");
        v13 = v32;
        v15 = v33;
        v17 = v34;
        v19 = v35;
        -[PXCuratedLibrarySectionGeometryDescriptor headerRect](self, "headerRect");
        goto LABEL_7;
      case 3:
        objc_msgSend(v10, "keyAssetRect");
        v13 = v36;
        v15 = v37;
        v17 = v38;
        v19 = v39;
        -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](self, "keyAssetRect");
LABEL_7:
        v31 = v20;
        v24 = v13;
        v25 = v21;
        v30 = v15;
        v26 = v22;
        v29 = v17;
        v27 = v23;
        v28 = v19;
        break;
      default:
        v24 = *MEMORY[0x1E0C9D628];
        v25 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v26 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v27 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        v28 = v27;
        v29 = v26;
        v30 = v25;
        v31 = *MEMORY[0x1E0C9D628];
        break;
    }
    if (!CGRectIsNull(*(CGRect *)&v24))
    {
      v50.origin.x = v31;
      v50.origin.y = v25;
      v50.size.width = v26;
      v50.size.height = v27;
      if (!CGRectIsNull(v50))
      {
        PXGResizeRect();
        a3.origin.x = v40;
        a3.origin.y = v41;
        a3.size.width = v42;
        a3.size.height = v43;
      }
    }
  }

  x = a3.origin.x;
  y = a3.origin.y;
  width = a3.size.width;
  height = a3.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadiusForRect:(CGRect)a3
{
  uint64_t i;
  int v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD aBlock[6];
  int v13;
  int v14;
  int v15;
  int v16;
  _QWORD v17[4];
  __int128 v18;
  _BYTE v19[4];
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](self, "sectionRect");
  for (i = 0; i != 4; ++i)
  {
    PXRectEdgeValue();
    PXRectEdgeValue();
    v19[i] = PXFloatApproximatelyEqualToFloat();
  }
  -[PXCuratedLibrarySectionGeometryDescriptor headerCornerRadius](self, "headerCornerRadius");
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3010000000;
  v17[3] = &unk_1A7E74EE7;
  v18 = *(_OWORD *)off_1E50B8248;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PXCuratedLibrarySectionGeometryDescriptor_cornerRadiusForRect___block_invoke;
  aBlock[3] = &unk_1E5146FA8;
  aBlock[4] = v17;
  aBlock[5] = v19;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v9 = _Block_copy(aBlock);
  (*((void (**)(void *, _QWORD, _QWORD, uint64_t))v9 + 2))(v9, 0, 0, 1);
  (*((void (**)(void *, uint64_t, uint64_t, uint64_t))v9 + 2))(v9, 1, 2, 1);
  (*((void (**)(void *, uint64_t, _QWORD, uint64_t))v9 + 2))(v9, 2, 0, 3);
  (*((void (**)(void *, uint64_t, uint64_t, uint64_t))v9 + 2))(v9, 3, 2, 3);

  _Block_object_dispose(v17, 8);
  *(_QWORD *)&result.var0.var1[2] = v11;
  *(_QWORD *)&result.var0.var0.var0 = v10;
  return result;
}

- (CGRect)sectionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sectionRect.origin.x;
  y = self->_sectionRect.origin.y;
  width = self->_sectionRect.size.width;
  height = self->_sectionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)keyAssetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyAssetRect.origin.x;
  y = self->_keyAssetRect.origin.y;
  width = self->_keyAssetRect.size.width;
  height = self->_keyAssetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)headerRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_headerRect.origin.x;
  y = self->_headerRect.origin.y;
  width = self->_headerRect.size.width;
  height = self->_headerRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)headerCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (PXDisplayAsset)headerAsset
{
  return self->_headerAsset;
}

- (int64_t)visualPosition
{
  return self->_visualPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerAsset, 0);
}

float __65__PXCuratedLibrarySectionGeometryDescriptor_cornerRadiusForRect___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4;
  float result;

  v4 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v4 + a3))
  {
    if (*(_BYTE *)(v4 + a4))
    {
      result = *(float *)(a1 + 4 * a2 + 48);
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 4 * a2 + 32) = result;
    }
  }
  return result;
}

double __84__PXCuratedLibrarySectionGeometryDescriptor_sectionGeometryDescriptorTransformedBy___block_invoke(_OWORD *a1, double a2, double a3, double a4, double a5)
{
  double v8;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  CGAffineTransform v15;

  v8 = a2;
  if (!CGRectIsNull(*(CGRect *)&a2))
  {
    v10 = a1[3];
    *(_OWORD *)&v15.a = a1[2];
    *(_OWORD *)&v15.c = v10;
    *(_OWORD *)&v15.tx = a1[4];
    v11 = v8;
    *(double *)&v10 = a3;
    v12 = a4;
    v13 = a5;
    *(_QWORD *)&v8 = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)((char *)&v10 - 8), &v15);
  }
  return v8;
}

@end
