@implementation CardShadowView

- (CardShadowView)initWithFrame:(CGRect)a3
{
  CardShadowView *v3;
  CardShadowView *v4;
  CardShadowView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CardShadowView;
  v3 = -[CardShadowView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_invalidatedShadow = 1;
    v5 = v3;
  }

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CardShadowView;
  -[CardShadowView traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[CardShadowView invalidateCachedShadow](self, "invalidateCachedShadow");
}

- (void)layoutSubviews
{
  int *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  UIImageView *v25;
  UIImageView *shadowImageView;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  void *v31;
  CGContext *CurrentContext;
  CGColor *SRGB;
  void *v34;
  void *v35;
  UIImage *ImageFromCurrentImageContext;
  void *v37;
  UIImageView *v38;
  UIImageView *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  _QWORD v58[6];
  CGSize v59;
  CGSize v60;
  CGRect v61;
  CGRect v62;

  v3 = &OBJC_IVAR___CuratedCollectionResolver__delegate;
  if (self->_invalidatedShadow)
  {
    self->_invalidatedShadow = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView traitCollection](self, "traitCollection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CardShadowSettings settingsForTraitCollection:button:](CardShadowSettings, "settingsForTraitCollection:button:", v4, -[CardShadowView buttonCard](self, "buttonCard")));

    objc_storeStrong((id *)&self->_settings, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView traitCollection](self, "traitCollection"));
    objc_msgSend(v6, "displayScale");
    v8 = v7;

    objc_msgSend(v5, "cornerRadius");
    v10 = v9;
    objc_msgSend(v5, "rimOpacity");
    v12 = v11;
    objc_msgSend(v5, "opacity");
    v14 = v13;
    objc_msgSend(v5, "radius");
    v16 = v15;
    if (-[CardShadowView shouldCropBottomEdge](self, "shouldCropBottomEdge"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v17, "setCornerRadius:", 0.0);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v18, "setBorderColor:", 0);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v19, "setBorderWidth:", 0.0);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v20, "setShadowRadius:", 0.0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      LODWORD(v22) = 0;
      objc_msgSend(v21, "setShadowOpacity:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v23, "setShadowColor:", 0);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v24, "setShadowPathIsBounds:", 0);

      if (!self->_shadowImageView)
      {
        v25 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        shadowImageView = self->_shadowImageView;
        self->_shadowImageView = v25;

        -[CardShadowView addSubview:](self, "addSubview:", self->_shadowImageView);
      }
      if (qword_1014D2718 != -1)
        dispatch_once(&qword_1014D2718, &stru_1011B94D8);
      v58[5] = 1;
      *(double *)v58 = v10;
      *(double *)&v58[1] = v12;
      *(double *)&v58[2] = v16;
      *(CGFloat *)&v58[3] = v14;
      *(CGFloat *)&v58[4] = v8;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v58, "{?=dddddB}"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2710, "objectForKeyedSubscript:", v27));
      if (!v28)
      {
        v57 = ceil(v10 * 1.528665);
        v29 = ceil(v16);
        v30 = v29 * 3.0 + v57 * 2.0 + 1.0;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v29, v29, v30 - v29 * 2.0, v30 - v29 * 2.0 + v30 - v29 * 2.0, v10));
        v59.width = v30;
        v59.height = v30;
        UIGraphicsBeginImageContextWithOptions(v59, 0, v8);
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(CurrentContext);
        SRGB = CGColorCreateSRGB(0.0, 0.0, 0.0, v14);
        v60.width = 0.0;
        v60.height = v30 + v30;
        CGContextSetShadowWithColor(CurrentContext, v60, v16, SRGB);
        CGColorRelease(SRGB);
        CGContextTranslateCTM(CurrentContext, 0.0, -(v30 + v30));
        objc_msgSend(v31, "fill");
        CGContextRestoreGState(CurrentContext);
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, v12));
        objc_msgSend(v34, "set");

        objc_msgSend(v31, "setLineWidth:", 2.0 / v8);
        objc_msgSend(v31, "stroke");
        CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOut);
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        objc_msgSend(v35, "set");

        objc_msgSend(v31, "fill");
        ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
        v37 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
        UIGraphicsEndImageContext();
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "resizableImageWithCapInsets:", v57 + v29, v57 + v29, v57 + v29, v57 + v29));

        if (v28)
          objc_msgSend((id)qword_1014D2710, "setObject:forKeyedSubscript:", v28, v27);
        v3 = &OBJC_IVAR___CuratedCollectionResolver__delegate;
      }

      -[UIImageView setImage:](self->_shadowImageView, "setImage:", v28);
    }
    else
    {
      v38 = self->_shadowImageView;
      if (v38)
      {
        -[UIImageView removeFromSuperview](v38, "removeFromSuperview");
        v39 = self->_shadowImageView;
        self->_shadowImageView = 0;

      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, v12));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, v14));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v42, "setCornerRadius:", v10);

      v43 = objc_retainAutorelease(v40);
      v44 = objc_msgSend(v43, "CGColor");
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v45, "setBorderColor:", v44);

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v46, "setBorderWidth:", 2.0 / v8);

      v47 = objc_retainAutorelease(v41);
      v48 = objc_msgSend(v47, "CGColor");
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v49, "setShadowColor:", v48);

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v50, "setShadowRadius:", v16);

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      LODWORD(v52) = 1.0;
      objc_msgSend(v51, "setShadowOpacity:", v52);

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v53, "setShadowOffset:", 0.0, 1.0);

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[CardShadowView layer](self, "layer"));
      objc_msgSend(v54, "setShadowPathIsBounds:", 1);

    }
  }
  if (self->_shadowImageView)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v3[710]), "expansion");
    v56 = v55;
    -[CardShadowView bounds](self, "bounds");
    v62 = CGRectInset(v61, -v56, -v56);
    -[UIImageView setFrame:](self->_shadowImageView, "setFrame:", v62.origin.x, v62.origin.y, v62.size.width, v62.size.height - v56);
  }
}

- (void)invalidateCachedShadow
{
  self->_invalidatedShadow = 1;
  -[CardShadowView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setButtonCard:(BOOL)a3
{
  if (self->_buttonCard != a3)
  {
    self->_buttonCard = a3;
    -[CardShadowView invalidateCachedShadow](self, "invalidateCachedShadow");
  }
}

- (void)setShouldCropBottomEdge:(BOOL)a3
{
  self->_shouldCropBottomEdge = a3;
  -[CardShadowView invalidateCachedShadow](self, "invalidateCachedShadow");
}

- (BOOL)buttonCard
{
  return self->_buttonCard;
}

- (BOOL)shouldCropBottomEdge
{
  return self->_shouldCropBottomEdge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_shadowImageView, 0);
}

@end
