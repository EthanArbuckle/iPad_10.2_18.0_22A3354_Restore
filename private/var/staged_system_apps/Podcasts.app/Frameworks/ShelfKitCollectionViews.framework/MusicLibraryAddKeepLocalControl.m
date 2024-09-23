@implementation MusicLibraryAddKeepLocalControl

- (MusicLibraryAddKeepLocalControl)initWithFrame:(CGRect)a3
{
  MusicLibraryAddKeepLocalControl *v3;
  MusicLibraryAddKeepLocalControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicLibraryAddKeepLocalControl;
  v3 = -[MusicLibraryAddKeepLocalControl initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_allowsAddImage = 1;
    -[MusicLibraryAddKeepLocalControl _updateControlStatusProperties](v3, "_updateControlStatusProperties");
    v4->_controlHitOutsets = -16.0;
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_controlStatus.statusType == 3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, MTApplicationWillEnterForegroundNotification, 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)MusicLibraryAddKeepLocalControl;
  -[MusicLibraryAddKeepLocalControl dealloc](&v4, "dealloc");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MusicLibraryAddKeepLocalControl;
  -[MusicLibraryAddKeepLocalControl didMoveToWindow](&v3, "didMoveToWindow");
  if (-[MusicLibraryAddKeepLocalControl _isInAWindow](self, "_isInAWindow"))
    -[MusicLibraryAddKeepLocalControl _updateControlImageViewAnimation](self, "_updateControlImageViewAnimation");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  MusicLibraryAddKeepLocalControl *v5;

  if (-[MusicLibraryAddKeepLocalControl pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y)
    && -[MusicLibraryAddKeepLocalControl isEnabled](self, "isEnabled"))
  {
    v5 = self;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  CGFloat width;
  CGFloat height;
  char v11;
  void *v13;
  CGPoint v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  -[MusicLibraryAddKeepLocalControl bounds](self, "bounds", a4);
  v7 = v15.origin.x;
  v8 = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  if (CGRectIsEmpty(v15))
    return 0;
  v16.origin.x = v7;
  v16.origin.y = v8;
  v16.size.width = width;
  v16.size.height = height;
  v17 = CGRectInset(v16, self->_controlHitOutsets, self->_controlHitOutsets);
  v14.x = x;
  v14.y = y;
  if (!CGRectContainsPoint(v17, v14))
    return 0;
  if (self->_controlImageView)
    return 1;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_controlTitleLabel, "text"));
  if (objc_msgSend(v13, "length"))
    v11 = 1;
  else
    v11 = self->_downloadProgressView != 0;

  return v11;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  if (self->_adjustsFontSizeToFitWidth != a3)
  {
    self->_adjustsFontSizeToFitWidth = a3;
    -[MusicLibraryAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double SafeScaleForValue;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char *v20;
  UIImageView *controlImageView;
  double v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  double v26;
  UIEdgeInsets *p_controlImageEdgeInsets;
  double v28;
  double v29;
  double v30;
  __n128 v31;
  double v32;
  double v33;
  double v34;
  double width;
  double v36;
  void *v37;
  id v38;
  __n128 v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  void *v52;
  id v53;
  __n128 v54;
  double MinX;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  CGFloat x;
  CGFloat y;
  CGFloat v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  double v82;
  UIImageView *v83;
  UILabel *v84;
  CGFloat v85;
  CGFloat v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  UILabel *controlTitleLabel;
  double v99;
  double v100;
  CGFloat v101;
  double MaxX;
  double v103;
  double v104;
  double v105;
  UIImageView *v106;
  CGFloat v107;
  double v108;
  double v109;
  id v110;
  double v111;
  double v112;
  CGFloat v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  BOOL IsNull;
  double v132;
  CGFloat v133;
  CGFloat v134;
  double v135;
  double v136;
  CGFloat v137;
  MusicDownloadProgressView *downloadProgressView;
  UIView *backgroundView;
  CGFloat v140;
  double v141;
  double v142;
  CGFloat v143;
  double v144;
  double v145;
  double rect;
  double rectb;
  double recta;
  double rect_8;
  double rect_16;
  double rect_24;
  double rect_24a;
  double v153;
  double v154;
  double r2;
  CGFloat r2a;
  double r2_8;
  double r2_8a;
  CGFloat r2_8b;
  double r2_8c;
  double r2_16;
  double r2_16a;
  double r2_16b;
  double r2_24;
  double v165;
  double v166;
  double v167;
  double Height;
  objc_super v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;

  v169.receiver = self;
  v169.super_class = (Class)MusicLibraryAddKeepLocalControl;
  -[MusicLibraryAddKeepLocalControl layoutSubviews](&v169, "layoutSubviews");
  -[MusicLibraryAddKeepLocalControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl traitCollection](self, "traitCollection"));
  SafeScaleForValue = MTMPUFloatGetSafeScaleForValue(objc_msgSend(v11, "displayScale"));

  -[UILabel frame](self->_controlTitleLabel, "frame");
  r2_16 = v13;
  v15 = v14;
  -[UILabel sizeThatFits:](self->_controlTitleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v18 = v17;
  if (v16 >= v8 + -32.0)
    v19 = v8 + -32.0;
  else
    v19 = v16;
  v20 = (char *)-[MusicLibraryAddKeepLocalControl contentHorizontalAlignment](self, "contentHorizontalAlignment");
  controlImageView = self->_controlImageView;
  v166 = v4;
  v167 = v10;
  r2_24 = v8;
  v165 = v6;
  r2 = SafeScaleForValue;
  if (!controlImageView)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_controlTitleLabel, "text"));
    v53 = objc_msgSend(v52, "length");

    if (v53)
    {
      if (v20 == (_BYTE *)&dword_0 + 2)
      {
        v182.origin.x = v4;
        v182.origin.y = v6;
        v182.size.width = v8;
        v182.size.height = v10;
        v85 = v19;
        v86 = CGRectGetMaxX(v182) + -16.0;
        v183.origin.x = r2_16;
        v183.origin.y = v15;
        v183.size.width = v85;
        v183.size.height = v18;
        v54.n128_f64[0] = v86 - CGRectGetWidth(v183);
        v19 = v85;
        v10 = v167;
      }
      else if (v20 == (_BYTE *)&dword_0 + 1)
      {
        v170.origin.x = v4;
        v170.origin.y = v6;
        v170.size.width = v8;
        v170.size.height = v10;
        v54.n128_f64[0] = CGRectGetMinX(v170) + 16.0;
      }
      else
      {
        UIRectCenteredXInRectScale(r2_16, v15, v19, v18, v4, v6, v8, v10, SafeScaleForValue);
        v15 = v87;
        v19 = v88;
        v18 = v89;
      }
      v90 = UIRectCenteredYInRectScale(v54, v15, v19, v18, v4, v6, v8, v10, SafeScaleForValue);
      v92 = v91;
      v93 = v6;
      v95 = v94;
      r2_8c = v96;
      r2_16b = v90 + -16.0;
      v97 = v91 + 32.0;
      v184.origin.x = v4;
      v184.origin.y = v93;
      v184.size.width = v8;
      v184.size.height = v10;
      Height = CGRectGetHeight(v184);
      controlTitleLabel = self->_controlTitleLabel;
      v99 = v90;
      width = v97;
      v100 = v95;
      v6 = v93;
      MTMPURectByApplyingUserInterfaceLayoutDirectionInRect(v99, r2_8c, v92, v100, v4, v93, v8, v10);
      -[UILabel setFrame:](controlTitleLabel, "setFrame:");
      r2_8b = 0.0;
    }
    else
    {
      width = CGRectNull.size.width;
      r2_8b = CGRectNull.origin.y;
      r2_16b = CGRectNull.origin.x;
      Height = CGRectNull.size.height;
    }
    goto LABEL_29;
  }
  rect_24 = v19;
  r2_8 = v18;
  v22 = v15;
  -[UIImageView frame](controlImageView, "frame");
  v24 = v23;
  v26 = v25;
  -[UIImageView sizeThatFits:](self->_controlImageView, "sizeThatFits:", v8, v10);
  p_controlImageEdgeInsets = &self->_controlImageEdgeInsets;
  v153 = v28;
  v154 = v29;
  v30 = v28 + -self->_controlImageEdgeInsets.right - self->_controlImageEdgeInsets.left;
  v31.n128_u64[0] = v24;
  rect = UIRectCenteredYInRectScale(v31, v26, v30, v29 + -self->_controlImageEdgeInsets.bottom - self->_controlImageEdgeInsets.top, v4, v6, v8, v10, SafeScaleForValue);
  v33 = v32;
  width = v34;
  Height = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_controlTitleLabel, "text"));
  v38 = objc_msgSend(v37, "length");

  if (!v38)
  {
    if (v20 == (_BYTE *)&dword_0 + 2)
    {
      v185.origin.x = v4;
      v185.origin.y = v6;
      v185.size.width = v8;
      v185.size.height = v10;
      v101 = width;
      MaxX = CGRectGetMaxX(v185);
      v186.origin.x = rect;
      v186.origin.y = v33;
      v186.size.width = v101;
      v186.size.height = Height;
      MinX = MaxX - CGRectGetWidth(v186);
      width = v101;
    }
    else if (v20 == (_BYTE *)&dword_0 + 1)
    {
      v171.origin.x = v4;
      v171.origin.y = v6;
      v171.size.width = v8;
      v171.size.height = v10;
      MinX = CGRectGetMinX(v171);
    }
    else
    {
      UIRectCenteredXInRectScale(rect, v33, width, Height, v4, v6, v8, v10, SafeScaleForValue);
      v33 = v103;
      width = v104;
      Height = v105;
    }
    r2_16b = MinX;
    v106 = self->_controlImageView;
    MTMPURectByApplyingUserInterfaceLayoutDirectionInRect(MinX - self->_controlImageEdgeInsets.left, v33 - p_controlImageEdgeInsets->top, v153, v154, v4, v6, v8, v10);
    -[UIImageView setFrame:](v106, "setFrame:");
    r2_8b = v33;
    goto LABEL_29;
  }
  rect_16 = v33;
  v143 = width;
  v39.n128_f64[0] = r2_16;
  v42 = UIRectCenteredYInRectScale(v39, v22, rect_24, r2_8, v4, v6, v8, v10, SafeScaleForValue);
  v44 = v43;
  v45 = 0;
  rect_8 = v40;
  r2_8a = v8 + -6.0;
  r2_16a = v4 + 0.0;
  v142 = v6 + 0.0;
  rect_24a = v41;
  v145 = v43;
  if (v20 == (_BYTE *)&dword_0 + 2)
  {
    v172.origin.x = v4;
    v56 = v41;
    v57 = v40;
    v172.origin.y = v6;
    v172.size.width = v8;
    v172.size.height = v10;
    v140 = v42;
    v58 = CGRectGetMaxX(v172) + -6.0;
    v173.origin.x = v140;
    v173.origin.y = v44;
    v173.size.width = v57;
    v173.size.height = v56;
    v59 = v58 - CGRectGetWidth(v173);
    v174.origin.x = v59;
    v174.origin.y = v44;
    v174.size.width = v57;
    v174.size.height = v56;
    v141 = CGRectGetMinX(v174);
    v175.origin.x = rect;
    v175.origin.y = rect_16;
    width = v143;
    v175.size.width = v143;
    v49 = Height;
    v175.size.height = Height;
    v46 = v141 - CGRectGetWidth(v175);
    v51 = v59;
  }
  else
  {
    if (v20 != (_BYTE *)&dword_0 + 1)
    {
      v61 = v41;
      v62 = v33;
      v63 = width;
      v49 = Height;
      v64 = Height;
      v176.origin.x = CGRectGetMaxX(*(CGRect *)&v45) + 0.0;
      rectb = v176.origin.x;
      v192.origin.x = 0.0;
      v176.origin.y = v44;
      v176.size.width = rect_8;
      v176.size.height = v61;
      v192.origin.y = rect_16;
      v192.size.width = width;
      v192.size.height = Height;
      v177 = CGRectUnion(v176, v192);
      x = v177.origin.x;
      y = v177.origin.y;
      v67 = v177.size.width;
      v68 = v177.size.height;
      v60 = v142;
      v178.origin.x = UIRectCenteredXInRectScale(v177.origin.x, v177.origin.y, v177.size.width, v177.size.height, r2_16a, v142, r2_8a, v167, r2);
      v69 = CGRectGetMinX(v178);
      v179.origin.x = x;
      v179.origin.y = y;
      v179.size.width = v67;
      v179.size.height = v68;
      v70 = CGRectGetMinX(v179);
      v71 = MTMPUFloatRoundForScale(v69 - v70, r2);
      v46 = v71 + 0.0;
      v44 = v145;
      v51 = rectb + v71;
      v10 = v167;
      goto LABEL_20;
    }
    v46 = 0.0;
    v47 = v33;
    v48 = width;
    v49 = Height;
    v50 = Height;
    v51 = CGRectGetMaxX(*(CGRect *)&v45) + 0.0;
  }
  v60 = v6 + 0.0;
