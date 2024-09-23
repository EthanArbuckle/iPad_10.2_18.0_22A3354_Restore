@implementation PKFingerprintGlyphView

- (PKFingerprintGlyphView)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This class is not NSCoding compliant"));
  return -[PKFingerprintGlyphView init](self, "init");
}

- (PKFingerprintGlyphView)init
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PKFingerprintGlyphView *v14;
  PKFingerprintGlyphView *v15;
  unint64_t v16;
  NSMutableArray *v17;
  NSMutableArray *transitionCompletionHandlers;
  id *p_backgroundLayer;
  CALayer *backgroundLayer;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  NSArray *backgroundShapeLayers;
  CALayer *v33;
  CALayer *foregroundLayer;
  CALayer *v35;
  void *v36;
  CALayer *v37;
  CALayer *v38;
  CALayer *v39;
  CALayer *v40;
  NSArray *v41;
  CALayer *v42;
  NSArray *v43;
  NSArray *v44;
  void *v45;
  unint64_t v46;
  NSArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  uint64_t v53;
  NSArray *foregroundShapeLayers;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  CGFloat v83;
  CGFloat v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id *p_foregroundRingShapeLayers;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  CALayer *v97;
  CALayer *foregroundRingContainerLayer;
  CALayer *v99;
  void *v100;
  CALayer *v101;
  CALayer *maskForegroundLayer;
  CALayer *v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t k;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  CALayer *v120;
  CALayer *maskLayer;
  CALayer *v122;
  void *v123;
  uint64_t v124;
  NSArray *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t m;
  void *v130;
  void *v131;
  uint64_t v132;
  NSArray *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t n;
  void *v138;
  void *v139;
  CALayer *v140;
  CALayer *contentLayer;
  CALayer *v142;
  void *v143;
  void *v144;
  void *v146;
  id v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  void *v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  objc_super v175[8];
  objc_super v176;
  CATransform3D v177;
  id v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  CATransform3D v187;
  uint64_t v188;
  CGRect PathBoundingBox;
  CGRect v190;
  CGRect v191;

  v188 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDE5718];
  PKPassKitUIFoundationBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("Payment_glyph"), CFSTR("caar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDE5D48];
  v178 = 0;
  objc_msgSend(v3, "packageWithContentsOfURL:type:options:error:", v5, v6, 0, &v178);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v178;

  memset(&v177, 0, sizeof(v177));
  CATransform3DMakeScale(&v177, 0.5, 0.5, 1.0);
  objc_msgSend(v7, "rootLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGeometryFlipped:", objc_msgSend(v7, "isGeometryFlipped"));
  v187 = v177;
  objc_msgSend(v9, "setTransform:", &v187);
  objc_msgSend(v9, "bounds");
  v10 = *MEMORY[0x24BDBEFB0];
  v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v176.receiver = self;
  v176.super_class = (Class)PKFingerprintGlyphView;
  v150 = v11;
  v151 = v10;
  v148 = v13 * 0.5;
  v149 = v12 * 0.5;
  v14 = -[PKFingerprintGlyphView initWithFrame:](&v176, sel_initWithFrame_);
  v15 = v14;
  if (v14)
  {
    v147 = v8;
    v158 = v7;
    v14->_state = 0;
    v16 = 0x24BDBC000uLL;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    transitionCompletionHandlers = v15->_transitionCompletionHandlers;
    v15->_transitionCompletionHandlers = v17;

    p_backgroundLayer = (id *)&v15->_backgroundLayer;
    v146 = v9;
    objc_storeStrong((id *)&v15->_backgroundLayer, v9);
    backgroundLayer = v15->_backgroundLayer;
    PKLayerNullActions();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](backgroundLayer, "setActions:", v21);

    -[CALayer setAnchorPoint:](v15->_backgroundLayer, "setAnchorPoint:", 0.5, 0.5);
    if (v15->_backgroundLayer)
    {
      -[CALayer sublayers](v15->_backgroundLayer, "sublayers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v22, "count"));
      PKLayerNullActions();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = 0u;
      v180 = 0u;
      v181 = 0u;
      v182 = 0u;
      v25 = v22;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v179, &v187, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v180;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v180 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v30, "setActions:", v24);
              objc_msgSend(v23, "addObject:", v30);
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v179, &v187, 16);
        }
        while (v27);
      }

      v16 = 0x24BDBC000;
    }
    else
    {
      v23 = 0;
    }
    v31 = objc_msgSend(v23, "copy");

    backgroundShapeLayers = v15->_backgroundShapeLayers;
    v15->_backgroundShapeLayers = (NSArray *)v31;

    v33 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    foregroundLayer = v15->_foregroundLayer;
    v15->_foregroundLayer = v33;

    v35 = v15->_foregroundLayer;
    PKLayerNullActions();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v35, "setActions:", v36);

    v37 = v15->_foregroundLayer;
    objc_msgSend(*p_backgroundLayer, "anchorPoint");
    -[CALayer setAnchorPoint:](v37, "setAnchorPoint:");
    v38 = v15->_foregroundLayer;
    objc_msgSend(*p_backgroundLayer, "bounds");
    -[CALayer setBounds:](v38, "setBounds:");
    v39 = v15->_foregroundLayer;
    objc_msgSend(*p_backgroundLayer, "position");
    -[CALayer setPosition:](v39, "setPosition:");
    v40 = v15->_foregroundLayer;
    if (*p_backgroundLayer)
      objc_msgSend(*p_backgroundLayer, "transform");
    else
      memset(v175, 0, sizeof(v175));
    -[CALayer setTransform:](v40, "setTransform:", v175);
    -[CALayer setGeometryFlipped:](v15->_foregroundLayer, "setGeometryFlipped:", objc_msgSend(*p_backgroundLayer, "isGeometryFlipped"));
    v41 = v15->_backgroundShapeLayers;
    v42 = v15->_foregroundLayer;
    v43 = v41;
    v44 = v43;
    v45 = 0;
    if (v42 && v43)
    {
      v46 = v16;
      v45 = (void *)objc_msgSend(objc_alloc(*(Class *)(v16 + 3768)), "initWithCapacity:", -[NSArray count](v43, "count"));
      v179 = 0u;
      v180 = 0u;
      v181 = 0u;
      v182 = 0u;
      v47 = v44;
      v48 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v179, &v187, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v180;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v180 != v50)
              objc_enumerationMutation(v47);
            CloneShapeLayer(*(void **)(*((_QWORD *)&v179 + 1) + 8 * j));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v52);
            -[CALayer addSublayer:](v42, "addSublayer:", v52);

          }
          v49 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v179, &v187, 16);
        }
        while (v49);
      }

      v16 = v46;
    }
    v53 = objc_msgSend(v45, "copy");

    foregroundShapeLayers = v15->_foregroundShapeLayers;
    v15->_foregroundShapeLayers = (NSArray *)v53;

    v55 = objc_alloc_init(*(Class *)(v16 + 3768));
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    v56 = v158;
    objc_msgSend(v158, "publishedObjectNames");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v171, v186, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v172;
      do
      {
        v61 = 0;
        do
        {
          if (*(_QWORD *)v172 != v60)
            objc_enumerationMutation(v57);
          v62 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v61);
          if (!objc_msgSend(v62, "hasPrefix:", CFSTR("ring_")))
            goto LABEL_40;
          objc_msgSend(v56, "publishedObjectWithName:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v63
            || (v64 = -[NSArray indexOfObjectIdenticalTo:](v15->_backgroundShapeLayers, "indexOfObjectIdenticalTo:", v63), v64 == 0x7FFFFFFFFFFFFFFFLL))
          {

            goto LABEL_41;
          }
          -[NSArray objectAtIndexedSubscript:](v15->_foregroundShapeLayers, "objectAtIndexedSubscript:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (v65)
          {
            v66 = v65;
            PathBoundingBox = CGPathGetPathBoundingBox((CGPathRef)objc_msgSend(v65, "path"));
            x = PathBoundingBox.origin.x;
            y = PathBoundingBox.origin.y;
            width = PathBoundingBox.size.width;
            height = PathBoundingBox.size.height;
            if (!CGRectIsNull(PathBoundingBox))
            {
              objc_msgSend(v66, "anchorPoint");
              v154 = v72;
              v156 = v71;
              objc_msgSend(v66, "position");
              v74 = v73;
              v76 = v75;
              objc_msgSend(v66, "bounds");
              v152 = v77;
              v153 = v78;
              v80 = v79;
              v82 = v81;
              v155 = v76 - v154 * v81;
              v157 = v74 - v156 * v79;
              v190.origin.x = x;
              v190.origin.y = y;
              v190.size.width = width;
              v190.size.height = height;
              v83 = (CGRectGetMidX(v190) - v152) / v80;
              v191.origin.x = x;
              v191.origin.y = y;
              v191.size.width = width;
              v191.size.height = height;
              v84 = (CGRectGetMidY(v191) - v153) / v82;
              objc_msgSend(v66, "setAnchorPoint:", v83, v84);
              objc_msgSend(v66, "setPosition:", v157 + v83 * v80, v155 + v84 * v82);
            }
            objc_msgSend(v55, "addObject:", v66);

            v56 = v158;
LABEL_40:
            objc_msgSend(v55, "sortUsingComparator:", &__block_literal_global_3);
            goto LABEL_41;
          }

          v56 = v158;
LABEL_41:
          ++v61;
        }
        while (v59 != v61);
        v85 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v171, v186, 16);
        v59 = v85;
      }
      while (v85);
    }

    v86 = objc_msgSend(v55, "count");
    if (v86)
      v87 = (void *)objc_msgSend(v55, "copy");
    else
      v87 = 0;
    p_foregroundRingShapeLayers = (id *)&v15->_foregroundRingShapeLayers;
    objc_storeStrong((id *)&v15->_foregroundRingShapeLayers, v87);
    if (v86)

    if (*p_foregroundRingShapeLayers)
    {
      -[CALayer bounds](v15->_foregroundLayer, "bounds");
      v90 = v89;
      v92 = v91;
      v94 = v93;
      v96 = v95;
      v97 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      foregroundRingContainerLayer = v15->_foregroundRingContainerLayer;
      v15->_foregroundRingContainerLayer = v97;

      v99 = v15->_foregroundRingContainerLayer;
      PKLayerNullActions();
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer setActions:](v99, "setActions:", v100);

      -[CALayer setBounds:](v15->_foregroundRingContainerLayer, "setBounds:", v90, v92, v94, v96);
      v101 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      maskForegroundLayer = v15->_maskForegroundLayer;
      v15->_maskForegroundLayer = v101;

      v103 = v15->_maskForegroundLayer;
      PKLayerNullActions();
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer setActions:](v103, "setActions:", v104);

      MatchLayerGeometry(v15->_maskForegroundLayer, v15->_foregroundLayer);
      v169 = 0u;
      v170 = 0u;
      v167 = 0u;
      v168 = 0u;
      v105 = *p_foregroundRingShapeLayers;
      v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v167, v185, 16);
      if (v106)
      {
        v107 = v106;
        v108 = *(_QWORD *)v168;
        do
        {
          for (k = 0; k != v107; ++k)
          {
            if (*(_QWORD *)v168 != v108)
              objc_enumerationMutation(v105);
            v110 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * k);
            -[CALayer addSublayer:](v15->_foregroundRingContainerLayer, "addSublayer:", v110);
            objc_msgSend(v110, "position");
          }
          v113 = v111;
          v114 = v112;
          v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v167, v185, 16);
        }
        while (v107);
      }
      else
      {
        v114 = v150;
        v113 = v151;
      }

      objc_msgSend(*p_foregroundRingShapeLayers, "firstObject");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      if (v115)
      {
        v116 = v115;
        CloneShapeLayer(v115);
        v117 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v118 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v117, "setFillColor:", objc_msgSend(v118, "CGColor"));

        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v119 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v117, "setStrokeColor:", objc_msgSend(v119, "CGColor"));

        objc_msgSend(v117, "setFillRule:", *MEMORY[0x24BDE5990]);
        objc_msgSend(v117, "setStrokeStart:", 0.0);
        objc_msgSend(v117, "setStrokeEnd:", 1.0);
        objc_msgSend(v117, "setLineWidth:", 1.0);
        -[CALayer addSublayer:](v15->_maskForegroundLayer, "addSublayer:", v117);

      }
      -[CALayer setAnchorPoint:](v15->_foregroundRingContainerLayer, "setAnchorPoint:", (v113 - v90) / v94, (v114 - v92) / v96);
      -[CALayer setPosition:](v15->_foregroundRingContainerLayer, "setPosition:", v94 * ((v113 - v90) / v94), v96 * ((v114 - v92) / v96));
      v120 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      maskLayer = v15->_maskLayer;
      v15->_maskLayer = v120;

      v122 = v15->_maskLayer;
      PKLayerNullActions();
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer setActions:](v122, "setActions:", v123);

      -[CALayer addSublayer:](v15->_maskLayer, "addSublayer:", v15->_maskForegroundLayer);
      -[CALayer addSublayer:](v15->_foregroundLayer, "addSublayer:", v15->_foregroundRingContainerLayer);
    }
    v124 = -[UIColor CGColor](v15->_secondaryColor, "CGColor");
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v125 = v15->_backgroundShapeLayers;
    v126 = -[NSArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v163, v184, 16);
    if (v126)
    {
      v127 = v126;
      v128 = *(_QWORD *)v164;
      do
      {
        for (m = 0; m != v127; ++m)
        {
          if (*(_QWORD *)v164 != v128)
            objc_enumerationMutation(v125);
          v130 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * m);
          v131 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EEB8]), "initWithShapeLayer:reverse:", v130, 1);
          -[PKFingerprintGlyphView setPathState:forLayer:](v15, "setPathState:forLayer:", v131, v130);
          objc_msgSend(v130, "setStrokeColor:", v124);

        }
        v127 = -[NSArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v163, v184, 16);
      }
      while (v127);
    }

    v132 = -[UIColor CGColor](v15->_primaryColor, "CGColor");
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v133 = v15->_foregroundShapeLayers;
    v134 = -[NSArray countByEnumeratingWithState:objects:count:](v133, "countByEnumeratingWithState:objects:count:", &v159, v183, 16);
    if (v134)
    {
      v135 = v134;
      v136 = *(_QWORD *)v160;
      do
      {
        for (n = 0; n != v135; ++n)
        {
          if (*(_QWORD *)v160 != v136)
            objc_enumerationMutation(v133);
          v138 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * n);
          v139 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EEB8]), "initWithShapeLayer:", v138);
          -[PKFingerprintGlyphView setPathState:forLayer:](v15, "setPathState:forLayer:", v139, v138);
          objc_msgSend(v138, "setStrokeColor:", v132);

        }
        v135 = -[NSArray countByEnumeratingWithState:objects:count:](v133, "countByEnumeratingWithState:objects:count:", &v159, v183, 16);
      }
      while (v135);
    }

    v140 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    contentLayer = v15->_contentLayer;
    v15->_contentLayer = v140;

    v142 = v15->_contentLayer;
    PKLayerNullActions();
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v142, "setActions:", v143);

    -[CALayer setFrame:](v15->_contentLayer, "setFrame:", v151, v150, v149, v148);
    -[CALayer setMask:](v15->_contentLayer, "setMask:", v15->_maskLayer);
    -[PKFingerprintGlyphView layer](v15, "layer");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "addSublayer:", v15->_backgroundLayer);
    objc_msgSend(v144, "addSublayer:", v15->_contentLayer);
    objc_msgSend(v144, "addSublayer:", v15->_foregroundLayer);
    -[PKFingerprintGlyphView setProgress:withDuration:](v15, "setProgress:withDuration:", 0.0, 0.0);
    v15->_priorState = 0;
    v15->_state = 0;
    -[PKFingerprintGlyphView setContentLayerOpacity:withDuration:](v15, "setContentLayerOpacity:withDuration:", 0.0, 0.0);
    -[PKFingerprintGlyphView setNeedsLayout](v15, "setNeedsLayout");

    v7 = v158;
    v9 = v146;
    v8 = v147;
  }

  return v15;
}

