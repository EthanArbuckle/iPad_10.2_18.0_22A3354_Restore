@implementation PKRoundedPath

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_CGPath);
  v3.receiver = self;
  v3.super_class = (Class)PKRoundedPath;
  -[PKRoundedPath dealloc](&v3, sel_dealloc);
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

- (PKRoundedPath)init
{

  return 0;
}

- (PKRoundedPath)initWithRect:(CGRect)a3 withRoundedCorners:(int)a4 cornerRadii:(id)a5 smoothPillShapes:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  CGFloat v9;
  CGFloat x;
  id v12;
  PKRoundedPath *v13;
  CGPath *Mutable;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  _BOOL4 v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL4 v41;
  uint64_t v42;
  int v43;
  double MinX;
  double MaxX;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double MaxY;
  double v64;
  double MinY;
  double y;
  double ya;
  double v68;
  double v69;
  double v70;
  objc_super v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  v9 = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v71.receiver = self;
  v71.super_class = (Class)PKRoundedPath;
  v13 = -[PKRoundedPath init](&v71, sel_init);
  if (v13)
  {
    Mutable = CGPathCreateMutable();
    objc_msgSend(v12, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeValue");
    v17 = v16 * 1.528665;
    objc_msgSend(v12, "objectAtIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeValue");
    v64 = v19;

    objc_msgSend(v12, "objectAtIndex:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeValue");
    v22 = v21 * 1.528665;
    objc_msgSend(v12, "objectAtIndex:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sizeValue");
    y = v24;

    v25 = 3;
    objc_msgSend(v12, "objectAtIndex:", 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sizeValue");
    v69 = v27 * 1.528665;
    objc_msgSend(v12, "objectAtIndex:", 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sizeValue");
    v62 = v29;

    objc_msgSend(v12, "objectAtIndex:", 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sizeValue");
    v70 = v31 * 1.528665;
    objc_msgSend(v12, "objectAtIndex:", 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sizeValue");
    v34 = v33;

    v68 = v17;
    v35 = v17 + v22 >= width;
    v36 = 3;
    if (v17 + v22 >= width)
    {
      v22 = width * 0.5;
      v36 = 2;
      v25 = 1;
      v68 = width * 0.5;
    }
    v37 = v64 * 1.528665;
    v38 = v34 * 1.528665;
    if (v69 + v70 >= width)
    {
      v39 = 1;
      v40 = 2;
      v69 = width * 0.5;
      v70 = width * 0.5;
      v35 = 1;
    }
    else
    {
      v39 = 3;
      v40 = 3;
    }
    v41 = v37 + v38 >= height;
    if (v37 + v38 >= height)
    {
      v38 = height * 0.5;
      v25 &= 2u;
      v40 &= 1u;
      v37 = height * 0.5;
    }
    v57 = v22;
    v60 = v38;
    v61 = v37;
    if (y * 1.528665 + v62 * 1.528665 >= height)
    {
      v36 &= 1u;
      v39 &= 2u;
      v41 = 1;
      v58 = height * 0.5;
      v59 = height * 0.5;
    }
    else
    {
      v58 = y * 1.528665;
      v59 = v62 * 1.528665;
    }
    v55 = v25;
    v42 = v40 | v25 | v36 | v39;
    if (!v42)
      v6 = 0;
    v43 = v35 && v6;
    v72.origin.x = x;
    v72.origin.y = v9;
    v72.size.width = width;
    v72.size.height = height;
    MinX = CGRectGetMinX(v72);
    v73.origin.x = x;
    v73.origin.y = v9;
    v73.size.width = width;
    v73.size.height = height;
    ya = CGRectGetMinY(v73);
    v74.origin.x = x;
    v74.origin.y = v9;
    v74.size.width = width;
    v74.size.height = height;
    MaxX = CGRectGetMaxX(v74);
    v75.origin.x = x;
    v75.origin.y = v9;
    v75.size.width = width;
    v75.size.height = height;
    MinY = CGRectGetMinY(v75);
    v76.origin.x = x;
    v76.origin.y = v9;
    v76.size.width = width;
    v76.size.height = height;
    v46 = CGRectGetMinX(v76);
    v77.origin.x = x;
    v77.origin.y = v9;
    v77.size.width = width;
    v77.size.height = height;
    MaxY = CGRectGetMaxY(v77);
    v78.origin.x = x;
    v78.origin.y = v9;
    v78.size.width = width;
    v78.size.height = height;
    v47 = CGRectGetMaxX(v78);
    v79.origin.x = x;
    v79.origin.y = v9;
    v79.size.width = width;
    v79.size.height = height;
    v48 = CGRectGetMaxY(v79);
    if (v43 == 1)
    {
      v49 = v68;
      MinX = MinX + v68 * 0.05;
      v50 = v57;
      MaxX = MaxX - v57 * 0.05;
      v46 = v46 + v70 * 0.05;
      v47 = v47 - v69 * 0.05;
    }
    else
    {
      v49 = v68;
      if (v41 && v6)
      {
        MinY = MinY + v58 * 0.05;
        ya = ya + v61 * 0.05;
        MaxY = MaxY - v60 * 0.05;
        v48 = v48 - v59 * 0.05;
      }
      v50 = v57;
    }
    v56 = MinX;
    v51 = v49 + MinX;
    CGPathMoveToPoint(Mutable, 0, v51, ya);
    CGPathAddLineToPoint(Mutable, 0, MaxX - v50, MinY);
    v53 = *MEMORY[0x1E0C9D820];
    v52 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v50 != *MEMORY[0x1E0C9D820] || v58 != v52)
      -[PKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](v13, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 2, v36, 0, v42 == 0, MaxX, MinY, v50, v58);
    CGPathAddLineToPoint(Mutable, 0, v47, v48 - v59);
    if (v69 != v53 || v59 != v52)
      -[PKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](v13, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 8, v39, 0, v42 == 0, v47, v48, v69, v59);
    CGPathAddLineToPoint(Mutable, 0, v70 + v46, MaxY);
    if (v70 != v53 || v60 != v52)
      -[PKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](v13, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 4, v40, 0, v42 == 0, v46, MaxY, v70, v60);
    CGPathAddLineToPoint(Mutable, 0, v56, v61 + ya);
    if (v68 != v53 || v61 != v52)
      -[PKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](v13, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 1, v55, 0, v42 == 0, v56, ya, v68, v61);
    CGPathAddLineToPoint(Mutable, 0, v51, ya);
    v13->_CGPath = Mutable;
  }

  return v13;
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
    v16 = dbl_190455590[a6 - 1];
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
  return self->_CGPath;
}

@end
