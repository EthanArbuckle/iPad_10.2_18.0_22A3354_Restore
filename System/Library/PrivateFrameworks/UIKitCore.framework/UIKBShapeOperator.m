@implementation UIKBShapeOperator

- (id)shapeByScalingShape:(id)a3 factor:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  UIKBShape *v12;
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
  UIKBShape *v30;
  void *v31;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    goto LABEL_9;
  if (!objc_msgSend(v7, "scaled"))
  {
    objc_msgSend(v8, "frame");
    -[UIKBShapeOperator _scaleRect:factor:](self, "_scaleRect:factor:");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v8, "paddedFrame");
    -[UIKBShapeOperator _scaleRect:factor:](self, "_scaleRect:factor:");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = [UIKBShape alloc];
    objc_msgSend(v8, "geometry");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v30, "initWithGeometry:frame:paddedFrame:", v31, v15, v17, v19, v21, v23, v25, v27, v29);

    -[UIKBShape setScaled:](v12, "setScaled:", 1);
    -[UIKBShape setOriginalShape:](v12, "setOriginalShape:", v8);
    goto LABEL_10;
  }
  objc_msgSend(v8, "originalShape");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "originalShape");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBShapeOperator shapeByScalingShape:factor:](self, "shapeByScalingShape:factor:", v11, width, height);
    v12 = (UIKBShape *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_9:
    v12 = v8;
  }
LABEL_10:

  return v12;
}