uint64_t __30__PKFingerprintGlyphView_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "strokeStart");
  v6 = v5;
  objc_msgSend(v4, "strokeStart");
  v8 = v7;

  if (v6 < v8)
    return -1;
  else
    return v6 > v8;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_transitioning)
    -[PKFingerprintGlyphView _executeTransitionCompletionHandlers:](self, "_executeTransitionCompletionHandlers:", 1);
  v3.receiver = self;
  v3.super_class = (Class)PKFingerprintGlyphView;
  -[PKFingerprintGlyphView dealloc](&v3, sel_dealloc);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKFingerprintGlyphView;
  -[PKFingerprintGlyphView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKFingerprintGlyphView _applyPrimaryColorAnimated:](self, "_applyPrimaryColorAnimated:", 1);
  -[PKFingerprintGlyphView _applySecondaryColorAnimated:](self, "_applySecondaryColorAnimated:", 1);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKFingerprintGlyphView;
  -[PKFingerprintGlyphView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PKFingerprintGlyphView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PKFingerprintGlyphView _restartRotationIfNecessary](self, "_restartRotationIfNecessary");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  double v12;
  CALayer *backgroundLayer;
  CALayer *foregroundLayer;
  double MidX;
  double MidY;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CATransform3D v27;
  CATransform3D v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)PKFingerprintGlyphView;
  -[PKFingerprintGlyphView layoutSubviews](&v29, sel_layoutSubviews);
  -[PKFingerprintGlyphView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CALayer setFrame:](self->_contentLayer, "setFrame:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "fingerprintGlyphView:didLayoutContentLayer:", self, self->_contentLayer);

  -[PKFingerprintGlyphView pointScaleToMatchBoundsSize:](self, "pointScaleToMatchBoundsSize:", v8, v10);
  memset(&v28, 0, sizeof(v28));
  CATransform3DMakeScale(&v28, v12 * 0.5, v12 * 0.5, 1.0);
  backgroundLayer = self->_backgroundLayer;
  v27 = v28;
  -[CALayer setTransform:](backgroundLayer, "setTransform:", &v27);
  foregroundLayer = self->_foregroundLayer;
  v27 = v28;
  -[CALayer setTransform:](foregroundLayer, "setTransform:", &v27);
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  MidX = CGRectGetMidX(v30);
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  MidY = CGRectGetMidY(v31);
  -[CALayer setPosition:](self->_backgroundLayer, "setPosition:", MidX, MidY);
  -[CALayer setPosition:](self->_foregroundLayer, "setPosition:", MidX, MidY);
  -[CALayer bounds](self->_contentLayer, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[CALayer anchorPoint](self->_maskLayer, "anchorPoint");
  -[CALayer setPosition:](self->_maskLayer, "setPosition:", v18 + v25 * v22, v20 + v26 * v24);
  -[CALayer setBounds:](self->_maskLayer, "setBounds:", v18, v20, v22, v24);
  MatchLayerGeometry(self->_maskForegroundLayer, self->_foregroundLayer);
}

- (double)pointScaleToMatchBoundsSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  height = a3.height;
  width = a3.width;
  -[CALayer bounds](self->_backgroundLayer, "bounds");
  v7 = width / v6;
  v8 = 0.0;
  if (v6 == 0.0)
    v7 = 0.0;
  if (v5 != 0.0)
    v8 = height / v5;
  v9 = fmin(v7, v8);
  return v9 + v9;
}

