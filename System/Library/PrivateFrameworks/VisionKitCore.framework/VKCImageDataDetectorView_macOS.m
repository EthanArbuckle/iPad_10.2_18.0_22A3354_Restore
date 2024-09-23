@implementation VKCImageDataDetectorView_macOS

- (VKCImageDataDetectorView_macOS)initWithFrame:(CGRect)a3
{
  VKCImageDataDetectorView_macOS *v3;
  VKCDataDetectorHighlightView *v4;
  VKCDataDetectorHighlightView *highlightView;
  VKCImageDataDetectorViewHighlightButton *v6;
  VKCImageDataDetectorViewHighlightButton *highlightButtonImageView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKCImageDataDetectorView_macOS;
  v3 = -[VKCImageDataDetectorView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VKCDataDetectorHighlightView);
    highlightView = v3->_highlightView;
    v3->_highlightView = v4;

    -[VKCImageDataDetectorView_macOS addSubview:](v3, "addSubview:", v3->_highlightView);
    v6 = objc_alloc_init(VKCImageDataDetectorViewHighlightButton);
    highlightButtonImageView = v3->_highlightButtonImageView;
    v3->_highlightButtonImageView = v6;

    -[VKCImageDataDetectorViewHighlightButton setHidden:](v3->_highlightButtonImageView, "setHidden:", 1);
    -[VKCImageDataDetectorView_macOS addSubview:](v3, "addSubview:", v3->_highlightButtonImageView);
  }
  return v3;
}

- (id)pathForDataDetectorElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[VKCImageDataDetectorView viewSpaceQuadsForDataDetectorElement:](self, "viewSpaceQuadsForDataDetectorElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_compactMap:", &__block_literal_global_37);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA390], "vk_groupAndRoundPaths:radius:offset:", v4, 4.0, 4.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)highlightedElementContainsPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char v12;

  y = a3.y;
  x = a3.x;
  -[VKCImageDataDetectorView_macOS highlightView](self, "highlightView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VKCImageDataDetectorView_macOS convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsPoint:", v8, v10);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)updateHighlightForPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  uint64_t v7;
  VKCImageDataDetectorView_macOS *v8;
  uint64_t v9;
  id v10;

  y = a3.y;
  x = a3.x;
  if (!-[VKCImageDataDetectorView_macOS highlightedElementContainsPoint:](self, "highlightedElementContainsPoint:"))
  {
    -[VKCImageDataDetectorView_macOS elementAtPoint:](self, "elementAtPoint:", x, y);
    v6 = objc_claimAutoreleasedReturnValue();
    v10 = (id)v6;
    if (v6)
    {
      v7 = v6;
      v8 = self;
      v9 = v7;
    }
    else
    {
      v8 = self;
      v9 = 0;
    }
    -[VKCImageDataDetectorView_macOS setHighlightedElement:](v8, "setHighlightedElement:", v9);

  }
}

- (void)setHighlightedElement:(id)a3
{
  VKCBaseDataDetectorElement *v5;
  VKCBaseDataDetectorElement **p_highlightedElement;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  void *v20;
  void *v21;
  CGAffineTransform v22;

  v5 = (VKCBaseDataDetectorElement *)a3;
  p_highlightedElement = &self->_highlightedElement;
  if (self->_highlightedElement != v5)
  {
    objc_storeStrong((id *)&self->_highlightedElement, a3);
    -[VKCImageDataDetectorView_macOS highlightView](self, "highlightView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", *p_highlightedElement == 0);
    if (*p_highlightedElement)
    {
      -[VKCImageDataDetectorView_macOS setupButtonForElement:](self, "setupButtonForElement:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ddBottomQuad");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sideLength");
      if (v10 >= v11)
        v10 = v11;
      -[UIView vk_windowLengthFromViewLength:](self, "vk_windowLengthFromViewLength:", v10);
      v13 = v12 < 6.0;
      objc_msgSend(v8, "combinedElementHighlightPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "buttonQuad");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageDataDetectorView_macOS setButtonQuad:](self, "setButtonQuad:", v15);

      objc_msgSend(v8, "ddBottomQuad");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageDataDetectorView_macOS setDdBottomQuad:](self, "setDdBottomQuad:", v16);

      objc_msgSend(v14, "bounds");
      objc_msgSend(v7, "setFrame:");
      objc_msgSend(v7, "frame");
      v18 = -v17;
      objc_msgSend(v7, "frame");
      CGAffineTransformMakeTranslation(&v22, v18, -v19);
      objc_msgSend(v14, "vk_applyTransform:", &v22);
      objc_msgSend(v7, "setPath:", v14);
      objc_msgSend(v7, "setHideDashedLine:", v13);

    }
    else
    {
      -[VKCImageDataDetectorView_macOS highlightButtonImageView](self, "highlightButtonImageView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHidden:", 1);

      -[VKCImageDataDetectorView_macOS highlightView](self, "highlightView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setPath:", 0);

      -[VKCImageDataDetectorView_macOS setButtonQuad:](self, "setButtonQuad:", 0);
    }

  }
}