LABEL_20:
  v144 = v46;
  recta = v51;
  v72 = v44;
  v73 = rect_8;
  v74 = rect_24a;
  v193.origin.x = v46;
  v193.origin.y = rect_16;
  v193.size.width = width;
  v193.size.height = v49;
  v180 = CGRectUnion(*(CGRect *)&v51, v193);
  v75 = v180.origin.x;
  v76 = v180.origin.y;
  v77 = v180.size.width;
  v78 = v180.size.height;
  v180.size.width = r2_8a;
  v180.origin.x = r2_16a;
  v180.origin.y = v60;
  v180.size.height = v10;
  v79 = CGRectGetWidth(v180);
  r2_8b = v76;
  r2_16b = v75;
  v181.origin.x = v75;
  v181.origin.y = v76;
  v181.size.width = v77;
  v80 = v77;
  Height = v78;
  v181.size.height = v78;
  v81 = CGRectGetWidth(v181) - v79;
  if (v81 <= 0.00000011920929)
    v81 = 0.0;
  v82 = rect_8 - v81;
  v83 = self->_controlImageView;
  v6 = v165;
  v4 = v166;
  v8 = r2_24;
  MTMPURectByApplyingUserInterfaceLayoutDirectionInRect(v144 - self->_controlImageEdgeInsets.left, rect_16 - p_controlImageEdgeInsets->top, v153, v154, v166, v165, r2_24, v10);
  -[UIImageView setFrame:](v83, "setFrame:");
  v84 = self->_controlTitleLabel;
  MTMPURectByApplyingUserInterfaceLayoutDirectionInRect(recta, v145, v82, rect_24a, v166, v165, r2_24, v10);
  -[UILabel setFrame:](v84, "setFrame:");
  width = v80 + 6.0;
