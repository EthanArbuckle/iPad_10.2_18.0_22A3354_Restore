@implementation UIKeyboardSliceTransitionView

- (UIKeyboardSliceTransitionView)initWithFrame:(CGRect)a3
{
  UIKeyboardSliceTransitionView *v3;
  UIKeyboardSliceTransitionView *v4;
  void *v5;
  UIKeyboardSliceTransitionView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardSliceTransitionView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.0);

    -[UIKeyboardSliceTransitionView initializeLayers](v4, "initializeLayers");
    -[UIKeyboardSliceTransitionView setRebuildFlags](v4, "setRebuildFlags");
    v6 = v4;
  }

  return v4;
}

- (void)initializeLayers
{
  CALayer *v3;
  CALayer *leftKeys;
  CALayer *v5;
  CALayer *rightKeys;
  void *v7;
  void *v8;
  CALayer *v9;
  CALayer *spaceFill;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *controlKeys;
  void *v14;
  _QWORD v15[5];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardSliceTransitionView;
  -[UIKeyboardSplitTransitionView initializeLayers](&v16, sel_initializeLayers);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v3 = (CALayer *)objc_claimAutoreleasedReturnValue();
  leftKeys = self->_leftKeys;
  self->_leftKeys = v3;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v5 = (CALayer *)objc_claimAutoreleasedReturnValue();
  rightKeys = self->_rightKeys;
  self->_rightKeys = v5;

  -[CALayer setName:](self->_leftKeys, "setName:", CFSTR("Keys (left)"));
  -[CALayer setName:](self->_rightKeys, "setName:", CFSTR("Keys (right)"));
  -[CALayer setAnchorPoint:](self->_leftKeys, "setAnchorPoint:", 0.0, 0.0);
  -[CALayer setAnchorPoint:](self->_rightKeys, "setAnchorPoint:", 1.0, 0.0);
  -[UIView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", self->_leftKeys);

  -[UIView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSublayer:", self->_rightKeys);

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v9 = (CALayer *)objc_claimAutoreleasedReturnValue();
  spaceFill = self->_spaceFill;
  self->_spaceFill = v9;

  -[CALayer setAnchorPoint:](self->_spaceFill, "setAnchorPoint:", 0.0, 0.0);
  -[UIView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSublayer:", self->_spaceFill);

  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  controlKeys = self->_controlKeys;
  self->_controlKeys = v12;

  -[UIKeyboardSplitTransitionView shadowLayers](self, "shadowLayers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__UIKeyboardSliceTransitionView_initializeLayers__block_invoke;
  v15[3] = &unk_1E16B40F8;
  v15[4] = self;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

}

void __49__UIKeyboardSliceTransitionView_initializeLayers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSublayer:", v3);

}

- (void)setRebuildFlags
{
  *(_BYTE *)&self->_rebuildFlags |= 0xFEu;
}

- (void)dealloc
{
  CGImage *defaultKeyplaneImage;
  CGImage *splitKeyplaneImage;
  objc_super v5;

  defaultKeyplaneImage = self->_defaultKeyplaneImage;
  if (defaultKeyplaneImage)
    CGImageRelease(defaultKeyplaneImage);
  splitKeyplaneImage = self->_splitKeyplaneImage;
  if (splitKeyplaneImage)
    CGImageRelease(splitKeyplaneImage);
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardSliceTransitionView;
  -[UIKeyboardSplitTransitionView dealloc](&v5, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardSliceTransitionView;
  -[UIKeyboardSplitTransitionView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView bounds](self, "bounds");
  -[CALayer setBounds:](self->_leftKeys, "setBounds:");
  -[UIView bounds](self, "bounds");
  -[CALayer setBounds:](self->_rightKeys, "setBounds:");
  -[UIView bounds](self, "bounds");
  -[CALayer setPosition:](self->_rightKeys, "setPosition:", v4, 0.0);
}

- (void)rebuildTransitionForSplitStyleChange:(id)a3
{
  *(_BYTE *)&self->_rebuildFlags |= 4u;
  -[UIKeyboardSliceTransitionView updateTransition](self, "updateTransition", a3);
}

- (CGImage)getKeyboardImageAsSplit:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  CGImage *v6;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._transitionDataSource);
  v6 = (CGImage *)objc_msgSend(WeakRetained, "renderedKeyplaneWithToken:split:", self->_keyplaneToken, v3);

  return v6;
}

- (CGImage)defaultKeyboardImage
{
  return self->_defaultKeyplaneImage;
}

- (CGImage)splitKeyboardImage
{
  return self->_splitKeyplaneImage;
}

- (double)adjustedLeftWidthAtMergePoint
{
  double v3;
  double v4;
  double v5;

  -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
  v4 = v3;
  -[UIKeyboardSliceSet mergePoint](self->super._sliceSet, "mergePoint");
  return v4 * (v5 + 0.065);
}

- (double)adjustedRightWidthAtMergePoint
{
  double v3;
  double v4;
  double v5;

  -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
  v4 = v3;
  -[UIKeyboardSliceSet mergePoint](self->super._sliceSet, "mergePoint");
  return v4 * (1.0 - v5 + 0.065);
}

- (id)crossfadeOpacityAnimation
{
  unint64_t v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;

  v2 = self->_orientation - 1;
  objc_msgSend(MEMORY[0x1E0CD2798], "normalizedKeyframeAnimationWithKeyPath:", CFSTR("opacity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v5) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 > 1)
  {
    LODWORD(v7) = 1042871747;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    LODWORD(v10) = 0.25;
  }
  else
  {
    LODWORD(v7) = 1047233823;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    LODWORD(v10) = 1052266988;
  }
  objc_msgSend(v9, "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObjects:", v6, v8, v11, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setKeyTimes:", v14);
  v15 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v16) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithObjects:", v17, v19, v21, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValues:", v24);

  return v3;
}

- (void)rebuildTopEdgeHighlightTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  -[CALayer removeAllAnimations](self->_topEdgeHighlight, "removeAllAnimations");
  -[CALayer sublayers](self->_topEdgeHighlight, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CALayer sublayers](self->_topEdgeHighlight, "sublayers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    -[CALayer sublayers](self->_topEdgeHighlight, "sublayers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAnchorPoint:", 0.0, 0.0);
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.2, 0.2, 0.2, 1.0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v20, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

    -[CALayer addSublayer:](self->_topEdgeHighlight, "addSublayer:", v20);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnchorPoint:", 0.0, 0.0);
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.75, 0.75, 0.75, 1.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

    -[CALayer addSublayer:](self->_topEdgeHighlight, "addSublayer:", v6);
  }
  -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
  v10 = v9;
  objc_msgSend(v20, "setBounds:", 0.0, 0.0);
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v10, 1.0);
  objc_msgSend(v6, "setPosition:", 0.0, 1.0);
  -[CALayer setBounds:](self->_topEdgeHighlight, "setBounds:", 0.0, 0.0, v10, 2.0);
  if (!self->super._centerFilled)
  {
    -[UIKeyboardSliceTransitionView crossfadeOpacityAnimation](self, "crossfadeOpacityAnimation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0C99D20];
    LODWORD(v13) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithObjects:", v14, v16, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValues:", v19);

    -[CALayer addAnimation:forKey:](self->_topEdgeHighlight, "addAnimation:forKey:", v11, CFSTR("top edge opacity animation"));
  }
  *(_BYTE *)&self->_rebuildFlags &= ~0x10u;

}

- (void)rebuildShadows
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  CGFloat v81;
  CGFloat v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  CGFloat v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  CGFloat Width;
  void *v97;
  void *v98;
  CGFloat v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  CGFloat rect;
  double v124;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  CGFloat v132;
  void *v133;
  CGFloat v134;
  CGFloat v135;
  CGFloat v136;
  void *v137;
  CGFloat v138;
  void *v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  CGFloat v144;
  double v145;
  void *v146;
  void *v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;

  -[UIKeyboardSplitTransitionView sizeForShadowLayer:](self, "sizeForShadowLayer:", 1);
  v4 = v3;
  -[UIKeyboardSplitTransitionView sizeForShadowLayer:](self, "sizeForShadowLayer:", 2);
  v145 = v5;
  -[UIKeyboardSplitTransitionView sizeForShadowLayer:](self, "sizeForShadowLayer:", 3);
  v7 = v6;
  -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
  v142 = v16;
  v143 = v17;
  v140 = v18;
  -[UIKeyboardSliceSet leftWidth](self->super._sliceSet, "leftWidth");
  v20 = v19;
  -[UIKeyboardSliceSet endRect](self->super._sliceSet, "endRect");
  v22 = v21;
  -[UIKeyboardSliceSet rightWidth](self->super._sliceSet, "rightWidth");
  v141 = v23;
  -[UIKeyboardSliceSet endRect](self->super._sliceSet, "endRect");
  v144 = v24;
  v136 = v11;
  v138 = v9;
  v148.origin.x = v9;
  v148.origin.y = v11;
  v148.size.width = v13;
  v132 = v15;
  v148.size.height = v15;
  v25 = v7 + v4 + CGRectGetHeight(v148) + -2.0 + -2.0;
  v149.origin.x = 0.0;
  v149.origin.y = 0.0;
  v149.size.width = v20;
  v149.size.height = v22;
  v26 = v7 + v4 + CGRectGetHeight(v149) + -2.0 + -2.0;
  -[UIKeyboardSplitTransitionView shadowLayers](self, "shadowLayers");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "enumerateObjectsUsingBlock:", &__block_literal_global_385);
  -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
  v28 = v27;
  -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
  v30 = v29;
  -[UIKeyboardSliceSet endRect](self->super._sliceSet, "endRect");
  v32 = v31 - v30 + -2.0;
  objc_msgSend(v147, "objectAtIndex:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
  objc_msgSend(v33, "setFrame:", 0.0, v28, v34 + -16.0, v7);
  objc_msgSend(v33, "setPosition:", 8.0, 0.0);
  objc_msgSend(v33, "setHidden:", 0);
  v35 = (void *)MEMORY[0x1E0CD2710];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28 + -2.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v28 + v32;
  v38 = v26;
  v39 = v25;
  v40 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("position.y"), v36, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "addAnimation:forKey:", v42, CFSTR("position animation"));
  objc_msgSend(v147, "objectAtIndex:", 7);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "objectAtIndex:", 8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAnchorPoint:", 0.0, 0.0);
  objc_msgSend(v44, "setAnchorPoint:", 0.0, 0.0);
  v45 = 2.0 - v4;
  objc_msgSend(v43, "setPosition:", 8.0, 2.0 - v4);
  -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
  objc_msgSend(v44, "setPosition:", v46 + -8.0, 2.0 - v4);
  objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("bounds"), 0, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v145, v39);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFromValue:", v48);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v145, v38);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setToValue:", v49);

  objc_msgSend(v43, "addAnimation:forKey:", v47, CFSTR("left outer shadow bounds"));
  objc_msgSend(v44, "addAnimation:forKey:", v47, CFSTR("right outer shadow bounds"));
  if (!self->super._centerFilled)
  {
    v126 = v38;
    v128 = v44;
    v129 = v43;
    v130 = v42;
    v131 = v33;
    objc_msgSend(MEMORY[0x1E0CD2798], "normalizedKeyframeAnimationWithKeyPath:", CFSTR("opacity"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = self->_orientation - 1;
    v52 = (void *)MEMORY[0x1E0C99D20];
    LODWORD(v53) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v7;
    if (v51 > 1)
    {
      LODWORD(v55) = 1038845215;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v58) = 0.25;
    }
    else
    {
      LODWORD(v55) = 1043878380;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v58) = 1052266988;
    }
    objc_msgSend(v57, "numberWithFloat:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "arrayWithObjects:", v54, v56, v59, v61, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setKeyTimes:", v62);

    v63 = (void *)MEMORY[0x1E0C99D20];
    LODWORD(v64) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v66) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v68) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v70) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "arrayWithObjects:", v65, v67, v69, v71, 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v50;
    objc_msgSend(v50, "setValues:", v72);

    objc_msgSend(v131, "addAnimation:forKey:", v50, CFSTR("full-width opacity"));
    -[UIKeyboardSliceTransitionView adjustedLeftWidthAtMergePoint](self, "adjustedLeftWidthAtMergePoint");
    v74 = v73;
    -[UIKeyboardSliceTransitionView adjustedRightWidthAtMergePoint](self, "adjustedRightWidthAtMergePoint");
    v76 = v75;
    rect = v75;
    objc_msgSend(v147, "objectAtIndex:", 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "objectAtIndex:", 4);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setAnchorPoint:", 0.0, 1.0);
    objc_msgSend(v78, "setAnchorPoint:", 1.0, 1.0);
    v79 = v77;
    objc_msgSend(v77, "setPosition:", 0.0, 2.0);
    -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
    objc_msgSend(v78, "setPosition:", v80, 2.0);
    v150.origin.y = v136;
    v150.origin.x = v138;
    v150.size.width = v74;
    v150.size.height = v132;
    v81 = CGRectGetWidth(v150) + -16.0 + -8.0;
    v151.origin.x = 0.0;
    v151.origin.y = 0.0;
    v151.size.height = v22;
    v151.size.width = v20;
    v134 = CGRectGetWidth(v151) + -16.0 + -1.0;
    v152.origin.x = v142;
    v152.origin.y = v143;
    v152.size.width = v76;
    v152.size.height = v140;
    v135 = CGRectGetWidth(v152) + -16.0 + -8.0 + -1.0;
    v153.origin.x = 0.0;
    v153.origin.y = 0.0;
    v153.size.width = v141;
    v153.size.height = v144;
    v82 = CGRectGetWidth(v153) + -16.0 + -1.0;
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("bounds"), 0, 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v81, v40);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v83;
    objc_msgSend(v83, "setFromValue:", v84);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v134, v40);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setToValue:", v85);

    v125 = v79;
    objc_msgSend(v79, "addAnimation:forKey:", v83, CFSTR("top left bounds"));
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v135, v40);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setFromValue:", v86);

    v87 = v82;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v82, v40);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setToValue:", v88);

    v133 = v78;
    objc_msgSend(v78, "addAnimation:forKey:", v83, CFSTR("top right bounds"));
    objc_msgSend(v79, "setHidden:", 0);
    objc_msgSend(v78, "setHidden:", 0);
    objc_msgSend(v147, "objectAtIndex:", 2);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "objectAtIndex:", 5);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setAnchorPoint:", 0.0, 0.0);
    objc_msgSend(v90, "setAnchorPoint:", 1.0, 0.0);
    objc_msgSend(v89, "setPosition:", 0.0, v45);
    objc_msgSend(v90, "setPosition:", 0.0, v45);
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("bounds"), 0, 0);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v145, v39);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "setFromValue:", v91);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v145, v126);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "setToValue:", v92);

    v93 = v89;
    objc_msgSend(v89, "addAnimation:forKey:", v137, CFSTR("left center bounds"));
    objc_msgSend(v90, "addAnimation:forKey:", v137, CFSTR("right center bounds"));
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("position.x"), 0, 0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = (void *)MEMORY[0x1E0CB37E8];
    v154.origin.x = 0.0;
    v154.origin.y = 0.0;
    v154.size.width = v81;
    v154.size.height = v40;
    Width = CGRectGetWidth(v154);
    *(float *)&Width = Width;
    objc_msgSend(v95, "numberWithFloat:", Width);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setFromValue:", v97);

    v98 = (void *)MEMORY[0x1E0CB37E8];
    v155.origin.x = 0.0;
    v155.origin.y = 0.0;
    v155.size.width = v134;
    v155.size.height = v40;
    v99 = CGRectGetWidth(v155);
    *(float *)&v99 = v99;
    objc_msgSend(v98, "numberWithFloat:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setToValue:", v100);

    objc_msgSend(v89, "addAnimation:forKey:", v94, CFSTR("left center position"));
    v101 = (void *)MEMORY[0x1E0CB37E8];
    -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
    v102 = CGRectGetWidth(v156);
    v157.origin.x = v142;
    v157.origin.y = v143;
    v157.size.width = rect;
    v157.size.height = v140;
    v103 = v102 - CGRectGetWidth(v157) + -3.0;
    *(float *)&v103 = v103;
    objc_msgSend(v101, "numberWithFloat:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = v94;
    objc_msgSend(v94, "setFromValue:", v104);

    v105 = (void *)MEMORY[0x1E0CB37E8];
    -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
    v106 = CGRectGetWidth(v158);
    v159.origin.x = 0.0;
    v159.origin.y = 0.0;
    v159.size.width = v141;
    v159.size.height = v144;
    v107 = v106 - CGRectGetWidth(v159) + -8.0 + -3.0;
    *(float *)&v107 = v107;
    objc_msgSend(v105, "numberWithFloat:", v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setToValue:", v108);

    objc_msgSend(v90, "addAnimation:forKey:", v94, CFSTR("right center position"));
    objc_msgSend(v89, "setHidden:", 0);
    objc_msgSend(v90, "setHidden:", 0);
    objc_msgSend(v147, "objectAtIndex:", 3);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "objectAtIndex:", 6);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setAnchorPoint:", 0.0, 0.0);
    objc_msgSend(v110, "setAnchorPoint:", 1.0, 0.0);
    objc_msgSend(v109, "setPosition:", 8.0, -1.0);
    -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
    objc_msgSend(v110, "setPosition:", v111 + -8.0, -1.0);
    v160.origin.x = 0.0;
    v160.origin.y = 0.0;
    v160.size.width = v81;
    v160.size.height = v40;
    v112 = CGRectGetWidth(v160) + -8.0;
    v161.origin.x = 0.0;
    v161.origin.y = 0.0;
    v161.size.width = v134;
    v161.size.height = v40;
    v113 = CGRectGetWidth(v161) + -8.0;
    v162.origin.x = 0.0;
    v162.origin.y = 0.0;
    v162.size.width = v135;
    v162.size.height = v40;
    v114 = CGRectGetWidth(v162) + -8.0;
    v163.origin.x = 0.0;
    v163.origin.y = 0.0;
    v163.size.width = v87;
    v163.size.height = v40;
    v115 = CGRectGetWidth(v163) + -8.0;
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("bounds"), 0, 0);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v112, v124);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setFromValue:", v117);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v113, v124);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setToValue:", v118);

    objc_msgSend(v109, "addAnimation:forKey:", v116, CFSTR("bottom left bounds"));
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("bounds"), 0, 0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v114, v124);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setFromValue:", v120);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v115, v124);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setToValue:", v121);

    objc_msgSend(v110, "addAnimation:forKey:", v119, CFSTR("bottom right bounds"));
    v42 = v130;
    objc_msgSend(v109, "addAnimation:forKey:", v130, CFSTR("position animation"));
    objc_msgSend(v110, "addAnimation:forKey:", v130, CFSTR("position animation"));
    objc_msgSend(v109, "setHidden:", 0);
    objc_msgSend(v110, "setHidden:", 0);
    -[UIKeyboardSliceTransitionView crossfadeOpacityAnimation](self, "crossfadeOpacityAnimation");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addAnimation:forKey:", v122, CFSTR("top left opacity"));
    objc_msgSend(v133, "addAnimation:forKey:", v122, CFSTR("top right opacity"));
    objc_msgSend(v93, "addAnimation:forKey:", v122, CFSTR("center left opacity"));
    objc_msgSend(v90, "addAnimation:forKey:", v122, CFSTR("center right opacity"));
    objc_msgSend(v109, "addAnimation:forKey:", v122, CFSTR("bottom left opacity"));
    objc_msgSend(v110, "addAnimation:forKey:", v122, CFSTR("bottom right opacity"));
    -[UIKeyboardSliceTransitionView rebuildTopEdgeHighlightTransition](self, "rebuildTopEdgeHighlightTransition");

    v33 = v131;
    v44 = v128;
    v43 = v129;
  }

}