- (CGSize)boundsSizeToMatchPointScale:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = a3 * 0.5;
  -[CALayer bounds](self->_backgroundLayer, "bounds");
  v5 = v3 * v4;
  v7 = v3 * v6;
  result.height = v7;
  result.width = v5;
  return result;
}

- (void)setRecognizedIfNecessaryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int64_t state;
  BOOL v7;
  id v8;

  v4 = a3;
  v5 = v4;
  state = self->_state;
  v7 = state == 4 || state == 1;
  if (v7 && !self->_fadeOnRecognized)
  {
    v8 = v4;
    -[PKFingerprintGlyphView setState:animated:completionHandler:](self, "setState:animated:completionHandler:", 4, 1);
    goto LABEL_10;
  }
  if (v4)
  {
    v8 = v4;
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_10:
    v5 = v8;
  }

}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSMutableArray *transitionCompletionHandlers;
  void *v14;
  void *v15;
  id v16;

  v5 = a4;
  v8 = a5;
  if (self->_state != a3)
  {
    v16 = v8;
    if (self->_transitioning)
    {
      self->_transitioning = 0;
      -[PKFingerprintGlyphView _executeTransitionCompletionHandlers:](self, "_executeTransitionCompletionHandlers:", 1);
      -[PKFingerprintGlyphView setState:animated:completionHandler:](self, "setState:animated:completionHandler:", a3, v5, v16);
    }
    else
    {
      v12 = self->_transitionIndex + 1;
      self->_transitionIndex = v12;
      self->_transitioning = 1;
      self->_priorState = self->_state;
      self->_state = a3;
      if (v8)
      {
        transitionCompletionHandlers = self->_transitionCompletionHandlers;
        v14 = (void *)objc_msgSend(v8, "copy");
        v15 = (void *)MEMORY[0x2199BB0CC]();
        -[NSMutableArray addObject:](transitionCompletionHandlers, "addObject:", v15);

      }
      -[PKFingerprintGlyphView _performTransitionWithTransitionIndex:animated:](self, "_performTransitionWithTransitionIndex:animated:", v12, v5);
    }
    goto LABEL_11;
  }
  if (v8)
  {
    v16 = v8;
    if (self->_transitioning)
    {
      v9 = self->_transitionCompletionHandlers;
      v10 = (void *)objc_msgSend(v8, "copy");
      v11 = (void *)MEMORY[0x2199BB0CC]();
      -[NSMutableArray addObject:](v9, "addObject:", v11);

    }
    else
    {
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    }
LABEL_11:
    v8 = v16;
  }

}

