@implementation CACZWLensChromeView

- (CACZWLensChromeView)initWithFrame:(CGRect)a3
{
  CACZWLensChromeView *v3;
  CACZWLensChromeView *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  double v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)CACZWLensChromeView;
  v3 = -[CACZWLensChromeView initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CACZWLensChromeView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BDE5640]);
    objc_msgSend(v6, "setEnabled:", 1);
    objc_msgSend(v6, "setAllowsHitTesting:", 0);
    objc_msgSend(v6, "setMarginWidth:", 12.0);
    objc_msgSend(v6, "setMasksToBounds:", 0);
    -[CACZWLensChromeView setBackdropLayer:](v4, "setBackdropLayer:", v6);
    -[CACZWLensChromeView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v6);

    v8 = v6;
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACZWLensChromeView backdropLayer](v4, "backdropLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMask:", v9);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACZWLensChromeView setBackdropMaskShapeLayer:](v4, "setBackdropMaskShapeLayer:", v11);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACZWLensChromeView setBackdropResizingMaskLayer:](v4, "setBackdropResizingMaskLayer:", v12);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "CGColor");
    -[CACZWLensChromeView backdropResizingMaskLayer](v4, "backdropResizingMaskLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

    -[CACZWLensChromeView backdropResizingMaskLayer](v4, "backdropResizingMaskLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 0;
    objc_msgSend(v16, "setOpacity:", v17);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACZWLensChromeView setBackdropGrabberMaskLayer:](v4, "setBackdropGrabberMaskLayer:", v18);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "CGColor");
    -[CACZWLensChromeView backdropGrabberMaskLayer](v4, "backdropGrabberMaskLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v20);

    -[CACZWLensChromeView backdropGrabberMaskLayer](v4, "backdropGrabberMaskLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCornerRadius:", 5.0);

    -[CACZWLensChromeView backdropLayer](v4, "backdropLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "mask");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACZWLensChromeView backdropMaskShapeLayer](v4, "backdropMaskShapeLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSublayer:", v25);

    -[CACZWLensChromeView backdropLayer](v4, "backdropLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mask");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACZWLensChromeView backdropGrabberMaskLayer](v4, "backdropGrabberMaskLayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSublayer:", v28);

    -[CACZWLensChromeView backdropLayer](v4, "backdropLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "mask");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACZWLensChromeView backdropResizingMaskLayer](v4, "backdropResizingMaskLayer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSublayer:", v31);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACZWLensChromeView setChromeInnerBorderLayer:](v4, "setChromeInnerBorderLayer:", v32);
    objc_msgSend(v8, "addSublayer:", v32);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v32, "setFillColor:", objc_msgSend(v33, "CGColor"));

    CACZWLensInnerColor();
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v32, "setStrokeColor:", objc_msgSend(v34, "CGColor"));

    objc_msgSend(v32, "setLineWidth:", CACZWLensInnerBorderWidth());
    v35 = *MEMORY[0x24BDE5BD8];
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCompositingFilter:", v36);

    v37 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    CACZWLensInnerColor();
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v37, "setBackgroundColor:", objc_msgSend(v38, "CGColor"));

    objc_msgSend(v37, "setMasksToBounds:", 1);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setCompositingFilter:", v39);

    -[CACZWLensChromeView setGrabberOverlayLayer:](v4, "setGrabberOverlayLayer:", v37);
    -[CACZWLensChromeView grabberOverlayLayer](v4, "grabberOverlayLayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setCornerRadius:", 5.0);

    objc_msgSend(v8, "addSublayer:", v37);
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACZWLensChromeView setChromeOuterBorderLayer:](v4, "setChromeOuterBorderLayer:", v41);
    objc_msgSend(v8, "addSublayer:", v41);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v41, "setFillColor:", objc_msgSend(v42, "CGColor"));

    CACZWLensOuterColor();
    v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v41, "setStrokeColor:", objc_msgSend(v43, "CGColor"));

    objc_msgSend(v41, "setLineWidth:", CACZWLensOuterBorderWidth());
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD0]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCompositingFilter:", v44);

    -[CACZWLensChromeView setLensCornerRadius:](v4, "setLensCornerRadius:", 13.0);
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACZWLensChromeView setLensResizingHandlesLayer:](v4, "setLensResizingHandlesLayer:", v45);
    LODWORD(v46) = 0;
    objc_msgSend(v45, "setOpacity:", v46);
    CACZWLensInnerColor();
    v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v45, "setFillColor:", objc_msgSend(v47, "CGColor"));

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", v35);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setCompositingFilter:", v48);

    -[CACZWLensChromeView layer](v4, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addSublayer:", v45);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    -[CACZWLensChromeView setTouchStealerShapeLayer:](v4, "setTouchStealerShapeLayer:", v50);
    LODWORD(v51) = 1.0;
    objc_msgSend(v50, "setOpacity:", v51);
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "colorWithAlphaComponent:", 0.00392156863);
    v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v50, "setStrokeColor:", objc_msgSend(v53, "CGColor"));

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v50, "setFillColor:", objc_msgSend(v54, "CGColor"));

    objc_msgSend(v50, "setLineWidth:", CACZWZoomLensBorderThicknessForTouches());
    -[CACZWLensChromeView layer](v4, "layer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addSublayer:", v50);

  }
  return v4;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  void *v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  id v100;
  uint64_t v101;
  void *v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  id v107;
  uint64_t v108;
  void *v109;
  id v110;
  uint64_t v111;
  void *v112;
  id v113;
  uint64_t v114;
  void *v115;
  void *v116;
  id v117;
  uint64_t v118;
  void *v119;
  id v120;
  uint64_t v121;
  void *v122;
  id v123;
  uint64_t v124;
  void *v125;
  double v126;
  double v127;
  void *v128;
  id v129;
  uint64_t v130;
  void *v131;
  objc_super v132;

  v132.receiver = self;
  v132.super_class = (Class)CACZWLensChromeView;
  -[CACZWLensChromeView layoutSubviews](&v132, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[CACZWLensChromeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CACZWLensChromeView chromeInnerBorderLayer](self, "chromeInnerBorderLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CACZWLensChromeView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[CACZWLensChromeView chromeOuterBorderLayer](self, "chromeOuterBorderLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[CACZWLensChromeView bounds](self, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[CACZWLensChromeView lensResizingHandlesLayer](self, "lensResizingHandlesLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  -[CACZWLensChromeView bounds](self, "bounds");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  -[CACZWLensChromeView backdropLayer](self, "backdropLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "mask");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v31, v33, v35, v37);

  -[CACZWLensChromeView bounds](self, "bounds");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  -[CACZWLensChromeView backdropResizingMaskLayer](self, "backdropResizingMaskLayer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

  -[CACZWLensChromeView bounds](self, "bounds");
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  -[CACZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setFrame:", v50, v52, v54, v56);

  -[CACZWLensChromeView bounds](self, "bounds");
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v65 = v64;
  -[CACZWLensChromeView touchStealerShapeLayer](self, "touchStealerShapeLayer");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setFrame:", v59, v61, v63, v65);

  v67 = (void *)MEMORY[0x24BEBD420];
  -[CACZWLensChromeView bounds](self, "bounds");
  objc_msgSend(v67, "bezierPathWithRect:");
  v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v69 = objc_msgSend(v68, "CGPath");
  -[CACZWLensChromeView touchStealerShapeLayer](self, "touchStealerShapeLayer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setPath:", v69);

  -[CACZWLensChromeView bounds](self, "bounds");
  CACZWOuterLensBorderForBounds(-[CACZWLensChromeView showingResizeHandles](self, "showingResizeHandles"), v71, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACZWLensChromeView bounds](self, "bounds");
  CACZWInnerLensBorderForBounds(-[CACZWLensChromeView showingResizeHandles](self, "showingResizeHandles"), v76, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_retainAutorelease(v75);
  v82 = objc_msgSend(v81, "CGPath");
  -[CACZWLensChromeView chromeOuterBorderLayer](self, "chromeOuterBorderLayer");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setPath:", v82);

  v84 = objc_retainAutorelease(v80);
  v85 = objc_msgSend(v84, "CGPath");
  -[CACZWLensChromeView chromeInnerBorderLayer](self, "chromeInnerBorderLayer");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setPath:", v85);

  -[CACZWLensChromeView bounds](self, "bounds");
  v88 = v87;
  v90 = v89;
  v92 = v91;
  v94 = v93;
  -[CACZWLensChromeView backdropLayer](self, "backdropLayer");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setFrame:", v88, v90, v92, v94);

  -[CACZWLensChromeView bounds](self, "bounds");
  CACZWResizeGrabberPath(v96, v97, v98, v99);
  v100 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v101 = objc_msgSend(v100, "CGPath");
  -[CACZWLensChromeView lensResizingHandlesLayer](self, "lensResizingHandlesLayer");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setPath:", v101);

  -[CACZWLensChromeView bounds](self, "bounds");
  CACZWResizeGrabberPath(v103, v104, v105, v106);
  v107 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v108 = objc_msgSend(v107, "CGPath");
  -[CACZWLensChromeView backdropResizingMaskLayer](self, "backdropResizingMaskLayer");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setPath:", v108);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v111 = objc_msgSend(v110, "CGColor");
  -[CACZWLensChromeView backdropResizingMaskLayer](self, "backdropResizingMaskLayer");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setFillColor:", v111);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v113 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v114 = objc_msgSend(v113, "CGColor");
  -[CACZWLensChromeView backdropResizingMaskLayer](self, "backdropResizingMaskLayer");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setBackgroundColor:", v114);

  v116 = (void *)objc_msgSend(v84, "copy");
  objc_msgSend(v116, "appendPath:", v81);
  v117 = objc_retainAutorelease(v116);
  v118 = objc_msgSend(v117, "CGPath");
  -[CACZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setPath:", v118);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v120 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v121 = objc_msgSend(v120, "CGColor");
  -[CACZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setFillColor:", v121);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v123 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v124 = objc_msgSend(v123, "CGColor");
  -[CACZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setStrokeColor:", v124);

  v126 = CACZWLensInnerBorderWidth();
  v127 = CACZWLensOuterBorderWidth();
  if (v126 < v127)
    v126 = v127;
  -[CACZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setLineWidth:", v126);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v129 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v130 = objc_msgSend(v129, "CGColor");
  -[CACZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setBackgroundColor:", v130);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)updateChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  BOOL v15;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BEBDB00];
  v10 = 0.0;
  if (v5)
    v10 = CACZWDefaultFadeAnimationDuration();
  v13 = v8;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__CACZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke;
  v14[3] = &unk_24F2ABF88;
  v14[4] = self;
  v15 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__CACZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke_2;
  v12[3] = &unk_24F2AC7B0;
  v11 = v8;
  objc_msgSend(v9, "animateWithDuration:animations:completion:", v14, v12, v10);

}

uint64_t __66__CACZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

uint64_t __66__CACZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)showLensResizingHandles:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  double v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", !v4);
  -[CACZWLensChromeView lensResizingHandlesLayer](self, "lensResizingHandlesLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v5)
    v10 = 1.0;
  else
    v10 = 0.0;
  if (v5)
    v11 = 0.0;
  else
    v11 = 1.0;
  *(float *)&v8 = v10;
  objc_msgSend(v7, "setOpacity:", v8);

  -[CACZWLensChromeView grabberOverlayLayer](self, "grabberOverlayLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = v11;
  objc_msgSend(v12, "setOpacity:", v13);

  -[CACZWLensChromeView backdropResizingMaskLayer](self, "backdropResizingMaskLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = v10;
  objc_msgSend(v14, "setOpacity:", v15);

  -[CACZWLensChromeView backdropGrabberMaskLayer](self, "backdropGrabberMaskLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v17 = v11;
  objc_msgSend(v16, "setOpacity:", v17);

  -[CACZWLensChromeView setShowingResizeHandles:](self, "setShowingResizeHandles:", v5);
  -[CACZWLensChromeView layoutSubviews](self, "layoutSubviews");
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (double)lensCornerRadius
{
  return self->_lensCornerRadius;
}

- (void)setLensCornerRadius:(double)a3
{
  self->_lensCornerRadius = a3;
}

- (CAShapeLayer)chromeOuterBorderLayer
{
  return self->_chromeOuterBorderLayer;
}

- (void)setChromeOuterBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_chromeOuterBorderLayer, a3);
}

- (CAShapeLayer)chromeInnerBorderLayer
{
  return self->_chromeInnerBorderLayer;
}

- (void)setChromeInnerBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_chromeInnerBorderLayer, a3);
}

- (CAShapeLayer)lensResizingHandlesLayer
{
  return self->_lensResizingHandlesLayer;
}

- (void)setLensResizingHandlesLayer:(id)a3
{
  objc_storeStrong((id *)&self->_lensResizingHandlesLayer, a3);
}

- (CAShapeLayer)touchStealerShapeLayer
{
  return self->_touchStealerShapeLayer;
}

- (void)setTouchStealerShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_touchStealerShapeLayer, a3);
}

- (CALayer)grabberOverlayLayer
{
  return self->_grabberOverlayLayer;
}

- (void)setGrabberOverlayLayer:(id)a3
{
  objc_storeStrong((id *)&self->_grabberOverlayLayer, a3);
}

- (CALayer)backdropLayer
{
  return self->_backdropLayer;
}

- (void)setBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropLayer, a3);
}

- (CAShapeLayer)backdropMaskShapeLayer
{
  return self->_backdropMaskShapeLayer;
}

- (void)setBackdropMaskShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, a3);
}

- (CAShapeLayer)backdropGrabberMaskLayer
{
  return self->_backdropGrabberMaskLayer;
}

- (void)setBackdropGrabberMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropGrabberMaskLayer, a3);
}