void __47__UIKeyboardSliceTransitionView_rebuildShadows__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;

  v4 = a2;
  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    objc_msgSend(v4, "setHidden:", 1);
    objc_msgSend(v5, "removeAllAnimations");
    v4 = v5;
  }

}

- (void)rebuildBackgroundAndShadowTransitions
{
  void *v3;
  _QWORD v4[5];

  -[UIKeyboardSplitTransitionView backgroundLayers](self, "backgroundLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__UIKeyboardSliceTransitionView_rebuildBackgroundAndShadowTransitions__block_invoke;
  v4[3] = &unk_1E16B40F8;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  -[UIKeyboardSliceTransitionView rebuildShadows](self, "rebuildShadows");
  *(_BYTE *)&self->_rebuildFlags &= ~4u;
}

void __70__UIKeyboardSliceTransitionView_rebuildBackgroundAndShadowTransitions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  _BOOL8 v30;
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
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;

  v61 = a2;
  objc_msgSend(v61, "removeAnimationForKey:", CFSTR("bounds animation"));
  if (a3 == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "startRect");
    v8 = v32;
    v31 = v33;
    v16 = v34;
    objc_msgSend(*(id *)(a1 + 32), "adjustedRightWidthAtMergePoint");
    v14 = v35;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "rightWidth");
    v37 = v36;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "preferencesActions");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "rivenSizeFactor:", 9.0);
    v26 = v37 + v40;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "endRect");
    v28 = v41;

    objc_msgSend(*(id *)(a1 + 32), "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "insertSublayer:atIndex:", v61, 0);

    v30 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 552) != 0;
    v20 = 0.0;
  }
  else if (a3 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "startRect");
    v8 = v43;
    v31 = v44;
    v16 = v45;
    objc_msgSend(*(id *)(a1 + 32), "adjustedLeftWidthAtMergePoint");
    v14 = v46;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "preferencesActions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "rivenSizeFactor:", 9.0);
    v20 = -v49;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "leftWidth");
    v51 = v50;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "preferencesActions");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "rivenSizeFactor:", 9.0);
    v26 = v51 + v54;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "endRect");
    v28 = v55;

    objc_msgSend(*(id *)(a1 + 32), "layer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "insertSublayer:atIndex:", v61, 0);

    v30 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 552) != 0;
  }
  else
  {
    if (a3)
    {
      v20 = *MEMORY[0x1E0C9D648];
      v57 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v16 = v28;
      v14 = v26;
      v31 = v57;
      v8 = *MEMORY[0x1E0C9D648];
      goto LABEL_9;
    }
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferencesActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rivenSizeFactor:", 9.0);
    v8 = -v7;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "startRect");
    v10 = v9;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferencesActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rivenSizeFactor:", 9.0);
    v14 = v10 + v13 + v13;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "startRect");
    v16 = v15;

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preferencesActions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rivenSizeFactor:", 9.0);
    v20 = -v19;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "endRect");
    v22 = v21;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferencesActions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rivenSizeFactor:", 9.0);
    v26 = v22 + v25 + v25;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "endRect");
    v28 = v27;

    objc_msgSend(*(id *)(a1 + 32), "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "insertSublayer:atIndex:", v61, 0);

    v30 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 552) == 0;
    v31 = 0.0;
  }
  objc_msgSend(v61, "setHidden:", v30);
  v57 = 0.0;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("bounds"), 0, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v8, v31, v14, v16);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setFromValue:", v59);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v20, v57, v26, v28);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setToValue:", v60);

  objc_msgSend(v61, "addAnimation:forKey:", v58, CFSTR("bounds animation"));
}

- (void)rebuildBackgroundGradientTransitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  -[UIKeyboardSplitTransitionView colorsForBackgroundLayer:](self, "colorsForBackgroundLayer:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSplitTransitionView colorsForBackgroundLayer:](self, "colorsForBackgroundLayer:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if (v8 && v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("colors"), v8, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v5);

  }
  -[UIKeyboardSplitTransitionView backgroundLayers](self, "backgroundLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__UIKeyboardSliceTransitionView_rebuildBackgroundGradientTransitions__block_invoke;
  v9[3] = &unk_1E16B40F8;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  *(_BYTE *)&self->_rebuildFlags &= ~8u;
}

void __69__UIKeyboardSliceTransitionView_rebuildBackgroundGradientTransitions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("gradient interpolation"));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_msgSend(v4, "addAnimation:forKey:", v3, CFSTR("gradient interpolation"));
  else
    objc_msgSend(v4, "setColors:");

}

- (void)updateTransitionForSlice:(id)a3 withStart:(id)a4 startContents:(id)a5 end:(id)a6 endContents:(id)a7 updateContents:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  unint64_t v14;
  id v15;
  unint64_t v16;
  void *v17;
  BOOL v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v8 = a8;
  v25 = a3;
  v13 = a4;
  v14 = (unint64_t)a5;
  v15 = a6;
  v16 = (unint64_t)a7;
  v17 = (void *)v16;
  if (v14 | v16)
  {
    if (v14)
      v18 = v16 == 0;
    else
      v18 = 1;
    v19 = !v18;
    if (v8)
    {
      objc_msgSend(v13, "setContents:", v14);
      objc_msgSend(v15, "setContents:", v17);
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scale");
      objc_msgSend(v13, "setContentsScale:");

      objc_msgSend(v13, "contentsScale");
      objc_msgSend(v15, "setContentsScale:");
    }
    objc_msgSend(v13, "removeAnimationForKey:", CFSTR("start opacity interpolation"));
    objc_msgSend(v15, "removeAnimationForKey:", CFSTR("end opacity interpolation"));
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), &unk_1E1A992B8, &unk_1E1A992D0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD27D0], "_kbTimingFunction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTimingFunction:", v22);

      objc_msgSend(v13, "addAnimation:forKey:", v21, CFSTR("start opacity interpolation"));
      objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), &unk_1E1A992D0, &unk_1E1A992B8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD27D0], "_kbTimingFunction");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTimingFunction:", v24);

      objc_msgSend(v15, "addAnimation:forKey:", v23, CFSTR("end opacity interpolation"));
    }
  }

}