- (id)shapesByScalingShapes:(id)a3 factor:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  uint64_t i;
  void *v20;
  UIKBShape *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double MidX;
  _BOOL4 v36;
  CGFloat MidY;
  _BOOL4 v38;
  double MaxY;
  double MinY;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double MaxX;
  double MinX;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  UIKBShape *v65;
  void *v66;
  void *v68;
  CGRect v69;
  double v70;
  double v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  double rect;
  double v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint64_t v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  height = a4.height;
  width = a4.width;
  v83 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!v7 || (width == *MEMORY[0x1E0C9D820] ? (v9 = height == *(double *)(MEMORY[0x1E0C9D820] + 8)) : (v9 = 0), v9))
  {
    v10 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v68 = v8;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v15 = *(_QWORD *)v79;
      v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v69.size.width = v14;
      v69.size.height = v16;
      v17 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v69.origin.x = *(CGFloat *)MEMORY[0x1E0C9D628];
      v69.origin.y = v17;
      v18 = *MEMORY[0x1E0C9D628];
      v70 = width;
      v71 = height;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v79 != v15)
            objc_enumerationMutation(v11);
          v20 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          if (objc_msgSend(v20, "shouldUseGeometry", v68))
          {
            -[UIKBShapeOperator geometryByScalingShapeGeometry:factor:](self, "geometryByScalingShapeGeometry:factor:", v20, width, height);
            v21 = (UIKBShape *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v20, "frame");
            -[UIKBShapeOperator _scaleRect:factor:](self, "_scaleRect:factor:");
            v23 = v22;
            v73 = v24;
            v77 = v25;
            v27 = v26;
            v84.origin.x = v18;
            v84.origin.y = v17;
            v84.size.width = v14;
            v84.size.height = v16;
            if (CGRectIsNull(v84))
            {
              objc_msgSend(v20, "frame");
              v69.origin.x = v28;
              v69.origin.y = v29;
              v69.size.width = v30;
              v69.size.height = v31;
              v32 = v27;
              v75 = v77;
              v33 = v73;
              v17 = v73;
              v72 = v23;
              v34 = v27;
            }
            else
            {
              v85.origin.x = v23;
              v85.origin.y = v73;
              v85.size.width = v77;
              v85.size.height = v27;
              MidX = CGRectGetMidX(v85);
              v75 = v14;
              v36 = v14 + v18 < MidX || v18 > MidX;
              v86.origin.x = v23;
              v86.origin.y = v73;
              v86.size.width = v77;
              v86.size.height = v27;
              MidY = CGRectGetMidY(v86);
              v38 = v17 <= MidY;
              if (v16 + v17 < MidY)
                v38 = 0;
              v32 = v16;
              v72 = v18;
              if (v36 || v38)
              {
                if (!v38 || !v36)
                {
                  v34 = v27;
                  v33 = v73;
                }
                else
                {
                  v92.origin.x = v18;
                  v92.origin.y = v17;
                  v92.size.width = v14;
                  v92.size.height = v16;
                  MaxX = CGRectGetMaxX(v92);
                  objc_msgSend(v20, "frame");
                  MinX = CGRectGetMinX(v93);
                  v23 = MaxX + v70 * (MinX - CGRectGetMaxX(v69));
                  v94.origin.x = v23;
                  v33 = v73;
                  v94.origin.y = v73;
                  v94.size.width = v77;
                  v94.size.height = v27;
                  v48 = CGRectGetMaxX(v94);
                  v95.origin.x = v18;
                  v95.origin.y = v17;
                  v95.size.width = v75;
                  v95.size.height = v16;
                  v75 = v48 - CGRectGetMinX(v95);
                  objc_msgSend(v20, "frame");
                  v49 = CGRectGetMaxX(v96);
                  v34 = v27;
                  v69.size.width = v49 - CGRectGetMinX(v69);
                  v32 = v16;
                }
              }
              else
              {
                v87.origin.x = v18;
                v87.origin.y = v17;
                v87.size.width = v14;
                v87.size.height = v16;
                MaxY = CGRectGetMaxY(v87);
                objc_msgSend(v20, "frame");
                MinY = CGRectGetMinY(v88);
                v33 = MaxY + v71 * (MinY - CGRectGetMaxY(v69));
                v89.origin.x = v23;
                v89.origin.y = v33;
                v89.size.width = v77;
                v41 = v18;
                v34 = v27;
                v89.size.height = v27;
                v42 = CGRectGetMaxY(v89);
                v90.origin.x = v41;
                v90.origin.y = v17;
                v90.size.width = v75;
                v90.size.height = v16;
                v43 = v42 - CGRectGetMinY(v90);
                objc_msgSend(v20, "frame");
                v44 = CGRectGetMaxY(v91);
                v69.size.height = v44 - CGRectGetMinY(v69);
                v32 = v43;
              }
            }
            v74 = v17;
            rect = v32;
            objc_msgSend(v20, "geometry");
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            if (v50)
            {
              objc_msgSend(v20, "geometry");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v77;
              objc_msgSend(v51, "paddedFrameWithResolvedFrame:", v23, v33, v77, v34);
              v54 = v53;
              v56 = v55;
              v58 = v57;
              v60 = v59;

            }
            else
            {
              objc_msgSend(v20, "paddedFrame");
              -[UIKBShapeOperator _scaleRect:factor:](self, "_scaleRect:factor:");
              v54 = v61;
              v56 = v62;
              v58 = v63;
              v60 = v64;
              v52 = v77;
            }
            v65 = [UIKBShape alloc];
            objc_msgSend(v20, "geometry");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v65, "initWithGeometry:frame:paddedFrame:", v66, v23, v33, v52, v34, v54, v56, v58, v60);

            -[UIKBShape setOriginalShape:](v21, "setOriginalShape:", v20);
            width = v70;
            height = v71;
            v18 = v72;
            v17 = v74;
            v14 = v75;
            v16 = rect;
          }
          objc_msgSend(v10, "addObject:", v21);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
      }
      while (v13);
    }

    v8 = v68;
  }

  return v10;
}