LABEL_29:
  if (!self->_downloadProgressView)
  {
    v120 = Height;
    v121 = r2_8b;
    v122 = r2_16b;
    goto LABEL_42;
  }
  v107 = width;
  v187.origin.x = v4;
  v187.origin.y = v6;
  v187.size.width = v8;
  v187.size.height = v10;
  v108 = CGRectGetWidth(v187);
  v188.origin.x = v4;
  v188.origin.y = v6;
  v188.size.width = v8;
  v188.size.height = v10;
  v109 = CGRectGetHeight(v188);
  if (v108 >= v109)
    v108 = v109;
  v110 = -[MusicDownloadProgressView frame](self->_downloadProgressView, "frame");
  v113 = v111;
  v114 = v112;
  v115 = v10;
  if (v20 == (_BYTE *)&dword_0 + 2)
  {
    v123 = v4;
    v124 = v6;
    v125 = v8;
    v126 = CGRectGetMaxX(*(CGRect *)(&v115 - 3));
    v189.origin.x = v113;
    v189.origin.y = v114;
    v189.size.width = v108;
    v189.size.height = v108;
    v119 = v126 - CGRectGetWidth(v189);
  }
  else
  {
    if (v20 != (_BYTE *)&dword_0 + 1)
    {
      r2a = UIRectCenteredIntegralRectScale(v110, v111, v112, v108, v108, v4, v6, v8, v10, r2);
      v114 = v128;
      v108 = v129;
      v127 = v130;
      goto LABEL_39;
    }
    v116 = v4;
    v117 = v6;
    v118 = v8;
    v119 = CGRectGetMinX(*(CGRect *)(&v115 - 3));
  }
  r2a = v119;
  v127 = v108;
LABEL_39:
  v190.origin.x = r2_16b;
  v190.origin.y = r2_8b;
  v190.size.width = v107;
  v190.size.height = Height;
  IsNull = CGRectIsNull(v190);
  v132 = Height;
  v133 = r2_8b;
  v120 = v127;
  v134 = v108;
  v135 = r2_16b;
  v121 = v114;
  v136 = r2a;
  v122 = r2a;
  if (!IsNull)
  {
    v137 = v107;
    v194.origin.x = r2a;
    v194.origin.y = v114;
    v194.size.width = v108;
    v194.size.height = v127;
    v191 = CGRectUnion(*(CGRect *)&v135, v194);
    v136 = r2a;
    v122 = v191.origin.x;
    v121 = v191.origin.y;
    v134 = v191.size.width;
    v120 = v191.size.height;
  }
  downloadProgressView = self->_downloadProgressView;
  MTMPURectByApplyingUserInterfaceLayoutDirectionInRect(v136, v114, v108, v127, v166, v165, r2_24, v167);
  -[MusicDownloadProgressView setFrame:](downloadProgressView, "setFrame:");
  width = v134;