- (void)refreshKeyplaneImages
{
  CGImage *defaultKeyplaneImage;
  CGImage *splitKeyplaneImage;
  CGImage *v5;

  defaultKeyplaneImage = self->_defaultKeyplaneImage;
  if (defaultKeyplaneImage)
  {
    CGImageRelease(defaultKeyplaneImage);
    self->_defaultKeyplaneImage = 0;
  }
  splitKeyplaneImage = self->_splitKeyplaneImage;
  if (splitKeyplaneImage)
  {
    CGImageRelease(splitKeyplaneImage);
    self->_splitKeyplaneImage = 0;
  }
  self->_defaultKeyplaneImage = -[UIKeyboardSliceTransitionView getKeyboardImageAsSplit:](self, "getKeyboardImageAsSplit:", 0);
  v5 = -[UIKeyboardSliceTransitionView getKeyboardImageAsSplit:](self, "getKeyboardImageAsSplit:", 1);
  self->_splitKeyplaneImage = v5;
  if (self->_defaultKeyplaneImage)
  {
    CGImageRetain(self->_defaultKeyplaneImage);
    v5 = self->_splitKeyplaneImage;
  }
  if (v5)
    CGImageRetain(v5);
}

- (void)rebuildSliceTransitions
{
  UIKeyboardSliceTransitionView *v2;
  CALayer **p_leftKeys;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  CGImage *v21;
  double width;
  double y;
  double x;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  CGImage *v45;
  void *v46;
  void *v47;
  CGImage *v48;
  void *v49;
  id v50;
  id v51;
  double height;
  double v53;
  double v54;
  BOOL IsEmpty;
  double v56;
  double v57;
  double v58;
  double v59;
  CGImage *v60;
  CGImage *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  int v65;
  NSMutableDictionary *controlKeys;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  UIKeyboardSliceTransitionView *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  CGImage *v80;
  void *v81;
  CGImage *v82;
  void *v83;
  double v84;
  id *v85;
  id v86;
  CGImage *v87;
  void *v88;
  CGImage *v89;
  void *v90;
  void *v91;
  char v92;
  double v93;
  double v94;
  id obj;
  CGImage *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  double v100;
  CALayer **p_rightKeys;
  CALayer **v102;
  uint64_t v103;
  double v104;
  CGImage *v105;
  int v106;
  CGImage *v107;
  double v108;
  CGImage *v109;
  double r2;
  double v111;
  double v112;
  double v113;
  double v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  uint64_t v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;

  v2 = self;
  v120 = *MEMORY[0x1E0C80C00];
  p_leftKeys = &self->_leftKeys;
  -[CALayer sublayers](self->_leftKeys, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

  -[CALayer sublayers](v2->_rightKeys, "sublayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

  v102 = p_leftKeys;
  -[CALayer removeAllAnimations](*p_leftKeys, "removeAllAnimations");
  p_rightKeys = &v2->_rightKeys;
  -[CALayer removeAllAnimations](v2->_rightKeys, "removeAllAnimations");
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v113 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[UIKeyboardSliceSet startRect](v2->super._sliceSet, "startRect");
  v10 = v9;
  -[UIKeyboardSliceSet leftWidth](v2->super._sliceSet, "leftWidth");
  v12 = v11;
  -[UIKeyboardSliceSet rightWidth](v2->super._sliceSet, "rightWidth");
  v14 = v13;
  -[UIKeyboardSliceSet leftWidth](v2->super._sliceSet, "leftWidth");
  v16 = v15;
  -[UIKeyboardSliceSet rightWidth](v2->super._sliceSet, "rightWidth");
  v18 = v17;
  -[UIKeyboardSliceSet endRect](v2->super._sliceSet, "endRect");
  v94 = v19;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  -[UIKeyboardSliceSet slices](v2->super._sliceSet, "slices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
  v104 = v7;
  v20 = 0;
  v21 = 0;
  if (v103)
  {
    v105 = 0;
    v97 = 0;
    v98 = 0;
    v100 = v10 - v12 - v14 + -3.0;
    v93 = v16 + v18 + 3.0;
    v99 = *(_QWORD *)v116;
    width = v8;
    y = v6;
    x = v113;
    do
    {
      for (i = 0; i != v103; ++i)
      {
        v106 = v20;
        if (*(_QWORD *)v116 != v99)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
        objc_msgSend(v26, "startRect");
        v28 = v27;
        v30 = v29;
        v32 = v31;
        r2 = v33;
        objc_msgSend(v26, "endRect");
        v35 = v34;
        v112 = v37;
        v114 = v36;
        v111 = v38;
        -[UIKeyboardSliceSet endRect](v2->super._sliceSet, "endRect");
        v40 = v100;
        if (v35 <= v39 * 0.5)
          v40 = 0.0;
        v108 = v40;
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "startToken");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          objc_msgSend(v26, "startToken");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[UIKeyboardSplitTransitionView keyImageWithToken:](v2, "keyImageWithToken:", v44);

        }
        else
        {
          v45 = v2->_defaultKeyplaneImage;
        }

        objc_msgSend(v26, "endToken");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          objc_msgSend(v26, "endToken");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[UIKeyboardSplitTransitionView keyImageWithToken:](v2, "keyImageWithToken:", v47);

        }
        else
        {
          v48 = v2->_splitKeyplaneImage;
        }

        -[UIKeyboardSliceTransitionView updateTransitionForSlice:withStart:startContents:end:endContents:updateContents:](v2, "updateTransitionForSlice:withStart:startContents:end:endContents:updateContents:", v26, v41, v45, v42, v48, 1);
        objc_msgSend(v26, "startToken");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          if (objc_msgSend(v26, "normalization") == 1)
          {
            objc_msgSend(v41, "setContentsRect:", 0.0, 0.0, 0.5, 1.0);
            v50 = v41;

            v98 = v50;
          }
          if (objc_msgSend(v26, "normalization") == 2)
          {
            objc_msgSend(v41, "setContentsRect:", 0.5, 0.0, 0.5, 1.0);
            v51 = v41;

            v97 = v51;
          }
          height = r2;
        }
        else
        {
          -[UIKeyboardSliceSet startRect](v2->super._sliceSet, "startRect");
          height = r2;
          objc_msgSend(v41, "setContentsRect:", v28 / v53, v30 / v54, v32 / v53, r2 / v54);
        }
        objc_msgSend(v41, "setAnchorPoint:", 0.0, 0.0);
        objc_msgSend(v41, "setFrame:", v28, v30, v32, height);
        if (objc_msgSend(v26, "normalization"))
        {
          objc_msgSend(v41, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
          objc_msgSend(v41, "setContentsCenter:", 0.1, 0.0, 0.8, 1.0);
          v121.origin.x = x;
          v121.origin.y = y;
          v121.size.width = width;
          v121.size.height = v104;
          IsEmpty = CGRectIsEmpty(v121);
          v56 = v104;
          v57 = width;
          width = v32;
          v58 = y;
          y = v30;
          v59 = x;
          x = v28;
          if (!IsEmpty)
          {
            v124.origin.x = v28;
            v124.origin.y = v30;
            v124.size.width = v32;
            v124.size.height = r2;
            v122 = CGRectUnion(*(CGRect *)&v59, v124);
            x = v122.origin.x;
            y = v122.origin.y;
            width = v122.size.width;
            height = v122.size.height;
          }
          v60 = v45;

          v61 = v48;
          v21 = v61;
          v105 = v60;
          v104 = height;
        }
        objc_msgSend(v26, "endToken");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v62)
          objc_msgSend(v42, "setContentsRect:", (v35 - v108) / v93, v114 / v94, v112 / v93, v111 / v94);
        v109 = v48;
        objc_msgSend(v42, "setAnchorPoint:", 0.0, 0.0);
        objc_msgSend(v42, "setFrame:", v35, v114, v112, v111);
        objc_msgSend(v26, "endToken");
        v63 = objc_claimAutoreleasedReturnValue();
        v107 = v45;
        if (v63)
        {
          v64 = (void *)v63;
          v65 = objc_msgSend(v26, "normalization");

          if (v65 != 2)
          {
            controlKeys = v2->_controlKeys;
            v67 = (void *)MEMORY[0x1E0C99E08];
            objc_msgSend(v26, "startToken");
            v96 = v21;
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "endToken");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "dictionaryWithObjectsAndKeys:", v41, v68, v42, v69, 0);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "endToken");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "name");
            v72 = v2;
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](controlKeys, "setObject:forKey:", v70, v73);

            v2 = v72;
            v21 = v96;
          }
        }
        objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("bounds"), 0, 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v28, v30, v32, r2);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setFromValue:", v75);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v35, v114, v112, v111);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setToValue:", v76);

        objc_msgSend(v41, "addAnimation:forKey:", v74, CFSTR("start bounds interpolation"));
        objc_msgSend(v42, "addAnimation:forKey:", v74, CFSTR("end bounds interpolation"));
        objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("position"), 0, 0);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v28, v30);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setFromValue:", v78);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v35, v114);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setToValue:", v79);

        objc_msgSend(v41, "addAnimation:forKey:", v77, CFSTR("start position interpolation"));
        objc_msgSend(v42, "addAnimation:forKey:", v77, CFSTR("end position interpolation"));
        if (v2->_defaultKeyplaneImage)
        {
          v20 = 1;
          v80 = v109;
          if (v2->_splitKeyplaneImage && v109)
          {
            objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), &unk_1E1A992B8, &unk_1E1A992D0);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD27D0], "_kbTimingFunction");
            v82 = v21;
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "setTimingFunction:", v83);

            v21 = v82;
            v80 = v109;
            objc_msgSend(v41, "addAnimation:forKey:", v81, CFSTR("start opacity interpolation"));

            v20 = v106;
          }
        }
        else
        {
          v20 = 1;
          v80 = v109;
        }
        -[UIView bounds](v2, "bounds");
        v85 = (id *)v102;
        if (v35 >= v84 * 0.5)
          v85 = (id *)p_rightKeys;
        v86 = *v85;
        objc_msgSend(v86, "addSublayer:", v42);
        objc_msgSend(v86, "addSublayer:", v41);

      }
      v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
    }
    while (v103);
  }
  else
  {
    v105 = 0;
    v97 = 0;
    v98 = 0;
    width = v8;
    y = v6;
    x = v113;
  }

  v87 = v105;
  -[CALayer setContents:](v2->_spaceFill, "setContents:", v105);
  -[CALayer removeAllAnimations](v2->_spaceFill, "removeAllAnimations");
  v123.origin.x = x;
  v123.origin.y = y;
  v123.size.width = width;
  v123.size.height = v104;
  if (!CGRectIsEmpty(v123))
  {
    -[CALayer setFrame:](v2->_spaceFill, "setFrame:", x, y, width, v104);
    objc_msgSend(MEMORY[0x1E0CD2798], "normalizedKeyframeAnimationWithKeyPath:", CFSTR("opacity"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setKeyTimes:", &unk_1E1A94388);
    objc_msgSend(v88, "setValues:", &unk_1E1A943A0);
    -[CALayer addAnimation:forKey:](v2->_spaceFill, "addAnimation:forKey:", v88, CFSTR("space fill opacity interpolation"));
    if (v98 && v97 && v21)
    {
      objc_msgSend(v98, "removeAnimationForKey:", CFSTR("start opacity interpolation"));
      objc_msgSend(MEMORY[0x1E0CD2798], "normalizedKeyframeAnimationWithKeyPath:", CFSTR("opacity"));
      v89 = v21;
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setKeyTimes:", &unk_1E1A943B8);
      objc_msgSend(v90, "setValues:", &unk_1E1A943D0);
      objc_msgSend(v98, "addAnimation:forKey:", v90, CFSTR("start opacity interpolation"));
      objc_msgSend(v97, "removeAnimationForKey:", CFSTR("start opacity interpolation"));
      objc_msgSend(MEMORY[0x1E0CD2798], "normalizedKeyframeAnimationWithKeyPath:", CFSTR("opacity"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v89;
      v87 = v105;
      objc_msgSend(v91, "setKeyTimes:", &unk_1E1A943E8);
      objc_msgSend(v91, "setValues:", &unk_1E1A94400);
      objc_msgSend(v97, "addAnimation:forKey:", v91, CFSTR("start opacity interpolation"));

    }
  }
  if ((v20 & 1) != 0)
    v92 = 2;
  else
    v92 = 0;
  *(_BYTE *)&v2->_rebuildFlags = *(_BYTE *)&v2->_rebuildFlags & 0xFD | v92;

}

- (void)rebuildShiftSlices
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id obj;
  void *v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v25;
    v5 = 2;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v4)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
      if (objc_msgSend(v7, "hasSuffix:", CFSTR("Shift-Key")))
      {
        v23 = v5;
        -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKey:](self->_controlKeys, "objectForKey:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "startToken");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "endToken");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "startToken");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardSplitTransitionView keyImageWithToken:](self, "keyImageWithToken:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "endToken");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardSplitTransitionView keyImageWithToken:](self, "keyImageWithToken:", v16);
        v17 = v3;
        v18 = v4;
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIKeyboardSliceTransitionView updateTransitionForSlice:withStart:startContents:end:endContents:updateContents:](self, "updateTransitionForSlice:withStart:startContents:end:endContents:updateContents:", v9, v22, v15, v13, v19, 1);
        v4 = v18;
        v3 = v17;

        v5 = 1;
        if (v23 == 1)
          break;
      }
      if (v3 == ++v6)
      {
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }

  *(_BYTE *)&self->_rebuildFlags &= ~0x20u;
}