- (CGRect)_scaleRect:(CGRect)a3 factor:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v6 = a3.size.height;
  v7 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = v7;
    v19.size.height = v6;
    if (!CGRectEqualToRect(v19, *MEMORY[0x1E0C9D648]))
    {
      -[UIKBShapeOperator _scaleRange:factor:](self, "_scaleRange:factor:", x, v7, width);
      x = v11;
      v7 = v12;
      -[UIKBShapeOperator _scaleRange:factor:](self, "_scaleRange:factor:", y, v6, height);
      y = v13;
      v6 = v14;
    }
  }
  v15 = x;
  v16 = y;
  v17 = v7;
  v18 = v6;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_scaleRange:(id)a3 factor:(double)a4
{
  double var1;
  double var0;
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
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  var1 = a3.var1;
  var0 = a3.var0;
  -[UIKBShapeOperator scale](self, "scale");
  v9 = a4;
  if (var0 != 1.0)
  {
    v10 = var0 * a4;
    if (v8 == 1.0)
      v9 = round(v10);
    else
      v9 = round(v10 * v8) / v8;
  }
  -[UIKBShapeOperator scale](self, "scale");
  v12 = a4;
  v13 = a4;
  if (var1 != 1.0)
  {
    v12 = var1 * a4;
    if (v11 == 1.0)
      v13 = round(v12);
    else
      v13 = round(v12 * v11) / v11;
  }
  v14 = var0 * a4 - v9 + v12 - v13;
  -[UIKBShapeOperator scale](self, "scale");
  v16 = 1.0;
  if (v14 != 1.0)
  {
    if (v15 == 1.0)
      v16 = round(v14);
    else
      v16 = round(v15 * v14) / v15;
  }
  v17 = v13 + v16;
  v18 = v9;
  result.var1 = v17;
  result.var0 = v18;
  return result;
}

- (double)scale
{
  return self->_scale;
}

+ (id)operatorWithScale:(double)a3
{
  UIKBShapeOperator *v4;

  v4 = objc_alloc_init(UIKBShapeOperator);
  -[UIKBShapeOperator setScale:](v4, "setScale:", a3);
  return v4;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (id)geometryByScalingShapeGeometry:(id)a3 factor:(CGSize)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  UIKBShape *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v29;
  UIKBShape *v30;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(v7, "geometry");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8 && !objc_msgSend(v7, "scaled"))
  {
    v11 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v11, "x");
    if (v12 == 3)
    {
      v13 = COERCE_DOUBLE(objc_msgSend(v11, "x"));
      -[UIKBShapeOperator scale](self, "scale");
      v15 = width;
      if (v13 != 1.0)
      {
        v16 = width * v13;
        if (v14 == 1.0)
          v15 = round(v16);
        else
          v15 = round(v14 * v16) / v14;
      }
      objc_msgSend(v11, "setX:", *(_QWORD *)&v15, 3);
    }
    objc_msgSend(v11, "y");
    if (v17 == 3)
    {
      v18 = COERCE_DOUBLE(objc_msgSend(v11, "y"));
      -[UIKBShapeOperator scale](self, "scale");
      v20 = height;
      if (v18 != 1.0)
      {
        v21 = height * v18;
        if (v19 == 1.0)
          v20 = round(v21);
        else
          v20 = round(v19 * v21) / v19;
      }
      objc_msgSend(v11, "setY:", *(_QWORD *)&v20, 3);
    }
    objc_msgSend(v11, "w");
    if (v22 == 3)
    {
      v23 = COERCE_DOUBLE(objc_msgSend(v11, "w"));
      -[UIKBShapeOperator scale](self, "scale");
      if (v23 != 1.0)
      {
        v25 = width * v23;
        if (v24 == 1.0)
          width = round(v25);
        else
          width = round(v24 * v25) / v24;
      }
      objc_msgSend(v11, "setW:", *(_QWORD *)&width, 3);
    }
    objc_msgSend(v11, "h");
    if (v26 == 3)
    {
      v27 = COERCE_DOUBLE(objc_msgSend(v11, "h"));
      -[UIKBShapeOperator scale](self, "scale");
      if (v27 != 1.0)
      {
        v29 = height * v27;
        if (v28 == 1.0)
          height = round(v29);
        else
          height = round(v28 * v29) / v28;
      }
      objc_msgSend(v11, "setH:", *(_QWORD *)&height, 3);
    }
    v30 = [UIKBShape alloc];
    v10 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v30, "initWithGeometry:frame:paddedFrame:", v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIKBShape setScaled:](v10, "setScaled:", 1);
    -[UIKBShape setOriginalShape:](v10, "setOriginalShape:", v7);

  }
  else
  {
    v10 = (UIKBShape *)v7;
  }

  return v10;
}