LABEL_42:
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[UIView setFrame:](backgroundView, "setFrame:", v122, v121, width, v120);
    -[MusicLibraryAddKeepLocalControl _updateBackgroundViewCornerRadius](self, "_updateBackgroundViewCornerRadius");
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;

  +[MusicAppTheme defaultLibraryAddKeepLocalControlHeight](MusicAppTheme, "defaultLibraryAddKeepLocalControlHeight");
  -[MusicLibraryAddKeepLocalControl maximumSizeWithPreferredHeight:](self, "maximumSizeWithPreferredHeight:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)maximumSizeWithPreferredHeight:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double width;
  double height;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  CGSize result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl traitCollection](self, "traitCollection", 0, 1, 2, 3, 4, 6));
  MTMPUFloatGetSafeScaleForValue(objc_msgSend(v5, "displayScale"));

  v7 = 0;
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  do
  {
    v10 = *(_QWORD *)((char *)&v21 + v7);
    v11 = (void *)objc_opt_class(self, v6);
    v12 = objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl titleForControlStatusType:](self, "titleForControlStatusType:", v10));
    v13 = (void *)v12;
    v14 = self->_allowsAddImage || self->_controlStatus.statusType != 1;
    objc_msgSend(v11, "_expectedSizeForControlStatusType:controlTitle:hasControlImage:displayScale:preferredHeight:", v10, v12, v14, MTMPUFloatGetSafeScaleForValue(v12), a3);
    v16 = v15;
    v18 = v17;

    if (width < v16)
      width = v16;
    if (height < v18)
      height = v18;
    v7 += 8;
  }
  while (v7 != 48);
  v19 = width;
  v20 = height;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  void *v5;
  int64_t statusType;
  void *v7;
  _BOOL8 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  v5 = (void *)objc_opt_class(self, a2);
  statusType = self->_controlStatus.statusType;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl titleForControlStatusType:](self, "titleForControlStatusType:", statusType));
  v8 = self->_allowsAddImage || self->_controlStatus.statusType != 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl traitCollection](self, "traitCollection"));
  objc_msgSend(v5, "_expectedSizeForControlStatusType:controlTitle:hasControlImage:displayScale:preferredHeight:", statusType, v7, v8, MTMPUFloatGetSafeScaleForValue(objc_msgSend(v9, "displayScale")), height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MusicLibraryAddKeepLocalControl;
  -[MusicLibraryAddKeepLocalControl tintColorDidChange](&v4, "tintColorDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl tintColor](self, "tintColor"));
  if (self->_displayStyle == 1)
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v3);
  -[MusicLibraryAddKeepLocalControl _updateControlTitleLabelVisualProperties](self, "_updateControlTitleLabelVisualProperties");
  if (self->_controlStatus.statusType == 2)
    -[MusicLibraryAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MusicLibraryAddKeepLocalControl;
  -[MusicLibraryAddKeepLocalControl traitCollectionDidChange:](&v13, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl traitCollection](self, "traitCollection"));
  v9 = v8;
  if (v5 != v7
    || (objc_msgSend(v8, "displayScale"),
        v11 = v10,
        objc_msgSend(v4, "displayScale"),
        (MTMPUFloatEqualToFloat(v11, v12) & 1) == 0))
  {
    -[MusicLibraryAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
  }

}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  id v5;
  objc_super v6;

  v5 = -[MusicLibraryAddKeepLocalControl contentHorizontalAlignment](self, "contentHorizontalAlignment");
  v6.receiver = self;
  v6.super_class = (Class)MusicLibraryAddKeepLocalControl;
  -[MusicLibraryAddKeepLocalControl setContentHorizontalAlignment:](&v6, "setContentHorizontalAlignment:", a3);
  if (v5 != -[MusicLibraryAddKeepLocalControl contentHorizontalAlignment](self, "contentHorizontalAlignment"))
    -[MusicLibraryAddKeepLocalControl setNeedsLayout](self, "setNeedsLayout");
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicLibraryAddKeepLocalControl;
  -[MusicLibraryAddKeepLocalControl touchesCancelled:withEvent:](&v5, "touchesCancelled:withEvent:", a3, a4);
  self->_hadFirstTouchHighlight = 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicLibraryAddKeepLocalControl;
  -[MusicLibraryAddKeepLocalControl touchesEnded:withEvent:](&v5, "touchesEnded:withEvent:", a3, a4);
  self->_hadFirstTouchHighlight = 0;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  unsigned int v6;
  char v7;
  double v8;
  _QWORD v9[5];
  char v10;
  _QWORD v11[6];
  objc_super v12;

  v3 = a3;
  v5 = -[MusicLibraryAddKeepLocalControl isHighlighted](self, "isHighlighted");
  v12.receiver = self;
  v12.super_class = (Class)MusicLibraryAddKeepLocalControl;
  -[MusicLibraryAddKeepLocalControl setHighlighted:](&v12, "setHighlighted:", v3);
  v6 = -[MusicLibraryAddKeepLocalControl isHighlighted](self, "isHighlighted");
  if (v5 != v6)
  {
    v7 = v6;
    v8 = 1.0;
    if (v6)
    {
      -[MusicLibraryAddKeepLocalControl _beginTransientContentViewTransaction](self, "_beginTransientContentViewTransaction", 1.0);
      v8 = 0.2;
    }
    if (self->_hadFirstTouchHighlight)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __50__MusicLibraryAddKeepLocalControl_setHighlighted___block_invoke;
      v11[3] = &unk_379708;
      v11[4] = self;
      *(double *)&v11[5] = v8;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __50__MusicLibraryAddKeepLocalControl_setHighlighted___block_invoke_2;
      v9[3] = &unk_379730;
      v10 = v7;
      v9[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v11, v9, 0.47, 0.0);
    }
    else
    {
      self->_hadFirstTouchHighlight = 1;
      -[UIView setAlpha:](self->_transientContentView, "setAlpha:", v8);
      if ((v7 & 1) == 0)
        -[MusicLibraryAddKeepLocalControl _endTransientContentViewTransaction](self, "_endTransientContentViewTransaction");
    }
  }
}

void __50__MusicLibraryAddKeepLocalControl_setHighlighted___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transientContentView"));
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

}

id *__50__MusicLibraryAddKeepLocalControl_setHighlighted___block_invoke_2(id *result)
{
  if (!*((_BYTE *)result + 40))
    return (id *)objc_msgSend(result[4], "_endTransientContentViewTransaction");
  return result;
}