- (id)elementAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[VKCImageDataDetectorView_macOS highlightedElementContainsPoint:](self, "highlightedElementContainsPoint:"))
    -[VKCImageDataDetectorView_macOS highlightedElement](self, "highlightedElement");
  else
    -[VKCImageDataDetectorView closestElementToPoint:maxDistance:](self, "closestElementToPoint:maxDistance:", x, y, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)setupButtonForElement:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  VKQuad *v47;
  void *v48;
  double v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  CGFloat v59;
  CGFloat v60;
  VKCImageDataDetectorViewQuadInfo *v61;
  CGAffineTransform v63;
  CGAffineTransform v64;
  _QWORD v65[4];
  id v66;
  VKCImageDataDetectorView_macOS *v67;
  char v68;
  _QWORD v69[5];

  v69[4] = *MEMORY[0x1E0C80C00];
  -[VKCImageDataDetectorView viewSpaceQuadsForDataDetectorElement:](self, "viewSpaceQuadsForDataDetectorElement:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomLeft");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "bottomRight");
  v12 = VKMAngleOfLine(v7, v9, v10, v11);
  objc_msgSend(v5, "bottomLeft");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v5, "bottomRight");
  v69[0] = v14;
  v69[1] = v16;
  v69[2] = v17;
  v69[3] = v18;
  v68 = 0;
  -[VKCImageDataDetectorView_macOS buttonImageSizeFromQuad:baseline:LTR:finalIsLTR:](self, "buttonImageSizeFromQuad:baseline:LTR:finalIsLTR:", v5, v69, 1, &v68);
  v20 = v19;
  objc_msgSend(v5, "bottomLeft");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v5, "topLeft");
  v26 = VKMMidpointOnLineSegment(v22, v24, v25);
  v28 = v27;
  objc_msgSend(v5, "bottomRight");
  v30 = v29;
  v32 = v31;
  objc_msgSend(v5, "topRight");
  v34 = VKMMidpointOnLineSegment(v30, v32, v33);
  v36 = VKMPointByExtendingLineFromPoints(v26, v28, v34, v35, v20 * 0.5);
  v38 = v37;
  -[VKCImageDataDetectorView_macOS highlightButtonImageView](self, "highlightButtonImageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = VKMRectWithCenterAndSize(v36, v38, v20);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  objc_msgSend(v39, "setFrame:");
  objc_msgSend(v39, "setHidden:", 0);
  objc_msgSend(v39, "setRotation:", v12);
  v47 = -[VKQuad initWithRect:]([VKQuad alloc], "initWithRect:", v40, v42, v44, v46);
  -[VKQuad quadFromRotatingAroundCentroidWithAngle:](v47, "quadFromRotatingAroundCentroidWithAngle:", v12);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VKCImageDataDetectorView_macOS needsRotationOffsetForElementQuad:buttonQuad:isLTR:](self, "needsRotationOffsetForElementQuad:buttonQuad:isLTR:", v5, v48, 1))
  {
    v49 = v12 + 3.14159265;
    objc_msgSend(v39, "setRotation:", v49);
    -[VKQuad quadFromRotatingAroundCentroidWithAngle:](v47, "quadFromRotatingAroundCentroidWithAngle:", v49);
    v50 = objc_claimAutoreleasedReturnValue();

    v48 = (void *)v50;
  }
  -[VKCImageDataDetectorView_macOS quadAddingButtonQuad:toElementQuad:LTR:](self, "quadAddingButtonQuad:toElementQuad:LTR:", v48, v5, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __56__VKCImageDataDetectorView_macOS_setupButtonForElement___block_invoke;
  v65[3] = &unk_1E9465958;
  v66 = v51;
  v67 = self;
  v52 = v51;
  objc_msgSend(v4, "vk_map:", v65);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "imageSize");
  v57 = VKMAspectRatio(v55, v56);

  objc_msgSend(MEMORY[0x1E0CEA390], "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v53, v57, 0.2, 0.02);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageDataDetectorView_macOS bounds](self, "bounds");
  memset(&v64, 0, sizeof(v64));
  CGAffineTransformMakeScale(&v64, v59, v60);
  v63 = v64;
  objc_msgSend(v58, "vk_applyTransform:", &v63);
  v61 = objc_alloc_init(VKCImageDataDetectorViewQuadInfo);
  -[VKCImageDataDetectorViewQuadInfo setButtonQuad:](v61, "setButtonQuad:", v48);
  -[VKCImageDataDetectorViewQuadInfo setDdBottomQuad:](v61, "setDdBottomQuad:", v5);
  -[VKCImageDataDetectorViewQuadInfo setCombinedElementHighlightPath:](v61, "setCombinedElementHighlightPath:", v58);

  return v61;
}

