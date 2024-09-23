@implementation LookAroundPuckView

- (LookAroundPuckView)initWithFrame:(CGRect)a3
{
  LookAroundPuckView *v3;
  id v4;
  double y;
  double width;
  double height;
  UIView *v8;
  UIView *coneContainerView;
  UIImageView *v10;
  UIImageView *puckConeView;
  UIImageView *v12;
  UIImageView *puckImageView;
  LookAroundPuckGlyphView *v14;
  LookAroundPuckGlyphView *glyphView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  LookAroundPuckView *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  _QWORD v46[8];

  v45.receiver = self;
  v45.super_class = (Class)LookAroundPuckView;
  v3 = -[LookAroundPuckView initWithFrame:](&v45, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = (UIView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    coneContainerView = v3->_coneContainerView;
    v3->_coneContainerView = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_coneContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[LookAroundPuckView addSubview:](v3, "addSubview:", v3->_coneContainerView);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Cone")));
    v10 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v44);
    puckConeView = v3->_puckConeView;
    v3->_puckConeView = v10;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_puckConeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_coneContainerView, "addSubview:", v3->_puckConeView);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Puck")));
    v12 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v43);
    puckImageView = v3->_puckImageView;
    v3->_puckImageView = v12;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_puckImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[LookAroundPuckView addSubview:](v3, "addSubview:", v3->_puckImageView);
    v14 = -[LookAroundPuckGlyphView initWithFrame:]([LookAroundPuckGlyphView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    glyphView = v3->_glyphView;
    v3->_glyphView = v14;

    -[LookAroundPuckGlyphView setTranslatesAutoresizingMaskIntoConstraints:](v3->_glyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[LookAroundPuckView addSubview:](v3, "addSubview:", v3->_glyphView);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3->_coneContainerView, "centerXAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView centerXAnchor](v3, "centerXAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
    v46[0] = v40;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3->_coneContainerView, "centerYAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView centerYAnchor](v3, "centerYAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
    v46[1] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v3->_puckConeView, "centerXAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView centerXAnchor](v3, "centerXAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
    v46[2] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v3->_puckConeView, "centerYAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView centerYAnchor](v3, "centerYAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
    v46[3] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v3->_puckImageView, "centerXAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView centerXAnchor](v3, "centerXAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v46[4] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v3->_puckImageView, "centerYAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView centerYAnchor](v3, "centerYAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v16));
    v46[5] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckGlyphView centerXAnchor](v3->_glyphView, "centerXAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView centerXAnchor](v3, "centerXAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v46[6] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckGlyphView centerYAnchor](v3->_glyphView, "centerYAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView centerYAnchor](v3, "centerYAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    v46[7] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    -[LookAroundPuckView setNeedsUpdateSubviews](v3, "setNeedsUpdateSubviews");
    -[LookAroundPuckView updateSubviewsIfNeeded](v3, "updateSubviewsIfNeeded");
    v25 = v3;

  }
  return v3;
}