- (void)setAllowsAddImage:(BOOL)a3
{
  if (self->_allowsAddImage != a3)
  {
    self->_allowsAddImage = a3;
    if (self->_controlStatus.statusType == 1)
      -[MusicLibraryAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
  }
}

- (void)setDisplayStyle:(int64_t)a3
{
  if (self->_displayStyle != a3)
  {
    self->_displayStyle = a3;
    -[MusicLibraryAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
    -[MusicLibraryAddKeepLocalControl _updateControlTitleLabelVisualProperties](self, "_updateControlTitleLabelVisualProperties");
  }
}

- (void)setControlStatus:(MusicLibraryAddKeepLocalControlStatus)a3
{
  -[MusicLibraryAddKeepLocalControl setControlStatus:animated:](self, "setControlStatus:animated:", a3.statusType, *(_QWORD *)&a3.downloadProgress, 0);
}

- (void)setControlStatus:(MusicLibraryAddKeepLocalControlStatus)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  MusicLibraryAddKeepLocalControlStatus *p_controlStatus;
  int64_t statusType;
  int64_t controlStatusRevision;
  int64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  _QWORD v19[6];
  _QWORD v20[5];
  _QWORD v21[5];

  v4 = a4;
  p_controlStatus = &self->_controlStatus;
  statusType = self->_controlStatus.statusType;
  if (statusType != a3.statusType)
  {
    p_controlStatus->statusType = a3.statusType;
    self->_controlStatus.downloadProgress = a3.downloadProgress;
    v9 = self->_controlStatusRevision + 1;
    self->_controlStatusRevision = v9;
    goto LABEL_7;
  }
  if (vabdd_f64(self->_controlStatus.downloadProgress, a3.downloadProgress) <= 0.00000011920929)
    return;
  controlStatusRevision = self->_controlStatusRevision;
  self->_controlStatus.downloadProgress = a3.downloadProgress;
  v9 = controlStatusRevision + 1;
  self->_controlStatusRevision = controlStatusRevision + 1;
  if ((statusType & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
LABEL_7:
    if (a3.statusType == 3)
    {
      if (statusType != 3)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v13 = MTApplicationWillEnterForegroundNotification;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        objc_msgSend(v12, "addObserver:selector:name:object:", self, "_applicationWillEnterForegroundNotification:", v13, v14);

        goto LABEL_12;
      }
    }
    else
    {
      if (statusType != 3)
      {
LABEL_12:
        v18 = (statusType & 0xFFFFFFFFFFFFFFFELL) != 4 || !v4;
        if (!v18 && p_controlStatus->statusType == 6)
        {
          v19[5] = v9;
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_2;
          v20[3] = &unk_3796A0;
          v20[4] = self;
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_3;
          v19[3] = &unk_379758;
          v19[4] = self;
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 134, v20, v19, 0.25, 0.0);
          return;
        }
        goto LABEL_18;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v16 = MTApplicationWillEnterForegroundNotification;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      objc_msgSend(v15, "removeObserver:name:object:", self, v16, v17);

    }
LABEL_18:
    -[MusicLibraryAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");
    return;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke;
  v21[3] = &unk_3796A0;
  v21[4] = self;
  v10 = objc_retainBlock(v21);
  v11 = v10;
  if (v4)
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 134, v10, 0, 0.25, 0.0);
  else
    ((void (*)(_QWORD *))v10[2])(v10);

}

void __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "downloadProgressView"));
  objc_msgSend(*(id *)(a1 + 32), "controlStatus");
  objc_msgSend(v3, "setDownloadProgress:", v2);

}

void __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "downloadProgressView"));
  objc_msgSend(v1, "setDownloadProgress:", 1.0);

}

void __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  _QWORD v4[6];

  v2 = dispatch_time(0, 100000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_4;
  v4[3] = &unk_379708;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

id __61__MusicLibraryAddKeepLocalControl_setControlStatus_animated___block_invoke_4(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "controlStatusRevision");
  if (result == *(id *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_updateControlStatusProperties");
  return result;
}

- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4
{
  void *v6;
  NSMutableDictionary *controlStatusTypeToTitle;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
  if (v11)
  {
    if (!controlStatusTypeToTitle)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v9 = self->_controlStatusTypeToTitle;
      self->_controlStatusTypeToTitle = v8;

      controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
    }
    -[NSMutableDictionary setObject:forKey:](controlStatusTypeToTitle, "setObject:forKey:", v11, v6);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](controlStatusTypeToTitle, "removeObjectForKey:", v6);
    if (!-[NSMutableDictionary count](self->_controlStatusTypeToTitle, "count"))
    {
      v10 = self->_controlStatusTypeToTitle;
      self->_controlStatusTypeToTitle = 0;

    }
  }
  if (self->_controlStatus.statusType == a4)
    -[MusicLibraryAddKeepLocalControl _updateControlStatusProperties](self, "_updateControlStatusProperties");

}

- (id)titleForControlStatusType:(int64_t)a3
{
  NSMutableDictionary *controlStatusTypeToTitle;
  void *v4;
  void *v5;

  controlStatusTypeToTitle = self->_controlStatusTypeToTitle;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](controlStatusTypeToTitle, "objectForKey:", v4));

  return v5;
}

+ (CGSize)_expectedSizeForControlStatusType:(int64_t)a3 controlTitle:(id)a4 hasControlImage:(BOOL)a5 displayScale:(double)a6 preferredHeight:(double)a7
{
  _BOOL4 v8;
  id v11;
  void *v12;
  double width;
  double height;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  v8 = a5;
  v11 = a4;
  v12 = v11;
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  if (a3)
  {
    if (objc_msgSend(v11, "length"))
    {
      v15 = objc_msgSend(a1, "_newControlTitleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_controlTitleFontForControlStatusType:", a3));
      objc_msgSend(v15, "setFont:", v16);

      objc_msgSend(v15, "setText:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "font"));
      MTMPUFloatCeilForScale(objc_msgSend(v15, "sizeThatFits:", 1.79769313e308, 1.79769313e308));
      if (v8)
      {
        width = CGSizeZero.width + v18 + 0.0 + 6.0 + 28.0;
        objc_msgSend(v17, "lineHeight");
        v20 = v19;
        objc_msgSend(v17, "ascender");
        v22 = v20 - v21;
        objc_msgSend(v17, "descender");
        height = fmax(v22 + v23 + 16.0, 28.0);
      }
      else
      {
        width = CGSizeZero.width + v18 + 32.0;
      }
      if (height <= a7)
        height = a7;

    }
    else
    {
      if (a7 >= 28.0)
        height = a7;
      else
        height = 28.0;
      width = height;
    }
  }

  v24 = width;
  v25 = height;
  result.height = v25;
  result.width = v24;
  return result;
}

+ (id)_newControlTitleLabel
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

