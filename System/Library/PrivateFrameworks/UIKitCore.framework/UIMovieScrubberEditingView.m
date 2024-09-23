@implementation UIMovieScrubberEditingView

- (UIMovieScrubberEditingView)initWithFrame:(CGRect)a3
{
  UIMovieScrubberEditingView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *inactiveImages;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *activeNoEditImages;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *activeImages;
  UIImageView *v22;
  void *v23;
  uint64_t v24;
  UIImageView *leftImageView;
  UIImageView *v26;
  void *v27;
  uint64_t v28;
  UIImageView *middleImageView;
  UIImageView *v30;
  void *v31;
  uint64_t v32;
  UIImageView *rightImageView;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)UIMovieScrubberEditingView;
  v3 = -[UIView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D20]);
    _UIImageWithName(CFSTR("UIMovieScrubberEditingGlassLeft.png"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageWithName(CFSTR("UIMovieScrubberEditingGlassFill.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageWithName(CFSTR("UIMovieScrubberEditingGlassRight.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, 0);
    inactiveImages = v3->_inactiveImages;
    v3->_inactiveImages = (NSArray *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99D20]);
    _UIImageWithName(CFSTR("UIMovieScrubberNoEditGlassLeft.png"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageWithName(CFSTR("UIMovieScrubberNoEditGlassFill.png"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageWithName(CFSTR("UIMovieScrubberNoEditGlassRight.png"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "initWithObjects:", v11, v12, v13, 0);
    activeNoEditImages = v3->_activeNoEditImages;
    v3->_activeNoEditImages = (NSArray *)v14;

    v16 = objc_alloc(MEMORY[0x1E0C99D20]);
    _UIImageWithName(CFSTR("UIMovieScrubberEditingLeft.png"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageWithName(CFSTR("UIMovieScrubberEditingFill.png"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageWithName(CFSTR("UIMovieScrubberEditingRight.png"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "initWithObjects:", v17, v18, v19, 0);
    activeImages = v3->_activeImages;
    v3->_activeImages = (NSArray *)v20;

    v22 = [UIImageView alloc];
    -[NSArray objectAtIndex:](v3->_inactiveImages, "objectAtIndex:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[UIImageView initWithImage:](v22, "initWithImage:", v23);
    leftImageView = v3->_leftImageView;
    v3->_leftImageView = (UIImageView *)v24;

    -[UIView addSubview:](v3, "addSubview:", v3->_leftImageView);
    v26 = [UIImageView alloc];
    -[NSArray objectAtIndex:](v3->_inactiveImages, "objectAtIndex:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[UIImageView initWithImage:](v26, "initWithImage:", v27);
    middleImageView = v3->_middleImageView;
    v3->_middleImageView = (UIImageView *)v28;

    -[UIImageView setContentMode:](v3->_middleImageView, "setContentMode:", 0);
    -[UIView addSubview:](v3, "addSubview:", v3->_middleImageView);
    v30 = [UIImageView alloc];
    -[NSArray objectAtIndex:](v3->_inactiveImages, "objectAtIndex:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[UIImageView initWithImage:](v30, "initWithImage:", v31);
    rightImageView = v3->_rightImageView;
    v3->_rightImageView = (UIImageView *)v32;

    -[UIView addSubview:](v3, "addSubview:", v3->_rightImageView);
    v3->_enabled = 1;
    v3->_editing = 0;
    -[UIMovieScrubberEditingView _updateHandleImages](v3, "_updateHandleImages");
  }
  return v3;
}

- (void)setEdgeInset:(double)a3
{
  self->_edgeInset = a3;
  -[UIMovieScrubberEditingView layoutSubviews](self, "layoutSubviews");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double edgeInset;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGSize v13;
  void *v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGFloat v18;
  CGRect v19;
  CGRect remainder;
  CGRect v21;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  edgeInset = self->_edgeInset;
  v9 = v8 + edgeInset;
  remainder.origin.x = v8 + edgeInset;
  remainder.origin.y = v4;
  v11 = v10 - (edgeInset + edgeInset);
  remainder.size.width = v11;
  remainder.size.height = v5;
  -[UIMovieScrubberEditingView _handleImages](self, "_handleImages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v19.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v19.size = v13;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  v16 = v15;
  v21.origin.x = v9;
  v21.origin.y = v4;
  v21.size.width = v11;
  v21.size.height = v6;
  CGRectDivide(v21, &v19, &remainder, v16, CGRectMinXEdge);
  -[UIImageView setFrame:](self->_leftImageView, "setFrame:", *(_OWORD *)&v19.origin, *(_OWORD *)&v19.size);
  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "size");
  CGRectDivide(remainder, &v19, &remainder, v18, CGRectMaxXEdge);
  -[UIImageView setFrame:](self->_rightImageView, "setFrame:", *(_OWORD *)&v19.origin, *(_OWORD *)&v19.size);
  -[UIImageView setFrame:](self->_middleImageView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);

}

- (CGRect)_leftHandleRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v6 = self->_edgeInset + 48.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)pointInsideLeftHandle:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[UIMovieScrubberEditingView _leftHandleRect](self, "_leftHandleRect");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (CGRect)_rightHandleRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double edgeInset;
  double v8;
  double v9;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v6 = v5 + -48.0;
  edgeInset = self->_edgeInset;
  v8 = v6 - edgeInset;
  v9 = edgeInset + 48.0;
  result.size.height = v4;
  result.size.width = v9;
  result.origin.y = v3;
  result.origin.x = v8;
  return result;
}

- (BOOL)pointInsideRightHandle:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[UIMovieScrubberEditingView _rightHandleRect](self, "_rightHandleRect");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (int)handleForPoint:(CGPoint)a3 hitOffset:(double *)a4
{
  double x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  _BOOL4 v22;
  _BOOL4 v23;
  double v24;
  CGFloat v25;
  int result;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat rect;
  CGFloat y;
  CGPoint v32;
  CGPoint v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  -[UIMovieScrubberEditingView _leftHandleRect](self, "_leftHandleRect");
  v8 = v7;
  v28 = v9;
  v29 = v7;
  v10 = v9;
  v12 = v11;
  v27 = v13;
  -[UIMovieScrubberEditingView _rightHandleRect](self, "_rightHandleRect");
  v15 = v14;
  v17 = v16;
  rect = v16;
  v19 = v18;
  v21 = v20;
  v34.origin.x = v8;
  v34.origin.y = v10;
  v34.size.width = v12;
  v34.size.height = v27;
  v32.x = x;
  v32.y = y;
  v22 = CGRectContainsPoint(v34, v32);
  v35.origin.x = v15;
  v35.origin.y = v17;
  v35.size.width = v19;
  v35.size.height = v21;
  v33.x = x;
  v33.y = y;
  v23 = CGRectContainsPoint(v35, v33);
  v36.origin.y = v28;
  v36.origin.x = v29;
  v36.size.width = v12;
  v36.size.height = v27;
  v24 = CGRectGetMaxX(v36) + -36.0 - x;
  v37.origin.x = v15;
  v37.origin.y = rect;
  v37.size.width = v19;
  v37.size.height = v21;
  v25 = CGRectGetMinX(v37) + 36.0 - x;
  if (v22 && v23)
  {
    if (fabs(v24) > fabs(v25))
    {
      result = 2;
    }
    else
    {
      v25 = v24;
      result = 1;
    }
  }
  else
  {
    if (v22)
    {
      v25 = v24;
      result = 1;
    }
    else
    {
      result = 2;
    }
    if (!v22 && !v23)
    {
      -[UIView bounds](self, "bounds", v25);
      v25 = CGRectGetMidX(v38) - x;
      result = 3;
    }
  }
  *a4 = v25;
  return result;
}

- (id)_handleImages
{
  int *v2;

  v2 = &OBJC_IVAR___UIMovieScrubberEditingView__activeNoEditImages;
  if (self->_enabled)
  {
    v2 = &OBJC_IVAR___UIMovieScrubberEditingView__inactiveImages;
    if (self->_editing)
      v2 = &OBJC_IVAR___UIMovieScrubberEditingView__activeImages;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (void)_updateHandleImages
{
  UIImageView *leftImageView;
  void *v4;
  UIImageView *middleImageView;
  void *v6;
  UIImageView *rightImageView;
  void *v8;
  id v9;

  -[UIMovieScrubberEditingView _handleImages](self, "_handleImages");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  leftImageView = self->_leftImageView;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](leftImageView, "setImage:", v4);

  middleImageView = self->_middleImageView;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](middleImageView, "setImage:", v6);

  rightImageView = self->_rightImageView;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](rightImageView, "setImage:", v8);

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[UIMovieScrubberEditingView _updateHandleImages](self, "_updateHandleImages");
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_enabled && self->_editing != a3)
  {
    self->_editing = a3;
    -[UIMovieScrubberEditingView _updateHandleImages](self, "_updateHandleImages");
  }
}

- (void)bounce
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t i;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.x"));
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CD3058];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTimingFunction:", v4);

  objc_msgSend(v36, "setDuration:", 0.75);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.x"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v6);

  objc_msgSend(v5, "setDuration:", 0.75);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size.width"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v8);

  objc_msgSend(v7, "setDuration:", 0.75);
  -[UIView layer](self->_leftImageView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "position");
  v11 = v10;

  -[UIView layer](self->_rightImageView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "position");
  v14 = v13;

  -[UIView layer](self->_middleImageView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 24);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 24);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 24);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 24);
  for (i = 0; i != 25; ++i)
  {
    v23 = (double)i;
    *(float *)&v23 = (double)i / 24.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v24);

    -[UIMovieScrubberEditingView _bounceValueForFraction:](self, "_bounceValueForFraction:", (double)i / 24.0);
    v26 = v25;
    v27 = v11 - v25;
    *(float *)&v27 = v27;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v28);

    v29 = v14 + v26;
    *(float *)&v29 = v14 + v26;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v30);

    v31 = ceil(v17 + v26 + v26);
    *(float *)&v31 = v31;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v32);

  }
  objc_msgSend(v36, "setKeyTimes:", v18);
  objc_msgSend(v36, "setValues:", v19);
  -[UIView layer](self->_leftImageView, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addAnimation:forKey:", v36, 0);

  objc_msgSend(v5, "setKeyTimes:", v18);
  objc_msgSend(v5, "setValues:", v20);
  -[UIView layer](self->_rightImageView, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addAnimation:forKey:", v5, 0);

  objc_msgSend(v7, "setKeyTimes:", v18);
  objc_msgSend(v7, "setValues:", v21);
  -[UIView layer](self->_middleImageView, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addAnimation:forKey:", v7, 0);

}

- (double)_bounceValueForFraction:(double)a3
{
  double result;
  double v6;
  double v7;

  result = 0.0;
  if (a3 > 0.0 && a3 < 1.0)
  {
    v6 = a3 + a3;
    v7 = cos((a3 + a3 + -0.145) * 11.0);
    return v7 * exp((v6 + 0.4) * -3.0) * 120.0;
  }
  return result;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (double)edgeInset
{
  return self->_edgeInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveImages, 0);
  objc_storeStrong((id *)&self->_activeNoEditImages, 0);
  objc_storeStrong((id *)&self->_activeImages, 0);
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_middleImageView, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
}

@end