- (void)updateSubviewsAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  double pitch;
  double v7;
  double v8;
  int64_t v9;
  double v15;
  LookAroundPuckView *v16;
  UIView *v17;
  UIImageView *v18;
  UIImageView *v19;
  LookAroundPuckGlyphView *v20;
  UIView *v21;
  UIImageView *v22;
  UIImageView *v23;
  LookAroundPuckGlyphView *v24;
  LookAroundPuckView *v25;
  _QWORD *v26;
  void *v27;
  unsigned int v28;
  id v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  unsigned int v35;
  id v36;
  double v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  char v43;
  _QWORD v44[4];
  id v45;
  char v46;
  _OWORD v47[3];
  _OWORD v48[2];
  __int128 v49;
  _QWORD v50[4];
  UIView *v51;
  UIImageView *v52;
  UIImageView *v53;
  LookAroundPuckGlyphView *v54;
  LookAroundPuckView *v55;
  double v56;
  uint64_t v57;
  __int128 v58;
  double v59;
  double v60;
  double v61;

  v4 = a3;
  v36 = a4;
  v35 = -[LookAroundPuckGlyphView isTilted](self->_glyphView, "isTilted");
  v37 = self->_heading + 3.14159265;
  pitch = self->_pitch;
  v7 = 1.0;
  if (self->_dimmed)
    v8 = 0.5;
  else
    v8 = 1.0;
  v9 = -[LookAroundPuckView state](self, "state");
  __asm { FMOV            V0.2D, #1.0 }
  *(double *)&_Q0 = v37;
  switch(v9)
  {
    case 0:
      v38 = _Q0;
      v8 = 0.0;
      goto LABEL_8;
    case 1:
      -[LookAroundPuckGlyphView setTilted:animated:](self->_glyphView, "setTilted:animated:", 0, v4, v37);
      v38 = xmmword_100E352C0;
LABEL_8:
      v15 = 0.0;
      break;
    case 2:
      v38 = _Q0;
      -[LookAroundPuckGlyphView setTilted:animated:](self->_glyphView, "setTilted:animated:", 1, v4);
      if (self->_dimmed)
        v15 = 0.0;
      else
        v15 = 1.0;
      break;
    case 3:
      v38 = _Q0;
      -[LookAroundPuckGlyphView setTilted:animated:](self->_glyphView, "setTilted:animated:", 1, v4);
      v15 = 0.0;
      v7 = 1.2;
      break;
    default:
      v38 = _Q0;
      v15 = 1.0;
      break;
  }
  v16 = self;
  v17 = v16->_coneContainerView;
  v18 = v16->_puckConeView;
  v19 = v16->_puckImageView;
  v20 = self->_glyphView;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100A60460;
  v50[3] = &unk_1011E0BF8;
  v56 = v7;
  v57 = v38;
  v21 = v17;
  v51 = v21;
  v22 = v18;
  v52 = v22;
  v58 = v38;
  v59 = v15;
  v23 = v19;
  v53 = v23;
  v60 = v8;
  v24 = v20;
  v54 = v24;
  v61 = pitch;
  v25 = v16;
  v55 = v25;
  v26 = objc_retainBlock(v50);
  v27 = v26;
  if (v4)
  {
    if ((v35 & 1) == 0)
    {
      v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v48[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v33 = v48[0];
      v48[1] = v34;
      v49 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v32 = v49;
      -[UIView setTransform:](v21, "setTransform:", v48);
      v47[0] = v33;
      v47[1] = v34;
      v47[2] = v32;
      -[LookAroundPuckGlyphView setTransform:](v24, "setTransform:", v47);
    }
    v28 = v35 ^ -[LookAroundPuckGlyphView isTilted](self->_glyphView, "isTilted");
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100A60700;
    v44[3] = &unk_1011B06A0;
    v29 = v27;
    v45 = v29;
    v46 = v28;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100A6071C;
    v41[3] = &unk_1011E0C20;
    v43 = v28;
    v30 = v36;
    v42 = v30;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v44, v41, 0.4);
    if (v28 == 1)
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100A60738;
      v39[3] = &unk_1011ADA00;
      v40 = v29;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v39, v30, 0.3, 0.5);

    }
    v31 = v36;
  }
  else
  {
    ((void (*)(_QWORD *, uint64_t))v26[2])(v26, 1);
    v31 = v36;
    if (v36)
      (*((void (**)(id, uint64_t))v36 + 2))(v36, 1);
  }

}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  -[LookAroundPuckView setNeedsUpdateSubviews](self, "setNeedsUpdateSubviews");
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
  -[LookAroundPuckView setNeedsUpdateSubviews](self, "setNeedsUpdateSubviews");
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
  -[LookAroundPuckView setNeedsUpdateSubviews](self, "setNeedsUpdateSubviews");
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
  -[LookAroundPuckView setNeedsUpdateSubviews](self, "setNeedsUpdateSubviews");
}

- (void)setNeedsUpdateSubviews
{
  self->_subviewsNeedUpdate = 1;
}

- (void)updateSubviewsIfNeeded
{
  -[LookAroundPuckView updateSubviewsIfNeededAnimated:completion:](self, "updateSubviewsIfNeededAnimated:completion:", 0, 0);
}

- (void)updateSubviewsIfNeededAnimated:(BOOL)a3
{
  -[LookAroundPuckView updateSubviewsIfNeededAnimated:completion:](self, "updateSubviewsIfNeededAnimated:completion:", a3, 0);
}

- (void)updateSubviewsIfNeededAnimated:(BOOL)a3 completion:(id)a4
{
  if (self->_subviewsNeedUpdate)
  {
    self->_subviewsNeedUpdate = 0;
    -[LookAroundPuckView updateSubviewsAnimated:completion:](self, "updateSubviewsAnimated:completion:", a3, a4);
  }
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (double)pitch
{
  return self->_pitch;
}

- (double)heading
{
  return self->_heading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_puckImageView, 0);
  objc_storeStrong((id *)&self->_puckConeView, 0);
  objc_storeStrong((id *)&self->_coneContainerView, 0);
}

@end