+ (id)_controlTitleFontForControlStatusType:(int64_t)a3
{
  void *v3;
  void *v4;

  if (a3 == 6)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 11.0));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTMPUFontDescriptor fontDescriptorWithTextStyle:weight:](MTMPUFontDescriptor, "fontDescriptorWithTextStyle:weight:", 2, 4));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultFont"));

  }
  return v3;
}

- (void)_beginTransientContentViewTransaction
{
  int64_t transientContentViewTransactionCount;
  id v4;
  UIView *v5;
  UIView *transientContentView;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  UIView *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  transientContentViewTransactionCount = self->_transientContentViewTransactionCount;
  self->_transientContentViewTransactionCount = transientContentViewTransactionCount + 1;
  if (!transientContentViewTransactionCount)
  {
    if (!self->_transientContentView)
    {
      v4 = objc_alloc((Class)UIView);
      -[MusicLibraryAddKeepLocalControl bounds](self, "bounds");
      v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
      transientContentView = self->_transientContentView;
      self->_transientContentView = v5;

      -[MusicLibraryAddKeepLocalControl insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_transientContentView, 0);
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl subviews](self, "subviews", 0));
    v8 = objc_msgSend(v7, "copy");

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = self->_transientContentView;
          if (*(UIView **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12) != v13)
            -[UIView addSubview:](v13, "addSubview:");
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)_endTransientContentViewTransaction
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  UIView *transientContentView;
  UIView *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  --self->_transientContentViewTransactionCount;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_transientContentView, "subviews", 0));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        transientContentView = *(UIView **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        if (transientContentView != self->_transientContentView)
        {
          -[MusicLibraryAddKeepLocalControl addSubview:](self, "addSubview:");
          transientContentView = self->_transientContentView;
        }
        -[UIView removeFromSuperview](transientContentView, "removeFromSuperview");
        v10 = self->_transientContentView;
        self->_transientContentView = 0;

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)_currentContentSuperview
{
  if (self->_transientContentViewTransactionCount >= 1)
    self = (MusicLibraryAddKeepLocalControl *)self->_transientContentView;
  return self;
}

- (void)_updateControlTitleLabelVisualProperties
{
  UILabel *controlTitleLabel;
  uint64_t v3;
  id v4;

  if (self->_controlStatus.statusType == 6)
  {
    controlTitleLabel = self->_controlTitleLabel;
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  }
  else
  {
    controlTitleLabel = self->_controlTitleLabel;
    if (self->_displayStyle == 1)
      v3 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    else
      v3 = objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl tintColor](self, "tintColor"));
  }
  v4 = (id)v3;
  -[UILabel setTextColor:](controlTitleLabel, "setTextColor:");

}

- (void)_updateBackgroundViewCornerRadius
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  id v10;
  CGRect v11;
  CGRect v12;

  -[UIView bounds](self->_backgroundView, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = CGRectGetWidth(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectGetHeight(v12);
  if (v7 < v8)
    v8 = v7;
  v9 = v8 * 0.5;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
  objc_msgSend(v10, "setCornerRadius:", v9);

}

- (id)_centerImageForDownloading
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = -[MusicLibraryAddKeepLocalControl downloadingCenterIconType](self, "downloadingCenterIconType");
  if (v3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl traitCollection](self, "traitCollection"));
    v5 = objc_claimAutoreleasedReturnValue(+[MusicAppTheme pauseButtonImageWithTraitCollection:](MusicAppTheme, "pauseButtonImageWithTraitCollection:", v4));
  }
  else
  {
    if (v3)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl traitCollection](self, "traitCollection"));
    v5 = objc_claimAutoreleasedReturnValue(+[MusicAppTheme stopButtonImageWithTraitCollection:](MusicAppTheme, "stopButtonImageWithTraitCollection:", v4));
  }
  v6 = (void *)v5;

LABEL_7:
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithRenderingMode:", 2));

  return v7;
}

- (id)_centerImageForPausedDownload
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl traitCollection](self, "traitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MusicAppTheme resumeButtonImageWithTraitCollection:](MusicAppTheme, "resumeButtonImageWithTraitCollection:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithRenderingMode:", 2));
  return v4;
}

