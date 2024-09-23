@implementation PUTileLayoutInfo

- (UIEdgeInsets)cropInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)parallaxOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (PUTileLayoutInfo)init
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  _OWORD v8[3];

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", 0, v8, 0, v2, v3, v4, v5, 0.0, 0.0);
}

- (PUTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9
{
  __int128 v9;
  _OWORD v11[3];

  v9 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a7->tx;
  return -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:", a3, v11, a9, a4.x, a4.y, a5.width, a5.height, a6, a8, 0, 0, 0x3FF0000000000000, 0x3FF0000000000000, *MEMORY[0x1E0DC49E8], *(_QWORD *)(MEMORY[0x1E0DC49E8] + 8), *(_QWORD *)(MEMORY[0x1E0DC49E8] + 16), *(_QWORD *)(MEMORY[0x1E0DC49E8] + 24));
}

- (PUTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 contentsRect:(CGRect)a9 coordinateSystem:(id)a10
{
  __int128 v10;
  _OWORD v12[3];

  v10 = *(_OWORD *)&a7->c;
  v12[0] = *(_OWORD *)&a7->a;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a7->tx;
  return -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:](self, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:", a3, 0, 0, 0, v12, a10, a4.x, a4.y, a5.width, a5.height, a6, 0.0, 0.0, a8, *(_QWORD *)&a9.origin.x, *(_QWORD *)&a9.origin.y,
           *(_QWORD *)&a9.size.width,
           *(_QWORD *)&a9.size.height,
           *MEMORY[0x1E0DC49E8],
           *(_QWORD *)(MEMORY[0x1E0DC49E8] + 8),
           *(_QWORD *)(MEMORY[0x1E0DC49E8] + 16),
           *(_QWORD *)(MEMORY[0x1E0DC49E8] + 24));
}

- (uint64_t)initWithTileIdentifier:(double)a3 center:(double)a4 size:(double)a5 alpha:(double)a6 transform:(double)a7 zPosition:(uint64_t)a8 contentsRect:(uint64_t)a9 hitTestOutset:(_OWORD *)a10 coordinateSystem:(uint64_t)a11
{
  __int128 v20;
  _OWORD v22[3];

  v20 = a10[1];
  v22[0] = *a10;
  v22[1] = v20;
  v22[2] = a10[2];
  return objc_msgSend(a1, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:", a9, 0, 0, 0, v22, a11, a2, a3, a4, a5, a6, 0.0, 0.0, a7, a15, a16,
           a17,
           a18,
           a19,
           a20);
}

- (PUTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 cornerRadius:(double)a7 cornerCurve:(id)a8 cornerMask:(unint64_t)a9 transform:(CGAffineTransform *)a10 zPosition:(double)a11 contentsRect:(CGRect)a12 coordinateSystem:(id)a13
{
  __int128 v13;
  _OWORD v15[3];

  v13 = *(_OWORD *)&a10->c;
  v15[0] = *(_OWORD *)&a10->a;
  v15[1] = v13;
  v15[2] = *(_OWORD *)&a10->tx;
  return -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:](self, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:", a3, a8, a9, 0, v15, a13, a4.x, a4.y, a5.width, a5.height, a6, a7, 0.0, a11, *(_QWORD *)&a12.origin.x, *(_QWORD *)&a12.origin.y,
           *(_QWORD *)&a12.size.width,
           *(_QWORD *)&a12.size.height,
           *MEMORY[0x1E0DC49E8],
           *(_QWORD *)(MEMORY[0x1E0DC49E8] + 8),
           *(_QWORD *)(MEMORY[0x1E0DC49E8] + 16),
           *(_QWORD *)(MEMORY[0x1E0DC49E8] + 24));
}

- (id)initWithTileIdentifier:(void *)a3 center:(void *)a4 size:(void *)a5 alpha:(void *)a6 cornerRadius:(__int128 *)a7 cornerCurve:(void *)a8 cornerMask:(double)a9 borderWidth:(double)a10 borderColor:(double)a11 transform:(double)a12 zPosition:(double)a13 contentsRect:(double)a14 hitTestOutset:(double)a15 coordinateSystem:(double)a16
{
  id v39;
  id v40;
  id v41;
  id v42;
  id *v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  void *v49;
  void *v51;
  objc_super v52;

  v39 = a3;
  v40 = a4;
  v41 = a6;
  v42 = a8;
  v52.receiver = a1;
  v52.super_class = (Class)PUTileLayoutInfo;
  v43 = (id *)objc_msgSendSuper2(&v52, sel_init);
  if (v43)
  {
    if (!v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, v43, CFSTR("PUTileLayoutInfo.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileIdentifier != nil"));

    }
    if (!v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, v43, CFSTR("PUTileLayoutInfo.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinateSystem != nil"));

    }
    objc_storeStrong(v43 + 1, a3);
    *((double *)v43 + 10) = a9;
    *((double *)v43 + 11) = a10;
    *((double *)v43 + 12) = a11;
    *((double *)v43 + 13) = a12;
    *((double *)v43 + 2) = a13;
    *((double *)v43 + 3) = a14;
    v44 = objc_msgSend(v40, "copy");
    v45 = v43[4];
    v43[4] = (id)v44;

    v43[7] = a5;
    *((double *)v43 + 5) = a15;
    objc_storeStrong(v43 + 6, a6);
    v46 = *a7;
    v47 = a7[2];
    *((_OWORD *)v43 + 14) = a7[1];
    *((_OWORD *)v43 + 15) = v47;
    *((_OWORD *)v43 + 13) = v46;
    *((double *)v43 + 8) = a16;
    v43[14] = a17;
    v43[15] = a18;
    v43[16] = a19;
    v43[17] = a20;
    v43[18] = a21;
    v43[19] = a22;
    v43[20] = a23;
    v43[21] = a24;
    objc_storeStrong(v43 + 9, a8);
  }

  return v43;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PUTileIdentifier isEqual:](self->_tileIdentifier, "isEqual:", v4[1]);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)dataSourceIdentifier
{
  void *v2;
  void *v3;

  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)tileKind
{
  void *v2;
  void *v3;

  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tileKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSIndexPath)indexPath
{
  void *v2;
  void *v3;

  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexPath *)v3;
}

