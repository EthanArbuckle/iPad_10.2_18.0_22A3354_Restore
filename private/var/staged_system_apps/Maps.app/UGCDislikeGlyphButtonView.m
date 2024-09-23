@implementation UGCDislikeGlyphButtonView

- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  id v28;
  dispatch_time_t v29;
  void *v30;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidY;
  double MaxX;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double MidX;
  double v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  uint64_t v51;
  void *v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  double v57;
  void *v58;
  uint64_t v59;
  unsigned __int8 v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  unsigned __int8 v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  void *v81;
  _QWORD *v82;
  void *v83;
  void *v84;
  double v85;
  void *v86;
  void *v87;
  _QWORD block[4];
  id v90;
  _QWORD v91[5];
  id v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView animationLayer](self, "animationLayer"));
  objc_msgSend(v8, "setHidden:", 1);

  +[CATransaction begin](CATransaction, "begin");
  -[UGCGlyphButtonView animationDuration](self, "animationDuration");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyph](self, "glyph"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v10, "position");
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyph](self, "glyph"));
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyph](self, "glyph"));
  objc_msgSend(v24, "setHidden:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  -[UGCGlyphButtonView setAnimationLayer:](self, "setAnimationLayer:", v25);
  v26 = v17;
  v79 = v21;
  objc_msgSend(v25, "setBounds:", v17, v19, v21, v23);
  objc_msgSend(v25, "setPosition:", v12, v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UGCDislikeGlyphButtonView layer](self, "layer"));
  objc_msgSend(v27, "addSublayer:", v25);

  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_1009409A4;
  v91[3] = &unk_1011AC8B0;
  v91[4] = self;
  v28 = v25;
  v92 = v28;
  v82 = objc_retainBlock(v91);
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:");
  if (v7)
  {
    v29 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009409F8;
    block[3] = &unk_1011ADA00;
    v90 = v7;
    dispatch_after(v29, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  v84 = v7;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  objc_msgSend(v28, "bounds");
  x = v93.origin.x;
  y = v93.origin.y;
  width = v93.size.width;
  height = v93.size.height;
  CGRectGetMidX(v93);
  v94.origin.x = x;
  v94.origin.y = y;
  v94.size.width = width;
  v94.size.height = height;
  MidY = CGRectGetMidY(v94);
  objc_msgSend(v28, "bounds");
  MaxX = CGRectGetMaxX(v95);
  objc_msgSend(v30, "setBounds:", v26, v19, v21, v23);
  objc_msgSend(v30, "setPosition:", MaxX, MidY);
  v83 = v28;
  objc_msgSend(v28, "addSublayer:", v30);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.436332315));
  objc_msgSend(v37, "setToValue:", v38);

  objc_msgSend(v37, "setMass:", 1.0);
  objc_msgSend(v37, "setStiffness:", 250.0);
  objc_msgSend(v37, "setDamping:", 20.0);
  LODWORD(v39) = 1.0;
  objc_msgSend(v37, "setSpeed:", v39);
  objc_msgSend(v37, "setDuration:", 0.25);
  v85 = v19;
  objc_msgSend(v37, "setBeginTime:", a3);
  objc_msgSend(v37, "setFillMode:", kCAFillModeBoth);
  v80 = v37;
  objc_msgSend(v30, "addAnimation:forKey:", v37, CFSTR("transform.rotation.z"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  objc_msgSend(v30, "bounds");
  v41 = v96.origin.x;
  v42 = v96.origin.y;
  v43 = v96.size.width;
  v44 = v96.size.height;
  MidX = CGRectGetMidX(v96);
  v97.origin.x = v41;
  v97.origin.y = v42;
  v97.size.width = v43;
  v97.size.height = v44;
  v46 = CGRectGetMidY(v97);
  objc_msgSend(v40, "setBounds:", v26, v85, v21, v23);
  objc_msgSend(v40, "setPosition:", MidX, v46);
  v81 = v30;
  objc_msgSend(v30, "addSublayer:", v40);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.436332315));
  objc_msgSend(v47, "setToValue:", v48);

  objc_msgSend(v47, "setMass:", 1.0);
  objc_msgSend(v47, "setStiffness:", 400.0);
  objc_msgSend(v47, "setDamping:", 15.0);
  LODWORD(v49) = 1.0;
  objc_msgSend(v47, "setSpeed:", v49);
  objc_msgSend(v47, "setDuration:", 0.22);
  objc_msgSend(v47, "setBeginTime:", a3 + 0.0299999993);
  objc_msgSend(v47, "setFillMode:", kCAFillModeBoth);
  objc_msgSend(v40, "addAnimation:forKey:", v47, CFSTR("transform.rotation.z"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyph](self, "glyph"));
  v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "image"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  v87 = v40;
  objc_msgSend(v40, "bounds");
  v53 = v98.origin.x;
  v54 = v98.origin.y;
  v55 = v98.size.width;
  v56 = v98.size.height;
  CGRectGetMidX(v98);
  v99.origin.x = v53;
  v99.origin.y = v54;
  v99.size.width = v55;
  v99.size.height = v56;
  v57 = CGRectGetMidY(v99);
  objc_msgSend(v52, "setBounds:", v26, v85, v79, v23);
  objc_msgSend(v52, "setPosition:", 0.0, v57);
  if (-[UGCGlyphButtonView isSelected](self, "isSelected"))
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyphAppearance](self, "glyphAppearance"));
    v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "selectedGlyphName"));
  }
  else
  {
    v60 = -[UGCGlyphButtonView isMuted](self, "isMuted");
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyphAppearance](self, "glyphAppearance"));
    v58 = v61;
    if ((v60 & 1) != 0)
      v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "mutedGlyphName"));
    else
      v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "unselectedGlyphName"));
  }
  v62 = (void *)v59;

  if (-[UGCGlyphButtonView isSelected](self, "isSelected"))
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyphAppearance](self, "glyphAppearance"));
    v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "selectedGlyphColor"));
  }
  else
  {
    v65 = -[UGCGlyphButtonView isMuted](self, "isMuted");
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyphAppearance](self, "glyphAppearance"));
    v63 = v66;
    if ((v65 & 1) != 0)
      v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "mutedGlyphColor"));
    else
      v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "unselectedGlyphColor"));
  }
  v67 = (void *)v64;

  v68 = (void *)v51;
  if (!-[UGCGlyphButtonView isEnabled](self, "isEnabled"))
  {
    v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "colorWithAlphaComponent:", 0.3));

    v67 = (void *)v69;
  }
  v86 = v62;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v62));
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[UGCFontManager ratingGlyphButtonFont](UGCFontManager, "ratingGlyphButtonFont"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v71));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "imageWithConfiguration:", v72));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "_flatImageWithColor:", v67));

  v75 = objc_retainAutorelease(v74);
  objc_msgSend(v52, "setContents:", objc_msgSend(v75, "CGImage"));
  objc_msgSend(v68, "scale");
  objc_msgSend(v52, "setContentsScale:");
  objc_msgSend(v52, "setContentsGravity:", kCAGravityCenter);
  -[UGCGlyphButtonView setContentLayer:](self, "setContentLayer:", v52);
  objc_msgSend(v87, "addSublayer:", v52);
  if (sub_1002A8AA0(self) != 5)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy")));
    objc_msgSend(v76, "setValues:", &off_101274040);
    objc_msgSend(v76, "setKeyTimes:", &off_101274058);
    objc_msgSend(v76, "setBeginTime:", a3);
    objc_msgSend(v76, "setFillMode:", kCAFillModeBoth);
    -[UGCGlyphButtonView animationDuration](self, "animationDuration");
    objc_msgSend(v76, "setDuration:", v77 * 0.5);
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UGCDislikeGlyphButtonView layer](self, "layer"));
    objc_msgSend(v78, "addAnimation:forKey:", v76, CFSTR("backgroundScaleAnimation"));

  }
  +[CATransaction commit](CATransaction, "commit");

}

@end
