@implementation PUParallaxComputer

- (CGPoint)contentParallaxOffsetForViewFrame:(CGRect)a3 visibleRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double (**v13)(_QWORD, double, double, double, double);
  double *v14;
  char v15;
  char v16;
  double v17;
  double MaxY;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double MaxX;
  double MinY;
  double MinX;
  CGFloat v30;
  _QWORD aBlock[5];
  CGPoint result;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (CGRectIntersectsRect(a3, a4))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PUParallaxComputer_contentParallaxOffsetForViewFrame_visibleRect___block_invoke;
    aBlock[3] = &unk_1E58A3D68;
    aBlock[4] = self;
    v13 = (double (**)(_QWORD, double, double, double, double))_Block_copy(aBlock);
    v14 = (double *)MEMORY[0x1E0C9D538];
    v15 = -[PUParallaxComputer axis](self, "axis");
    v16 = v15;
    v30 = height;
    if ((v15 & 1) != 0)
    {
      v37.origin.x = v11;
      v37.origin.y = v10;
      v37.size.width = v9;
      v37.size.height = v8;
      MinX = CGRectGetMinX(v37);
      v38.origin.x = v11;
      v38.origin.y = v10;
      v38.size.width = v9;
      v38.size.height = v8;
      MaxX = CGRectGetMaxX(v38);
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v22 = CGRectGetMinX(v39);
      v40.size.height = height;
      v23 = v22;
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v24 = CGRectGetMaxX(v40);
      v17 = v13[2](v13, MinX, MaxX, v23, v24);
      if ((v16 & 2) != 0)
        goto LABEL_4;
    }
    else
    {
      v17 = *v14;
      if ((v15 & 2) != 0)
      {
LABEL_4:
        v33.origin.x = v11;
        v33.origin.y = v10;
        v33.size.width = v9;
        v33.size.height = v8;
        MinY = CGRectGetMinY(v33);
        v34.origin.x = v11;
        v34.origin.y = v10;
        v34.size.width = v9;
        v34.size.height = v8;
        MaxY = CGRectGetMaxY(v34);
        v35.origin.x = x;
        v35.origin.y = y;
        v35.size.width = width;
        v35.size.height = v30;
        v19 = CGRectGetMinY(v35);
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = v30;
        v20 = CGRectGetMaxY(v36);
        v21 = v13[2](v13, MinY, MaxY, v19, v20);
LABEL_8:

        goto LABEL_9;
      }
    }
    v21 = v14[1];
    goto LABEL_8;
  }
  v17 = *MEMORY[0x1E0C9D538];
  v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
LABEL_9:
  v25 = v17;
  v26 = v21;
  result.y = v26;
  result.x = v25;
  return result;
}

- (int64_t)model
{
  return self->_model;
}

- (void)setModel:(int64_t)a3
{
  self->_model = a3;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

unint64_t __68__PUParallaxComputer_contentParallaxOffsetForViewFrame_visibleRect___block_invoke(uint64_t a1)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "model");
  if (result < 2)
    return objc_msgSend(*(id *)(a1 + 32), "parallaxFactor");
  return result;
}

@end