- (void)_executeTransitionCompletionHandlers:(BOOL)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)-[NSMutableArray copy](self->_transitionCompletionHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_transitionCompletionHandlers, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_finishTransitionForIndex:(unint64_t)a3
{
  if (self->_transitioning && self->_transitionIndex == a3)
  {
    self->_transitioning = 0;
    -[PKFingerprintGlyphView _executeTransitionCompletionHandlers:](self, "_executeTransitionCompletionHandlers:", 0);
  }
}

- (void)_updateLastAnimationTimeWithAnimationOfDuration:(double)a3
{
  self->_lastAnimationWillFinish = fmax(CFAbsoluteTimeGetCurrent() + a3, self->_lastAnimationWillFinish);
}

- (double)_minimumAnimationDurationForStateTransition
{
  CFAbsoluteTime Current;
  double lastAnimationWillFinish;
  double v5;
  BOOL v6;
  double result;

  Current = CFAbsoluteTimeGetCurrent();
  lastAnimationWillFinish = self->_lastAnimationWillFinish;
  v5 = lastAnimationWillFinish - Current;
  v6 = lastAnimationWillFinish <= Current;
  result = 0.0;
  if (!v6)
    return v5;
  return result;
}

- (void)_executeAfterMinimumAnimationDurationForStateTransition:(id)a3
{
  void (**v4)(void);
  double v5;
  dispatch_time_t v6;
  void (**block)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    block = v4;
    -[PKFingerprintGlyphView _minimumAnimationDurationForStateTransition](self, "_minimumAnimationDurationForStateTransition");
    if (v5 <= 0.0)
    {
      block[2]();
    }
    else
    {
      v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
      dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
    }
    v4 = block;
  }

}

- (void)_performTransitionWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  double v8;
  id *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  dispatch_time_t v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  PKFingerprintGlyphView *v24;
  id v25[2];
  BOOL v26;
  _QWORD v27[4];
  id v28[2];
  _QWORD block[4];
  id v30[2];
  _QWORD v31[4];
  id v32[2];
  _QWORD v33[4];
  id v34[2];
  BOOL v35;
  id location;

  v4 = a4;
  -[PKFingerprintGlyphView _minimumAnimationDurationForStateTransition](self, "_minimumAnimationDurationForStateTransition");
  v8 = v7;
  objc_initWeak(&location, self);
  switch(self->_state)
  {
    case 0:
      -[CALayer opacity](self->_contentLayer, "opacity");
      if (v15 == 0.0)
        goto LABEL_18;
      v16 = 0.0;
      if (v4)
        v16 = 0.25;
      v17 = fmax(v16, v8);
      -[PKFingerprintGlyphView setContentLayerOpacity:withDuration:](self, "setContentLayerOpacity:withDuration:", 0.0, v17);
      -[PKFingerprintGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:", v17);
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke;
      v33[3] = &unk_24D0A1558;
      v9 = v34;
      objc_copyWeak(v34, &location);
      v34[1] = (id)a3;
      v35 = v4;
      -[PKFingerprintGlyphView _executeAfterMinimumAnimationDurationForStateTransition:](self, "_executeAfterMinimumAnimationDurationForStateTransition:", v33);
      goto LABEL_23;
    case 1:
      if (v4)
      {
        v13 = 0.5;
        if (!self->_fadeOnRecognized)
          v13 = 0.75;
        v8 = fmax(v13, v8);
      }
      -[PKFingerprintGlyphView setContentLayerOpacity:withDuration:](self, "setContentLayerOpacity:withDuration:", 0.0, v8);
      if (v4)
      {
        -[PKFingerprintGlyphView setProgress:withDuration:](self, "setProgress:withDuration:", 1.0, v8);
        v14 = dispatch_time(0, (uint64_t)(v8 * 0.85 * 1000000000.0));
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_3;
        block[3] = &unk_24D0A1580;
        v9 = v30;
        objc_copyWeak(v30, &location);
        v30[1] = (id)a3;
        dispatch_after(v14, MEMORY[0x24BDAC9B8], block);
      }
      else
      {
        -[PKFingerprintGlyphView setProgress:withDuration:](self, "setProgress:withDuration:", 0.8, v8);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_4;
        v27[3] = &unk_24D0A1580;
        v9 = v28;
        objc_copyWeak(v28, &location);
        v28[1] = (id)a3;
        -[PKFingerprintGlyphView _executeAfterMinimumAnimationDurationForStateTransition:](self, "_executeAfterMinimumAnimationDurationForStateTransition:", v27);
      }
      goto LABEL_23;
    case 2:
    case 3:
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_5;
      v23 = &unk_24D0A15A8;
      v9 = v25;
      objc_copyWeak(v25, &location);
      v25[1] = (id)a3;
      v24 = self;
      v26 = v4;
      v10 = MEMORY[0x2199BB0CC](&v20);
      v11 = (void *)v10;
      if (self->_priorState == 1)
      {
        v12 = 0.4;
        if (!v4)
          v12 = 0.0;
        -[PKFingerprintGlyphView setProgress:withDuration:](self, "setProgress:withDuration:", 1.0, fmax(v12, v8), v20, v21, v22, v23);
        -[PKFingerprintGlyphView _executeAfterMinimumAnimationDurationForStateTransition:](self, "_executeAfterMinimumAnimationDurationForStateTransition:", v11);
      }
      else
      {
        (*(void (**)(uint64_t))(v10 + 16))(v10);
      }

      goto LABEL_23;
    case 4:
LABEL_18:
      -[PKFingerprintGlyphView _showFingerprintWithTransitionIndex:animated:](self, "_showFingerprintWithTransitionIndex:animated:", a3, v4);
      goto LABEL_24;
    case 5:
      -[PKFingerprintGlyphView _minimumAnimationDurationForStateTransition](self, "_minimumAnimationDurationForStateTransition");
      v19 = 0.3;
      if (!v4)
        v19 = 0.0;
      -[PKFingerprintGlyphView setContentLayerOpacity:withDuration:](self, "setContentLayerOpacity:withDuration:", 1.0, fmax(v19, v18));
      -[PKFingerprintGlyphView _setRingState:withTransitionIndex:animated:](self, "_setRingState:withTransitionIndex:animated:", 2, a3, v4);
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_2;
      v31[3] = &unk_24D0A1580;
      v9 = v32;
      objc_copyWeak(v32, &location);
      v32[1] = (id)a3;
      -[PKFingerprintGlyphView _executeAfterMinimumAnimationDurationForStateTransition:](self, "_executeAfterMinimumAnimationDurationForStateTransition:", v31);
LABEL_23:
      objc_destroyWeak(v9);
LABEL_24:
      if (self->_state != 3)
        goto LABEL_25;
      goto LABEL_26;
    default:
LABEL_25:
      -[PKFingerprintGlyphView _updateRotationAnimationsIfNecessary](self, "_updateRotationAnimationsIfNecessary", v20, v21, v22, v23);
LABEL_26:
      objc_destroyWeak(&location);
      return;
  }
}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_showFingerprintWithTransitionIndex:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v3;
  }

}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_finishTransitionForIndex:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_startRecognitionHoldingStateWithTransitionIndex:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_startRecognitionHoldingStateWithTransitionIndex:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_5(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  double v5;
  double v6;
  _QWORD v7[4];
  id v8[2];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[60] == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "_setRingState:withTransitionIndex:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560) != 2);
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(v4, "_minimumAnimationDurationForStateTransition");
      v6 = v5;
    }
    else
    {
      v6 = 0.0;
    }
    objc_msgSend(v4, "setContentLayerOpacity:withDuration:", 0.0, v6);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_6;
    v7[3] = &unk_24D0A1580;
    objc_copyWeak(v8, v2);
    v8[1] = *(id *)(a1 + 48);
    objc_msgSend(v4, "_executeAfterMinimumAnimationDurationForStateTransition:", v7);
    objc_destroyWeak(v8);
  }

}

