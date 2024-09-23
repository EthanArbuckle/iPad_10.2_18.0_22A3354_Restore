@implementation PXPath

- (PXPath)initWithPoints:(CGPoint *)a3 count:(int64_t)a4
{
  PXPath *v6;
  NSMutableArray *v7;
  NSMutableArray *points;
  CGFloat *p_y;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXPath;
  v6 = -[PXPath init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    points = v6->_points;
    v6->_points = v7;

    if (a4 >= 1)
    {
      p_y = &a3->y;
      do
      {
        -[PXPath addLineToPointX:y:](v6, "addLineToPointX:y:", *(p_y - 1), *p_y);
        p_y += 2;
        --a4;
      }
      while (a4);
    }
  }
  return v6;
}

- (void)addLineToPointX:(double)a3 y:(double)a4
{
  void *v5;
  id v6;

  +[SPCCurvePoint pointWithX:y:](SPCCurvePoint, "pointWithX:y:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPath points](self, "points");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (CGRect)boundingRect
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
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
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect result;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PXPath points](self, "points", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    v6 = 0.0;
    v7 = 1.79769313e308;
    v8 = 0.0;
    v9 = 1.79769313e308;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "x");
        if (v12 < v9)
        {
          objc_msgSend(v11, "x");
          v9 = v13;
        }
        objc_msgSend(v11, "x");
        if (v14 > v6)
        {
          objc_msgSend(v11, "x");
          v6 = v15;
        }
        objc_msgSend(v11, "y");
        if (v16 < v7)
        {
          objc_msgSend(v11, "y");
          v7 = v17;
        }
        objc_msgSend(v11, "y");
        if (v18 > v8)
        {
          objc_msgSend(v11, "y");
          v8 = v19;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
    v7 = 1.79769313e308;
    v8 = 0.0;
    v9 = 1.79769313e308;
  }

  v20 = v6 - v9;
  v21 = v8 - v7;
  v22 = v9;
  v23 = v7;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (PXPath)initWithRect:(CGRect)a3 withRoundedCorners:(int)a4 cornerRadii:(id)a5 smoothPillShapes:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  CGFloat v9;
  CGFloat v10;
  id v12;
  CGPath *Mutable;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  _BOOL4 v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  double MinX;
  double MaxX;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  PXPath *v59;
  double x;
  double v62;
  double MinY;
  double v64;
  double MaxY;
  double v66;
  double v67;
  double v68;
  double y;
  double ya;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v12 = a5;
  Mutable = CGPathCreateMutable();
  objc_msgSend(v12, "objectAtIndex:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeValue");
  v16 = v15 * 1.528665;
  objc_msgSend(v12, "objectAtIndex:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeValue");
  v72 = v18 * 1.528665;

  objc_msgSend(v12, "objectAtIndex:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeValue");
  v74 = v20 * 1.528665;
  objc_msgSend(v12, "objectAtIndex:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeValue");
  y = v22;

  v23 = 3;
  objc_msgSend(v12, "objectAtIndex:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sizeValue");
  v26 = v25 * 1.528665;
  objc_msgSend(v12, "objectAtIndex:", 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sizeValue");
  v67 = v28;

  objc_msgSend(v12, "objectAtIndex:", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sizeValue");
  v31 = v30 * 1.528665;
  objc_msgSend(v12, "objectAtIndex:", 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "sizeValue");
  v73 = v33 * 1.528665;

  v34 = v74;
  v71 = v16;
  v35 = v16 + v74 >= width;
  v36 = 3;
  if (v16 + v74 >= width)
  {
    v34 = width * 0.5;
    v36 = 2;
    v23 = 1;
    v71 = width * 0.5;
  }
  v75 = v34;
  v37 = y * 1.528665;
  v38 = v67 * 1.528665;
  v39 = width * 0.5;
  if (v26 + v31 >= width)
    v40 = width * 0.5;
  else
    v40 = v31;
  if (v26 + v31 < width)
    v39 = v26;
  v66 = v39;
  v68 = v40;
  if (v26 + v31 >= width)
    v41 = 1;
  else
    v41 = 3;
  if (v26 + v31 >= width)
    v42 = 2;
  else
    v42 = 3;
  if (v26 + v31 >= width)
    v35 = 1;
  v43 = v72 + v73 >= height;
  if (v72 + v73 >= height)
  {
    v23 &= 2u;
    v42 &= 1u;
    v72 = height * 0.5;
    v73 = height * 0.5;
  }
  v44 = v37 + v38 < height;
  if (v37 + v38 >= height)
    v38 = height * 0.5;
  v62 = v38;
  if (v44)
    v45 = v36;
  else
    v45 = v36 & 1;
  if (v44)
    v46 = v41;
  else
    v46 = v41 & 2;
  v47 = !v44 || v43;
  if (!v44)
    v37 = height * 0.5;
  v64 = v37;
  v48 = v42 | v23 | v45 | v46;
  if (!v48)
    v6 = 0;
  v49 = v35 && v6;
  v76.origin.x = v10;
  v76.origin.y = v9;
  v76.size.width = width;
  v76.size.height = height;
  MinX = CGRectGetMinX(v76);
  v77.origin.x = v10;
  v77.origin.y = v9;
  v77.size.width = width;
  v77.size.height = height;
  ya = CGRectGetMinY(v77);
  v78.origin.x = v10;
  v78.origin.y = v9;
  v78.size.width = width;
  v78.size.height = height;
  MaxX = CGRectGetMaxX(v78);
  v79.origin.x = v10;
  v79.origin.y = v9;
  v79.size.width = width;
  v79.size.height = height;
  MinY = CGRectGetMinY(v79);
  v80.origin.x = v10;
  v80.origin.y = v9;
  v80.size.width = width;
  v80.size.height = height;
  v52 = CGRectGetMinX(v80);
  v81.origin.x = v10;
  v81.origin.y = v9;
  v81.size.width = width;
  v81.size.height = height;
  MaxY = CGRectGetMaxY(v81);
  v82.origin.x = v10;
  v82.origin.y = v9;
  v82.size.width = width;
  v82.size.height = height;
  v53 = CGRectGetMaxX(v82);
  v83.origin.x = v10;
  v83.origin.y = v9;
  v83.size.width = width;
  v83.size.height = height;
  v54 = CGRectGetMaxY(v83);
  if (v49 == 1)
  {
    v55 = v71;
    MinX = MinX + v71 * 0.05;
    v56 = v75;
    MaxX = MaxX - v75 * 0.05;
    v52 = v52 + v68 * 0.05;
    v53 = v53 - v66 * 0.05;
  }
  else
  {
    v55 = v71;
    if ((v47 & v6) == 1)
    {
      ya = ya + v72 * 0.05;
      MinY = MinY + v64 * 0.05;
      MaxY = MaxY - v73 * 0.05;
      v54 = v54 - v62 * 0.05;
    }
    v56 = v75;
  }
  x = v55 + MinX;
  CGPathMoveToPoint(Mutable, 0, v55 + MinX, ya);
  CGPathAddLineToPoint(Mutable, 0, MaxX - v56, MinY);
  v58 = *MEMORY[0x1E0C9D820];
  v57 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v56 != *MEMORY[0x1E0C9D820] || v64 != v57)
    -[PXPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 2, v45, 0, v48 == 0, MaxX, MinY, v56, v64, *(_QWORD *)&x);
  CGPathAddLineToPoint(Mutable, 0, v53, v54 - v62);
  if (v66 != v58 || v62 != v57)
    -[PXPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 8, v46, 0, v48 == 0, v53, v54, v66, v62);
  CGPathAddLineToPoint(Mutable, 0, v68 + v52, MaxY);
  if (v68 != v58 || v73 != v57)
    -[PXPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 4, v42, 0, v48 == 0, v52, MaxY, v68, v73);
  CGPathAddLineToPoint(Mutable, 0, MinX, v72 + ya);
  if (v71 != v58 || v72 != v57)
    -[PXPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 1, v23, 0, v48 == 0, MinX, ya, v71, v72);
  CGPathAddLineToPoint(Mutable, 0, x, ya);
  v59 = objc_alloc_init(PXPath);
  -[PXPath setCGPath:](v59, "setCGPath:", Mutable);
  CGPathRelease(Mutable);

  return v59;
}

- (void)addContinuousCornerToPath:(CGPath *)a3 trueCorner:(CGPoint)a4 cornerRadius:(CGSize)a5 corners:(unint64_t)a6 portion:(unint64_t)a7 clockwise:(BOOL)a8 fullRadius:(BOOL)a9
{
  _BOOL4 v9;
  char v10;
  double x;
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
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGPath *v51;
  CGAffineTransform *p_m;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGPath *v59;
  CGAffineTransform *v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGPath *v67;
  CGAffineTransform *v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  CGFloat v91;
  CGFloat v92;
  double height;
  double v94;
  double v95;
  double v96;
  CGAffineTransform m;

  v9 = a8;
  v10 = a7;
  x = a4.x;
  if (a5.width < a5.height)
    a5.height = a5.width;
  v14 = 0.980263;
  if (a9)
    v14 = 1.0;
  height = a5.height;
  if (a9)
    v15 = a5.height;
  else
    v15 = a5.height * 0.95;
  v95 = v14;
  v16 = 0.0;
  if (a6 - 1 <= 3)
    v16 = dbl_1A7C0A0C0[a6 - 1];
  v17 = v15 * (1.0 - v14);
  if (a7 == 2)
  {
    v96 = v16;
    v18 = -v17;
    v94 = 70.0;
    v19 = *MEMORY[0x1E0C9D538];
  }
  else if (a7 == 1)
  {
    v96 = v16 + 20.0;
    v19 = -v17;
    v94 = 70.0;
    v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else if (a7)
  {
    v96 = v16 + 20.0;
    v94 = 50.0;
    v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v19 = *MEMORY[0x1E0C9D538];
    v15 = v15 / 1.528665;
  }
  else
  {
    v96 = v16;
    v18 = -v17;
    v94 = 90.0;
    v19 = -v17;
  }
  v20 = _interiorPointForCorner(a6, v19, v18, *MEMORY[0x1E0C9D538]);
  v91 = v21;
  v92 = v20;
  v22 = v15 * 0.33 * 0.666666667;
  v23 = v22 * 1.05304313;
  v24 = v22 * 0.33 / 1.05304313;
  v25 = (v15 / 1.05304313 + v24) * 0.67;
  v26 = v23 + v25;
  v27 = v23 + v23 + v25;
  v28 = v23 + v23 + v27;
  v29 = v25 + v24 * 0.33;
  v89 = _interiorPointForCorner(a6, v27, 0.0, x);
  v90 = v30;
  v87 = _interiorPointForCorner(a6, v26, 0.0, x);
  v88 = v31;
  v32 = _interiorPointForCorner(a6, v29, v24, x);
  v79 = v33;
  v80 = v32;
  v34 = _interiorPointForCorner(a6, v24, v29, x);
  v75 = v35;
  v76 = v34;
  v85 = _interiorPointForCorner(a6, 0.0, v26, x);
  v86 = v36;
  v83 = _interiorPointForCorner(a6, 0.0, v27, x);
  v84 = v37;
  v38 = _interiorPointForCorner(a6, 0.0, v28, x);
  v81 = v39;
  v82 = v38;
  v40 = _interiorPointForCorner(a6, v28, 0.0, x);
  v77 = v41;
  v78 = v40;
  v42 = _interiorPointForCorner(a6, v15, v15, x);
  v44 = v43;
  v45 = _interiorPointForCorner(a6, height, 0.0, x);
  v47 = v46;
  v48 = _interiorPointForCorner(a6, 0.0, height, x);
  v50 = v49;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&m, v92, v91);
  if (v9)
  {
    if ((v10 & 1) != 0)
    {
      p_m = &m;
      v51 = a3;
      v53 = v83;
      v54 = v84;
      v55 = v85;
      v56 = v86;
      v58 = v75;
      v57 = v76;
    }
    else
    {
      v51 = a3;
      p_m = 0;
      v53 = v48;
      v54 = v50;
      v55 = v48;
      v56 = v50;
      v57 = v48;
      v58 = v50;
    }
    CGPathAddCurveToPoint(v51, p_m, v53, v54, v55, v56, v57, v58);
    CGPathAddArc(a3, &m, v42, v44, v95 * v15, (v94 + v96) * 0.0174532925, v96 * 0.0174532925, 1);
    if ((v10 & 2) != 0)
    {
      v68 = &m;
      v67 = a3;
      v69 = v87;
      v70 = v88;
      v71 = v89;
      v72 = v90;
      v74 = v77;
      v73 = v78;
    }
    else
    {
      v67 = a3;
      v68 = 0;
      v69 = v45;
      v70 = v47;
      v71 = v45;
      v72 = v47;
      v73 = v45;
      v74 = v47;
    }
  }
  else
  {
    if ((v10 & 1) != 0)
    {
      v60 = &m;
      v59 = a3;
      v61 = v89;
      v62 = v90;
      v63 = v87;
      v64 = v88;
      v66 = v79;
      v65 = v80;
    }
    else
    {
      v59 = a3;
      v60 = 0;
      v61 = v45;
      v62 = v47;
      v63 = v45;
      v64 = v47;
      v65 = v45;
      v66 = v47;
    }
    CGPathAddCurveToPoint(v59, v60, v61, v62, v63, v64, v65, v66);
    CGPathAddArc(a3, &m, v42, v44, v95 * v15, v96 * 0.0174532925, (v94 + v96) * 0.0174532925, 0);
    if ((v10 & 2) != 0)
    {
      v68 = &m;
      v67 = a3;
      v69 = v85;
      v70 = v86;
      v71 = v83;
      v72 = v84;
      v74 = v81;
      v73 = v82;
    }
    else
    {
      v67 = a3;
      v68 = 0;
      v69 = v48;
      v70 = v50;
      v71 = v48;
      v72 = v50;
      v73 = v48;
      v74 = v50;
    }
  }
  CGPathAddCurveToPoint(v67, v68, v69, v70, v71, v72, v73, v74);
}

- (CGPath)CGPath
{
  return (CGPath *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCGPath:(CGPath *)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
  objc_storeStrong((id *)&self->_points, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_points, 0);
}

+ (id)pathWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  void *v11;
  _QWORD v13[3];
  CGFloat MaxY;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = *MEMORY[0x1E0C80C00];
  MinX = CGRectGetMinX(a3);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MinY = CGRectGetMinY(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MaxX = CGRectGetMaxX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  *(CGFloat *)v13 = MinX;
  *(CGFloat *)&v13[1] = MinY;
  *(CGFloat *)&v13[2] = MinX;
  MaxY = CGRectGetMaxY(v22);
  v15 = MaxX;
  v16 = MaxY;
  v17 = MaxX;
  v18 = MinY;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPoints:count:", v13, 4);
  objc_msgSend(v11, "closeSubpath");
  return v11;
}

+ (id)pathWithEllipseInRect:(CGRect)a3
{
  return objc_alloc_init((Class)a1);
}

+ (id)pathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", a4, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc((Class)a1);
  v14[0] = v9;
  v14[1] = v9;
  v14[2] = v9;
  v14[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithRect:withRoundedCorners:cornerRadii:smoothPillShapes:", 255, v11, 1, x, y, width, height);

  return v12;
}

@end