- (id)clone
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _BYTE v43[48];

  v3 = objc_alloc((Class)objc_opt_class());
  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo center](self, "center");
  v41 = v6;
  v42 = v5;
  -[PUTileLayoutInfo size](self, "size");
  v39 = v8;
  v40 = v7;
  -[PUTileLayoutInfo alpha](self, "alpha");
  v38 = v9;
  -[PUTileLayoutInfo cornerRadius](self, "cornerRadius");
  v37 = v10;
  -[PUTileLayoutInfo cornerCurve](self, "cornerCurve");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUTileLayoutInfo cornerMask](self, "cornerMask");
  -[PUTileLayoutInfo borderWidth](self, "borderWidth");
  v36 = v13;
  -[PUTileLayoutInfo borderColor](self, "borderColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo transform](self, "transform");
  -[PUTileLayoutInfo zPosition](self, "zPosition");
  v35 = v15;
  -[PUTileLayoutInfo contentsRect](self, "contentsRect");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[PUTileLayoutInfo hitTestOutset](self, "hitTestOutset");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v3, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:", v4, v11, v12, v14, v43, v32, v42, v41, v40, v39, v38, v37, v36, v35, v17, v19,
                  v21,
                  v23,
                  v25,
                  v27,
                  v29,
                  v31);

  -[PUTileLayoutInfo expandedRectInsets](self, "expandedRectInsets");
  objc_msgSend(v33, "setExpandedRectInsets:");
  return v33;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  void *v28;
  char v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  int v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  BOOL v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGAffineTransform v73;
  CGAffineTransform t1;
  CGRect v75;
  CGRect v76;

  v4 = a3;
  if (!v4)
    goto LABEL_31;
  -[PUTileLayoutInfo size](self, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "size");
  if (v6 != v10 || v8 != v9)
    goto LABEL_31;
  -[PUTileLayoutInfo alpha](self, "alpha");
  v13 = v12;
  objc_msgSend(v4, "alpha");
  if (v13 != v14)
    goto LABEL_31;
  -[PUTileLayoutInfo cornerRadius](self, "cornerRadius");
  v16 = v15;
  objc_msgSend(v4, "cornerRadius");
  if (v16 != v17)
    goto LABEL_31;
  -[PUTileLayoutInfo cornerCurve](self, "cornerCurve");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerCurve");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v18 == v19)
  {

  }
  else
  {
    v20 = v19;
    v21 = objc_msgSend(v18, "isEqualToString:", v19);

    if ((v21 & 1) == 0)
      goto LABEL_31;
  }
  v22 = -[PUTileLayoutInfo cornerMask](self, "cornerMask");
  if (v22 != objc_msgSend(v4, "cornerMask"))
    goto LABEL_31;
  -[PUTileLayoutInfo borderWidth](self, "borderWidth");
  v24 = v23;
  objc_msgSend(v4, "borderWidth");
  if (v24 != v25)
    goto LABEL_31;
  -[PUTileLayoutInfo borderColor](self, "borderColor");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "borderColor");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (v26 == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = objc_msgSend(v26, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_31;
  }
  -[PUTileLayoutInfo transform](self, "transform");
  objc_msgSend(v4, "transform");
  if (!CGAffineTransformEqualToTransform(&t1, &v73))
    goto LABEL_31;
  -[PUTileLayoutInfo zPosition](self, "zPosition");
  v31 = v30;
  objc_msgSend(v4, "zPosition");
  if (v31 != v32)
    goto LABEL_31;
  objc_msgSend(v4, "coordinateSystem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = PUCanConvertFromCoordinateSystemToCoordinateSystem(v33, v34);

  if (!v35)
    goto LABEL_31;
  -[PUTileLayoutInfo contentsRect](self, "contentsRect");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  objc_msgSend(v4, "contentsRect");
  v76.origin.x = v44;
  v76.origin.y = v45;
  v76.size.width = v46;
  v76.size.height = v47;
  v75.origin.x = v37;
  v75.origin.y = v39;
  v75.size.width = v41;
  v75.size.height = v43;
  if (!CGRectEqualToRect(v75, v76))
    goto LABEL_31;
  -[PUTileLayoutInfo hitTestOutset](self, "hitTestOutset");
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;
  objc_msgSend(v4, "hitTestOutset");
  v59 = 0;
  if (v51 == v60 && v49 == v56 && v55 == v58 && v53 == v57)
  {
    -[PUTileLayoutInfo expandedRectInsets](self, "expandedRectInsets");
    objc_msgSend(v4, "expandedRectInsets");
    if (!PXEdgeInsetsEqualToEdgeInsets())
    {
LABEL_31:
      v59 = 0;
      goto LABEL_32;
    }
    objc_msgSend(v4, "center");
    v62 = v61;
    v64 = v63;
    objc_msgSend(v4, "coordinateSystem");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v65, v66, v62, v64);
    v69 = v68;

    -[PUTileLayoutInfo center](self, "center");
    v59 = v71 == v69 && v70 == v67;
  }
LABEL_32:

  return v59;
}