void __73__PKFingerprintGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_6(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[60] == *(_QWORD *)(a1 + 40))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateRotationAnimationsIfNecessary");
    objc_msgSend(v3, "_finishTransitionForIndex:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_showFingerprintWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  int64_t state;
  BOOL v11;
  _QWORD v12[4];
  id v13[2];
  BOOL v14;
  id location;

  if (self->_transitionIndex == a3)
  {
    v4 = a4;
    -[PKFingerprintGlyphView _minimumAnimationDurationForStateTransition](self, "_minimumAnimationDurationForStateTransition");
    v8 = 0.0;
    v9 = 0.0;
    if (v4)
      v9 = dbl_213A5DC30[!self->_fadeOnRecognized];
    state = self->_state;
    v11 = state == 4;
    if (state == 4 && (v8 = 1.0, self->_fadeOnRecognized))
      -[PKFingerprintGlyphView setContentLayerOpacity:withDuration:](self, "setContentLayerOpacity:withDuration:", 1.0, 0.25, 1.0);
    else
      -[PKFingerprintGlyphView setProgress:withDuration:](self, "setProgress:withDuration:", v8, fmax(v9, v7));
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__PKFingerprintGlyphView__showFingerprintWithTransitionIndex_animated___block_invoke;
    v12[3] = &unk_24D0A1558;
    objc_copyWeak(v13, &location);
    v13[1] = (id)a3;
    v14 = v11;
    -[PKFingerprintGlyphView _executeAfterMinimumAnimationDurationForStateTransition:](self, "_executeAfterMinimumAnimationDurationForStateTransition:", v12);
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __71__PKFingerprintGlyphView__showFingerprintWithTransitionIndex_animated___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9[2];

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[60] == *(_QWORD *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v5 = MEMORY[0x24BDAC760];
      v6 = 3221225472;
      v7 = __71__PKFingerprintGlyphView__showFingerprintWithTransitionIndex_animated___block_invoke_2;
      v8 = &unk_24D0A1580;
      objc_copyWeak(v9, v2);
      v9[1] = *(id *)(a1 + 40);
      objc_msgSend(v4, "_executeAfterMinimumAnimationDurationForStateTransition:", &v5);
      objc_msgSend(v4, "setContentLayerOpacity:withDuration:", 1.0, 0.25, v5, v6, v7, v8);
      objc_destroyWeak(v9);
    }
    else
    {
      objc_msgSend(WeakRetained, "_finishTransitionForIndex:");
    }
  }

}

void __71__PKFingerprintGlyphView__showFingerprintWithTransitionIndex_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_finishTransitionForIndex:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_startRecognitionHoldingStateWithTransitionIndex:(unint64_t)a3
{
  NSUInteger v5;
  NSUInteger v6;
  uint64_t i;

  if (self->_transitionIndex == a3)
  {
    v5 = -[NSArray count](self->_backgroundShapeLayers, "count");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        -[PKFingerprintGlyphView _continueHoldingStateForPathAtIndex:withTransitionIndex:](self, "_continueHoldingStateForPathAtIndex:withTransitionIndex:", i, a3);
    }
    -[PKFingerprintGlyphView _finishTransitionForIndex:](self, "_finishTransitionForIndex:", a3);
  }
}