- (id)shapesByElaboratingShapes:(id)a3 insideShape:(id)a4 count:(int64_t)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  double v12;
  int64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  _BOOL4 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  unint64_t v39;
  double v40;
  double v41;
  double v42;
  int64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  _BOOL4 v52;
  void *v53;
  int v54;
  BOOL v55;
  double *v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double MaxX;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  UIKBShape *v67;
  void *v68;
  UIKBShape *v69;
  uint64_t v70;
  uint64_t v71;
  int has_internal_diagnostics;
  unint64_t v73;
  NSObject *v75;
  unint64_t v76;
  NSObject *v77;
  id v78;
  int64_t v79;
  id v80;
  id v82;
  _QWORD v83[4];
  id v84;
  uint64_t *v85;
  uint8_t *v86;
  uint64_t v87;
  double *v88;
  uint64_t v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  id v94;
  id v95;
  uint8_t *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t buf[8];
  double *v102;
  uint64_t v103;
  void *v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v82 = a4;
  if (v7)
  {
    v8 = objc_msgSend(v7, "count");
    v80 = 0;
    if (a5 >= 1 && v82 && v8)
    {
      v79 = a5;
      v9 = objc_msgSend(v7, "count");
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v78 = v7;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
      v12 = *MEMORY[0x1E0C9D820];
      v13 = a5 - v9;
      v14 = 0;
      v15 = 0;
      if (v11)
      {
        v16 = *(_QWORD *)v98;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v98 != v16)
              objc_enumerationMutation(v10);
            v18 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
            if (v15
              || (objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * i), "geometry"),
                  v19 = (void *)objc_claimAutoreleasedReturnValue(),
                  v20 = objc_msgSend(v19, "isTemplate"),
                  v19,
                  !v20))
            {
              objc_msgSend(v18, "geometry");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "w");
              v26 = v25 == 100;

              if (v26)
              {
                ++v14;
              }
              else
              {
                objc_msgSend(v18, "geometry");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "frame");
                objc_msgSend(v27, "frameWithContainingFrame:");
                v29 = v28;

                v12 = v12 + v29;
              }
            }
            else
            {
              v15 = v18;
              objc_msgSend(v15, "geometry");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "frame");
              objc_msgSend(v21, "frameWithContainingFrame:");
              v23 = v22;

              v12 = v12 + v23 * (double)++v13;
            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
        }
        while (v11);
      }

      objc_msgSend(v15, "frame");
      if (v14)
        v30 = v14;
      else
        v30 = 2;
      if (v15)
        v31 = v14 == 0;
      else
        v31 = 0;
      objc_msgSend(v82, "frame");
      v33 = v32;
      -[UIKBShapeOperator scale](self, "scale");
      v35 = (v33 - v12) / (double)v30;
      v36 = 1.0;
      if (v35 != 1.0)
      {
        if (v34 == 1.0)
          v36 = round(v35);
        else
          v36 = round(v34 * v35) / v34;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v79);
      v80 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "frame");
      v38 = 0;
      v39 = 0;
      v40 = -0.0;
      if (v31)
        v40 = v36;
      v41 = v40 + v37;
      v42 = 0.0;
      v43 = v79;
      while (v39 < objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "objectAtIndex:", v39);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        v102 = (double *)buf;
        v103 = 0x4010000000;
        v104 = &unk_18685B0AF;
        v105 = 0u;
        v106 = 0u;
        objc_msgSend(v44, "frame");
        *(_QWORD *)&v105 = v45;
        *((_QWORD *)&v105 + 1) = v46;
        *(_QWORD *)&v106 = v47;
        *((_QWORD *)&v106 + 1) = v48;
        objc_msgSend(v44, "geometry");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __65__UIKBShapeOperator_shapesByElaboratingShapes_insideShape_count___block_invoke;
          v93[3] = &unk_1E16B9698;
          v96 = buf;
          v94 = v44;
          v95 = v82;
          -[UIKBShapeOperator scale](self, "scale");
          +[UIKBGeometry performOperations:withScale:](UIKBGeometry, "performOperations:withScale:", v93);

        }
        objc_msgSend(v44, "geometry");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "w");
        v52 = v51 == 100;

        if (v52)
          v102[6] = v36;
        objc_msgSend(v44, "geometry");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "x");
        v55 = v54 == 100;

        v56 = v102;
        if (v55)
        {
          v57 = v41 + v42;
          v102[4] = v41 + v42;
        }
        else
        {
          v57 = v102[4];
        }
        v58 = *((_QWORD *)v56 + 5);
        v59 = *((_QWORD *)v56 + 6);
        v60 = *((_QWORD *)v56 + 7);
        MaxX = CGRectGetMaxX(*(CGRect *)&v57);
        v87 = 0;
        v88 = (double *)&v87;
        v89 = 0x4010000000;
        v90 = &unk_18685B0AF;
        v91 = 0u;
        v92 = 0u;
        objc_msgSend(v44, "paddedFrame");
        *(_QWORD *)&v91 = v62;
        *((_QWORD *)&v91 + 1) = v63;
        *(_QWORD *)&v92 = v64;
        *((_QWORD *)&v92 + 1) = v65;
        objc_msgSend(v44, "geometry");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (v66)
        {
          v83[0] = MEMORY[0x1E0C809B0];
          v83[1] = 3221225472;
          v83[2] = __65__UIKBShapeOperator_shapesByElaboratingShapes_insideShape_count___block_invoke_2;
          v83[3] = &unk_1E16C3488;
          v85 = &v87;
          v84 = v44;
          v86 = buf;
          -[UIKBShapeOperator scale](self, "scale");
          +[UIKBGeometry performOperations:withScale:](UIKBGeometry, "performOperations:withScale:", v83);

        }
        v67 = [UIKBShape alloc];
        objc_msgSend(v44, "geometry");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v67, "initWithGeometry:frame:paddedFrame:", v68, v102[4], v102[5], v102[6], v102[7], v88[4], v88[5], v88[6], v88[7]);
        objc_msgSend(v80, "addObject:", v69);

        v70 = v38 + 1;
        if (v44 == v15)
          ++v38;
        v71 = v70 == v13 || v44 != v15;
        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(buf, 8);

        v42 = MaxX - v41;
        v39 += v71;
        if (!--v43)
          goto LABEL_51;
      }
      has_internal_diagnostics = os_variant_has_internal_diagnostics();
      v73 = objc_msgSend(v10, "count");
      if (has_internal_diagnostics)
      {
        if (v39 >= v73)
        {
          __UIFaultDebugAssertLog();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&buf[4] = v79;
            LOWORD(v102) = 1024;
            *(_DWORD *)((char *)&v102 + 2) = v13;
            HIWORD(v102) = 2112;
            v103 = (uint64_t)v10;
            _os_log_fault_impl(&dword_185066000, v75, OS_LOG_TYPE_FAULT, "keyboard requested %d shapes (%d templates) from %@", buf, 0x18u);
          }

        }
      }
      else if (v39 >= v73)
      {
        v76 = shapesByElaboratingShapes_insideShape_count____s_category;
        if (!shapesByElaboratingShapes_insideShape_count____s_category)
        {
          v76 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v76, (unint64_t *)&shapesByElaboratingShapes_insideShape_count____s_category);
        }
        v77 = *(NSObject **)(v76 + 8);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&buf[4] = v79;
          LOWORD(v102) = 1024;
          *(_DWORD *)((char *)&v102 + 2) = v13;
          HIWORD(v102) = 2112;
          v103 = (uint64_t)v10;
          _os_log_impl(&dword_185066000, v77, OS_LOG_TYPE_ERROR, "keyboard requested %d shapes (%d templates) from %@", buf, 0x18u);
        }
      }
