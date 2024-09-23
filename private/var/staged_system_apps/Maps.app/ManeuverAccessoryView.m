@implementation ManeuverAccessoryView

- (id)initForDetached:(BOOL)a3
{
  double y;
  double width;
  double height;
  ManeuverAccessoryView *v7;
  ManeuverAccessoryView *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  GuidanceManeuverView *v12;
  GuidanceManeuverView *maneuverView;
  GuidanceManeuverView *v14;
  GuidanceManeuverView *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *transportTypeImageView;
  void *v19;
  void *v20;
  _BYTE v22[496];
  _OWORD v23[31];
  _BYTE __dst[496];
  _QWORD __src[62];
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)ManeuverAccessoryView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[ManeuverAccessoryView initWithFrame:](&v26, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[ManeuverAccessoryView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v11);

    v8->_isDetached = a3;
    v12 = -[GuidanceManeuverView initWithFrame:textureProvider:]([GuidanceManeuverView alloc], "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, y, width, height);
    maneuverView = v8->_maneuverView;
    v8->_maneuverView = v12;

    MKDefaultCompactManeuverMetrics(__src);
    v14 = v8->_maneuverView;
    memcpy(__dst, __src, sizeof(__dst));
    memset(v23, 0, sizeof(v23));
    MKDefaultJunctionManeuverMetrics(v23, -[GuidanceManeuverView setArrowMetrics:](v14, "setArrowMetrics:", __dst));
    BYTE2(v23[21]) = 1;
    v15 = v8->_maneuverView;
    memcpy(v22, v23, sizeof(v22));
    -[GuidanceManeuverView setJunctionArrowMetrics:](v15, "setJunctionArrowMetrics:", v22);
    -[GuidanceManeuverView setUsesCompactImages:](v8->_maneuverView, "setUsesCompactImages:", 1);
    -[GuidanceManeuverView setFraming:](v8->_maneuverView, "setFraming:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[GuidanceManeuverView setAccentColor:](v8->_maneuverView, "setAccentColor:", v16);

    -[GuidanceManeuverView setContentMode:](v8->_maneuverView, "setContentMode:", 1);
    -[ManeuverAccessoryView addSubview:](v8, "addSubview:", v8->_maneuverView);
    v17 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    transportTypeImageView = v8->_transportTypeImageView;
    v8->_transportTypeImageView = v17;

    -[UIImageView setAccessibilityIdentifier:](v8->_transportTypeImageView, "setAccessibilityIdentifier:", CFSTR("TransportTypeImageView"));
    -[UIImageView setContentMode:](v8->_transportTypeImageView, "setContentMode:", 1);
    -[UIImageView setHidden:](v8->_transportTypeImageView, "setHidden:", 1);
    -[ManeuverAccessoryView addSubview:](v8, "addSubview:", v8->_transportTypeImageView);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor"));
    -[GuidanceManeuverView setArrowColor:](v8->_maneuverView, "setArrowColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor"));
    -[UIImageView setTintColor:](v8->_transportTypeImageView, "setTintColor:", v20);

    v8->_usesArrowMetricsReferenceSize = 1;
  }
  return v8;
}