- (PUTileLayoutInfo)layoutInfoWithCoordinateSystem:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  -[PUTileLayoutInfo clone](self, "clone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo center](self, "center");
  v7 = v6;
  v9 = v8;
  -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v10, v4, v7, v9);
  v13 = v12;

  objc_msgSend(v5, "_setCenter:", v11, v13);
  objc_msgSend(v5, "_setCoordinateSystem:", v4);

  return (PUTileLayoutInfo *)v5;
}

- (PUTileLayoutInfo)layoutInfoWithIndexPath:(id)a3 tileKind:(id)a4 dataSourceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PUTileIdentifier *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUTileLayoutInfo clone](self, "clone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUTileIdentifier initWithIndexPath:tileKind:dataSourceIdentifier:]([PUTileIdentifier alloc], "initWithIndexPath:tileKind:dataSourceIdentifier:", v10, v9, v8);

  objc_msgSend(v11, "_setTileIdentifier:", v12);
  return (PUTileLayoutInfo *)v11;
}

- (PUTileLayoutInfo)layoutInfoWithAlpha:(double)a3
{
  void *v4;

  -[PUTileLayoutInfo clone](self, "clone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAlpha:", a3);
  return (PUTileLayoutInfo *)v4;
}

- (PUTileLayoutInfo)layoutInfoWithZPosition:(double)a3
{
  void *v4;

  -[PUTileLayoutInfo clone](self, "clone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setZPosition:", a3);
  return (PUTileLayoutInfo *)v4;
}

