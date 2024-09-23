@implementation ISVisibilityOffsetHelper

- (void)_setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->__scrollView, a3);
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (UIScrollView)_scrollView
{
  return self->__scrollView;
}

- (void)_setTargetContentOffset:(CGPoint)a3
{
  self->__targetContentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__scrollView, 0);
}

- (void)computeVisibilityOffsetsInScrollView:(id)a3 withTargetContentOffset:(CGPoint)a4 usingBlock:(id)a5
{
  double y;
  double x;
  void (**v9)(id, ISVisibilityOffsetHelper *);

  y = a4.y;
  x = a4.x;
  v9 = (void (**)(id, ISVisibilityOffsetHelper *))a5;
  -[ISVisibilityOffsetHelper _setScrollView:](self, "_setScrollView:", a3);
  -[ISVisibilityOffsetHelper _setTargetContentOffset:](self, "_setTargetContentOffset:", x, y);
  -[ISVisibilityOffsetHelper _updateDirectionIfNeeded](self, "_updateDirectionIfNeeded");
  v9[2](v9, self);

  -[ISVisibilityOffsetHelper _setScrollView:](self, "_setScrollView:", 0);
}

- (void)_updateDirectionIfNeeded
{
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  id v7;

  if (-[ISVisibilityOffsetHelper direction](self, "direction") == 1)
  {
    -[ISVisibilityOffsetHelper _scrollView](self, "_scrollView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentSize");
    v4 = v3;
    objc_msgSend(v7, "bounds");
    if (v4 >= v5)
      v6 = 2;
    else
      v6 = 3;
    -[ISVisibilityOffsetHelper setDirection:](self, "setDirection:", v6);

  }
}

- (ISVisibilityRange)_visibilityRangeForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double MaxX;
  double v9;
  double MinY;
  double v11;
  ISVisibilityRange result;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  switch(-[ISVisibilityOffsetHelper direction](self, "direction"))
  {
    case 2:
      v13.origin.x = x;
      v13.origin.y = y;
      v13.size.width = width;
      v13.size.height = height;
      MinX = CGRectGetMinX(v13);
      v14.origin.x = x;
      v14.origin.y = y;
      v14.size.width = width;
      v14.size.height = height;
      MaxX = CGRectGetMaxX(v14);
      goto LABEL_5;
    case 3:
      v15.origin.x = x;
      v15.origin.y = y;
      v15.size.width = width;
      v15.size.height = height;
      MinX = CGRectGetMinY(v15);
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      MaxX = CGRectGetMaxY(v16);
LABEL_5:
      v9 = MaxX;
      break;
    case 4:
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      MinX = -CGRectGetMaxX(v17);
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      MinY = CGRectGetMinX(v18);
      goto LABEL_8;
    case 5:
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      MinX = -CGRectGetMaxY(v19);
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      MinY = CGRectGetMinY(v20);
LABEL_8:
      v9 = -MinY;
      break;
    default:
      v9 = 0.0;
      MinX = 0.0;
      break;
  }
  v11 = MinX;
  result.var1 = v9;
  result.var0 = v11;
  return result;
}

- (CGRect)visibleRectForScrollView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)boundsForView:(id)a3 inScrollView:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)getVisibility:(BOOL *)a3 offset:(double *)a4 targetVisibilityOffset:(double *)a5 forView:(id)a6
{
  id v10;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  double (**v41)(double, double);
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  _QWORD v50[7];
  CGRect v51;
  CGRect v52;

  v10 = a6;
  -[ISVisibilityOffsetHelper _scrollView](self, "_scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isDescendantOfView:", v11))
  {
    v40 = 0;
    v43 = 0.0;
    v42 = 0.0;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[ISVisibilityOffsetHelper visibleRectForScrollView:](self, "visibleRectForScrollView:", v11);
  v13 = v12;
  v44 = v14;
  v45 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[ISVisibilityOffsetHelper _targetContentOffset](self, "_targetContentOffset");
  v21 = v20;
  v23 = v22;
  -[ISVisibilityOffsetHelper _visibilityRangeForRect:](self, "_visibilityRangeForRect:", v13, v15, v17, v19);
  v48 = v25;
  v49 = v24;
  -[ISVisibilityOffsetHelper _visibilityRangeForRect:](self, "_visibilityRangeForRect:", v21, v23, v17, v19);
  v46 = v27;
  v47 = v26;
  -[ISVisibilityOffsetHelper boundsForView:inScrollView:](self, "boundsForView:inScrollView:", v10, v11);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[ISVisibilityOffsetHelper _visibilityRangeForRect:](self, "_visibilityRangeForRect:");
  v37 = v36;
  v39 = v38;
  v51.origin.x = v29;
  v51.origin.y = v31;
  v51.size.width = v33;
  v51.size.height = v35;
  v52.origin.y = v44;
  v52.origin.x = v45;
  v52.size.width = v17;
  v52.size.height = v19;
  v40 = CGRectIntersectsRect(v51, v52);
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __80__ISVisibilityOffsetHelper_getVisibility_offset_targetVisibilityOffset_forView___block_invoke;
  v50[3] = &unk_1E9453E20;
  v50[4] = self;
  v50[5] = v37;
  v50[6] = v39;
  v41 = (double (**)(double, double))MEMORY[0x1D8248F20](v50);
  v42 = v41[2](v49, v48);
  v43 = ((double (*)(double (**)(double, double), double, double))v41[2])(v41, v47, v46);

  if (a3)
LABEL_5:
    *a3 = v40;
LABEL_6:
  if (a4)
    *a4 = v42;
  if (a5)
    *a5 = v43;

}

- (double)maximumDistance
{
  return self->_maximumDistance;
}

- (void)setMaximumDistance:(double)a3
{
  self->_maximumDistance = a3;
}

- (double)maximumDistanceLag
{
  return self->_maximumDistanceLag;
}

- (void)setMaximumDistanceLag:(double)a3
{
  self->_maximumDistanceLag = a3;
}

- (CGPoint)_targetContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->__targetContentOffset.x;
  y = self->__targetContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

uint64_t __80__ISVisibilityOffsetHelper_getVisibility_offset_targetVisibilityOffset_forView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "maximumDistance");
  return objc_msgSend(*(id *)(a1 + 32), "maximumDistanceLag");
}

@end
