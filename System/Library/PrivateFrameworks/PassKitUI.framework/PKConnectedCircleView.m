@implementation PKConnectedCircleView

- (PKConnectedCircleView)initWithSize:(CGSize)a3
{
  return -[PKConnectedCircleView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3.width, a3.height);
}

- (PKConnectedCircleView)init
{
  return -[PKConnectedCircleView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKConnectedCircleView)initWithFrame:(CGRect)a3
{
  PKConnectedCircleView *v3;
  PKConnectedCircleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKConnectedCircleView;
  v3 = -[PKConnectedCircleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKConnectedCircleView setOpaque:](v3, "setOpaque:", 0);
  return v4;
}

- (void)setTargetView:(id)a3
{
  UIView **p_targetView;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  p_targetView = &self->_targetView;
  v6 = PKEqualObjects();
  v7 = v8;
  if ((v6 & 1) == 0)
  {
    if (*p_targetView)
      -[UIView removeFromSuperview](*p_targetView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_targetView, a3);
    -[PKConnectedCircleView addSubview:](self, "addSubview:", *p_targetView);
    -[PKConnectedCircleView setNeedsLayout](self, "setNeedsLayout");
    -[PKConnectedCircleView setNeedsDisplay](self, "setNeedsDisplay");
    v7 = v8;
  }

}

- (void)setTopConnector:(id)a3
{
  PKGradientVerticalConnector *v5;
  PKGradientVerticalConnector *v6;

  v5 = (PKGradientVerticalConnector *)a3;
  if (self->_topConnector != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_topConnector, a3);
    -[PKConnectedCircleView setNeedsLayout](self, "setNeedsLayout");
    -[PKConnectedCircleView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)setBottomConnector:(id)a3
{
  PKGradientVerticalConnector *v5;
  PKGradientVerticalConnector *v6;

  v5 = (PKGradientVerticalConnector *)a3;
  if (self->_bottomConnector != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bottomConnector, a3);
    -[PKConnectedCircleView setNeedsLayout](self, "setNeedsLayout");
    -[PKConnectedCircleView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  double v5;
  double v6;
  CGSize result;

  height = a3.height;
  -[UIView sizeThatFits:](self->_targetView, "sizeThatFits:", a3.width);
  if (*(_OWORD *)&self->_topConnector != 0)
    v5 = fmax(v5, 2.0);
  v6 = height;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKConnectedCircleView;
  -[PKConnectedCircleView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKConnectedCircleView bounds](self, "bounds");
  -[PKConnectedCircleView _targetViewRectForBounds:](self, "_targetViewRectForBounds:");
  -[UIView setFrame:](self->_targetView, "setFrame:");
}

- (CGRect)_targetViewRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  UIView *targetView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  v4 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  targetView = self->_targetView;
  if (targetView)
  {
    -[UIView sizeThatFits:](targetView, "sizeThatFits:", a3.size.width, a3.size.height);
    PKRectCenteredIntegralRect();
    v4 = v8;
    v3 = v9;
  }
  else
  {
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v10 = v4;
  v11 = v3;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGContext *CurrentContext;
  CGColorSpace *DeviceRGB;
  PKGradientVerticalConnector *topConnector;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  const __CFArray *v25;
  CGGradient *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  CGFloat MaxY;
  PKGradientVerticalConnector *bottomConnector;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  const __CFArray *v43;
  CGGradient *v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat MinY;
  CGFloat MidX;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  _QWORD v65[2];
  _QWORD v66[2];
  CGFloat locations[3];
  uint64_t v68;
  CGPoint v69;
  CGPoint v70;
  CGPoint v71;
  CGPoint v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v68 = *MEMORY[0x1E0C80C00];
  -[PKConnectedCircleView bounds](self, "bounds");
  -[PKConnectedCircleView _targetViewRectForBounds:](self, "_targetViewRectForBounds:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  CurrentContext = UIGraphicsGetCurrentContext();
  if (*(_OWORD *)&self->_topConnector != 0)
  {
    *(_OWORD *)locations = xmmword_19DF171F0;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    topConnector = self->_topConnector;
    if (topConnector)
    {
      -[PKGradientVerticalConnector topGradientColor](topConnector, "topGradientColor");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        -[PKGradientVerticalConnector bottomGradientColor](self->_topConnector, "bottomGradientColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[PKGradientVerticalConnector topGradientColor](self->_topConnector, "topGradientColor");
          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v66[0] = objc_msgSend(v22, "CGColor");
          -[PKGradientVerticalConnector bottomGradientColor](self->_topConnector, "bottomGradientColor");
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v66[1] = objc_msgSend(v23, "CGColor");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = (const __CFArray *)objc_msgSend(v24, "copy");
          v26 = CGGradientCreateWithColors(DeviceRGB, v25, locations);

          CGContextSaveGState(CurrentContext);
          v61 = v11;
          v62 = v9;
          v59 = v15;
          v60 = v13;
          if (self->_targetView)
          {
            v73.origin.x = x;
            v73.origin.y = y;
            v73.size.width = width;
            v73.size.height = height;
            CGRectGetHeight(v73);
          }
          else
          {
            v74.origin.x = v9;
            v74.origin.y = v11;
            v74.size.width = v13;
            v74.size.height = v15;
            CGRectGetMinY(v74);
            v75.origin.x = x;
            v75.origin.y = y;
            v75.size.width = width;
            v75.size.height = height;
            CGRectGetMinY(v75);
          }
          PKContentAlignmentMake();
          v27 = height;
          PKSizeAlignedInRect();
          v28 = v76.origin.x;
          v29 = v76.origin.y;
          v30 = v76.size.width;
          v31 = v76.size.height;
          MidX = CGRectGetMidX(v76);
          v77.origin.x = v28;
          v77.origin.y = v29;
          v77.size.width = v30;
          v77.size.height = v31;
          v64 = v27;
          MinY = CGRectGetMinY(v77);
          v78.origin.x = v28;
          v78.origin.y = v29;
          v78.size.width = v30;
          v78.size.height = v31;
          v63 = width;
          v32 = CGRectGetMidX(v78);
          v79.origin.x = v28;
          v79.origin.y = v29;
          v79.size.width = v30;
          v79.size.height = v31;
          v33 = x;
          v34 = y;
          MaxY = CGRectGetMaxY(v79);
          v80.origin.x = v28;
          v80.origin.y = v29;
          v80.size.width = v30;
          v80.size.height = v31;
          CGContextAddRect(CurrentContext, v80);
          CGContextClip(CurrentContext);
          v69.y = MinY;
          v69.x = MidX;
          v71.x = v32;
          width = v63;
          height = v64;
          v71.y = MaxY;
          y = v34;
          x = v33;
          CGContextDrawLinearGradient(CurrentContext, v26, v69, v71, 0);
          CGContextRestoreGState(CurrentContext);
          CGGradientRelease(v26);

          v11 = v61;
          v9 = v62;
          v15 = v59;
          v13 = v60;
        }
      }
    }
    bottomConnector = self->_bottomConnector;
    if (bottomConnector)
    {
      -[PKGradientVerticalConnector topGradientColor](bottomConnector, "topGradientColor");
      v37 = objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v38 = (void *)v37;
        -[PKGradientVerticalConnector bottomGradientColor](self->_bottomConnector, "bottomGradientColor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          -[PKGradientVerticalConnector topGradientColor](self->_bottomConnector, "topGradientColor");
          v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v65[0] = objc_msgSend(v40, "CGColor");
          -[PKGradientVerticalConnector bottomGradientColor](self->_bottomConnector, "bottomGradientColor");
          v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v65[1] = objc_msgSend(v41, "CGColor");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          v43 = (const __CFArray *)objc_msgSend(v42, "copy");
          v44 = CGGradientCreateWithColors(DeviceRGB, v43, locations);

          CGContextSaveGState(CurrentContext);
          v45 = x;
          v46 = y;
          v47 = width;
          v48 = height;
          if (self->_targetView)
          {
            CGRectGetHeight(*(CGRect *)&v45);
          }
          else
          {
            CGRectGetMaxY(*(CGRect *)&v45);
            v81.size.height = v15;
            v81.origin.x = v9;
            v81.origin.y = v11;
            v81.size.width = v13;
            CGRectGetMaxY(v81);
          }
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          v49 = v82.origin.x;
          v50 = v82.origin.y;
          v51 = v82.size.width;
          v52 = v82.size.height;
          v53 = CGRectGetMidX(v82);
          v83.origin.x = v49;
          v83.origin.y = v50;
          v83.size.width = v51;
          v83.size.height = v52;
          v54 = CGRectGetMinY(v83);
          v84.origin.x = v49;
          v84.origin.y = v50;
          v84.size.width = v51;
          v84.size.height = v52;
          v55 = CGRectGetMidX(v84);
          v85.origin.x = v49;
          v85.origin.y = v50;
          v85.size.width = v51;
          v85.size.height = v52;
          v56 = CGRectGetMaxY(v85);
          v86.origin.x = v49;
          v86.origin.y = v50;
          v86.size.width = v51;
          v86.size.height = v52;
          CGContextAddRect(CurrentContext, v86);
          CGContextClip(CurrentContext);
          v70.x = v53;
          v70.y = v54;
          v72.x = v55;
          v72.y = v56;
          CGContextDrawLinearGradient(CurrentContext, v44, v70, v72, 0);
          CGContextRestoreGState(CurrentContext);
          CGGradientRelease(v44);

        }
      }
    }
    CGColorSpaceRelease(DeviceRGB);
  }
}

- (PKGradientVerticalConnector)topConnector
{
  return self->_topConnector;
}

- (PKGradientVerticalConnector)bottomConnector
{
  return self->_bottomConnector;
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_storeStrong((id *)&self->_bottomConnector, 0);
  objc_storeStrong((id *)&self->_topConnector, 0);
}

@end