LABEL_51:

      v7 = v78;
    }
  }
  else
  {
    v80 = 0;
  }

  return v80;
}

void __65__UIKBShapeOperator_shapesByElaboratingShapes_insideShape_count___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "geometry");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(v7, "frameWithContainingFrame:");
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;

}

void __65__UIKBShapeOperator_shapesByElaboratingShapes_insideShape_count___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "geometry");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paddedFrameWithResolvedFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;

}

- (id)shapesByCenteringShapes:(id)a3 insideRect:(CGRect)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t j;
  void *v23;
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
  UIKBShape *v39;
  void *v40;
  UIKBShape *v41;
  double v43;
  double v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  if (CGRectIsNull(v56) || !objc_msgSend(v8, "count"))
  {
    v16 = v8;
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v50;
      v13 = 0.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v50 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "frame");
          v13 = v13 + v15;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v11);
    }
    else
    {
      v13 = 0.0;
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v18)
    {
      v19 = v18;
      v43 = x + floor((width - v13) * 0.5);
      v20 = *(_QWORD *)v46;
      v21 = 0.0;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v46 != v20)
            objc_enumerationMutation(v17);
          v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v23, "paddedFrame", *(_QWORD *)&v43);
          v25 = v24;
          objc_msgSend(v23, "frame");
          v27 = v25 - v26;
          objc_msgSend(v23, "frame");
          v29 = v28;
          v31 = v30;
          v44 = v32;
          objc_msgSend(v23, "paddedFrame");
          v34 = v33;
          v36 = v35;
          v38 = v37;
          v39 = [UIKBShape alloc];
          objc_msgSend(v23, "geometry");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v39, "initWithGeometry:frame:paddedFrame:", v40, v43 + v21, v29, v31, v44, v43 + v21 + v27, v34, v36, v38);
          objc_msgSend(v16, "addObject:", v41);

          v21 = v21 + v31;
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v19);
    }

  }
  return v16;
}

