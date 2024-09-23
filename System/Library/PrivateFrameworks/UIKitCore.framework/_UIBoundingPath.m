@implementation _UIBoundingPath

- (UICoordinateSpace)coordinateSpace
{
  return (UICoordinateSpace *)objc_loadWeakRetained((id *)&self->_coordinateSpace);
}

- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingRect:(CGRect)a4 withSize:(double)a5 minimumPadding:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double MinY;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (CGRectIsNull(a4))
    goto LABEL_2;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v28 = CGRectInset(v27, a6, a6);
  if (v28.size.width < 0.0)
    goto LABEL_2;
  v22 = v28.size.height;
  if (v28.size.height < 0.0)
    goto LABEL_2;
  v23 = v28.origin.x;
  v24 = v28.origin.y;
  v25 = v28.size.width;
  switch(a3)
  {
    case 1uLL:
      MinX = CGRectGetMinX(v28);
      v29.origin.x = v23;
      v29.origin.y = v24;
      v29.size.width = v25;
      v29.size.height = v22;
      MinY = CGRectGetMinY(v29);
      goto LABEL_11;
    case 2uLL:
      MinX = CGRectGetMinX(v28);
      goto LABEL_13;
    case 4uLL:
      MinX = CGRectGetMinX(v28);
      v30.origin.x = v23;
      v30.origin.y = v24;
      v30.size.width = v25;
      v30.size.height = v22;
      MinY = CGRectGetMaxY(v30) - a5;
LABEL_11:
      v31.origin.x = v23;
      v31.origin.y = v24;
      v31.size.width = v25;
      v31.size.height = v22;
      v17 = a5;
      a5 = CGRectGetWidth(v31);
      break;
    case 8uLL:
      MinX = CGRectGetMaxX(v28) - a5;
LABEL_13:
      v32.origin.x = v23;
      v32.origin.y = v24;
      v32.size.width = v25;
      v32.size.height = v22;
      MinY = CGRectGetMinY(v32);
      v33.origin.x = v23;
      v33.origin.y = v24;
      v33.size.width = v25;
      v33.size.height = v22;
      v17 = CGRectGetHeight(v33);
      break;
    default:
      a5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v17 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      MinX = *MEMORY[0x1E0C9D628];
      MinY = *(double *)(MEMORY[0x1E0C9D628] + 8);
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBoundingPath.m"), 403, CFSTR("Invalid UIRectEdge value (%ld)"), a3);

      break;
  }
  v34.origin.x = MinX;
  v34.origin.y = MinY;
  v34.size.width = a5;
  v34.size.height = v17;
  if (CGRectIsNull(v34))
    goto LABEL_2;
  v35.origin.x = v23;
  v35.origin.y = v24;
  v35.size.width = v25;
  v35.size.height = v22;
  v36 = CGRectInset(v35, -0.01, -0.01);
  v38.origin.x = MinX;
  v38.origin.y = MinY;
  v38.size.width = a5;
  v38.size.height = v17;
  if (!CGRectContainsRect(v36, v38))
  {
LABEL_2:
    MinX = *MEMORY[0x1E0C9D628];
    MinY = *(double *)(MEMORY[0x1E0C9D628] + 8);
    a5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v18 = MinX;
  v19 = MinY;
  v20 = a5;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_inscribedRectInBoundingRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5
{
  char v5;
  double height;
  double width;
  double y;
  double x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double MinX;
  double v17;
  double MaxX;
  double MinY;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MaxY;
  CGFloat rect;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;
  CGRect v37;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (CGRectIsNull(a4))
    goto LABEL_12;
  rect = v10;
  if ((v5 & 2) != 0)
  {
    v27.origin.x = v13;
    v27.origin.y = v12;
    v27.size.width = v11;
    v27.size.height = v10;
    MinX = CGRectGetMinX(v27);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v17 = fmax(MinX - CGRectGetMinX(v28), 0.0);
    x = x + v17;
    width = width - v17;
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        goto LABEL_5;
LABEL_9:
      v31.origin.x = v13;
      v31.origin.y = v12;
      v31.size.width = v11;
      v31.size.height = rect;
      MinY = CGRectGetMinY(v31);
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      v20 = fmax(MinY - CGRectGetMinY(v32), 0.0);
      y = y + v20;
      height = height - v20;
      if ((v5 & 4) == 0)
        goto LABEL_6;
      goto LABEL_10;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_4;
  }
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MaxX = CGRectGetMaxX(v29);
  v30.origin.x = v13;
  v30.origin.y = v12;
  v30.size.width = v11;
  v30.size.height = rect;
  width = width - fmax(MaxX - CGRectGetMaxX(v30), 0.0);
  if ((v5 & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((v5 & 4) == 0)
  {
LABEL_6:
    v14 = v11;
    v15 = rect;
    goto LABEL_11;
  }
LABEL_10:
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MaxY = CGRectGetMaxY(v33);
  v34.origin.x = v13;
  v34.origin.y = v12;
  v34.size.width = v11;
  v14 = v11;
  v15 = rect;
  v34.size.height = rect;
  height = height - fmax(MaxY - CGRectGetMaxY(v34), 0.0);
LABEL_11:
  v35.origin.x = v13;
  v35.origin.y = v12;
  v35.size.width = v14;
  v35.size.height = v15;
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  if (!CGRectContainsRect(v35, v37))
  {
LABEL_12:
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (_UIBoundingPath)initWithCoordinateSpace:(id)a3
{
  id v5;
  _UIBoundingPath *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIBoundingPath;
  v6 = -[_UIBoundingPath init](&v9, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_UIBoundingPath.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinateSpace != nil"));

    }
    objc_storeWeak((id *)&v6->_coordinateSpace, v5);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinateSpace);
}

- (CGRect)_largestInscribedRectInBoundingRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  _UIBoundingPathLargestInscribedRectWithAspectRatioAndCenter(a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.x, a4.y);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBoundingPath)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIBoundingPath;
  return -[_UIBoundingPath init](&v4, sel_init, a3);
}

- (BOOL)validateForCoordinateSpace
{
  return 0;
}

- (id)boundingPathForCoordinateSpace:(id)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBoundingPath.m"), 196, CFSTR("%@ must provide a concrete implementation of %@"), v7, v8);

  return 0;
}

- (id)boundingPathForCoordinateSpace:(id)a3 withCornerRadii:(UIRectCornerRadii)a4 orientation:(int64_t)a5 scale:(double)a6
{
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a5, a4.topLeft, a4.bottomLeft, a4.bottomRight, a4.topRight, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBoundingPath.m"), 203, CFSTR("%@ must provide a concrete implementation of %@"), v10, v11);

  return 0;
}

- (BOOL)isNonRectangular
{
  return 0;
}

- (CGRect)_inscribedRectInBoundingPathAndRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5 withOptions:(unint64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v6 = *MEMORY[0x1E0C9D628];
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_largestInscribedRectInBoundingPathAndRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v5 = *MEMORY[0x1E0C9D628];
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(CGSize)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v7 = *MEMORY[0x1E0C9D628];
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(double)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v7 = *MEMORY[0x1E0C9D628];
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingRect:(CGRect)a4 withSize:(CGSize)a5 minimumPadding:(double)a6
{
  double height;
  double width;
  CGFloat v9;
  CGFloat v10;
  CGFloat y;
  CGFloat x;
  CGFloat v14;
  double v15;
  uint64_t v16;
  CGRect *v17;
  double MinX;
  double v19;
  double v20;
  double v21;
  double v22;
  double MinY;
  void *v24;
  void *v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double *p_y;
  double *p_width;
  double *p_height;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  CGFloat v41;
  CGFloat rect;
  CGFloat v43;
  _QWORD v44[2];
  void (*v45)(uint64_t, double, double);
  void *v46;
  uint64_t *v47;
  double v48;
  uint64_t v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  uint64_t v54;
  CGRect *v55;
  uint64_t v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect result;
  CGRect v71;

  height = a5.height;
  width = a5.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (CGRectIsNull(a4)
    || (v60.origin.x = x,
        v60.origin.y = y,
        v60.size.width = v10,
        v60.size.height = v9,
        v61 = CGRectInset(v60, a6, a6),
        v43 = v61.origin.y,
        v61.size.width < 0.0)
    || v61.size.height < 0.0)
  {
    v19 = *MEMORY[0x1E0C9D628];
    v20 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v14 = v61.size.width;
    v41 = v61.origin.x;
    rect = v61.size.height;
    v15 = _UIDirectionVectorForCorner(a3);
    v39 = v16;
    v40 = v15;
    v54 = 0;
    v55 = (CGRect *)&v54;
    v56 = 0x4010000000;
    v57 = &unk_18685B0AF;
    v58 = 0u;
    v59 = 0u;
    v17 = (CGRect *)MEMORY[0x1E0C9D628];
    switch(a3)
    {
      case 1uLL:
        v62.origin.x = x;
        v62.origin.y = y;
        v62.size.width = v10;
        v62.size.height = v9;
        MinX = CGRectGetMinX(v62);
        goto LABEL_8;
      case 2uLL:
        v63.origin.x = x;
        v63.origin.y = y;
        v63.size.width = v10;
        v63.size.height = v9;
        MinX = CGRectGetMaxX(v63) - width;
LABEL_8:
        v64.origin.x = x;
        v64.origin.y = y;
        v64.size.width = v10;
        v64.size.height = v9;
        MinY = CGRectGetMinY(v64);
        goto LABEL_13;
      case 4uLL:
        v65.origin.x = x;
        v65.origin.y = y;
        v65.size.width = v10;
        v65.size.height = v9;
        MinX = CGRectGetMinX(v65);
        goto LABEL_12;
      case 8uLL:
        v66.origin.x = x;
        v66.origin.y = y;
        v66.size.width = v10;
        v66.size.height = v9;
        MinX = CGRectGetMaxX(v66) - width;
LABEL_12:
        v67.origin.x = x;
        v67.origin.y = y;
        v67.size.width = v10;
        v67.size.height = v9;
        MinY = CGRectGetMaxY(v67) - height;
LABEL_13:
        v26 = width;
        v27 = height;
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGRect _rectWithSizeInCornerOfBoundingRect(const CGSize, const UIRectCorner, const CGRect)");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("_UIBoundingPath.m"), 319, CFSTR("Invalid UIRectCorner value (%ld)"), a3);

        MinX = v17->origin.x;
        MinY = v17->origin.y;
        v26 = v17->size.width;
        v27 = v17->size.height;
        break;
    }
    *(double *)&v58 = MinX;
    *((double *)&v58 + 1) = MinY;
    *(double *)&v59 = v26;
    *((double *)&v59 + 1) = v27;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v45 = __78___UIBoundingPath__rectTuckedInCorner_ofBoundingRect_withSize_minimumPadding___block_invoke;
    v46 = &unk_1E16CB488;
    v47 = &v54;
    v48 = v40;
    v49 = v39;
    v50 = v41;
    v51 = v43;
    v52 = v14;
    v53 = rect;
    __78___UIBoundingPath__rectTuckedInCorner_ofBoundingRect_withSize_minimumPadding___block_invoke((uint64_t)v44, v55[1].origin.x, v55[1].origin.y);
    if (width > 0.0 || height > 0.0)
    {
      __78___UIBoundingPath__rectTuckedInCorner_ofBoundingRect_withSize_minimumPadding___block_invoke((uint64_t)v44, v55[1].origin.x, v55[1].origin.y + v55[1].size.height);
      v45((uint64_t)v44, v55[1].origin.x + v55[1].size.width, v55[1].origin.y + v55[1].size.height);
      v45((uint64_t)v44, v55[1].origin.x + v55[1].size.width, v55[1].origin.y);
    }
    if (CGRectIsNull(v55[1]))
      goto LABEL_20;
    v28 = v55[1].origin.x;
    v29 = v55[1].origin.y;
    v68.origin.x = v41;
    v30 = v55[1].size.width;
    v31 = v55[1].size.height;
    v68.origin.y = v43;
    v68.size.width = v14;
    v68.size.height = rect;
    v69 = CGRectInset(v68, -0.01, -0.01);
    v71.origin.x = v28;
    v71.origin.y = v29;
    v71.size.width = v30;
    v71.size.height = v31;
    if (!CGRectContainsRect(v69, v71))
    {
LABEL_20:
      p_height = &v17->size.height;
      p_width = &v17->size.width;
      p_y = &v17->origin.y;
    }
    else
    {
      v17 = v55 + 1;
      p_y = &v55[1].origin.y;
      p_width = &v55[1].size.width;
      p_height = &v55[1].size.height;
    }
    v22 = *p_height;
    v21 = *p_width;
    v20 = *p_y;
    v19 = v17->origin.x;
    _Block_object_dispose(&v54, 8);
  }
  v35 = v19;
  v36 = v20;
  v37 = v21;
  v38 = v22;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (UIEdgeInsets)_centerEdgeInsetsOfBoundingPathAndRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)_imageRepresentation
{
  return objc_alloc_init(UIImage);
}

- (void)setCoordinateSpace:(id)a3
{
  objc_storeWeak((id *)&self->_coordinateSpace, a3);
}

@end