- (void)_continueHoldingStateForPathAtIndex:(unint64_t)a3 withTransitionIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint32_t v18;
  dispatch_time_t v19;
  _QWORD v20[4];
  id v21[3];
  id location;

  if (self->_transitionIndex == a4)
  {
    -[NSArray objectAtIndexedSubscript:](self->_foregroundShapeLayers, "objectAtIndexedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFingerprintGlyphView pathStateForLayer:](self, "pathStateForLayer:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_foregroundShapeLayers, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "progressForShapeLayer:", v9);
    v11 = v10;

    LODWORD(v7) = arc4random_uniform(2u);
    v12 = (double)arc4random_uniform(0x65u) / 1000.0;
    v13 = 0.8;
    if (!(_DWORD)v7)
      v13 = 0.5;
    v14 = v13 + v12;
    v15 = vabdd_f64(v13 + v12, v11);
    v16 = 1.5;
    if (v14 > v11)
      v16 = 2.25;
    v17 = v16 * v15;
    -[PKFingerprintGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:", v16 * v15);
    -[PKFingerprintGlyphView _setProgress:withDuration:forShapeLayerAtIndex:](self, "_setProgress:withDuration:forShapeLayerAtIndex:", a3, v14, v17);
    objc_initWeak(&location, self);
    v18 = arc4random_uniform(0xFBu);
    v19 = dispatch_time(0, (uint64_t)((v17 + (double)v18 / 1000.0 + 0.5) * 1000000000.0));
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __82__PKFingerprintGlyphView__continueHoldingStateForPathAtIndex_withTransitionIndex___block_invoke;
    v20[3] = &unk_24D0A15D0;
    objc_copyWeak(v21, &location);
    v21[1] = (id)a3;
    v21[2] = (id)a4;
    dispatch_after(v19, MEMORY[0x24BDAC9B8], v20);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
}

void __82__PKFingerprintGlyphView__continueHoldingStateForPathAtIndex_withTransitionIndex___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_continueHoldingStateForPathAtIndex:withTransitionIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)_setRingState:(unint64_t)a3 withTransitionIndex:(unint64_t)a4 animated:(BOOL)a5
{
  double v7;
  BOOL fadeOnRecognized;
  void (**v9)(_QWORD, _QWORD, __n128, double);
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __n128 v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSArray *foregroundRingShapeLayers;
  unint64_t v21;
  __n128 v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  unint64_t v45;
  NSArray *obj;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[6];
  BOOL v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  if (self->_transitionIndex == a4)
  {
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v62 = 0;
    if (a5)
      v7 = 0.4;
    else
      v7 = 0.0;
    fadeOnRecognized = self->_fadeOnRecognized;
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __69__PKFingerprintGlyphView__setRingState_withTransitionIndex_animated___block_invoke;
    v57[3] = &unk_24D0A15F8;
    *(double *)&v57[5] = v7;
    v57[4] = &v59;
    v58 = fadeOnRecognized;
    v9 = (void (**)(_QWORD, _QWORD, __n128, double))MEMORY[0x2199BB0CC](v57, a2);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v10 = self->_backgroundShapeLayers;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v54 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (a3)
            objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "strokeEnd");
          else
            objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "strokeStart");
          v9[2](v9, v14, v15, v15.n128_f64[0]);
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      }
      while (v11);
    }

    v16 = -[NSArray count](self->_foregroundRingShapeLayers, "count");
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = self->_foregroundShapeLayers;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    if (v17)
    {
      v47 = *(_QWORD *)v50;
      v45 = v16 - 1;
      do
      {
        v48 = v17;
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v50 != v47)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          foregroundRingShapeLayers = self->_foregroundRingShapeLayers;
          if (foregroundRingShapeLayers
            && (v21 = -[NSArray indexOfObjectIdenticalTo:](foregroundRingShapeLayers, "indexOfObjectIdenticalTo:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j)), v21 != 0x7FFFFFFFFFFFFFFFLL))
          {
            -[PKFingerprintGlyphView pathStateForLayer:](self, "pathStateForLayer:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "strokeStartAtProgress:", 1.0);
            v25 = v24;
            objc_msgSend(v23, "strokeEndAtProgress:", 1.0);
            v27 = v26;
            if (v21)
            {
              -[NSArray objectAtIndexedSubscript:](self->_foregroundRingShapeLayers, "objectAtIndexedSubscript:", v21 - 1);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKFingerprintGlyphView pathStateForLayer:](self, "pathStateForLayer:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "strokeEndAtProgress:", 1.0);
              v31 = v30;

              v32 = (v25 + v31) * 0.5;
            }
            else
            {
              v32 = 0.0;
            }
            v33 = 1.0;
            if (v21 < v45)
            {
              -[NSArray objectAtIndexedSubscript:](self->_foregroundRingShapeLayers, "objectAtIndexedSubscript:", v21 + 1, 1.0);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKFingerprintGlyphView pathStateForLayer:](self, "pathStateForLayer:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v35, "strokeStartAtProgress:", 1.0);
              v37 = v36;

              v33 = (v27 + v37) * 0.5;
            }
            if (a3)
              v38 = v33;
            else
              v38 = v32;
            if (a3 == 1)
            {
              v39 = v32 + 0.025;
              if (v21)
                v39 = v32;
              v40 = v38 + -0.025;
              if (v21 != v45)
                v40 = v38;
              v32 = fmin(v39, v40);
              v38 = fmax(v32, v40);
            }
            objc_msgSend(v19, "strokeStart", v45);
            v42 = v41;
            objc_msgSend(v19, "strokeEnd");
            if (v42 == v43
              && (objc_msgSend(v19, "pkui_hasAdditiveAnimationForKeyPath:", CFSTR("strokeStart")) & 1) == 0
              && (objc_msgSend(v19, "pkui_hasAdditiveAnimationForKeyPath:", CFSTR("strokeEnd")) & 1) == 0)
            {
              if (v32 == v38)
              {
                objc_msgSend(v19, "setStrokeStart:", v32);
                v44 = v38;
              }
              else
              {
                v44 = 0.5;
                objc_msgSend(v19, "setStrokeStart:", 0.5);
              }
              objc_msgSend(v19, "setStrokeEnd:", v44);
            }
            ((void (*)(void (**)(_QWORD, _QWORD, __n128, double), void *, double, double))v9[2])(v9, v19, v32, v38);

          }
          else
          {
            if (a3)
              objc_msgSend(v19, "strokeEnd");
            else
              objc_msgSend(v19, "strokeStart");
            ((void (**)(_QWORD, void *, __n128, double))v9)[2](v9, v19, v22, v22.n128_f64[0]);
          }
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
      }
      while (v17);
    }

    if (*((_BYTE *)v60 + 24))
      -[PKFingerprintGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:", v7);

    _Block_object_dispose(&v59, 8);
  }
}

void __69__PKFingerprintGlyphView__setRingState_withTransitionIndex_animated___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v7 = a2;
  v26 = v7;
  if (*(double *)(a1 + 40) > 0.0)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v26, "strokeStart");
    if (v9 == a3)
    {
      v14 = v26;
LABEL_9:
      objc_msgSend(v14, "strokeEnd");
      if (v15 != a4)
      {
        if (v8)
        {
          v16 = v15;
          objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeEnd"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAdditive:", 1);
          objc_msgSend(v17, "setDuration:", *(double *)(a1 + 40));
          PKMagicCurve();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setTimingFunction:", v18);

          objc_msgSend(v17, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v16, a4);
          objc_msgSend(v8, "addObject:", v17);

        }
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    if (v8)
    {
      v10 = v9;
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeStart"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAdditive:", 1);
      objc_msgSend(v11, "setDuration:", *(double *)(a1 + 40));
      PKMagicCurve();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTimingFunction:", v12);

      objc_msgSend(v11, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v10, a3);
      objc_msgSend(v8, "addObject:", v11);

    }
LABEL_7:
    objc_msgSend(v26, "setStrokeStart:", a3);
    v14 = v26;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_9;
  }
  objc_msgSend(v7, "strokeStart");
  if (v13 != a3)
  {
    v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v26, "strokeEnd");
  v8 = 0;
  if (v19 != a4)
  {
LABEL_13:
    objc_msgSend(v26, "setStrokeEnd:", a4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
LABEL_14:
  if (a3 == a4 && *(_BYTE *)(a1 + 48) && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v26, "opacity");
    v21 = v20;
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAdditive:", 1);
    objc_msgSend(v22, "setDuration:", *(double *)(a1 + 40));
    PKMagicCurve();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTimingFunction:", v23);

    objc_msgSend(v22, "setFillMode:", *MEMORY[0x24BDE5978]);
    objc_msgSend(v22, "pkui_updateForAdditiveAnimationFromScalar:toScalar:withLayerScalar:", v21, 0.0, v21);
    objc_msgSend(v8, "addObject:", v22);

  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDE5638], "animation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDuration:", *(double *)(a1 + 40));
    objc_msgSend(v24, "setAnimations:", v8);
    v25 = (id)objc_msgSend(v26, "pkui_addAdditiveAnimation:", v24);

  }
}

- (void)_updateRotationAnimationsIfNecessary
{
  BOOL v2;

  v2 = self->_state == 3;
  if (self->_state == 3)
  {
    if (!self->_rotatingRing)
    {
      self->_rotatingRing = v2;
      -[PKFingerprintGlyphView _startRotationAnimation](self, "_startRotationAnimation");
    }
  }
  else if (self->_rotatingRing)
  {
    self->_rotatingRing = v2;
    -[PKFingerprintGlyphView _endRotationAnimation](self, "_endRotationAnimation");
  }
}

- (void)_restartRotationIfNecessary
{
  void *v3;
  NSString *rotationAnimationKey;

  if (self->_rotationAnimationKey)
  {
    -[CALayer animationForKey:](self->_foregroundRingContainerLayer, "animationForKey:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      rotationAnimationKey = self->_rotationAnimationKey;
      self->_rotationAnimationKey = 0;

      -[PKFingerprintGlyphView _startRotationAnimation](self, "_startRotationAnimation");
    }
  }
}

