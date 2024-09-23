@implementation UGCLikeGlyphButtonView

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
  void *v26;
  id v27;
  dispatch_time_t v28;
  void *v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidY;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double MidX;
  double v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  double MaxX;
  void *v57;
  uint64_t v58;
  unsigned __int8 v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  unsigned __int8 v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD *v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD block[4];
  id v89;
  _QWORD v90[5];
  id v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

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
  objc_msgSend(v25, "setBounds:", v17, v19, v21, v23);
  objc_msgSend(v25, "setPosition:", v12, v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UGCLikeGlyphButtonView layer](self, "layer"));
  objc_msgSend(v26, "addSublayer:", v25);

  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_1009400F8;
  v90[3] = &unk_1011AC8B0;
  v90[4] = self;
  v27 = v25;
  v91 = v27;
  v83 = objc_retainBlock(v90);
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:");
  if (v7)
  {
    v28 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10094014C;
    block[3] = &unk_1011ADA00;
    v89 = v7;
    dispatch_after(v28, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  v85 = v7;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  objc_msgSend(v27, "bounds");
  x = v92.origin.x;
  y = v92.origin.y;
  width = v92.size.width;
  height = v92.size.height;
  CGRectGetMidX(v92);
  v93.origin.x = x;
  v93.origin.y = y;
  v93.size.width = width;
  v93.size.height = height;
  MidY = CGRectGetMidY(v93);
  objc_msgSend(v29, "setBounds:", v17, v19, v21, v23);
  objc_msgSend(v29, "setPosition:", 0.0, MidY);
  v84 = v27;
  objc_msgSend(v27, "addSublayer:", v29);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.436332315));
  objc_msgSend(v35, "setToValue:", v36);

  objc_msgSend(v35, "setMass:", 1.0);
  objc_msgSend(v35, "setStiffness:", 250.0);
  objc_msgSend(v35, "setDamping:", 20.0);
  LODWORD(v37) = 1.0;
  objc_msgSend(v35, "setSpeed:", v37);
  objc_msgSend(v35, "setDuration:", 0.25);
  v78 = v19;
  objc_msgSend(v35, "setBeginTime:", a3);
  objc_msgSend(v35, "setFillMode:", kCAFillModeBoth);
  v81 = v35;
  objc_msgSend(v29, "addAnimation:forKey:", v35, CFSTR("transform.rotation.z"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  objc_msgSend(v29, "bounds");
  v39 = v94.origin.x;
  v40 = v94.origin.y;
  v41 = v94.size.width;
  v42 = v94.size.height;
  v79 = v17;
  MidX = CGRectGetMidX(v94);
  v95.origin.x = v39;
  v95.origin.y = v40;
  v95.size.width = v41;
  v95.size.height = v42;
  v44 = CGRectGetMidY(v95);
  objc_msgSend(v38, "setBounds:", v17, v78, v21, v23);
  objc_msgSend(v38, "setPosition:", MidX, v44);
  v82 = v29;
  objc_msgSend(v29, "addSublayer:", v38);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.436332315));
  objc_msgSend(v45, "setToValue:", v46);

  objc_msgSend(v45, "setMass:", 1.0);
  objc_msgSend(v45, "setStiffness:", 400.0);
  objc_msgSend(v45, "setDamping:", 15.0);
  LODWORD(v47) = 1.0;
  objc_msgSend(v45, "setSpeed:", v47);
  objc_msgSend(v45, "setDuration:", 0.22);
  objc_msgSend(v45, "setBeginTime:", a3 + 0.0299999993);
  objc_msgSend(v45, "setFillMode:", kCAFillModeBoth);
  objc_msgSend(v38, "addAnimation:forKey:", v45, CFSTR("transform.rotation.z"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyph](self, "glyph"));
  v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "image"));

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  v86 = v38;
  objc_msgSend(v38, "bounds");
  v51 = v96.origin.x;
  v52 = v96.origin.y;
  v53 = v96.size.width;
  v54 = v96.size.height;
  CGRectGetMidX(v96);
  v97.origin.x = v51;
  v97.origin.y = v52;
  v97.size.width = v53;
  v97.size.height = v54;
  v55 = CGRectGetMidY(v97);
  v98.origin.x = v79;
  v98.origin.y = v78;
  v98.size.width = v21;
  v98.size.height = v23;
  MaxX = CGRectGetMaxX(v98);
  objc_msgSend(v50, "setBounds:", v79, v78, v21, v23);
  objc_msgSend(v50, "setPosition:", MaxX, v55);
  if (-[UGCGlyphButtonView isSelected](self, "isSelected"))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyphAppearance](self, "glyphAppearance"));
    v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "selectedGlyphName"));
  }
  else
  {
    v59 = -[UGCGlyphButtonView isMuted](self, "isMuted");
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyphAppearance](self, "glyphAppearance"));
    v57 = v60;
    if ((v59 & 1) != 0)
      v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "mutedGlyphName"));
    else
      v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "unselectedGlyphName"));
  }
  v61 = (void *)v58;

  if (-[UGCGlyphButtonView isSelected](self, "isSelected"))
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyphAppearance](self, "glyphAppearance"));
    v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "selectedGlyphColor"));
  }
  else
  {
    v64 = -[UGCGlyphButtonView isMuted](self, "isMuted");
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyphAppearance](self, "glyphAppearance"));
    v62 = v65;
    if ((v64 & 1) != 0)
      v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "mutedGlyphColor"));
    else
      v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "unselectedGlyphColor"));
  }
  v66 = (void *)v63;

  v67 = (void *)v49;
  if (!-[UGCGlyphButtonView isEnabled](self, "isEnabled"))
  {
    v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "colorWithAlphaComponent:", 0.3));

    v66 = (void *)v68;
  }
  v80 = v61;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v61));
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[UGCFontManager ratingGlyphButtonFont](UGCFontManager, "ratingGlyphButtonFont"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v70));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "imageWithConfiguration:", v71));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "_flatImageWithColor:", v66));

  v74 = objc_retainAutorelease(v73);
  objc_msgSend(v50, "setContents:", objc_msgSend(v74, "CGImage"));
  objc_msgSend(v67, "scale");
  objc_msgSend(v50, "setContentsScale:");
  objc_msgSend(v50, "setContentsGravity:", kCAGravityCenter);
  -[UGCGlyphButtonView setContentLayer:](self, "setContentLayer:", v50);
  objc_msgSend(v86, "addSublayer:", v50);
  if (sub_1002A8AA0(self) != 5)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy")));
    objc_msgSend(v75, "setValues:", &off_101274010);
    objc_msgSend(v75, "setKeyTimes:", &off_101274028);
    objc_msgSend(v75, "setBeginTime:", a3);
    objc_msgSend(v75, "setFillMode:", kCAFillModeBoth);
    -[UGCGlyphButtonView animationDuration](self, "animationDuration");
    objc_msgSend(v75, "setDuration:", v76 * 0.5);
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UGCLikeGlyphButtonView layer](self, "layer"));
    objc_msgSend(v77, "addAnimation:forKey:", v75, CFSTR("backgroundScaleAnimation"));

  }
  +[CATransaction commit](CATransaction, "commit");

}

@end
