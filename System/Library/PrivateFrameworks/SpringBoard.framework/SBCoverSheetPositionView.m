@implementation SBCoverSheetPositionView

- (SBCoverSheetPositionView)initWithFrame:(CGRect)a3
{
  SBCoverSheetPositionView *v3;
  SBCoverSheetPositionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBCoverSheetPositionView;
  v3 = -[SBCoverSheetPositionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SBCoverSheetPositionView _createContentView](v3, "_createContentView");
  return v4;
}

- (void)_createContentView
{
  id v3;
  UIView *v4;
  UIView *contentView;

  if (!self->_contentView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DA9F28]);
    -[SBCoverSheetPositionView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    contentView = self->_contentView;
    self->_contentView = v4;

    -[SBCoverSheetPositionView addSubview:](self, "addSubview:", self->_contentView);
    -[UIView setOpaque:](self->_contentView, "setOpaque:", 0);
    -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
    -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", 1);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBCoverSheetPositionView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  -[UIView frame](self->_contentView, "frame");
  -[SBCoverSheetPositionView _progressFromContenViewFrame:](self, "_progressFromContenViewFrame:");
  -[SBCoverSheetPositionView setProgress:](self, "setProgress:");
  v13.receiver = self;
  v13.super_class = (Class)SBCoverSheetPositionView;
  -[SBCoverSheetPositionView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    -[SBCoverSheetPositionView _simulatedTouchLocationForProgress](self, "_simulatedTouchLocationForProgress");
    -[SBCoverSheetPositionView positionContentForTouchAtLocation:](self, "positionContentForTouchAtLocation:");
  }
}