- (double)preferredLeadingPadding
{
  double v3;
  GuidanceManeuverView *maneuverView;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  unsigned int v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v3 = 0.0;
  if (-[ManeuverAccessoryView usesArrowMetricsReferenceSize](self, "usesArrowMetricsReferenceSize"))
    return v3;
  maneuverView = self->_maneuverView;
  if (maneuverView)
  {
    -[GuidanceManeuverView arrowMetrics](maneuverView, "arrowMetrics");
    maneuverView = self->_maneuverView;
    v3 = *((double *)&v21 + 1) * 0.5;
  }
  else
  {
    v50 = 0u;
    v51 = 0;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
  }
  -[GuidanceManeuverView intrinsicContentSize](maneuverView, "intrinsicContentSize", v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51);
  v6 = 1.0;
  if (v5 > v3 * 1.75)
    v6 = 0.0;
  if (v5 > v3 * 1.5)
    v7 = v6;
  else
    v7 = 2.0;
  if (v5 > v3 * 1.25)
    v8 = v7;
  else
    v8 = 3.0;
  if (v5 > v3)
    v3 = v8;
  else
    v3 = 4.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self->_maneuverView, "maneuverArtwork"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "junction"));

  if (!v10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self->_maneuverView, "maneuverArtwork"));
    if (objc_msgSend(v9, "maneuver") == 61)
    {

LABEL_24:
      -[ManeuverAccessoryView _sharpRightAdditionalInset](self, "_sharpRightAdditionalInset");
      v3 = v3 + v15;
LABEL_25:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self->_maneuverView, "maneuverArtwork"));
      if (objc_msgSend(v9, "maneuver") == 2)
      {

        goto LABEL_29;
      }
      goto LABEL_27;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self->_maneuverView, "maneuverArtwork"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "junction"));
  v13 = objc_msgSend(v12, "willSnapToSharpRight");

  if (!v10)
  {

    if (!v13)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (v13)
  {
    -[ManeuverAccessoryView _sharpRightAdditionalInset](self, "_sharpRightAdditionalInset");
    v3 = v3 + v14;
  }
LABEL_27:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView maneuverArtwork](self->_maneuverView, "maneuverArtwork"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "junction"));
  v18 = objc_msgSend(v17, "willSnapToRightHandTurn");

  if (!v10)
  {

    if ((v18 & 1) == 0)
      return v3;
    goto LABEL_29;
  }
  if (v18)
  {
LABEL_29:
    -[ManeuverAccessoryView _rightAdditionalInset](self, "_rightAdditionalInset");
    return v3 + v19;
  }
  return v3;
}

- (double)_sharpRightAdditionalInset
{
  if (qword_1014D27E8 != -1)
    dispatch_once(&qword_1014D27E8, &stru_1011BA588);
  return *(double *)&qword_1014D27E0;
}

- (double)_rightAdditionalInset
{
  if (qword_1014D27F8 != -1)
    dispatch_once(&qword_1014D27F8, &stru_1011BA5A8);
  return *(double *)&qword_1014D27F0;
}

- (CGSize)intrinsicContentSize
{
  unsigned __int8 v3;
  double v4;
  double v5;
  double v6;
  GuidanceManeuverView *maneuverView;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  CGSize result;

  v3 = -[ManeuverAccessoryView isRerouting](self, "isRerouting");
  v4 = 20.0;
  v5 = 20.0;
  v6 = 20.0;
  if ((v3 & 1) == 0)
  {
    maneuverView = self->_maneuverView;
    if (maneuverView)
    {
      -[GuidanceManeuverView arrowMetrics](maneuverView, "arrowMetrics", 20.0);
      v6 = *((double *)&v9 + 1);
      v5 = *(double *)&v10;
    }
    else
    {
      v38 = 0u;
      v39 = 0;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = 0.0;
      v9 = 0u;
      v6 = 0.0;
    }
    if (-[ManeuverAccessoryView usesArrowMetricsReferenceSize](self, "usesArrowMetricsReferenceSize", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25,
           v26,
           v27,
           v28,
           v29,
           v30,
           v31,
           v32,
           v33,
           v34,
           v35,
           v36,
           v37,
           v38,
           v39))
    {
      v4 = v6;
    }
    else
    {
      -[GuidanceManeuverView intrinsicContentSize](self->_maneuverView, "intrinsicContentSize");
    }
  }
  if (self->_isDetached)
    v4 = 45.0;
  if (v4 <= v6 * 0.5)
    v4 = v6 * 0.5;
  v8 = v5;
  result.height = v8;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  GuidanceManeuverView *maneuverView;
  double v4;
  double v5;
  unsigned __int8 v6;
  double v7;
  unsigned __int8 v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  maneuverView = self->_maneuverView;
  if (maneuverView)
  {
    -[GuidanceManeuverView arrowMetrics](maneuverView, "arrowMetrics");
    v5 = *((double *)&v13 + 1);
    v4 = *(double *)&v14;
  }
  else
  {
    v42 = 0u;
    v43 = 0;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = 0.0;
    v13 = 0u;
    v5 = 0.0;
  }
  v6 = -[ManeuverAccessoryView isRerouting](self, "isRerouting", v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29,
         v30,
         v31,
         v32,
         v33,
         v34,
         v35,
         v36,
         v37,
         v38,
         v39,
         v40,
         v41,
         v42,
         v43);
  v7 = 20.0;
  if ((v6 & 1) == 0)
  {
    v8 = -[ManeuverAccessoryView usesArrowMetricsReferenceSize](self, "usesArrowMetricsReferenceSize", 20.0);
    v7 = v5;
    if ((v8 & 1) == 0)
      -[GuidanceManeuverView intrinsicContentSize](self->_maneuverView, "intrinsicContentSize", v5);
  }
  if (self->_isDetached)
    v7 = 45.0;
  v9 = (v5 - v7) * -0.5;
  v10 = (20.0 - v7) * -0.5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView maneuverView](self, "maneuverView"));
  objc_msgSend(v11, "setFrame:", v9, 0.0, v5, v4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView transportTypeImageView](self, "transportTypeImageView"));
  objc_msgSend(v12, "setFrame:", v10, 0.0, 20.0, 20.0);

}