- (PUTileLayoutInfo)layoutInfoWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  __int128 v11;
  _OWORD v13[3];

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  -[PUTileLayoutInfo clone](self, "clone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setCenter:", x, y);
  objc_msgSend(v10, "_setSize:", width, height);
  v11 = *(_OWORD *)&a5->c;
  v13[0] = *(_OWORD *)&a5->a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&a5->tx;
  objc_msgSend(v10, "_setTransform:", v13);
  return (PUTileLayoutInfo *)v10;
}

- (PUTileLayoutInfo)layoutInfoWithCenter:(CGPoint)a3 size:(CGSize)a4 alpha:(double)a5 transform:(CGAffineTransform *)a6 zPosition:(double)a7 coordinateSystem:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  __int128 v18;
  _OWORD v20[3];

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  v16 = a8;
  -[PUTileLayoutInfo clone](self, "clone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setCenter:", x, y);
  objc_msgSend(v17, "_setSize:", width, height);
  objc_msgSend(v17, "_setAlpha:", a5);
  v18 = *(_OWORD *)&a6->c;
  v20[0] = *(_OWORD *)&a6->a;
  v20[1] = v18;
  v20[2] = *(_OWORD *)&a6->tx;
  objc_msgSend(v17, "_setTransform:", v20);
  objc_msgSend(v17, "_setZPosition:", a7);
  objc_msgSend(v17, "_setCoordinateSystem:", v16);

  return (PUTileLayoutInfo *)v17;
}

- (id)layoutInfoByInterpolatingWithLayoutInfo:(id)a3 mixFactor:(double)a4 coordinateSystem:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v55;
  double v56;
  double v57;
  float64x2_t v58;
  double v59;
  float64x2_t v60;
  double v61;
  float64x2_t v62;
  _OWORD v64[3];
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;

  v7 = a3;
  v8 = a5;
  -[PUTileLayoutInfo center](self, "center");
  v10 = v9;
  v12 = v11;
  -[PUTileLayoutInfo coordinateSystem](self, "coordinateSystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v13, v8, v10, v12);
  v61 = v14;

  objc_msgSend(v7, "center");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v7, "coordinateSystem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v19, v8, v16, v18);
  v57 = v20;

  -[PUTileLayoutInfo size](self, "size");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v7, "size");
  v26 = v25;
  v28 = v27;
  -[PUTileLayoutInfo alpha](self, "alpha");
  v30 = v29;
  objc_msgSend(v7, "alpha");
  v32 = v31;
  -[PUTileLayoutInfo cornerRadius](self, "cornerRadius");
  v34 = v33;
  objc_msgSend(v7, "cornerRadius");
  v36 = v35;
  objc_msgSend(v7, "cornerCurve");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v7, "cornerMask");
  -[PUTileLayoutInfo transform](self, "transform");
  if (v7)
  {
    objc_msgSend(v7, "transform");
    v41 = v65;
    v40 = v66;
    v42 = v67;
  }
  else
  {
    v42 = 0uLL;
    v66 = 0u;
    v67 = 0u;
    v65 = 0u;
    v40 = 0uLL;
    v41 = 0uLL;
  }
  v43 = v36 * a4 + (1.0 - a4) * v34;
  v44 = v32 * a4 + (1.0 - a4) * v30;
  v45 = v26 * a4 + (1.0 - a4) * v22;
  v46 = v28 * a4 + (1.0 - a4) * v24;
  v47 = v56 * a4 + (1.0 - a4) * v59;
  v48 = v57 * a4 + (1.0 - a4) * v61;
  v60 = vmlaq_n_f64(vmulq_n_f64(v40, a4), v69, 1.0 - a4);
  v62 = vmlaq_n_f64(vmulq_n_f64(v41, a4), v68, 1.0 - a4);
  v58 = vmlaq_n_f64(vmulq_n_f64(v42, a4), v70, 1.0 - a4);
  -[PUTileLayoutInfo zPosition](self, "zPosition", 1.0 - a4, v39);
  v50 = v49;
  objc_msgSend(v7, "zPosition");
  v52 = v51 * a4 + v55 * v50;
  -[PUTileLayoutInfo clone](self, "clone");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "_setCenter:", v47, v48);
  objc_msgSend(v53, "_setSize:", v45, v46);
  objc_msgSend(v53, "_setAlpha:", v44);
  objc_msgSend(v53, "_setCornerRadius:", v43);
  objc_msgSend(v53, "_setCornerCurve:", v37);
  objc_msgSend(v53, "_setCornerMask:", v38);
  v64[0] = v62;
  v64[1] = v60;
  v64[2] = v58;
  objc_msgSend(v53, "_setTransform:", v64);
  objc_msgSend(v53, "_setZPosition:", v52);
  objc_msgSend(v53, "_setCoordinateSystem:", v8);

  return v53;
}