- (CGRect)positionContentForTouchAtLocation:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBCoverSheetPositionView positionContentForTouchAtLocation:withVelocity:transformMode:forPresentationValue:](self, "positionContentForTouchAtLocation:withVelocity:transformMode:forPresentationValue:", 1, 0, a3.x, a3.y, 0.0, 0.0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)positionContentForTouchAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4 transformMode:(int64_t)a5 forPresentationValue:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double v9;
  double v11;
  double v12;
  __int128 v13;
  uint64_t *v14;
  double v15;
  double width;
  double height;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL IsIdentity;
  double v28;
  double v29;
  BOOL v30;
  UIView *contentView;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  uint64_t v37;
  UIView *v38;
  void *v39;
  void *v40;
  double v41;
  UIView *v42;
  void *v43;
  void *v44;
  void *v45;
  UIView *v46;
  UIView *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double sx;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  double x;
  CGAffineTransform m;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CATransform3D v64;
  _QWORD v65[2];
  _QWORD v66[2];
  CATransform3D v67;
  CGAffineTransform v68;
  CGRect v69;
  CGRect v70;
  CGRect result;

  v6 = a6;
  y = a4.y;
  v9 = a3.y;
  -[SBCoverSheetPositionView bounds](self, "bounds", a3.x, a3.y, a4.x);
  v12 = v11;
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v68.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v68.c = v13;
  *(_OWORD *)&v68.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v14 = (uint64_t *)MEMORY[0x1E0C9D538];
  v55 = v13;
  v56 = *(_OWORD *)&v68.a;
  v54 = *(_OWORD *)&v68.tx;
  if (a5 == 2)
  {
    v52 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    CGAffineTransformMakeScale(&v68, (v11 + (v11 - v9) * -2.0) / v11, (v11 + (v11 - v9) * -2.0) / v11);
    -[SBCoverSheetPositionView bounds](self, "bounds");
    *(_OWORD *)&v67.m11 = *(_OWORD *)&v68.a;
    *(_OWORD *)&v67.m13 = *(_OWORD *)&v68.c;
    *(_OWORD *)&v67.m21 = *(_OWORD *)&v68.tx;
    v70 = CGRectApplyAffineTransform(v69, (CGAffineTransform *)&v67);
    x = v70.origin.x;
    v15 = v70.origin.y;
    width = v70.size.width;
    sx = (y + y) / v12;
    height = v70.size.height;
  }
  else
  {
    SBScreenScale();
    BSFloatRoundForScale();
    v19 = v18;
    -[SBCoverSheetPositionView bounds](self, "bounds");
    v52 = y;
    sx = 0.0;
    height = v20;
    width = v21;
    v15 = v19;
    x = v22;
  }
  UIRectGetCenter();
  v24 = v23;
  v26 = v25;
  *(_OWORD *)&v67.m11 = *(_OWORD *)&v68.a;
  *(_OWORD *)&v67.m13 = *(_OWORD *)&v68.c;
  *(_OWORD *)&v67.m21 = *(_OWORD *)&v68.tx;
  IsIdentity = CGAffineTransformIsIdentity((CGAffineTransform *)&v67);
  -[UIView center](self->_contentView, "center");
  v30 = v26 == v29 && v24 == v28;
  if (v6)
  {
    if (!IsIdentity)
    {
      contentView = self->_contentView;
      v32 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&v67.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *(_OWORD *)&v67.m33 = v32;
      v33 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&v67.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      *(_OWORD *)&v67.m43 = v33;
      v34 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&v67.m11 = *MEMORY[0x1E0CD2610];
      *(_OWORD *)&v67.m13 = v34;
      v35 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      *(_OWORD *)&v67.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      *(_OWORD *)&v67.m23 = v35;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v67);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _setPresentationValue:forKey:](contentView, "_setPresentationValue:forKey:", v36, CFSTR("transform"));

    }
    if (!v30)
    {
      v37 = *v14;
      v38 = self->_contentView;
      *(double *)v66 = v24;
      *(double *)&v66[1] = v26;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v66, "{CGPoint=dd}");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v37;
      *(double *)&v65[1] = v52;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v65, "{CGPoint=dd}");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _setPresentationValue:velocity:preferredFrameRateRangeMaximum:forKey:](v38, "_setPresentationValue:velocity:preferredFrameRateRangeMaximum:forKey:", v39, v40, 120, CFSTR("position"));

    }
    v41 = x;
    if (!IsIdentity)
    {
      memset(&v67, 0, sizeof(v67));
      CATransform3DMakeScale(&v67, sx, sx, 0.0);
      v42 = self->_contentView;
      v43 = (void *)MEMORY[0x1E0CB3B18];
      m = v68;
      CATransform3DMakeAffineTransform(&v64, &m);
      objc_msgSend(v43, "valueWithCATransform3D:", &v64);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = *(_OWORD *)&v67.m31;
      v61 = *(_OWORD *)&v67.m33;
      v62 = *(_OWORD *)&v67.m41;
      v63 = *(_OWORD *)&v67.m43;
      *(_OWORD *)&m.a = *(_OWORD *)&v67.m11;
      *(_OWORD *)&m.c = *(_OWORD *)&v67.m13;
      *(_OWORD *)&m.tx = *(_OWORD *)&v67.m21;
      v59 = *(_OWORD *)&v67.m23;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &m);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _setPresentationValue:velocity:preferredFrameRateRangeMaximum:forKey:](v42, "_setPresentationValue:velocity:preferredFrameRateRangeMaximum:forKey:", v44, v45, 120, CFSTR("transform"));

    }
  }
  else
  {
    v46 = self->_contentView;
    *(_OWORD *)&v67.m11 = v56;
    *(_OWORD *)&v67.m13 = v55;
    *(_OWORD *)&v67.m21 = v54;
    -[UIView setTransform:](v46, "setTransform:", &v67);
    -[UIView setCenter:](self->_contentView, "setCenter:", v24, v26);
    v47 = self->_contentView;
    *(_OWORD *)&v67.m11 = *(_OWORD *)&v68.a;
    *(_OWORD *)&v67.m13 = *(_OWORD *)&v68.c;
    *(_OWORD *)&v67.m21 = *(_OWORD *)&v68.tx;
    -[UIView setTransform:](v47, "setTransform:", &v67);
    v41 = x;
    -[SBCoverSheetPositionView _progressFromContenViewFrame:](self, "_progressFromContenViewFrame:", x, v15, width, height);
    -[SBCoverSheetPositionView setProgress:](self, "setProgress:");
  }
  v48 = v41;
  v49 = v15;
  v50 = width;
  v51 = height;
  result.size.height = v51;
  result.size.width = v50;
  result.origin.y = v49;
  result.origin.x = v48;
  return result;
}

- (double)_progressForTouchLocation:(CGPoint)a3
{
  double y;
  double v4;

  y = a3.y;
  -[UIView bounds](self->_contentView, "bounds", a3.x);
  return (v4 - y) / v4;
}

- (double)_progressFromContenViewFrame:(CGRect)a3
{
  return -a3.origin.y / CGRectGetHeight(a3);
}

- (CGPoint)_simulatedTouchLocationForProgress
{
  double Height;
  double v4;
  double v5;
  double v6;
  CGPoint result;
  CGRect v8;

  -[UIView frame](self->_contentView, "frame");
  Height = CGRectGetHeight(v8);
  -[SBCoverSheetPositionView progress](self, "progress");
  v5 = Height * (1.0 - v4);
  v6 = 0.0;
  result.y = v5;
  result.x = v6;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