- (void)_startRotationAnimation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  id v30;
  void *v31;
  NSString *v32;
  NSString *rotationAnimationKey;
  CALayer *foregroundRingContainerLayer;
  uint64_t v35;
  CATransform3D v36;
  CATransform3D v37;
  CATransform3D v38;
  CATransform3D v39;
  CATransform3D v40;
  CATransform3D v41;
  _QWORD v42[7];

  v42[5] = *MEMORY[0x24BDAC8D0];
  if (self->_foregroundRingContainerLayer)
  {
    if (!self->_rotationAnimationKey)
    {
      objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAdditive:", 1);
      v4 = *MEMORY[0x24BDE5858];
      objc_msgSend(v3, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
      objc_msgSend(v3, "setDuration:", 0.55);
      v35 = *MEMORY[0x24BDE5970];
      objc_msgSend(v3, "setFillMode:");
      v5 = (void *)MEMORY[0x24BDD1968];
      CATransform3DMakeRotation(&v39, -3.14159265, 0.0, 0.0, -1.0);
      objc_msgSend(v5, "valueWithCATransform3D:", &v39);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v41.m11 = v6;
      v7 = (void *)MEMORY[0x24BDD1968];
      CATransform3DMakeRotation(&v38, -1.57079633, 0.0, 0.0, -1.0);
      objc_msgSend(v7, "valueWithCATransform3D:", &v38);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v41.m12 = v8;
      v9 = (void *)MEMORY[0x24BDD1968];
      CATransform3DMakeRotation(&v37, 0.0, 0.0, 0.0, -1.0);
      objc_msgSend(v9, "valueWithCATransform3D:", &v37);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v41.m13 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValues:", v11);

      objc_msgSend(v3, "setKeyTimes:", &unk_24D0AA0E8);
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D18]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v40.m11 = v12;
      v13 = *MEMORY[0x24BDE5D30];
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v40.m12 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTimingFunctions:", v15);

      objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAdditive:", 1);
      objc_msgSend(v16, "setBeginTimeMode:", v4);
      objc_msgSend(v16, "setDuration:", 1.0);
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTimingFunction:", v17);

      objc_msgSend(v16, "setFillMode:", v35);
      v18 = (void *)MEMORY[0x24BDD1968];
      CATransform3DMakeRotation(&v39, 0.0, 0.0, 0.0, -1.0);
      objc_msgSend(v18, "valueWithCATransform3D:", &v39);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v19;
      v20 = (void *)MEMORY[0x24BDD1968];
      CATransform3DMakeRotation(&v38, 1.57079633, 0.0, 0.0, -1.0);
      objc_msgSend(v20, "valueWithCATransform3D:", &v38);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v21;
      v22 = (void *)MEMORY[0x24BDD1968];
      CATransform3DMakeRotation(&v37, 3.14159265, 0.0, 0.0, -1.0);
      objc_msgSend(v22, "valueWithCATransform3D:", &v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42[2] = v23;
      v24 = (void *)MEMORY[0x24BDD1968];
      CATransform3DMakeRotation(&v41, 4.71238898, 0.0, 0.0, -1.0);
      objc_msgSend(v24, "valueWithCATransform3D:", &v41);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v42[3] = v25;
      v26 = (void *)MEMORY[0x24BDD1968];
      CATransform3DMakeRotation(&v40, 0.0, 0.0, 0.0, -1.0);
      objc_msgSend(v26, "valueWithCATransform3D:", &v40);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v42[4] = v27;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setValues:", v28);

      objc_msgSend(v16, "setKeyTimes:", &unk_24D0AA100);
      LODWORD(v29) = 2139095040;
      objc_msgSend(v16, "setRepeatCount:", v29);
      objc_msgSend(v16, "setBeginTime:", 0.55);
      v30 = (id)-[CALayer pkui_addAdditiveAnimation:](self->_foregroundRingContainerLayer, "pkui_addAdditiveAnimation:", v3);
      -[CALayer pkui_addAdditiveAnimation:](self->_foregroundRingContainerLayer, "pkui_addAdditiveAnimation:", v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (NSString *)objc_msgSend(v31, "copy");
      rotationAnimationKey = self->_rotationAnimationKey;
      self->_rotationAnimationKey = v32;

      foregroundRingContainerLayer = self->_foregroundRingContainerLayer;
      CATransform3DMakeRotation(&v36, 3.14159265, 0.0, 0.0, -1.0);
      -[CALayer setTransform:](foregroundRingContainerLayer, "setTransform:", &v36);

    }
  }
}

- (void)_endRotationAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *rotationAnimationKey;
  long double v16;
  double v17;
  double v18;
  CALayer **p_foregroundRingContainerLayer;
  id v20;
  CALayer *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  NSString *v30;
  id v31;
  CATransform3D v32;
  CATransform3D v33;
  CATransform3D v34;
  _QWORD v35[2];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x24BDAC8D0];
  if (self->_foregroundRingContainerLayer && self->_rotationAnimationKey)
  {
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAdditive:", 1);
    objc_msgSend(v3, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
    objc_msgSend(v3, "setDuration:", 0.55);
    objc_msgSend(v3, "setFillMode:", *MEMORY[0x24BDE5970]);
    v4 = (void *)MEMORY[0x24BDD1968];
    CATransform3DMakeRotation(&v34, -3.14159265, 0.0, 0.0, -1.0);
    objc_msgSend(v4, "valueWithCATransform3D:", &v34);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v5;
    v6 = (void *)MEMORY[0x24BDD1968];
    CATransform3DMakeRotation(&v33, -1.57079633, 0.0, 0.0, -1.0);
    objc_msgSend(v6, "valueWithCATransform3D:", &v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v7;
    v8 = (void *)MEMORY[0x24BDD1968];
    CATransform3DMakeRotation(&v32, 0.0, 0.0, 0.0, -1.0);
    objc_msgSend(v8, "valueWithCATransform3D:", &v32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValues:", v10);

    objc_msgSend(v3, "setKeyTimes:", &unk_24D0AA118);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v11;
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTimingFunctions:", v13);

    v14 = self->_rotationAnimationKey;
    rotationAnimationKey = self->_rotationAnimationKey;
    self->_rotationAnimationKey = 0;

    -[CALayer pkui_elapsedDurationForAnimationWithKey:](self->_foregroundRingContainerLayer, "pkui_elapsedDurationForAnimationWithKey:", v14);
    v17 = v16;
    if (v16 <= 0.0)
    {
      -[CALayer removeAnimationForKey:](self->_foregroundRingContainerLayer, "removeAnimationForKey:", v14);

      v14 = 0;
      v18 = fabs(v17);
    }
    else
    {
      v18 = 1.0 - fmod(v16, 1.0);
    }
    objc_msgSend(v3, "setBeginTime:", v18 + CACurrentMediaTime());
    objc_msgSend(v3, "setBeginTimeMode:", *MEMORY[0x24BDE5828]);
    if (v14)
    {
      objc_initWeak((id *)&v34, self);
      v26 = MEMORY[0x24BDAC760];
      v27 = 3221225472;
      v28 = __47__PKFingerprintGlyphView__endRotationAnimation__block_invoke;
      v29 = &unk_24D0A0F90;
      objc_copyWeak(&v31, (id *)&v34);
      v30 = v14;
      objc_msgSend(v3, "pkui_setDidStartHandler:", &v26);

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)&v34);
    }
    p_foregroundRingContainerLayer = &self->_foregroundRingContainerLayer;
    v20 = (id)-[CALayer pkui_addAdditiveAnimation:](*p_foregroundRingContainerLayer, "pkui_addAdditiveAnimation:", v3, v26, v27, v28, v29);
    v21 = *p_foregroundRingContainerLayer;
    v22 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    *(_OWORD *)&v34.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    *(_OWORD *)&v34.m33 = v22;
    v23 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    *(_OWORD *)&v34.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    *(_OWORD *)&v34.m43 = v23;
    v24 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    *(_OWORD *)&v34.m11 = *MEMORY[0x24BDE5598];
    *(_OWORD *)&v34.m13 = v24;
    v25 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    *(_OWORD *)&v34.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    *(_OWORD *)&v34.m23 = v25;
    -[CALayer setTransform:](v21, "setTransform:", &v34);

  }
}

void __47__PKFingerprintGlyphView__endRotationAnimation__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[54], "removeAnimationForKey:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)setContentLayerOpacity:(double)a3 withDuration:(double)a4
{
  double v7;
  double v8;
  void *v9;
  id v10;

  -[CALayer opacity](self->_contentLayer, "opacity");
  v8 = *(float *)&v7;
  if (*(float *)&v7 != a3)
  {
    if (a4 > 0.0)
    {
      objc_msgSend(MEMORY[0x24BE6EF08], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v8, a3);
      v10 = (id)-[CALayer pkui_addAdditiveAnimation:](self->_contentLayer, "pkui_addAdditiveAnimation:", v9);

    }
    *(float *)&v7 = a3;
    -[CALayer setOpacity:](self->_contentLayer, "setOpacity:", v7);
  }
}