- (void)rebuildReturnSlices
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasSuffix:", CFSTR("Return-Key")))
        {
          -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKey:](self->_controlKeys, "objectForKey:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "startToken");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "endToken");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "startToken");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardSplitTransitionView keyImageWithToken:](self, "keyImageWithToken:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "endToken");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardSplitTransitionView keyImageWithToken:](self, "keyImageWithToken:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIKeyboardSliceTransitionView updateTransitionForSlice:withStart:startContents:end:endContents:updateContents:](self, "updateTransitionForSlice:withStart:startContents:end:endContents:updateContents:", v10, v13, v17, v15, v19, 1);
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  *(_BYTE *)&self->_rebuildFlags &= ~0x40u;
}

- (void)rebuildMoreIntlKeys
{
  UIKeyboardSliceSet *sliceSet;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIKeyboardSliceTransitionView *v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned int v66;
  unsigned int v67;
  void *v68;
  uint64_t v69;
  void *v70;
  UIKeyboardSliceTransitionView *v71;
  uint64_t v72;
  id obj;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  sliceSet = self->super._sliceSet;
  if (sliceSet)
  {
    -[UIKeyboardSliceSet controlKeys](sliceSet, "controlKeys");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = -[NSMutableDictionary count](self->_controlKeys, "count");

      if (v6)
      {
        -[UIKeyboardSliceSet controlKeys](self->super._sliceSet, "controlKeys");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("MoreIntlNames"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v8, "count"))
        {
          v9 = -[UIKeyboardSplitTransitionView showIntlKey](self, "showIntlKey");
          v10 = -[UIKeyboardSplitTransitionView showDictationKey](self, "showDictationKey");
          v11 = -[UIKeyboardSplitTransitionView showIntlKey](self, "showIntlKey");
          if (-[UIKeyboardSplitTransitionView showDictationKey](self, "showDictationKey"))
            v12 = 2;
          else
            v12 = 0;
          v71 = self;
          v13 = v12 | v11;
          -[UIKeyboardSliceSet controlKeys](v71->super._sliceSet, "controlKeys");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", CFSTR("MoreIntlStarts"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKBTree shapesForControlKeyShapes:options:](UIKBTree, "shapesForControlKeyShapes:options:", v15, v13 | 4u);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIKeyboardSliceSet controlKeys](v71->super._sliceSet, "controlKeys");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("MoreIntlEnds"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v13 | 0xCu;
          v19 = v71;
          +[UIKBTree shapesForControlKeyShapes:options:](UIKBTree, "shapesForControlKeyShapes:options:", v17, v18);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v65 = v8;
          obj = v8;
          v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
          if (v72)
          {
            v66 = !v10;
            v67 = !v9;
            v69 = *(_QWORD *)v76;
            do
            {
              for (i = 0; i != v72; ++i)
              {
                if (*(_QWORD *)v76 != v69)
                  objc_enumerationMutation(obj);
                v21 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
                objc_msgSend(obj, "objectForKey:", v21, v65);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "hasSuffix:", CFSTR("Space-Key"));
                -[UIKeyboardSliceSet controlKeys](v19->super._sliceSet, "controlKeys");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "objectForKey:", v22);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                -[NSMutableDictionary objectForKey:](v19->_controlKeys, "objectForKey:", v22);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "startToken");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKey:", v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v25, "endToken");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = v26;
                objc_msgSend(v26, "objectForKey:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (v23)
                {
                  objc_msgSend(v25, "startRect");
                  v32 = v31;
                  v34 = v33;
                  v36 = v35;
                  v38 = v37;
                }
                else
                {
                  objc_msgSend(v68, "objectForKey:", v21);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "paddedFrame");
                  v32 = v40;
                  v34 = v41;
                  v36 = v42;
                  v38 = v43;

                }
                objc_msgSend(v70, "objectForKey:", v21);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "paddedFrame");
                v46 = v45;
                v48 = v47;
                v50 = v49;
                v52 = v51;

                if ((v23 & 1) == 0)
                {
                  objc_msgSend(v25, "startToken");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "setSize:", v36, v38);

                }
                objc_msgSend(v25, "endToken");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "setSize:", v50, v52);

                objc_msgSend(v28, "setFrame:", v32, v34, v36, v38);
                objc_msgSend(v30, "setFrame:", v46, v48, v50, v52);
                objc_msgSend(v25, "setStartRect:", v32, v34, v36, v38);
                objc_msgSend(v25, "setEndRect:", v46, v48, v50, v52);
                objc_msgSend(v25, "startToken");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIKeyboardSplitTransitionView keyImageWithToken:](v19, "keyImageWithToken:", v55);
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v25, "endToken");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIKeyboardSplitTransitionView keyImageWithToken:](v19, "keyImageWithToken:", v57);
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                if (v58)
                  objc_msgSend(v30, "setContents:", v58);
                if ((v23 & 1) == 0)
                {
                  if (v56)
                    objc_msgSend(v28, "setContents:", v56);
                  -[UIKeyboardSliceTransitionView updateTransitionForSlice:withStart:startContents:end:endContents:updateContents:](v19, "updateTransitionForSlice:withStart:startContents:end:endContents:updateContents:", v25, v28, v56, v30, v58, 0);
                }
                objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("bounds"), 0, 0);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v32, v34, v36, v38);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "setFromValue:", v60);

                objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v46, v48, v50, v52);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "setToValue:", v61);

                objc_msgSend(v28, "addAnimation:forKey:", v59, CFSTR("start bounds interpolation"));
                objc_msgSend(v30, "addAnimation:forKey:", v59, CFSTR("end bounds interpolation"));
                objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("position"), 0, 0);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v32, v34);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setFromValue:", v63);

                objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v46, v48);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setToValue:", v64);

                objc_msgSend(v28, "addAnimation:forKey:", v62, CFSTR("start position interpolation"));
                objc_msgSend(v30, "addAnimation:forKey:", v62, CFSTR("end position interpolation"));
                if (objc_msgSend(v22, "hasSuffix:", CFSTR("International-Key")))
                {
                  objc_msgSend(v28, "setHidden:", v67);
                  objc_msgSend(v30, "setHidden:", v67);
                }
                if (objc_msgSend(v22, "hasSuffix:", CFSTR("Dictation-Key")))
                {
                  objc_msgSend(v28, "setHidden:", v66);
                  objc_msgSend(v30, "setHidden:", v66);
                }

                v19 = v71;
              }
              v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
            }
            while (v72);
          }

          *(_BYTE *)&v19->_rebuildFlags &= ~0x80u;
          v8 = v65;
        }

      }
    }
  }
}