- (BOOL)needsRotationOffsetForElementQuad:(id)a3 buttonQuad:(id)a4 isLTR:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "bottomLeft");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v7, "bottomLeft");
    v16 = VKMDistance(v11, v13, v14, v15);
    objc_msgSend(v9, "bottomLeft");
    v18 = v17;
    v20 = v19;

    objc_msgSend(v7, "bottomRight");
  }
  else
  {
    objc_msgSend(v8, "bottomRight");
    v24 = v23;
    v26 = v25;
    objc_msgSend(v7, "bottomRight");
    v16 = VKMDistance(v24, v26, v27, v28);
    objc_msgSend(v9, "bottomRight");
    v18 = v29;
    v20 = v30;

    objc_msgSend(v7, "bottomLeft");
  }
  v31 = v21;
  v32 = v22;

  return v16 > VKMDistance(v18, v20, v31, v32);
}

- (double)angleOfQuad:(id)a3 LTR:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "bottomLeft");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "bottomRight");
  }
  else
  {
    objc_msgSend(v5, "bottomRight");
    v8 = v13;
    v10 = v14;
    objc_msgSend(v6, "bottomLeft");
  }
  v15 = v11;
  v16 = v12;

  return VKMAngleOfLine(v8, v10, v15, v16);
}

- (VKEdgeDistance)edgeDistanceFromLine:(CGPoint *)a3 toRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  VKEdgeDistance result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[VKCImageDataDetectorView_macOS closestDistanceFromLine:point:toRect:](self, "closestDistanceFromLine:point:toRect:", a3->x, a3->y, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v11 = v10;
  -[VKCImageDataDetectorView_macOS closestDistanceFromLine:point:toRect:](self, "closestDistanceFromLine:point:toRect:", a3, a3[1].x, a3[1].y, x, y, width, height);
  v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (double)closestDistanceFromLine:(CGPoint *)a3 point:(CGPoint)a4 toRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  _BOOL4 v12;
  double result;
  CGFloat v14;
  CGFloat MaxY;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat MaxX;
  CGFloat MinY;
  CGFloat MinX;
  double v26[4];
  double v27[4];
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32[5];
  CGPoint v33;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.y;
  v10 = a4.x;
  v32[4] = *(double *)MEMORY[0x1E0C80C00];
  v33.x = v10;
  v33.y = v9;
  v12 = CGRectContainsPoint(a5, v33);
  result = -1.0;
  if (v12)
  {
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    MinX = CGRectGetMinX(v35);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    MinY = CGRectGetMinY(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    MaxX = CGRectGetMaxX(v37);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v22 = CGRectGetMinY(v38);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    v14 = CGRectGetMinX(v39) + 0.00001;
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    MaxY = CGRectGetMaxY(v40);
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    v16 = CGRectGetMaxX(v41) + 0.00001;
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v32[0] = MaxX;
    v32[1] = v22;
    v32[2] = MinX;
    v32[3] = MinY;
    v28 = v16;
    v29 = CGRectGetMaxY(v42);
    v30 = v14;
    v31 = MaxY;
    v27[0] = MinX;
    v27[1] = MinY;
    v27[2] = v14;
    v27[3] = MaxY;
    v26[0] = MaxX;
    v26[1] = v22;
    v26[2] = v16;
    v26[3] = v29;
    VKMDistanceFromLineToLineAtPoint(&a3->x, v32);
    v18 = v17;
    VKMDistanceFromLineToLineAtPoint(&a3->x, &v28);
    if (v18 >= v19)
      v20 = v19;
    else
      v20 = v18;
    VKMDistanceFromLineToLineAtPoint(&a3->x, v27);
    if (v20 >= v21)
      v20 = v21;
    VKMDistanceFromLineToLineAtPoint(&a3->x, v26);
    if (v20 < result)
      return v20;
  }
  return result;
}

- (CGSize)buttonImageSizeFromQuad:(id)a3 baseline:(CGPoint *)a4 LTR:(BOOL)a5 finalIsLTR:(BOOL *)a6
{
  _BOOL4 v7;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  double v21;
  CGSize result;

  v7 = a5;
  *a6 = a5;
  objc_msgSend(a3, "sideLength");
  v12 = v10;
  v13 = v11;
  if (v7)
    v14 = v11;
  else
    v14 = v10;
  -[UIView vk_viewPointRatioFromWindow](self, "vk_viewPointRatioFromWindow");
  v16 = VKMClamp(v14, v15 * 12.0, v15 * 32.0);
  -[VKCImageDataDetectorView_macOS bounds](self, "bounds");
  -[VKCImageDataDetectorView_macOS edgeDistanceFromLine:toRect:](self, "edgeDistanceFromLine:toRect:", a4);
  if (v7)
  {
    if (v17 >= 12.0)
    {
      if (v17 < v16)
        v16 = v17;
    }
    else if (v18 > 12.0)
    {
      v16 = VKMClamp(v13, 12.0, 32.0);
      *a6 = 0;
    }
  }
  else if (v18 < 12.0 && v17 > 12.0)
  {
    v16 = VKMClamp(v12, 12.0, 32.0);
    *a6 = 1;
  }
  v20 = v16;
  v21 = v16;
  result.height = v21;
  result.width = v20;
  return result;
}

- (id)quadAddingButtonQuad:(id)a3 toElementQuad:(id)a4 LTR:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65[4];
  double v66[5];

  v5 = a5;
  v66[4] = *(double *)MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "topLeft");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v7, "topRight");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v7, "bottomLeft");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v7, "bottomRight");
  v22 = v21;
  v24 = v23;

  if (v5)
    v25 = v20;
  else
    v25 = v24;
  if (v5)
    v26 = v18;
  else
    v26 = v22;
  v66[0] = v26;
  v66[1] = v25;
  v51 = v20;
  v52 = v18;
  if (v5)
  {
    v20 = v24;
    v18 = v22;
    v27 = v12;
  }
  else
  {
    v27 = v16;
  }
  if (v5)
    v28 = v10;
  else
    v28 = v14;
  v55 = v12;
  v56 = v10;
  v53 = v16;
  v54 = v14;
  if (v5)
    v12 = v16;
  v66[2] = v18;
  v66[3] = v20;
  if (v5)
    v10 = v14;
  v65[0] = v28;
  v65[1] = v27;
  v65[2] = v10;
  v65[3] = v12;
  if (v5)
  {
    objc_msgSend(v8, "bottomRight");
    v61 = v29;
    v62 = v30;
    objc_msgSend(v8, "topRight");
  }
  else
  {
    objc_msgSend(v8, "bottomLeft");
    v61 = v33;
    v62 = v34;
    objc_msgSend(v8, "topLeft");
  }
  v35 = v31;
  v36 = v32;

  v59 = 0;
  v60 = 0;
  v57 = 0.0;
  v58 = 0.0;
  v63 = v35;
  v64 = v36;
  VKMIntersectionOfLines(v66, (double *)&v61, (double *)&v59, (double *)&v60, &v57, 1, 1);
  v37 = VKMDistance(v18, v20, v57, v58);
  VKMIntersectionOfLines(v65, (double *)&v61, (double *)&v59, (double *)&v60, &v57, 1, 1);
  v38 = VKMDistance(v10, v12, v57, v58);
  if (v5)
  {
    v40 = v55;
    v39 = v56;
    v41 = VKMPointByExtendingLineFromPoints(v56, v55, v54, v53, v38);
    v43 = v42;
    v44 = v52;
    v45 = v37;
    v46 = v51;
    v22 = VKMPointByExtendingLineFromPoints(v52, v51, v22, v24, v45);
    v24 = v47;
  }
  else
  {
    v43 = v53;
    v41 = v54;
    v39 = VKMPointByExtendingLineFromPoints(v54, v53, v56, v55, v38);
    v40 = v48;
    v44 = VKMPointByExtendingLineFromPoints(v22, v24, v52, v51, v37);
    v46 = v49;
  }
  return -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v44, v46, v22, v24, v39, v40, v41, v43);
}

- (VKCBaseDataDetectorElement)highlightedElement
{
  return self->_highlightedElement;
}

- (VKCDataDetectorHighlightView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (VKQuad)buttonQuad
{
  return self->_buttonQuad;
}

- (void)setButtonQuad:(id)a3
{
  objc_storeStrong((id *)&self->_buttonQuad, a3);
}

- (VKQuad)ddBottomQuad
{
  return self->_ddBottomQuad;
}

- (void)setDdBottomQuad:(id)a3
{
  objc_storeStrong((id *)&self->_ddBottomQuad, a3);
}

- (UITapGestureRecognizer)tapGR
{
  return self->_tapGR;
}

- (void)setTapGR:(id)a3
{
  objc_storeStrong((id *)&self->_tapGR, a3);
}

- (VKCImageDataDetectorViewHighlightButton)highlightButtonImageView
{
  return self->_highlightButtonImageView;
}

- (void)setHighlightButtonImageView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightButtonImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightButtonImageView, 0);
  objc_storeStrong((id *)&self->_tapGR, 0);
  objc_storeStrong((id *)&self->_ddBottomQuad, 0);
  objc_storeStrong((id *)&self->_buttonQuad, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_highlightedElement, 0);
}

@end