- (CGPoint)offsetForCenteringShapes:(id)a3 insideRect:(CGRect)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double MaxX;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint result;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  if (CGRectIsNull(v30) || !objc_msgSend(v8, "count"))
  {
    v19 = *MEMORY[0x1E0C9D538];
    v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      v13 = 1.79769313e308;
      MaxX = 2.22507386e-308;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "frame", (_QWORD)v23);
          if (v17 < v13)
          {
            objc_msgSend(v16, "frame");
            v13 = v18;
          }
          objc_msgSend(v16, "frame");
          if (MaxX < CGRectGetMaxX(v31))
          {
            objc_msgSend(v16, "frame");
            MaxX = CGRectGetMaxX(v32);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }
    else
    {
      v13 = 1.79769313e308;
      MaxX = 2.22507386e-308;
    }

    v19 = x + floor(width - (MaxX - v13)) * 0.5 - v13;
    v20 = 0.0;
  }

  v21 = v19;
  v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (id)shapesByCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4
{
  return -[UIKBShapeOperator shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:](self, "shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:", a3, 1, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (id)shapesByHorizontallyCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4
{
  return -[UIKBShapeOperator shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:](self, "shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:", a3, 1, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (id)shapesByVerticallyCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4
{
  return -[UIKBShapeOperator shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:](self, "shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:", a3, 0, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (id)shapesByCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4 horizontal:(BOOL)a5 vertical:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  double MidX;
  double MidY;
  double v35;
  double v36;
  double v37;
  id v38;
  void *v39;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v6 = a6;
  v7 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v49 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  if (CGRectIsNull(v50) || !objc_msgSend(v13, "count"))
  {
    v38 = v13;
  }
  else
  {
    v41 = y;
    v42 = width;
    v43 = height;
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v51.origin.x = v16;
    v51.origin.y = v18;
    v51.size.width = v20;
    v51.size.height = v22;
    MinX = CGRectGetMinX(v51);
    v52.origin.x = v16;
    v52.origin.y = v18;
    v52.size.width = v20;
    v52.size.height = v22;
    MaxX = CGRectGetMaxX(v52);
    v53.origin.x = v16;
    v53.origin.y = v18;
    v53.size.width = v20;
    v53.size.height = v22;
    MinY = CGRectGetMinY(v53);
    v54.origin.x = v16;
    v54.origin.y = v18;
    v54.size.width = v20;
    v54.size.height = v22;
    MaxY = CGRectGetMaxY(v54);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v27 = v13;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v45 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v32, "frame");
          if (CGRectGetMinX(v55) < MinX)
          {
            objc_msgSend(v32, "frame");
            MinX = CGRectGetMinX(v56);
          }
          objc_msgSend(v32, "frame");
          if (MaxX < CGRectGetMaxX(v57))
          {
            objc_msgSend(v32, "frame");
            MaxX = CGRectGetMaxX(v58);
          }
          objc_msgSend(v32, "frame");
          if (CGRectGetMinY(v59) < MinY)
          {
            objc_msgSend(v32, "frame");
            MinY = CGRectGetMinY(v60);
          }
          objc_msgSend(v32, "frame");
          if (MaxY < CGRectGetMaxY(v61))
          {
            objc_msgSend(v32, "frame");
            MaxY = CGRectGetMaxY(v62);
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v29);
    }

    v63.origin.x = x;
    v63.origin.y = v41;
    v63.size.width = v42;
    v63.size.height = v43;
    MidX = CGRectGetMidX(v63);
    v64.origin.x = x;
    v64.origin.y = v41;
    v64.size.width = v42;
    v64.size.height = v43;
    MidY = CGRectGetMidY(v64);
    v35 = MidX - (MinX + (MaxX - MinX) * 0.5);
    if (!v7)
      v35 = *MEMORY[0x1E0C9D538];
    v36 = MidY - (MinY + (MaxY - MinY) * 0.5);
    if (v6)
      v37 = v36;
    else
      v37 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIKBShapeOperator shapesByRepositioningShapes:withOffset:](self, "shapesByRepositioningShapes:withOffset:", v27, v35, v37);
    v38 = (id)objc_claimAutoreleasedReturnValue();
  }
  v39 = v38;

  return v39;
}

- (id)shapesByRepositioningShapes:(id)a3 withOffset:(CGPoint)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  UIKBShape *v28;
  void *v29;
  UIKBShape *v30;
  void *v31;
  void *v32;
  CGPoint v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v34 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "frame", *(_QWORD *)&v34.x, *(_QWORD *)&v34.y, (_QWORD)v35);
        v13 = v12;
        v15 = v14;
        v17 = v34.x + v16;
        v19 = v34.y + v18;
        objc_msgSend(v11, "paddedFrame");
        v21 = v20;
        v23 = v22;
        v25 = v34.x + v24;
        v27 = v34.y + v26;
        v28 = [UIKBShape alloc];
        objc_msgSend(v11, "geometry");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v28, "initWithGeometry:frame:paddedFrame:", v29, v17, v19, v13, v15, v25, v27, v21, v23);

        objc_msgSend(v11, "originalShape");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(v11, "originalShape");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBShape setOriginalShape:](v30, "setOriginalShape:", v32);

        }
        else
        {
          -[UIKBShape setOriginalShape:](v30, "setOriginalShape:", v11);
        }

        objc_msgSend(v5, "addObject:", v30);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)shapesByResizingShapes:(id)a3 withOffset:(CGPoint)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  UIKBShape *v27;
  void *v28;
  UIKBShape *v29;
  void *v30;
  void *v31;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "frame");
        v34 = v12;
        v14 = v13;
        v16 = a4.x + v15;
        v18 = fmax(a4.y + v17, 0.0);
        objc_msgSend(v11, "paddedFrame");
        v20 = v19;
        v22 = v21;
        v24 = a4.x + v23;
        v26 = fmax(a4.y + v25, 0.0);
        v27 = [UIKBShape alloc];
        objc_msgSend(v11, "geometry");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v27, "initWithGeometry:frame:paddedFrame:", v28, v34, v14, v16, v18, v20, v22, v24, v26);

        objc_msgSend(v11, "originalShape");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v11, "originalShape");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBShape setOriginalShape:](v29, "setOriginalShape:", v31);

        }
        else
        {
          -[UIKBShape setOriginalShape:](v29, "setOriginalShape:", v11);
        }

        objc_msgSend(v5, "addObject:", v29);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)shapesByInsettingShapes:(id)a3 withInsets:(UIEdgeInsets)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  UIKBShape *v12;
  void *v13;
  UIKBShape *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "paddedFrame", (_QWORD)v18);
        v12 = [UIKBShape alloc];
        objc_msgSend(v11, "geometry");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "frame");
        v14 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v12, "initWithGeometry:frame:paddedFrame:", v13);

        objc_msgSend(v11, "originalShape");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v11, "originalShape");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBShape setOriginalShape:](v14, "setOriginalShape:", v16);

        }
        else
        {
          -[UIKBShape setOriginalShape:](v14, "setOriginalShape:", v11);
        }

        objc_msgSend(v5, "addObject:", v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

@end