- (void)_updateControlStatusProperties
{
  void *v3;
  double v4;
  double v5;
  int64_t statusType;
  MusicDownloadProgressView *downloadProgressView;
  MusicDownloadProgressView *v8;
  MusicDownloadProgressView *v9;
  MusicDownloadProgressView *v10;
  void *v11;
  MusicDownloadProgressView *v12;
  uint64_t v13;
  MusicDownloadProgressView *v14;
  id v15;
  UIView *v16;
  UIView *v17;
  UIView *v18;
  void *v19;
  void *v20;
  double left;
  CGFloat top;
  CGFloat bottom;
  double right;
  void *v25;
  UIView *backgroundView;
  double v27;
  void *v28;
  UIImageView *v29;
  uint64_t v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  UIImageView *controlImageView;
  UIImageView *v39;
  UIImageView *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  UILabel *controlTitleLabel;
  UILabel *v46;
  UILabel *v47;
  void *v48;
  UILabel *v49;
  uint64_t v50;
  id v51;
  void *v52;
  UILabel *v53;
  id v54;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl traitCollection](self, "traitCollection"));
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  if ((MTMPUFloatLessThanOrEqualToFloat(v5, 0.0) & 1) != 0)
    return;
  statusType = self->_controlStatus.statusType;
  downloadProgressView = self->_downloadProgressView;
  if ((statusType & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    if (!downloadProgressView)
    {
      v8 = [MusicDownloadProgressView alloc];
      -[MusicLibraryAddKeepLocalControl bounds](self, "bounds");
      v9 = -[MusicDownloadProgressView initWithFrame:](v8, "initWithFrame:");
      v10 = self->_downloadProgressView;
      self->_downloadProgressView = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl _currentContentSuperview](self, "_currentContentSuperview"));
      objc_msgSend(v11, "addSubview:", self->_downloadProgressView);

    }
    if (statusType == 5)
    {
      v12 = self->_downloadProgressView;
      v13 = objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl _centerImageForPausedDownload](self, "_centerImageForPausedDownload"));
    }
    else
    {
      if (statusType != 4)
      {
LABEL_15:
        -[MusicDownloadProgressView setDownloadProgress:](self->_downloadProgressView, "setDownloadProgress:", self->_controlStatus.downloadProgress);
        goto LABEL_16;
      }
      v12 = self->_downloadProgressView;
      v13 = objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl _centerImageForDownloading](self, "_centerImageForDownloading"));
    }
    v25 = (void *)v13;
    -[MusicDownloadProgressView setCenterImage:](v12, "setCenterImage:", v13);

    goto LABEL_15;
  }
  -[MusicDownloadProgressView removeFromSuperview](downloadProgressView, "removeFromSuperview");
  v14 = self->_downloadProgressView;
  self->_downloadProgressView = 0;

  if (statusType != 1 || self->_displayStyle != 1)
  {
LABEL_16:
    -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;

    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    switch(statusType)
    {
      case 1:
        goto LABEL_17;
      case 2:
        if (-[MusicLibraryAddKeepLocalControl offerButtonSize](self, "offerButtonSize"))
          v31 = 16.0;
        else
          v31 = 22.0;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl tintColor](self, "tintColor"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl traitCollection](self, "traitCollection"));
        v29 = (UIImageView *)objc_claimAutoreleasedReturnValue(+[MusicAppTheme cloudDownloadImageForTintColor:pointSize:traitCollection:](MusicAppTheme, "cloudDownloadImageForTintColor:pointSize:traitCollection:", v32, v33, v31));

        goto LABEL_28;
      case 3:
        v29 = (UIImageView *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UniversalAddControlWaiting")));
        goto LABEL_28;
      case 6:
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl titleForControlStatusType:](self, "titleForControlStatusType:", 6));
        if (objc_msgSend(v34, "length"))
        {

        }
        else
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v36 = objc_msgSend(v35, "BOOLForKey:", CFSTR("MusicKeepLocalControlShouldShowDownloadedIndicator"));

          if (!v36)
            goto LABEL_37;
        }
        v29 = (UIImageView *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UniversalAddControlDownloaded")));
        if (MTMPUFloatEqualToFloat(v5, 2.0))
          left = -1.5;
        else
          left = -2.0;
        if (self->_displayStyle == 1)
          v37 = objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
        else
          v37 = objc_claimAutoreleasedReturnValue(+[MusicAppTheme systemLightGrayColor](MusicAppTheme, "systemLightGrayColor"));
        v30 = v37;
        bottom = 0.0;
        right = -3.0;
        top = 0.0;
        break;
      default:
        goto LABEL_37;
    }
    goto LABEL_40;
  }
  if (!self->_backgroundView)
  {
    v15 = objc_alloc((Class)UIView);
    -[MusicLibraryAddKeepLocalControl bounds](self, "bounds");
    v16 = (UIView *)objc_msgSend(v15, "initWithFrame:");
    v17 = self->_backgroundView;
    self->_backgroundView = v16;

    v18 = self->_backgroundView;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl tintColor](self, "tintColor"));
    -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", 1);
    -[MusicLibraryAddKeepLocalControl _updateBackgroundViewCornerRadius](self, "_updateBackgroundViewCornerRadius");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl _currentContentSuperview](self, "_currentContentSuperview"));
    objc_msgSend(v20, "insertSubview:atIndex:", self->_backgroundView, 0);

  }
  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
LABEL_17:
  if (!self->_allowsAddImage)
  {
LABEL_37:
    v54 = 0;
    self->_controlImageEdgeInsets.top = top;
    self->_controlImageEdgeInsets.left = left;
    self->_controlImageEdgeInsets.bottom = bottom;
    self->_controlImageEdgeInsets.right = right;
    goto LABEL_44;
  }
  if (-[MusicLibraryAddKeepLocalControl offerButtonSize](self, "offerButtonSize"))
    v27 = 16.0;
  else
    v27 = 20.0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl traitCollection](self, "traitCollection"));
  v29 = (UIImageView *)objc_claimAutoreleasedReturnValue(+[MusicAppTheme addButtonImageWithPointSize:traitCollection:](MusicAppTheme, "addButtonImageWithPointSize:traitCollection:", v28, v27));

  if (self->_displayStyle == 1)
    v30 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
LABEL_28:
    v30 = 0;
LABEL_40:
  self->_controlImageEdgeInsets.top = top;
  self->_controlImageEdgeInsets.left = left;
  self->_controlImageEdgeInsets.bottom = bottom;
  self->_controlImageEdgeInsets.right = right;
  v54 = (id)v30;
  if (v29)
  {
    controlImageView = self->_controlImageView;
    if (!controlImageView)
    {
      v39 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v40 = self->_controlImageView;
      self->_controlImageView = v39;

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl _currentContentSuperview](self, "_currentContentSuperview"));
      objc_msgSend(v41, "addSubview:", self->_controlImageView);

      v30 = (uint64_t)v54;
      controlImageView = self->_controlImageView;
    }
    -[UIImageView setTintColor:](controlImageView, "setTintColor:", v30);
    -[UIImageView setImage:](self->_controlImageView, "setImage:", v29);
    -[MusicLibraryAddKeepLocalControl _updateControlImageViewAnimation](self, "_updateControlImageViewAnimation");
    goto LABEL_45;
  }
LABEL_44:
  -[UIImageView removeFromSuperview](self->_controlImageView, "removeFromSuperview");
  v29 = self->_controlImageView;
  self->_controlImageView = 0;