- (id)meshTransformForProgress:(double)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  int32x4_t v20;

  v4 = -[UIKeyboardSplitTransitionView shouldAllowRubberiness](self, "shouldAllowRubberiness");
  if (v4)
  {
    MEMORY[0x1E0C80A78](v4);
    MEMORY[0x1E0C80A78](v5);
    v20 = vdupq_n_s32(0x7F7FFFFFu);
    v8 = (a3 + -1.0) * 0.025;
    v9 = 0.0;
    if (a3 <= 1.0)
      v8 = 0.0;
    if (a3 < 0.0)
      v9 = a3 * -0.025;
    *(_OWORD *)v6 = xmmword_186681810;
    *(double *)(v6 + 16) = v9 + -0.05;
    *(_OWORD *)(v6 + 24) = xmmword_186681820;
    *(_OWORD *)(v6 + 40) = xmmword_186681830;
    *(double *)(v6 + 56) = 0.5 - v8;
    *(_OWORD *)(v6 + 64) = xmmword_186681820;
    *(_OWORD *)(v6 + 80) = xmmword_186681840;
    *(double *)(v6 + 96) = 0.5 - v8;
    *(_OWORD *)(v6 + 104) = xmmword_186681850;
    *(_OWORD *)(v6 + 120) = xmmword_186681860;
    *(double *)(v6 + 136) = v9 + -0.05;
    v10 = v8 + 0.5;
    *(_OWORD *)(v6 + 144) = xmmword_186681850;
    *(_OWORD *)(v6 + 160) = xmmword_186681830;
    *(double *)(v6 + 176) = v10;
    *(_OWORD *)(v6 + 184) = xmmword_186681820;
    v11 = 1.05 - v9;
    *(_OWORD *)(v6 + 200) = xmmword_186681870;
    *(double *)(v6 + 216) = v11;
    *(_OWORD *)(v7 - 256) = xmmword_186681820;
    *(_OWORD *)(v7 - 240) = xmmword_186681880;
    *(double *)(v7 - 224) = v11;
    *(_QWORD *)(v7 - 216) = 0x3FF4000000000000;
    *(_OWORD *)(v7 - 208) = xmmword_18667A4E0;
    *(_QWORD *)(v7 - 192) = 0x3FF4000000000000;
    *(double *)(v7 - 184) = v10;
    *(_QWORD *)(v7 - 128) = *(_QWORD *)(v6 + 72);
    v12 = *(_OWORD *)(v6 + 56);
    v13 = *(_OWORD *)(v6 + 40);
    *(_OWORD *)(v7 - 176) = xmmword_186681850;
    *(_OWORD *)(v7 - 160) = v13;
    *(_OWORD *)(v7 - 144) = v12;
    v14 = *(_OWORD *)(v6 + 160);
    v15 = *(_OWORD *)(v6 + 176);
    *(_QWORD *)(v7 - 88) = *(_QWORD *)(v6 + 192);
    *(_OWORD *)(v7 - 104) = v15;
    *(_OWORD *)(v7 - 120) = v14;
    v16 = *(_OWORD *)(v7 - 184);
    *(_OWORD *)(v7 - 80) = *(_OWORD *)(v7 - 200);
    *(_OWORD *)(v7 - 64) = v16;
    *(_QWORD *)(v7 - 48) = *(_QWORD *)(v7 - 168);
    *(_QWORD *)(v7 - 8) = *(_QWORD *)(v6 + 112);
    v17 = *(_OWORD *)(v6 + 80);
    *(_OWORD *)(v7 - 24) = *(_OWORD *)(v6 + 96);
    *(_OWORD *)(v7 - 40) = v17;
    objc_msgSend(MEMORY[0x1E0CD27F0], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 12, 0x100000000, 0x300000002, *(_OWORD *)&v20, 0x500000004, 0x700000006, *(_OWORD *)&v20, 0x900000008, 0xB0000000ALL, *(_OWORD *)&v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (void)transformForProgress:(double)a3
{
  void *v4;
  id v5;

  -[UIKeyboardSliceTransitionView meshTransformForProgress:](self, "meshTransformForProgress:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMeshTransform:", v5);

}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardSliceTransitionView;
  -[UIView setHidden:](&v6, sel_setHidden_);
  if (v3)
  {
    -[UIView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[UIKeyboardSliceTransitionView updateTransition](self, "updateTransition");
  }
}

- (void)_delayedUpdateTransition
{
  void *v3;
  UIKeyboardSliceSet *sliceSet;
  void *v5;
  char rebuildFlags;

  if (-[UIView isHidden](self, "isHidden"))
  {
    -[UIView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      sliceSet = self->super._sliceSet;

      if (sliceSet)
      {
        if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
        {
LABEL_12:
          self->super._isRebuilding = 0;
          return;
        }
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
        -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
        -[UIKeyboardSliceTransitionView setFrame:](self, "setFrame:");
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        self->super._centerFilled = objc_msgSend(v5, "centerFilled");

        rebuildFlags = (char)self->_rebuildFlags;
        if ((rebuildFlags & 2) != 0)
        {
          -[UIKeyboardSliceTransitionView refreshKeyplaneImages](self, "refreshKeyplaneImages");
          -[UIKeyboardSliceTransitionView rebuildSliceTransitions](self, "rebuildSliceTransitions");
          rebuildFlags = (char)self->_rebuildFlags;
          if ((rebuildFlags & 0x20) == 0)
          {
LABEL_7:
            if ((rebuildFlags & 0x40) == 0)
              goto LABEL_8;
            goto LABEL_16;
          }
        }
        else if ((*(_BYTE *)&self->_rebuildFlags & 0x20) == 0)
        {
          goto LABEL_7;
        }
        -[UIKeyboardSliceTransitionView rebuildShiftSlices](self, "rebuildShiftSlices");
        rebuildFlags = (char)self->_rebuildFlags;
        if ((rebuildFlags & 0x40) == 0)
        {
LABEL_8:
          if ((rebuildFlags & 0x80) == 0)
            goto LABEL_9;
          goto LABEL_17;
        }
LABEL_16:
        -[UIKeyboardSliceTransitionView rebuildReturnSlices](self, "rebuildReturnSlices");
        rebuildFlags = (char)self->_rebuildFlags;
        if ((rebuildFlags & 0x80) == 0)
        {
LABEL_9:
          if ((rebuildFlags & 0x10) == 0)
          {
LABEL_11:
            objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
            goto LABEL_12;
          }
LABEL_10:
          -[UIKeyboardSliceTransitionView rebuildTopEdgeHighlightTransition](self, "rebuildTopEdgeHighlightTransition");
          goto LABEL_11;
        }
LABEL_17:
        -[UIKeyboardSliceTransitionView rebuildMoreIntlKeys](self, "rebuildMoreIntlKeys");
        if ((*(_BYTE *)&self->_rebuildFlags & 0x10) == 0)
          goto LABEL_11;
        goto LABEL_10;
      }
    }
  }
}

- (void)updateTransition
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[UIKeyboardSliceTransitionView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedUpdateTransition, 0, 0.25);
}

- (void)rebuildFromKeyplane:(id)a3 toKeyplane:(id)a4 startToken:(id)a5 endToken:(id)a6 keyboardType:(int64_t)a7 orientation:(int64_t)a8
{
  void *v13;
  void *v14;
  void *v15;
  CGImage *splitKeyplaneImage;
  UIKeyboardSliceSet *sliceSet;
  UIKeyboardSliceSet *v18;
  UIKeyboardSliceSet *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  id v28;

  v28 = a5;
  if (a7 == 1)
    a7 = 0;
  objc_msgSend(a3, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSliceStore sliceSetIDForKeyplaneName:type:orientation:](UIKeyboardSliceStore, "sliceSetIDForKeyplaneName:type:orientation:", v13, a7, a8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->super._isRebuilding)
    goto LABEL_4;
  -[UIKeyboardSliceSet sliceSetID](self->super._sliceSet, "sliceSetID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", v15) && self->_defaultKeyplaneImage)
  {
    splitKeyplaneImage = self->_splitKeyplaneImage;

    if (splitKeyplaneImage)
    {
LABEL_4:
      *(_BYTE *)&self->_rebuildFlags |= 0xEAu;
LABEL_14:
      -[UIKeyboardSliceTransitionView _delayedUpdateTransition](self, "_delayedUpdateTransition");
      goto LABEL_15;
    }
  }
  else
  {

  }
  self->super._isRebuilding = 1;
  objc_storeStrong((id *)&self->_keyplaneToken, a5);
  self->_orientation = a8;
  sliceSet = self->super._sliceSet;
  if (sliceSet)
  {
    self->super._sliceSet = 0;

  }
  +[UIKeyboardSliceStore sliceSetForID:](UIKeyboardSliceStore, "sliceSetForID:", v14);
  v18 = (UIKeyboardSliceSet *)objc_claimAutoreleasedReturnValue();
  v19 = self->super._sliceSet;
  self->super._sliceSet = v18;

  if (v18)
  {
    -[UIKeyboardSliceSet startRect](self->super._sliceSet, "startRect");
    self->super._startFrame.origin.x = v20;
    self->super._startFrame.origin.y = v21;
    self->super._startFrame.size.width = v22;
    self->super._startFrame.size.height = v23;
    -[UIKeyboardSliceSet endRect](self->super._sliceSet, "endRect");
    self->super._endFrame.origin.x = v24;
    self->super._endFrame.origin.y = v25;
    self->super._endFrame.size.width = v26;
    self->super._endFrame.size.height = v27;
    -[UIKeyboardSliceTransitionView setRebuildFlags](self, "setRebuildFlags");
    goto LABEL_14;
  }
LABEL_15:

}