- (CAShapeLayer)backdropResizingMaskLayer
{
  return self->_backdropResizingMaskLayer;
}

- (void)setBackdropResizingMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropResizingMaskLayer, a3);
}

- (NSArray)resizeElements
{
  return self->_resizeElements;
}

- (void)setResizeElements:(id)a3
{
  objc_storeStrong((id *)&self->_resizeElements, a3);
}

- (CGRect)previousResizeBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousResizeBounds.origin.x;
  y = self->_previousResizeBounds.origin.y;
  width = self->_previousResizeBounds.size.width;
  height = self->_previousResizeBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousResizeBounds:(CGRect)a3
{
  self->_previousResizeBounds = a3;
}

- (BOOL)showingResizeHandles
{
  return self->_showingResizeHandles;
}

- (void)setShowingResizeHandles:(BOOL)a3
{
  self->_showingResizeHandles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizeElements, 0);
  objc_storeStrong((id *)&self->_backdropResizingMaskLayer, 0);
  objc_storeStrong((id *)&self->_backdropGrabberMaskLayer, 0);
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_grabberOverlayLayer, 0);
  objc_storeStrong((id *)&self->_touchStealerShapeLayer, 0);
  objc_storeStrong((id *)&self->_lensResizingHandlesLayer, 0);
  objc_storeStrong((id *)&self->_chromeInnerBorderLayer, 0);
  objc_storeStrong((id *)&self->_chromeOuterBorderLayer, 0);
}

@end