- (void)setProgress:(double)a3 withDuration:(double)a4
{
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  double v10;

  -[PKFingerprintGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:", a4);
  v7 = -[NSArray count](self->_backgroundShapeLayers, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = fmax(fmin(a3, 1.0), 0.0);
    do
      -[PKFingerprintGlyphView _setProgress:withDuration:forShapeLayerAtIndex:](self, "_setProgress:withDuration:forShapeLayerAtIndex:", v9++, v10, a4);
    while (v8 != v9);
  }
}

- (void)_setProgress:(double)a3 withDuration:(double)a4 forShapeLayerAtIndex:(unint64_t)a5
{
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  if (a4 <= 0.0)
  {
    v8 = 0;
  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73__PKFingerprintGlyphView__setProgress_withDuration_forShapeLayerAtIndex___block_invoke;
    v14[3] = &__block_descriptor_40_e36_v40__0__CALayer_8__NSString_16d24d32l;
    *(double *)&v14[4] = a4;
    v8 = v14;
  }
  v9 = (void *)MEMORY[0x2199BB0CC](v8, a2);
  -[NSArray objectAtIndexedSubscript:](self->_backgroundShapeLayers, "objectAtIndexedSubscript:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFingerprintGlyphView pathStateForLayer:](self, "pathStateForLayer:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProgress:onShapeLayer:withAnimationHandler:", v10, v9, 1.0 - a3);

  -[NSArray objectAtIndexedSubscript:](self->_foregroundShapeLayers, "objectAtIndexedSubscript:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKFingerprintGlyphView pathStateForLayer:](self, "pathStateForLayer:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProgress:onShapeLayer:withAnimationHandler:", v12, v9, a3);

}

void __73__PKFingerprintGlyphView__setProgress_withDuration_forShapeLayerAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4, double a5)
{
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdditive:", 1);
  objc_msgSend(v9, "setDuration:", *(double *)(a1 + 32));
  PKMagicCurve();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimingFunction:", v10);

  objc_msgSend(v9, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", a4, a5);
  v11 = (id)objc_msgSend(v12, "pkui_addAdditiveAnimation:", v9);

}

- (void)setPrimaryColor:(id)a3
{
  -[PKFingerprintGlyphView setPrimaryColor:animated:](self, "setPrimaryColor:animated:", a3, 0);
}

- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIColor *v6;
  UIColor *primaryColor;
  int v8;
  UIColor *v9;
  UIColor *v10;
  UIColor *v11;

  v4 = a4;
  v6 = (UIColor *)a3;
  primaryColor = self->_primaryColor;
  v11 = v6;
  if (v6 && primaryColor)
  {
    v8 = -[UIColor isEqual:](primaryColor, "isEqual:", v6);
    v6 = v11;
    if (!v8)
    {
LABEL_6:
      v9 = (UIColor *)-[UIColor copy](v6, "copy");
      v10 = self->_primaryColor;
      self->_primaryColor = v9;

      -[PKFingerprintGlyphView _applyPrimaryColorAnimated:](self, "_applyPrimaryColorAnimated:", v4);
      v6 = v11;
      goto LABEL_7;
    }
    primaryColor = self->_primaryColor;
  }
  if (primaryColor != v6)
    goto LABEL_6;
LABEL_7:

}

- (void)_applyPrimaryColorAnimated:(BOOL)a3
{
  -[PKFingerprintGlyphView _applyColor:toShapeLayers:animated:](self, "_applyColor:toShapeLayers:animated:", self->_primaryColor, self->_foregroundShapeLayers, a3);
}

- (void)setSecondaryColor:(id)a3
{
  -[PKFingerprintGlyphView setSecondaryColor:animated:](self, "setSecondaryColor:animated:", a3, 0);
}

- (void)setSecondaryColor:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIColor *v6;
  UIColor *secondaryColor;
  int v8;
  UIColor *v9;
  UIColor *v10;
  UIColor *v11;

  v4 = a4;
  v6 = (UIColor *)a3;
  secondaryColor = self->_secondaryColor;
  v11 = v6;
  if (v6 && secondaryColor)
  {
    v8 = -[UIColor isEqual:](secondaryColor, "isEqual:", v6);
    v6 = v11;
    if (!v8)
    {
LABEL_6:
      v9 = (UIColor *)-[UIColor copy](v6, "copy");
      v10 = self->_secondaryColor;
      self->_secondaryColor = v9;

      -[PKFingerprintGlyphView _applySecondaryColorAnimated:](self, "_applySecondaryColorAnimated:", v4);
      v6 = v11;
      goto LABEL_7;
    }
    secondaryColor = self->_secondaryColor;
  }
  if (secondaryColor != v6)
    goto LABEL_6;
LABEL_7:

}

- (void)_applySecondaryColorAnimated:(BOOL)a3
{
  -[PKFingerprintGlyphView _applyColor:toShapeLayers:animated:](self, "_applyColor:toShapeLayers:animated:", self->_secondaryColor, self->_backgroundShapeLayers, a3);
}

- (void)_applyColor:(id)a3 toShapeLayers:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  _QWORD *v9;
  PKFingerprintGlyphView *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  CGColorRef (*v29)(uint64_t);
  void *v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v5 = a5;
  v38 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v22 = a4;
  if (v22)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v29 = __61__PKFingerprintGlyphView__applyColor_toShapeLayers_animated___block_invoke;
    v30 = &unk_24D0A1640;
    v32 = &v33;
    v31 = v23;
    v8 = (void *)MEMORY[0x24BDF6F30];
    v9 = v28;
    v10 = self;
    objc_msgSend(v8, "currentTraitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDF6F30];
    -[PKFingerprintGlyphView traitCollection](v10, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setCurrentTraitCollection:", v13);
    v29((uint64_t)v9);

    objc_msgSend(MEMORY[0x24BDF6F30], "setCurrentTraitCollection:", v11);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = v22;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v25;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
          if (v5)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "removeAnimationForKey:", CFSTR("color"));
            objc_msgSend(v18, "presentationLayer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "strokeColor");

            objc_msgSend(MEMORY[0x24BE6EF08], "springAnimationWithKeyPath:", CFSTR("strokeColor"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setAdditive:", 0);
            objc_msgSend(v21, "setFromValue:", v20);
            objc_msgSend(v21, "setToValue:", v34[3]);
            objc_msgSend(v18, "addAnimation:forKey:", v21, CFSTR("color"));

          }
          objc_msgSend(v18, "setStrokeColor:", v34[3], v22);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
      }
      while (v15);
    }

    CGColorRelease((CGColorRef)v34[3]);
    _Block_object_dispose(&v33, 8);
  }

}

CGColorRef __61__PKFingerprintGlyphView__applyColor_toShapeLayers_animated___block_invoke(uint64_t a1)
{
  CGColorRef result;

  result = CGColorRetain((CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setPathState:(id)a3 forLayer:(id)a4
{
  if (a4)
    objc_setAssociatedObject(a4, &PathStateKey, a3, (void *)0x301);
}

- (id)pathStateForLayer:(id)a3
{
  if (!a3)
    return 0;
  objc_getAssociatedObject(a3, &PathStateKey);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (BOOL)fadeOnRecognized
{
  return self->_fadeOnRecognized;
}

- (void)setFadeOnRecognized:(BOOL)a3
{
  self->_fadeOnRecognized = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (PKFingerprintGlyphViewDelegate)delegate
{
  return (PKFingerprintGlyphViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_rotationAnimationKey, 0);
  objc_storeStrong((id *)&self->_transitionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_maskForegroundLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_foregroundRingShapeLayers, 0);
  objc_storeStrong((id *)&self->_foregroundShapeLayers, 0);
  objc_storeStrong((id *)&self->_backgroundShapeLayers, 0);
  objc_storeStrong((id *)&self->_foregroundRingContainerLayer, 0);
  objc_storeStrong((id *)&self->_foregroundLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
}

@end