- (void)rebuildControlKeys:(unint64_t)a3
{
  *(_BYTE *)&self->_rebuildFlags |= (a3 & 1) << 6;
  -[UIKeyboardSliceTransitionView updateTransition](self, "updateTransition");
}

- (void)updateWithProgress:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMeshTransform:", 0);

  -[UIView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 0;
  objc_msgSend(v6, "setSpeed:", v7);

  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardSliceTransitionView;
  -[UIKeyboardSplitTransitionView updateWithProgress:](&v8, sel_updateWithProgress_, a3);
}

- (BOOL)canDisplayTransition
{
  objc_super v4;

  if (!self->super._sliceSet)
    return 0;
  if (!self->_defaultKeyplaneImage && !self->_splitKeyplaneImage)
    -[UIKeyboardSliceTransitionView refreshKeyplaneImages](self, "refreshKeyplaneImages");
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardSliceTransitionView;
  return -[UIKeyboardSplitTransitionView canDisplayTransition](&v4, sel_canDisplayTransition);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyplaneToken, 0);
  objc_storeStrong((id *)&self->_topEdgeHighlight, 0);
  objc_storeStrong((id *)&self->_controlKeys, 0);
  objc_storeStrong((id *)&self->_spaceFill, 0);
  objc_storeStrong((id *)&self->_rightKeys, 0);
  objc_storeStrong((id *)&self->_leftKeys, 0);
}

@end