LABEL_45:

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl titleForControlStatusType:](self, "titleForControlStatusType:", statusType));
  v44 = objc_msgSend(v42, "length");
  controlTitleLabel = self->_controlTitleLabel;
  if (v44)
  {
    if (!controlTitleLabel)
    {
      v46 = (UILabel *)objc_msgSend((id)objc_opt_class(self, v43), "_newControlTitleLabel");
      v47 = self->_controlTitleLabel;
      self->_controlTitleLabel = v46;

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MusicLibraryAddKeepLocalControl _currentContentSuperview](self, "_currentContentSuperview"));
      objc_msgSend(v48, "addSubview:", self->_controlTitleLabel);

    }
    -[MusicLibraryAddKeepLocalControl _updateControlTitleLabelVisualProperties](self, "_updateControlTitleLabelVisualProperties");
    v49 = self->_controlTitleLabel;
    v51 = objc_msgSend((id)objc_opt_class(self, v50), "_controlTitleFontForControlStatusType:", statusType);
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    -[UILabel setFont:](v49, "setFont:", v52);

    -[UILabel setText:](self->_controlTitleLabel, "setText:", v42);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_controlTitleLabel, "setAdjustsFontSizeToFitWidth:", -[MusicLibraryAddKeepLocalControl adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth"));
    -[UILabel setMinimumScaleFactor:](self->_controlTitleLabel, "setMinimumScaleFactor:", 0.75);
    -[UILabel setBaselineAdjustment:](self->_controlTitleLabel, "setBaselineAdjustment:", -[MusicLibraryAddKeepLocalControl adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth"));
    -[MusicLibraryAddKeepLocalControl setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UILabel removeFromSuperview](controlTitleLabel, "removeFromSuperview");
    v53 = self->_controlTitleLabel;
    self->_controlTitleLabel = 0;

  }
  -[MusicLibraryAddKeepLocalControl setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateControlImageViewAnimation
{
  UIImageView *controlImageView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  NSNumber *v10;
  void *v11;
  double v12;
  CFTimeInterval v13;
  long double v14;
  id v15;

  controlImageView = self->_controlImageView;
  if (controlImageView)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView layer](controlImageView, "layer"));
    if (self->_controlStatus.statusType == 3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "presentationLayer"));
      if (v5)
        v6 = v5;
      else
        v6 = v15;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyPath"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKeyPath:", v7));

      objc_msgSend(v4, "setFromValue:", v8);
      objc_msgSend(v8, "floatValue");
      v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(fmod(v9, 6.28318531) + 6.28318531));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      objc_msgSend(v4, "setToValue:", v11);

      objc_msgSend(v4, "setRemovedOnCompletion:", 0);
      LODWORD(v12) = 2139095040;
      objc_msgSend(v4, "setRepeatCount:", v12);
      objc_msgSend(v4, "setFillMode:", kCAFillModeBoth);
      objc_msgSend(v4, "setDuration:", 1.0);
      objc_msgSend(v4, "setBeginTimeMode:", kCAAnimationAbsolute);
      v13 = CACurrentMediaTime();
      objc_msgSend(v4, "duration");
      objc_msgSend(v4, "setBeginTime:", (double)(v13 - fmod(v13, v14)));
      objc_msgSend(v15, "addAnimation:forKey:", v4, CFSTR("_MusicLibraryAddKeepLocalControlWaitingSpinnerAnimationKey"));

    }
    else
    {
      objc_msgSend(v15, "removeAnimationForKey:", CFSTR("_MusicLibraryAddKeepLocalControlWaitingSpinnerAnimationKey"));
    }

  }
}

- (BOOL)allowsAddImage
{
  return self->_allowsAddImage;
}

- (MusicLibraryAddKeepLocalControlStatus)controlStatus
{
  MusicLibraryAddKeepLocalControlStatus *p_controlStatus;
  int64_t statusType;
  double downloadProgress;
  MusicLibraryAddKeepLocalControlStatus result;

  p_controlStatus = &self->_controlStatus;
  statusType = self->_controlStatus.statusType;
  downloadProgress = p_controlStatus->downloadProgress;
  result.downloadProgress = downloadProgress;
  result.statusType = statusType;
  return result;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (int64_t)offerButtonSize
{
  return self->_offerButtonSize;
}

- (void)setOfferButtonSize:(int64_t)a3
{
  self->_offerButtonSize = a3;
}

- (double)controlHitOutsets
{
  return self->_controlHitOutsets;
}

- (void)setControlHitOutsets:(double)a3
{
  self->_controlHitOutsets = a3;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (int64_t)downloadingCenterIconType
{
  return self->_downloadingCenterIconType;
}

- (void)setDownloadingCenterIconType:(int64_t)a3
{
  self->_downloadingCenterIconType = a3;
}

- (UIView)transientContentView
{
  return self->_transientContentView;
}

- (void)setTransientContentView:(id)a3
{
  objc_storeStrong((id *)&self->_transientContentView, a3);
}

- (MusicDownloadProgressView)downloadProgressView
{
  return self->_downloadProgressView;
}

- (void)setDownloadProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgressView, a3);
}

- (UILabel)controlTitleLabel
{
  return self->_controlTitleLabel;
}

- (void)setControlTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_controlTitleLabel, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIImageView)controlImageView
{
  return self->_controlImageView;
}

- (void)setControlImageView:(id)a3
{
  objc_storeStrong((id *)&self->_controlImageView, a3);
}

- (NSMutableDictionary)controlStatusTypeToTitle
{
  return self->_controlStatusTypeToTitle;
}

- (void)setControlStatusTypeToTitle:(id)a3
{
  objc_storeStrong((id *)&self->_controlStatusTypeToTitle, a3);
}

- (int64_t)controlStatusRevision
{
  return self->_controlStatusRevision;
}

- (void)setControlStatusRevision:(int64_t)a3
{
  self->_controlStatusRevision = a3;
}

- (BOOL)hadFirstTouchHighlight
{
  return self->_hadFirstTouchHighlight;
}

- (void)setHadFirstTouchHighlight:(BOOL)a3
{
  self->_hadFirstTouchHighlight = a3;
}

- (UIEdgeInsets)controlImageEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_controlImageEdgeInsets.top;
  left = self->_controlImageEdgeInsets.left;
  bottom = self->_controlImageEdgeInsets.bottom;
  right = self->_controlImageEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setControlImageEdgeInsets:(UIEdgeInsets)a3
{
  self->_controlImageEdgeInsets = a3;
}

- (int64_t)transientContentViewTransactionCount
{
  return self->_transientContentViewTransactionCount;
}

- (void)setTransientContentViewTransactionCount:(int64_t)a3
{
  self->_transientContentViewTransactionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlStatusTypeToTitle, 0);
  objc_storeStrong((id *)&self->_controlImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_controlTitleLabel, 0);
  objc_storeStrong((id *)&self->_downloadProgressView, 0);
  objc_storeStrong((id *)&self->_transientContentView, 0);
}

@end