- (void)setManeuverArtwork:(id)a3
{
  uint64_t v5;
  void *v6;
  GuidanceManeuverArtwork *maneuverArtwork;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_maneuverArtwork, a3);
  if ((objc_msgSend(v9, "isRoundaboutManeuver") & 1) != 0)
    v5 = objc_claimAutoreleasedReturnValue(+[MapsTheme apertureKeyColor](MapsTheme, "apertureKeyColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)v5;
  -[GuidanceManeuverView setAccentColor:](self->_maneuverView, "setAccentColor:", v5);

  maneuverArtwork = self->_maneuverArtwork;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView maneuverView](self, "maneuverView"));
  objc_msgSend(v8, "setManeuverArtwork:", maneuverArtwork);

  -[ManeuverAccessoryView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[ManeuverAccessoryView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setTransportType:(int)a3
{
  uint64_t v4;
  id v5;

  self->_transportType = a3;
  if (a3 > 3)
    v4 = 0;
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", *(&off_1011BA5C8 + a3)));
  v5 = (id)v4;
  -[UIImageView setImage:](self->_transportTypeImageView, "setImage:", v4);
  -[ManeuverAccessoryView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[ManeuverAccessoryView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setIsRerouting:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  self->_isRerouting = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView maneuverView](self, "maneuverView"));
  objc_msgSend(v5, "setHidden:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ManeuverAccessoryView transportTypeImageView](self, "transportTypeImageView"));
  objc_msgSend(v6, "setHidden:", v3 ^ 1);

  -[ManeuverAccessoryView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[ManeuverAccessoryView setNeedsLayout](self, "setNeedsLayout");
}

- (GuidanceManeuverArtwork)maneuverArtwork
{
  return self->_maneuverArtwork;
}

- (int)transportType
{
  return self->_transportType;
}

- (BOOL)isRerouting
{
  return self->_isRerouting;
}

- (BOOL)usesArrowMetricsReferenceSize
{
  return self->_usesArrowMetricsReferenceSize;
}

- (void)setUsesArrowMetricsReferenceSize:(BOOL)a3
{
  self->_usesArrowMetricsReferenceSize = a3;
}

- (GuidanceManeuverView)maneuverView
{
  return self->_maneuverView;
}

- (void)setManeuverView:(id)a3
{
  objc_storeStrong((id *)&self->_maneuverView, a3);
}

- (BOOL)isDetached
{
  return self->_isDetached;
}

- (void)setIsDetached:(BOOL)a3
{
  self->_isDetached = a3;
}

- (UIImageView)transportTypeImageView
{
  return self->_transportTypeImageView;
}

- (void)setTransportTypeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_transportTypeImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportTypeImageView, 0);
  objc_storeStrong((id *)&self->_maneuverView, 0);
  objc_storeStrong((id *)&self->_maneuverArtwork, 0);
}

@end
