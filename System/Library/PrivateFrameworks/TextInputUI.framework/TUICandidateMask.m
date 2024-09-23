@implementation TUICandidateMask

- (TUICandidateMask)initWithFrame:(CGRect)a3
{
  TUICandidateMask *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TUICandidateMask;
  v3 = -[TUICandidateMask initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    -[TUICandidateMask setCenterView:](v3, "setCenterView:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateMask centerView](v3, "centerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v10);

    -[TUICandidateMask centerView](v3, "centerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateMask addSubview:](v3, "addSubview:", v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v5, v6, v7, v8);
    -[TUICandidateMask setLeftEdgeImageView:](v3, "setLeftEdgeImageView:", v13);

    -[TUICandidateMask leftEdgeImageView](v3, "leftEdgeImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateMask addSubview:](v3, "addSubview:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v5, v6, v7, v8);
    -[TUICandidateMask setRightEdgeImageView:](v3, "setRightEdgeImageView:", v15);

    -[TUICandidateMask rightEdgeImageView](v3, "rightEdgeImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateMask addSubview:](v3, "addSubview:", v16);

  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "leftEdgeMaskImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateMask leftEdgeImageView](self, "leftEdgeImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  objc_msgSend(v4, "rightEdgeMaskImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUICandidateMask rightEdgeImageView](self, "rightEdgeImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

  -[TUICandidateMask _updateLayout](self, "_updateLayout");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUICandidateMask;
  -[TUICandidateMask setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TUICandidateMask _updateLayout](self, "_updateLayout");
}

- (void)_updateLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  -[TUICandidateMask frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[TUICandidateMask leftEdgeImageView](self, "leftEdgeImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;

  -[TUICandidateMask rightEdgeImageView](self, "rightEdgeImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;

  -[TUICandidateMask leftEdgeImageView](self, "leftEdgeImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v10, v6);

  -[TUICandidateMask centerView](self, "centerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v10, 0.0, v4 - v10 - v14, v6);

  -[TUICandidateMask rightEdgeImageView](self, "rightEdgeImageView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v4 - v14, 0.0, v14, v6);

}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (UIImageView)leftEdgeImageView
{
  return self->_leftEdgeImageView;
}

- (void)setLeftEdgeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_leftEdgeImageView, a3);
}

- (NSLayoutConstraint)leftEdgeWidthConstraint
{
  return self->_leftEdgeWidthConstraint;
}

- (void)setLeftEdgeWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leftEdgeWidthConstraint, a3);
}

- (UIImageView)rightEdgeImageView
{
  return self->_rightEdgeImageView;
}

- (void)setRightEdgeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_rightEdgeImageView, a3);
}

- (NSLayoutConstraint)rightEdgeWidthConstraint
{
  return self->_rightEdgeWidthConstraint;
}

- (void)setRightEdgeWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_rightEdgeWidthConstraint, a3);
}

- (UIView)centerView
{
  return self->_centerView;
}

- (void)setCenterView:(id)a3
{
  objc_storeStrong((id *)&self->_centerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerView, 0);
  objc_storeStrong((id *)&self->_rightEdgeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_rightEdgeImageView, 0);
  objc_storeStrong((id *)&self->_leftEdgeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leftEdgeImageView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