- (CGRect)frame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  -[PUTileLayoutInfo size](self, "size");
  v4 = v3;
  v6 = v5;
  v7 = *MEMORY[0x1E0C9D538] - v3 * 0.5;
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8) - v5 * 0.5;
  -[PUTileLayoutInfo transform](self, "transform");
  v20.origin.x = v7;
  v20.origin.y = v8;
  v20.size.width = v4;
  v20.size.height = v6;
  v21 = CGRectApplyAffineTransform(v20, &v19);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  -[PUTileLayoutInfo center](self, "center");
  v14 = x + v13;
  v16 = y + v15;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v14;
  return result;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  CGAffineTransform transform;
  CGPoint v26;
  CGSize v27;
  CGRect v28;
  UIEdgeInsets v29;

  v24 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo tileIdentifier](self, "tileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo center](self, "center");
  NSStringFromCGPoint(v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo size](self, "size");
  NSStringFromCGSize(v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo alpha](self, "alpha");
  v8 = v7;
  -[PUTileLayoutInfo cornerRadius](self, "cornerRadius");
  v10 = v9;
  -[PUTileLayoutInfo cornerCurve](self, "cornerCurve");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUTileLayoutInfo cornerMask](self, "cornerMask");
  -[PUTileLayoutInfo borderWidth](self, "borderWidth");
  v14 = v13;
  -[PUTileLayoutInfo borderColor](self, "borderColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo transform](self, "transform");
  NSStringFromCGAffineTransform(&transform);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo zPosition](self, "zPosition");
  v18 = v17;
  -[PUTileLayoutInfo contentsRect](self, "contentsRect");
  NSStringFromCGRect(v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileLayoutInfo hitTestOutset](self, "hitTestOutset");
  NSStringFromUIEdgeInsets(v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p; tileIdentifier: %@; center: %@; size: %@; alpha: %f; cornerRadius: %f, cornerCurve: %@, cornerMask: %lu, borderWidth:%f, borderColor:%@, transform: %@; zPosition: %f; contentsRect: %@ hitExtensionInsets: %@>"),
    v23,
    self,
    v4,
    v5,
    v6,
    v8,
    v10,
    v11,
    v12,
    v14,
    v15,
    v16,
    v18,
    v19,
    v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (PUTileIdentifier)tileIdentifier
{
  return self->_tileIdentifier;
}

- (void)_setTileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_tileIdentifier, a3);
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)_setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (void)_setCornerCurve:(id)a3
{
  objc_storeStrong((id *)&self->_cornerCurve, a3);
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (void)_setCornerMask:(unint64_t)a3
{
  self->_cornerMask = a3;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].a;
  return self;
}

- (void)_setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (void)_setZPosition:(double)a3
{
  self->_zPosition = a3;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIEdgeInsets)hitTestOutset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestOutset.top;
  left = self->_hitTestOutset.left;
  bottom = self->_hitTestOutset.bottom;
  right = self->_hitTestOutset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PUTilingCoordinateSystem)coordinateSystem
{
  return self->_coordinateSystem;
}

- (void)_setCoordinateSystem:(id)a3
{
  objc_storeStrong((id *)&self->_coordinateSystem, a3);
}

- (UIEdgeInsets)expandedRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_expandedRectInsets.top;
  left = self->_expandedRectInsets.left;
  bottom = self->_expandedRectInsets.bottom;
  right = self->_expandedRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setExpandedRectInsets:(UIEdgeInsets)a3
{
  self->_expandedRectInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSystem, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_cornerCurve, 0);
  objc_storeStrong((id *)&self->_tileIdentifier, 0);
}

@end
