@implementation WFWorkflowIconDrawer

- (WFWorkflowIconDrawer)init
{
  return -[WFWorkflowIconDrawer initWithDrawerContext:](self, "initWithDrawerContext:", 0);
}

- (WFWorkflowIconDrawer)initWithDrawerContext:(id)a3
{
  id v4;
  WFWorkflowIconDrawer *v5;
  WFWorkflowIconDrawerContext *v6;
  WFWorkflowIconDrawerContext *drawerContext;
  WFWorkflowIconDrawer *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowIconDrawer;
  v5 = -[WFWorkflowIconDrawer init](&v10, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (WFWorkflowIconDrawerContext *)v4;
    }
    else
    {
      +[WFWorkflowIconDrawerContext cachedContextOrNewContext](WFWorkflowIconDrawerContext, "cachedContextOrNewContext");
      v6 = (WFWorkflowIconDrawerContext *)objc_claimAutoreleasedReturnValue();
    }
    drawerContext = v5->_drawerContext;
    v5->_drawerContext = v6;

    *(_WORD *)&v5->_drawGradient = 257;
    v5->_rounded = 1;
    v8 = v5;
  }

  return v5;
}

- (WFColor)glyphColor
{
  WFColor *glyphColor;
  WFColor *v4;
  WFColor *v5;

  glyphColor = self->_glyphColor;
  if (!glyphColor)
  {
    +[WFColor whiteColor](WFColor, "whiteColor");
    v4 = (WFColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_glyphColor;
    self->_glyphColor = v4;

    glyphColor = self->_glyphColor;
  }
  return glyphColor;
}

- (void)drawInContext:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double v6;
  double x;
  id v9;
  CGContext *v10;
  _BOOL4 v11;
  double v12;
  double v13;
  Class v14;
  id v15;
  CGPath *Mutable;
  double v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  CGGradient *v24;
  CGFloat MidX;
  CGFloat MinY;
  CGFloat v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  CGColor *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  BOOL v50;
  void *v51;
  double v52;
  CGFloat v53;
  uint64_t v54;
  const __CFCharacterSet *v55;
  const __CFCharacterSet *v56;
  void (**v57)(_QWORD);
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  _BOOL4 v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  _QWORD *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  NSObject *v85;
  double v86;
  double MinX;
  double v88;
  double v89;
  CGFloat v90;
  double v91;
  double v92;
  CGPathRef v93;
  void (**v94)(_QWORD);
  uint64_t v95;
  uint64_t v96;
  void (**v97)(_QWORD);
  unint64_t v98;
  unint64_t v99;
  double v100;
  unint64_t v101;
  unint64_t v102;
  CGContext *v103;
  double v104;
  double v105;
  CGFloat v106;
  double v107;
  double v108;
  CGPathRef v109;
  double v110;
  uint64_t v111;
  uint64_t v112;
  const __CFAllocator *v113;
  __CFBitVector *v114;
  __CFBitVector *v115;
  CFIndex v116;
  unsigned __int8 *v117;
  CFIndex v118;
  unsigned __int8 *v119;
  int v120;
  CGDataProvider *v121;
  CFIndex FirstIndexOfBit;
  CFIndex v123;
  double v124;
  double v125;
  uint64_t v126;
  double v127;
  uint64_t v128;
  double v129;
  double v130;
  double v131;
  CGImage *v132;
  WFImage *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  void *v139;
  void *v140;
  size_t y;
  void (**v142)(_QWORD);
  void (**v143)(_QWORD);
  double cp1x;
  unsigned __int8 *cp1xa;
  void (**v146)(_QWORD);
  double cp2xc;
  _BOOL4 cp2x;
  CGColorSpace *cp2xa;
  CFIndex cp2xb;
  void *v151;
  CGFloat v152;
  CFIndex LastIndexOfBit;
  CGFloat v154;
  void (**v155)(_QWORD);
  void *v156;
  id v157;
  void (**v158)(_QWORD);
  void (**v159)(_QWORD);
  double v160;
  double v161;
  size_t v162;
  CGImage *v163;
  CGFloat v164;
  uint64_t v165;
  unint64_t v166;
  CGFloat v167;
  void *v168;
  double v169;
  void *v170;
  CGFloat v171;
  id v172;
  CGFloat v173;
  id v174;
  id v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  void (*v179)(uint64_t);
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  _QWORD v187[5];
  CGAffineTransform v188;
  _QWORD v189[5];
  _QWORD aBlock[5];
  UniChar theChar;
  __int128 buf;
  void (*v193)(uint64_t);
  void *v194;
  CGPathRef v195;
  _QWORD v196[2];
  _QWORD v197[2];
  uint64_t v198;
  _QWORD v199[4];
  CFRange v200;
  CFRange v201;
  CFRange v202;
  CFRange v203;
  CGPoint v204;
  CGSize v205;
  CGPoint v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a4.origin.y;
  x = a4.origin.x;
  v199[1] = *MEMORY[0x1E0C80C00];
  v9 = objc_retainAutorelease(a3);
  v10 = (CGContext *)objc_msgSend(v9, "CGContext");
  CGContextSaveGState(v10);
  v11 = -[WFWorkflowIconDrawer drawBackground](self, "drawBackground");
  if (-[WFWorkflowIconDrawer rounded](self, "rounded") && v11)
  {
    -[WFWorkflowIconDrawer cornerRadius](self, "cornerRadius");
    v13 = v12;
    if (v12 == 0.0)
    {
      v207.origin.x = x;
      v207.origin.y = v6;
      v207.size.width = width;
      v207.size.height = height;
      v13 = CGRectGetWidth(v207) * 0.224999994;
    }
    v14 = NSClassFromString((NSString *)CFSTR("UIBezierPath"));
    if (!v14
      || (-[objc_class bezierPathWithRoundedRect:cornerRadius:](v14, "bezierPathWithRoundedRect:cornerRadius:", x, v6, width, height, v13), v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), Mutable = CGPathRetain((CGPathRef)objc_msgSend(v15, "CGPath")), v15, !Mutable))
    {
      if (v13 >= 0.0)
        v17 = v13;
      else
        v17 = 0.0;
      if (v17 == 0.0
        || (v208.origin.x = x,
            v208.origin.y = v6,
            v208.size.width = width,
            v208.size.height = height,
            CGRectIsEmpty(v208)))
      {
        v209.origin.x = x;
        v209.origin.y = v6;
        v209.size.width = width;
        v209.size.height = height;
        Mutable = CGPathCreateWithRect(v209, 0);
      }
      else
      {
        v52 = x + width;
        Mutable = CGPathCreateMutable();
        CGPathMoveToPoint(Mutable, 0, x, v6 + v17 * 1.528665);
        CGPathAddCurveToPoint(Mutable, 0, x, v6 + v17 * 1.08849, x, v6 + v17 * 0.868407, x + v17 * 0.0749114, v6 + v17 * 0.631494);
        CGPathAddCurveToPoint(Mutable, 0, x + v17 * 0.16906, v6 + v17 * 0.372824, x + v17 * 0.372824, v6 + v17 * 0.16906, x + v17 * 0.631494, v6 + v17 * 0.0749114);
        CGPathAddCurveToPoint(Mutable, 0, x + v17 * 0.868407, v6, x + v17 * 1.08849, v6, x + v17 * 1.52866, v6);
        CGPathAddLineToPoint(Mutable, 0, x + width - v17 * 1.528665, v6);
        cp2xc = x + width - v17 * 1.08849;
        CGPathAddCurveToPoint(Mutable, 0, cp2xc, v6, v52 - v17 * 0.868407, v6, v52 - v17 * 0.631494, v6 + v17 * 0.0749114);
        CGPathAddCurveToPoint(Mutable, 0, v52 - v17 * 0.372824, v6 + v17 * 0.16906, v52 - v17 * 0.16906, v6 + v17 * 0.372824, v52 - v17 * 0.0749114, v6 + v17 * 0.631494);
        CGPathAddCurveToPoint(Mutable, 0, x + width, v6 + v17 * 0.868407, x + width, v6 + v17 * 1.08849, x + width, v6 + v17 * 1.52866);
        CGPathAddLineToPoint(Mutable, 0, x + width, v6 + height - v17 * 1.528665);
        v164 = v6 + height - v17 * 1.08849;
        v167 = v6 + height - v17 * 0.868407;
        v169 = v6 + height - v17 * 0.631494;
        CGPathAddCurveToPoint(Mutable, 0, x + width, v164, x + width, v167, x + width - v17 * 0.0749114, v169);
        v171 = v6 + height - v17 * 0.16906;
        v173 = v6 + height - v17 * 0.372824;
        v53 = v6 + height - v17 * 0.0749114;
        CGPathAddCurveToPoint(Mutable, 0, x + width - v17 * 0.16906, v173, x + width - v17 * 0.372824, v171, x + width - v17 * 0.631494, v53);
        CGPathAddCurveToPoint(Mutable, 0, x + width - v17 * 0.868407, v6 + height, cp2xc, v6 + height, x + width - v17 * 1.52866, v6 + height);
        CGPathAddLineToPoint(Mutable, 0, x + v17 * 1.528665, v6 + height);
        CGPathAddCurveToPoint(Mutable, 0, x + v17 * 1.08849, v6 + height, x + v17 * 0.868407, v6 + height, x + v17 * 0.631494, v53);
        CGPathAddCurveToPoint(Mutable, 0, x + v17 * 0.372824, v171, x + v17 * 0.16906, v173, x + v17 * 0.0749114, v169);
        CGPathAddCurveToPoint(Mutable, 0, x, v167, x, v164, x, v6 + height - v17 * 1.52866);
        CGPathCloseSubpath(Mutable);
      }
    }
    CGContextAddPath(v10, Mutable);
    CGContextClip(v10);
    CGPathRelease(Mutable);
  }
  if (v11)
  {
    v18 = -[WFWorkflowIconDrawer drawGradient](self, "drawGradient");
    -[WFWorkflowIconDrawer backgroundColor](self, "backgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      objc_msgSend(v19, "gradient");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "baseColorForDarkMode:highContrast:", -[WFWorkflowIconDrawer dark](self, "dark"), -[WFWorkflowIconDrawer highContrast](self, "highContrast"));
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(v10, (CGColorRef)objc_msgSend(v22, "CGColor"));
      v210.origin.x = x;
      v210.origin.y = v6;
      v210.size.width = width;
      v210.size.height = height;
      CGContextFillRect(v10, v210);
      if (objc_msgSend(v21, "blendMode") == 1)
        CGContextSetBlendMode(v10, kCGBlendModeSoftLight);
      v23 = objc_retainAutorelease(v21);
      v24 = (CGGradient *)objc_msgSend(v23, "CGGradient");
      v211.origin.x = x;
      v211.origin.y = v6;
      v211.size.width = width;
      v211.size.height = height;
      MidX = CGRectGetMidX(v211);
      v212.origin.x = x;
      v212.origin.y = v6;
      v212.size.width = width;
      v212.size.height = height;
      MinY = CGRectGetMinY(v212);
      v213.origin.x = x;
      v213.origin.y = v6;
      v213.size.width = width;
      v213.size.height = height;
      v27 = CGRectGetMidX(v213);
      v214.origin.x = x;
      v214.origin.y = v6;
      v214.size.width = width;
      v214.size.height = height;
      v206.y = CGRectGetMaxY(v214);
      v204.x = MidX;
      v204.y = MinY;
      v206.x = v27;
      CGContextDrawLinearGradient(v10, v24, v204, v206, 2u);

    }
    else
    {
      v28 = objc_retainAutorelease(v19);
      CGContextSetFillColorWithColor(v10, (CGColorRef)objc_msgSend(v28, "CGColor"));

      v215.origin.x = x;
      v215.origin.y = v6;
      v215.size.width = width;
      v215.size.height = height;
      CGContextFillRect(v10, v215);
    }
  }
  if (-[WFWorkflowIconDrawer drawShadowBehindGlyph](self, "drawShadowBehindGlyph"))
  {
    CGContextSaveGState(v10);
    +[WFColor blackColor](WFColor, "blackColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "colorWithAlphaComponent:", 0.3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_retainAutorelease(v30);
    v32 = (CGColor *)objc_msgSend(v31, "CGColor");
    v205.width = 0.0;
    v205.height = 2.0;
    CGContextSetShadowWithColor(v10, v205, 2.0, v32);

  }
  -[WFWorkflowIconDrawer customImageData](self, "customImageData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFWorkflowIconDrawer useCustomImage](self, "useCustomImage") && objc_msgSend(v33, "length"))
  {
    +[WFImage imageWithData:scale:allowAnimated:](WFImage, "imageWithData:scale:allowAnimated:", v33, 0, 1.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "drawInContext:inRect:", v9, x, v6, width, height);

  }
  else
  {
    -[WFWorkflowIconDrawer glyphSize](self, "glyphSize");
    v38 = *MEMORY[0x1E0C9D820];
    v37 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v35 == *MEMORY[0x1E0C9D820] && v36 == v37)
    {
      v44 = 0.0;
      if (v11)
      {
        v216.origin.x = x;
        v216.origin.y = v6;
        v216.size.width = width;
        v216.size.height = height;
        v44 = CGRectGetWidth(v216) / 6.0;
      }
      v217.origin.x = x;
      v217.origin.y = v6;
      v217.size.width = width;
      v217.size.height = height;
      v218 = CGRectInset(v217, v44, v44);
      v42 = v218.origin.x;
      v43 = v218.origin.y;
      v40 = v218.size.width;
      v41 = v218.size.height;
    }
    else
    {
      v40 = v35;
      v41 = v36;
      v42 = (width - v35) * 0.5;
      v43 = (height - v36) * 0.5;
    }
    -[WFWorkflowIconDrawer symbolName](self, "symbolName");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowIconDrawer drawerContext](self, "drawerContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v176)
    {
      -[WFWorkflowIconDrawer glyphColor](self, "glyphColor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v176;
      WFDrawGlyphForVectorIdentifier(v45, v9, v176, v46, v42, v43, v40, v41);

    }
    else
    {
      v48 = -[WFWorkflowIconDrawer glyphCharacter](self, "glyphCharacter");
      -[WFWorkflowIconDrawer glyphColor](self, "glyphColor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[WFWorkflowIconDrawer outline](self, "outline");
      v175 = v45;
      v172 = v9;
      theChar = v48;
      v174 = v49;
      v219.origin.x = v42;
      v219.origin.y = v43;
      v219.size.width = v40;
      v219.size.height = v41;
      if (!CGRectIsEmpty(v219))
      {
        if (v50)
          WFSystemImageNameForOutlineGlyphCharacter(v48);
        else
          WFSystemImageNameForGlyphCharacter(v48);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          WFDrawGlyphForVectorIdentifier(v175, v172, v51, v174, v42, v43, v40, v41);
        }
        else
        {
          theChar = WFReplacementGlyphCharacterForCharacter(v48);
          v54 = objc_msgSend(v175, "glyphTestFont");
          WFCTFontCopyCharacterSet(v54);
          v56 = v55;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __WFDrawGlyphForIconCharacter_block_invoke;
          aBlock[3] = &__block_descriptor_40_e5_v8__0l;
          aBlock[4] = v55;
          v57 = (void (**)(_QWORD))_Block_copy(aBlock);
          if (CFCharacterSetIsCharacterMember(v56, theChar))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &theChar, 1);
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            v165 = objc_msgSend(v170, "length");
            v58 = objc_alloc(MEMORY[0x1E0CB3498]);
            getkCTFontAttributeName();
            v198 = v59;
            v199[0] = v54;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v199, &v198, 1);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v168 = (void *)objc_msgSend(v58, "initWithString:attributes:", v170, v60);

            WFCTFramesetterCreateWithAttributedString((uint64_t)v168);
            v62 = v61;
            if (v61)
            {
              v189[0] = MEMORY[0x1E0C809B0];
              v189[1] = 3221225472;
              v189[2] = __WFDrawGlyphForIconCharacter_block_invoke_2;
              v189[3] = &__block_descriptor_40_e5_v8__0l;
              v189[4] = v61;
              v159 = (void (**)(_QWORD))_Block_copy(v189);
              WFCTFramesetterSuggestFrameSizeWithConstraints(v62, 0, v165);
              v65 = v64;
              if (v64 != v38 || v63 != v37)
              {
                v160 = v63;
                memset(&v188, 0, sizeof(v188));
                v157 = objc_retainAutorelease(v172);
                CGContextGetCTM(&v188, (CGContextRef)objc_msgSend(v157, "CGContext"));
                v66 = sqrt(v188.c * v188.c + v188.a * v188.a);
                cp1x = floor(v66);
                v67 = cp1x != v66;
                if (v66 != sqrt(v188.d * v188.d + v188.b * v188.b))
                  v67 = 1;
                v68 = 1.0 / v66;
                cp2x = v67;
                if (v67)
                  v69 = 0.0;
                else
                  v69 = v68;
                v220.origin.x = v42;
                v220.origin.y = v43;
                v220.size.width = v40;
                v220.size.height = v41;
                v70 = CGRectGetWidth(v220);
                v221.origin.x = v42;
                v221.origin.y = v43;
                v221.size.width = v40;
                v221.size.height = v41;
                v71 = CGRectGetHeight(v221);
                +[WFWorkflowIconDrawerContext glyphTestFontSize](WFWorkflowIconDrawerContext, "glyphTestFontSize");
                v73 = (v70 - v69) / v65;
                if (v73 >= (v71 - v69) / v160)
                  v73 = (v71 - v69) / v160;
                v74 = objc_msgSend(v175, "newGlyphFontForSize:", v73 * v72);
                v75 = v74;
                if (v74)
                {
                  v187[0] = MEMORY[0x1E0C809B0];
                  v187[1] = 3221225472;
                  v187[2] = __WFDrawGlyphForIconCharacter_block_invoke_3;
                  v187[3] = &__block_descriptor_40_e5_v8__0l;
                  v187[4] = v74;
                  v146 = (void (**)(_QWORD))_Block_copy(v187);
                  v76 = objc_alloc(MEMORY[0x1E0CB3498]);
                  getkCTFontAttributeName();
                  v151 = v33;
                  v196[0] = v77;
                  v197[0] = v75;
                  v182 = 0;
                  v183 = (uint64_t)&v182;
                  v184 = 0x2020000000;
                  v78 = (_QWORD *)getkCTForegroundColorAttributeNameSymbolLoc_ptr;
                  v185 = (void *)getkCTForegroundColorAttributeNameSymbolLoc_ptr;
                  if (!getkCTForegroundColorAttributeNameSymbolLoc_ptr)
                  {
                    v79 = CoreTextLibrary();
                    v78 = dlsym(v79, "kCTForegroundColorAttributeName");
                    *(_QWORD *)(v183 + 24) = v78;
                    getkCTForegroundColorAttributeNameSymbolLoc_ptr = (uint64_t)v78;
                  }
                  _Block_object_dispose(&v182, 8);
                  if (!v78)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCTForegroundColorAttributeName(void)");
                    v140 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v139, "handleFailureInFunction:file:lineNumber:description:", v140, CFSTR("WFWorkflowIconDrawer.m"), 36, CFSTR("%s"), dlerror());

                    __break(1u);
                  }
                  v196[1] = *v78;
                  v197[1] = objc_msgSend(objc_retainAutorelease(v174), "CGColor");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v197, v196, 2);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  v156 = (void *)objc_msgSend(v76, "initWithString:attributes:", v170, v80);

                  WFCTFramesetterCreateWithAttributedString((uint64_t)v156);
                  v82 = v81;
                  if (v81)
                  {
                    v182 = MEMORY[0x1E0C809B0];
                    v183 = 3221225472;
                    v184 = (uint64_t)__WFDrawGlyphForIconCharacter_block_invoke_4;
                    v185 = &__block_descriptor_40_e5_v8__0l;
                    v186 = v81;
                    v143 = (void (**)(_QWORD))_Block_copy(&v182);
                    WFCTFramesetterSuggestFrameSizeWithConstraints(v82, 0, v165);
                    v152 = v83;
                    v154 = v84;
                    if (cp2x)
                    {
                      getWFVoiceShortcutClientLogObject();
                      v85 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                      {
                        LODWORD(buf) = 136315138;
                        *(_QWORD *)((char *)&buf + 4) = "WFDrawGlyphForIconCharacter";
                        _os_log_impl(&dword_1AF681000, v85, OS_LOG_TYPE_ERROR, "%s Warning: Drawing at a non-integral scale or stretching the glyph will not result in a perfectly positioned result", (uint8_t *)&buf, 0xCu);
                      }

                      v222.origin.x = v42;
                      v222.origin.y = v43;
                      v222.size.width = v40;
                      v222.size.height = v41;
                      v161 = CGRectGetWidth(v222);
                      v223.origin.x = 0.0;
                      v223.origin.y = 0.0;
                      v223.size.width = v152;
                      v223.size.height = v154;
                      v86 = CGRectGetWidth(v223);
                      v224.origin.x = v42;
                      v224.origin.y = v43;
                      v224.size.width = v40;
                      v224.size.height = v41;
                      MinX = CGRectGetMinX(v224);
                      v225.origin.x = 0.0;
                      v225.origin.y = 0.0;
                      v225.size.width = v152;
                      v225.size.height = v154;
                      v88 = CGRectGetMinX(v225);
                      v226.origin.x = v42;
                      v226.origin.y = v43;
                      v226.size.width = v40;
                      v226.size.height = v41;
                      v89 = CGRectGetHeight(v226);
                      v90 = (v161 - v86) * 0.5 + MinX - v88;
                      v227.origin.y = 0.0;
                      v227.origin.x = v90;
                      v227.size.width = v152;
                      v227.size.height = v154;
                      v91 = CGRectGetHeight(v227);
                      v228.origin.x = v42;
                      v228.origin.y = v43;
                      v228.size.width = v40;
                      v228.size.height = v41;
                      v92 = CGRectGetMinY(v228);
                      v229.origin.y = 0.0;
                      v229.origin.x = v90;
                      v229.size.width = v152;
                      v229.size.height = v154;
                      v230.origin.y = (v89 - v91) * 0.5 + v92 - CGRectGetMinY(v229);
                      v230.origin.x = v90;
                      v230.size.width = v152;
                      v230.size.height = v154;
                      v93 = CGPathCreateWithRect(v230, 0);
                      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                      *((_QWORD *)&buf + 1) = 3221225472;
                      v193 = __WFDrawGlyphForIconCharacter_block_invoke_125;
                      v194 = &__block_descriptor_40_e5_v8__0l;
                      v195 = v93;
                      v94 = (void (**)(_QWORD))_Block_copy(&buf);
                      WFCTFramesetterCreateFrame(v82, 0, v165, (uint64_t)v93);
                      v96 = v95;
                      v177 = MEMORY[0x1E0C809B0];
                      v178 = 3221225472;
                      v179 = __WFDrawGlyphForIconCharacter_block_invoke_2_126;
                      v180 = &__block_descriptor_40_e5_v8__0l;
                      v181 = v95;
                      v97 = (void (**)(_QWORD))_Block_copy(&v177);
                      WFCTFrameDraw(v96, objc_msgSend(objc_retainAutorelease(v157), "CGContext"));
                      v97[2](v97);

                      v94[2](v94);
                    }
                    else
                    {
                      v98 = vcvtpd_u64_f64(v41 * 0.5);
                      v99 = (unint64_t)cp1x;
                      v100 = (double)(2 * v98);
                      v101 = (unint64_t)cp1x * (unint64_t)(ceil(v40) + v100);
                      v102 = (unint64_t)cp1x * (unint64_t)(ceil(v41) + v100);
                      v162 = 4 * v101;
                      y = 4 * v101 * v102;
                      v142 = v57;
                      cp1xa = (unsigned __int8 *)malloc_type_calloc(y, 1uLL, 0x33012F5AuLL);
                      cp2xa = CGColorSpaceCreateDeviceRGB();
                      v103 = CGBitmapContextCreate(cp1xa, v101, v102, 8uLL, 4 * v101, cp2xa, 1u);
                      CGContextScaleCTM(v103, (double)v99, (double)v99);
                      v231.origin.x = (double)v98;
                      v231.origin.y = (double)v98;
                      v231.size.width = v40;
                      v231.size.height = v41;
                      v104 = CGRectGetWidth(v231);
                      v232.origin.x = 0.0;
                      v232.origin.y = 0.0;
                      v232.size.width = v152;
                      v232.size.height = v154;
                      v105 = CGRectGetWidth(v232);
                      v233.origin.x = (double)v98;
                      v233.origin.y = (double)v98;
                      v233.size.width = v40;
                      v233.size.height = v41;
                      v106 = (v104 - v105) * 0.5 + CGRectGetMinX(v233);
                      v234.origin.x = v106;
                      v234.origin.y = (double)v98;
                      v234.size.width = v40;
                      v234.size.height = v41;
                      v107 = CGRectGetWidth(v234);
                      v235.origin.x = 0.0;
                      v235.origin.y = 0.0;
                      v235.size.width = v152;
                      v235.size.height = v154;
                      v108 = CGRectGetHeight(v235);
                      v236.origin.x = v106;
                      v236.origin.y = (double)v98;
                      v236.size.width = v40;
                      v236.size.height = v41;
                      v237.origin.y = (v107 - v108) * 0.5 + CGRectGetMinY(v236);
                      v237.origin.x = v106;
                      v237.size.width = v40;
                      v237.size.height = v41;
                      v109 = CGPathCreateWithRect(v237, 0);
                      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                      *((_QWORD *)&buf + 1) = 3221225472;
                      v193 = __WFDrawGlyphForIconCharacter_block_invoke_3_127;
                      v194 = &__block_descriptor_40_e5_v8__0l;
                      v195 = v109;
                      v110 = (double)v99;
                      v155 = (void (**)(_QWORD))_Block_copy(&buf);
                      WFCTFramesetterCreateFrame(v82, 0, v165, (uint64_t)v109);
                      v112 = v111;
                      v177 = MEMORY[0x1E0C809B0];
                      v178 = 3221225472;
                      v179 = __WFDrawGlyphForIconCharacter_block_invoke_4_128;
                      v180 = &__block_descriptor_40_e5_v8__0l;
                      v181 = v111;
                      v158 = (void (**)(_QWORD))_Block_copy(&v177);
                      WFCTFrameDraw(v112, (uint64_t)v103);
                      CGContextRelease(v103);
                      v113 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
                      v114 = CFBitVectorCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v102);
                      CFBitVectorSetCount(v114, v102);
                      CFBitVectorSetAllBits(v114, 0);
                      v115 = CFBitVectorCreateMutable(v113, v101);
                      CFBitVectorSetCount(v115, v101);
                      CFBitVectorSetAllBits(v115, 0);
                      v166 = v102;
                      if (v102)
                      {
                        v116 = 0;
                        v117 = cp1xa;
                        do
                        {
                          if (v101)
                          {
                            v118 = 0;
                            v119 = v117;
                            do
                            {
                              v120 = *v119;
                              v119 += 4;
                              if (v120)
                              {
                                CFBitVectorSetBitAtIndex(v114, v116, 1u);
                                CFBitVectorSetBitAtIndex(v115, v118, 1u);
                              }
                              ++v118;
                            }
                            while (v101 != v118);
                          }
                          ++v116;
                          v117 += v162;
                        }
                        while (v116 != v166);
                      }
                      v121 = CGDataProviderCreateWithData(0, cp1xa, y, (CGDataProviderReleaseDataCallback)WFDrawGlyphFreeCallback);
                      v57 = v142;
                      v163 = CGImageCreate(v101, v166, 8uLL, 0x20uLL, v162, cp2xa, 1u, v121, 0, 0, kCGRenderingIntentDefault);
                      CGDataProviderRelease(v121);
                      CGColorSpaceRelease(cp2xa);
                      v200.location = 0;
                      v200.length = v166;
                      FirstIndexOfBit = CFBitVectorGetFirstIndexOfBit(v114, v200, 1u);
                      v201.location = 0;
                      v201.length = v166;
                      LastIndexOfBit = CFBitVectorGetLastIndexOfBit(v114, v201, 1u);
                      v33 = v151;
                      v202.location = 0;
                      v202.length = v101;
                      cp2xb = CFBitVectorGetFirstIndexOfBit(v115, v202, 1u);
                      v203.location = 0;
                      v203.length = v101;
                      v123 = CFBitVectorGetLastIndexOfBit(v115, v203, 1u);
                      CFRelease(v114);
                      CFRelease(v115);
                      v124 = (double)v101;
                      v125 = (double)v166;
                      if (FirstIndexOfBit == -1)
                        v126 = 0;
                      else
                        v126 = FirstIndexOfBit;
                      v127 = (double)v126;
                      v128 = cp2xb;
                      if (cp2xb == -1)
                        v128 = 0;
                      v129 = (double)v128;
                      v130 = v125 - (double)LastIndexOfBit + -1.0;
                      if (LastIndexOfBit == -1)
                        v130 = 0.0;
                      v131 = v124 - (double)v123 + -1.0;
                      if (v123 == -1)
                        v131 = 0.0;
                      v238.origin.x = *MEMORY[0x1E0C9D538] + v129;
                      v238.origin.y = *(double *)(MEMORY[0x1E0C9D538] + 8) + v127;
                      v238.size.width = v124 - (v131 + v129);
                      v238.size.height = v125 - (v130 + v127);
                      v132 = CGImageCreateWithImageInRect(v163, v238);
                      CGImageRelease(v163);
                      v94 = v155;
                      v133 = -[WFImage initWithCGImage:scale:orientation:]([WFImage alloc], "initWithCGImage:scale:orientation:", v132, 1, v110);
                      -[WFImage sizeInPoints](v133, "sizeInPoints");
                      v135 = v134;
                      v137 = v136;
                      CGImageRelease(v132);
                      v239.origin.x = v42;
                      v239.origin.y = v43;
                      v239.size.width = v40;
                      v239.size.height = v41;
                      v138 = CGRectGetMinX(v239);
                      v240.origin.x = v42;
                      v240.origin.y = v43;
                      v240.size.width = v40;
                      v240.size.height = v41;
                      -[WFImage drawInContext:inRect:](v133, "drawInContext:inRect:", v157, round(((v40 - v135) * 0.5 + v138) * v110) / v110, round(((v41 - v137) * 0.5 + CGRectGetMinY(v240)) * v110) / v110, round(v135 * v110) / v110, round(v137 * v110) / v110);

                      v158[2](v158);
                      v94[2](v94);
                    }

                    v143[2](v143);
                  }

                  v146[2](v146);
                }
              }
              v159[2](v159);

            }
          }
          v57[2](v57);

          v51 = 0;
        }

      }
      v47 = 0;
    }

  }
  if (-[WFWorkflowIconDrawer drawShadowBehindGlyph](self, "drawShadowBehindGlyph"))
    CGContextRestoreGState(v10);
  CGContextRestoreGState(v10);

}

- (CGSize)calculatedSizeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  id v20;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD);
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  const __CFCharacterSet *v34;
  const __CFCharacterSet *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void (**v43)(_QWORD);
  double v44;
  double v45;
  double v46;
  double v47;
  NSObject *v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void (**v59)(_QWORD);
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void (**v67)(_QWORD);
  void *v68;
  uint64_t v69;
  _QWORD v70[5];
  _QWORD v71[5];
  _QWORD v72[5];
  UniChar theChar;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE aBlock[24];
  void *v79;
  const __CFCharacterSet *v80;
  uint64_t v81;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v81 = *MEMORY[0x1E0C80C00];
  if (a3.width == 0.0 || a3.height == 0.0)
  {
    -[WFWorkflowIconDrawer customImageData](self, "customImageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WFWorkflowIconDrawer useCustomImage](self, "useCustomImage") && objc_msgSend(v10, "length"))
    {
      +[WFImage imageWithData:scale:allowAnimated:](WFImage, "imageWithData:scale:allowAnimated:", v10, 0, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sizeInPoints");
      v13 = v12;
      v15 = v14;

      v8 = WFWorkflowIconDrawerScaledSizeWithTargetSize(width, height, v13, v15, a4);
      v9 = v16;
    }
    else
    {
      -[WFWorkflowIconDrawer drawerContext](self, "drawerContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[WFWorkflowIconDrawer glyphCharacter](self, "glyphCharacter");
      v19 = -[WFWorkflowIconDrawer outline](self, "outline");
      v20 = v17;
      theChar = v18;
      v8 = *MEMORY[0x1E0C9D820];
      v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (width == *MEMORY[0x1E0C9D820] && height == v9)
      {
        v8 = width;
        v9 = height;
      }
      else
      {
        +[WFDevice currentDevice](WFDevice, "currentDevice");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "screenScale");
        v24 = v23;

        if (v19)
          WFSystemImageNameForOutlineGlyphCharacter(v18);
        else
          WFSystemImageNameForGlyphCharacter(v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          v27 = v25;
          objc_msgSend(v20, "coreGlyphsCatalogs");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFImage glyphNamed:pointSize:symbolWeight:scaleFactor:inCatalogs:](WFImage, "glyphNamed:pointSize:symbolWeight:scaleFactor:inCatalogs:", v27, 6, v28, height, v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v29, "sizeInPoints");
            v8 = WFWorkflowIconDrawerScaledSizeWithTargetSize(width, height, v30, v31, v24);
            v9 = v32;
          }
          else
          {
            getWFVoiceShortcutClientLogObject();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)aBlock = 136315394;
              *(_QWORD *)&aBlock[4] = "WFWorkflowIconDrawerScaledSizeForVectorIdentifier";
              *(_WORD *)&aBlock[12] = 2114;
              *(_QWORD *)&aBlock[14] = v27;
              _os_log_impl(&dword_1AF681000, v48, OS_LOG_TYPE_FAULT, "%s vector glyph was unexpectedly nil with identifier: %{public}@", aBlock, 0x16u);
            }

          }
        }
        else
        {
          theChar = WFReplacementGlyphCharacterForCharacter(v18);
          v33 = objc_msgSend(v20, "glyphTestFont");
          WFCTFontCopyCharacterSet(v33);
          v35 = v34;
          *(_QWORD *)aBlock = MEMORY[0x1E0C809B0];
          *(_QWORD *)&aBlock[8] = 3221225472;
          *(_QWORD *)&aBlock[16] = __WFWorkflowIconDrawerScaledSizeForIconCharacter_block_invoke;
          v79 = &__block_descriptor_40_e5_v8__0l;
          v80 = v34;
          v27 = (void (**)(_QWORD))_Block_copy(aBlock);
          if (CFCharacterSetIsCharacterMember(v35, theChar))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &theChar, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v36, "length");
            v37 = objc_alloc(MEMORY[0x1E0CB3498]);
            getkCTFontAttributeName();
            v76 = v38;
            v77 = v33;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_msgSend(v37, "initWithString:attributes:", v36, v39);

            WFCTFramesetterCreateWithAttributedString((uint64_t)v40);
            v42 = v41;
            if (v41)
            {
              v72[0] = MEMORY[0x1E0C809B0];
              v72[1] = 3221225472;
              v72[2] = __WFWorkflowIconDrawerScaledSizeForIconCharacter_block_invoke_2;
              v72[3] = &__block_descriptor_40_e5_v8__0l;
              v72[4] = v41;
              v43 = (void (**)(_QWORD))_Block_copy(v72);
              WFCTFramesetterSuggestFrameSizeWithConstraints(v42, 0, v69);
              if (v44 != v8 || v45 != v9)
              {
                v46 = height - 1.0 / v24;
                if (width == 0.0)
                {
                  v47 = v46 / v45;
                }
                else
                {
                  v49 = (width - 1.0 / v24) / v44;
                  v50 = v46 / v45;
                  if (v49 < v50)
                    v50 = v49;
                  if (height == 0.0)
                    v47 = v49;
                  else
                    v47 = v50;
                }
                +[WFWorkflowIconDrawerContext glyphTestFontSize](WFWorkflowIconDrawerContext, "glyphTestFontSize");
                v52 = objc_msgSend(v20, "newGlyphFontForSize:", v47 * v51);
                v53 = v52;
                if (v52)
                {
                  v71[0] = MEMORY[0x1E0C809B0];
                  v71[1] = 3221225472;
                  v71[2] = __WFWorkflowIconDrawerScaledSizeForIconCharacter_block_invoke_3;
                  v71[3] = &__block_descriptor_40_e5_v8__0l;
                  v71[4] = v52;
                  v67 = (void (**)(_QWORD))_Block_copy(v71);
                  v54 = objc_alloc(MEMORY[0x1E0CB3498]);
                  getkCTFontAttributeName();
                  v74 = v55;
                  v75 = v53;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v68 = (void *)objc_msgSend(v54, "initWithString:attributes:", v36, v56);

                  WFCTFramesetterCreateWithAttributedString((uint64_t)v68);
                  v58 = v57;
                  if (v57)
                  {
                    v70[0] = MEMORY[0x1E0C809B0];
                    v70[1] = 3221225472;
                    v70[2] = __WFWorkflowIconDrawerScaledSizeForIconCharacter_block_invoke_4;
                    v70[3] = &__block_descriptor_40_e5_v8__0l;
                    v70[4] = v57;
                    v59 = (void (**)(_QWORD))_Block_copy(v70);
                    WFCTFramesetterSuggestFrameSizeWithConstraints(v58, 0, v69);
                    v61 = v60;
                    v63 = v62;
                    v59[2](v59);
                    v8 = WFWorkflowIconDrawerScaledSizeWithTargetSize(width, height, v61, v63, v24);
                    v9 = v64;

                  }
                  v67[2](v67);

                }
              }
              v43[2](v43);

            }
          }
          v27[2](v27);
        }

      }
    }

  }
  else
  {
    v8 = a3.width;
    v9 = a3.height;
  }
  v65 = v8;
  v66 = v9;
  result.height = v66;
  result.width = v65;
  return result;
}

- (id)imageWithSize:(CGSize)a3
{
  return -[WFWorkflowIconDrawer imageWithSize:scale:](self, "imageWithSize:scale:", a3.width, a3.height, 0.0);
}

- (id)imageWithSize:(CGSize)a3 scale:(double)a4
{
  return -[WFWorkflowIconDrawer imageWithSize:scale:padding:](self, "imageWithSize:scale:padding:", a3.width, a3.height, a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (id)imageWithSize:(CGSize)a3 scale:(double)a4 padding:(CGSize)a5
{
  double width;
  double height;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;

  width = a5.width;
  if (a3.width == *MEMORY[0x1E0C9D820] && a3.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v16 = 0;
  }
  else
  {
    height = a5.height;
    -[WFWorkflowIconDrawer calculatedSizeForSize:scale:](self, "calculatedSizeForSize:scale:");
    v10 = v9;
    v12 = v11;
    +[WFBitmapContext contextWithSize:scale:](WFBitmapContext, "contextWithSize:scale:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = ceil(width);
      v15 = ceil(height);
      -[WFWorkflowIconDrawer drawInContext:inRect:](self, "drawInContext:inRect:", v13, v14, v15, v10 - v14 * 2.0, v12 - v15 * 2.0);
      objc_msgSend(v13, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (WFWorkflowIconDrawerContext)drawerContext
{
  return self->_drawerContext;
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (void)setGlyphCharacter:(unsigned __int16)a3
{
  self->_glyphCharacter = a3;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (WFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (BOOL)drawGradient
{
  return self->_drawGradient;
}

- (void)setDrawGradient:(BOOL)a3
{
  self->_drawGradient = a3;
}

- (NSData)customImageData
{
  return self->_customImageData;
}

- (void)setCustomImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_glyphColor, a3);
}

- (CGSize)glyphSize
{
  double width;
  double height;
  CGSize result;

  width = self->_glyphSize.width;
  height = self->_glyphSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setGlyphSize:(CGSize)a3
{
  self->_glyphSize = a3;
}

- (BOOL)drawBackground
{
  return self->_drawBackground;
}

- (void)setDrawBackground:(BOOL)a3
{
  self->_drawBackground = a3;
}

- (BOOL)useCustomImage
{
  return self->_useCustomImage;
}

- (void)setUseCustomImage:(BOOL)a3
{
  self->_useCustomImage = a3;
}

- (BOOL)rounded
{
  return self->_rounded;
}

- (void)setRounded:(BOOL)a3
{
  self->_rounded = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)dark
{
  return self->_dark;
}

- (void)setDark:(BOOL)a3
{
  self->_dark = a3;
}

- (BOOL)highContrast
{
  return self->_highContrast;
}

- (void)setHighContrast:(BOOL)a3
{
  self->_highContrast = a3;
}

- (BOOL)outline
{
  return self->_outline;
}

- (void)setOutline:(BOOL)a3
{
  self->_outline = a3;
}

- (BOOL)drawShadowBehindGlyph
{
  return self->_drawShadowBehindGlyph;
}

- (void)setDrawShadowBehindGlyph:(BOOL)a3
{
  self->_drawShadowBehindGlyph = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_customImageData, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_drawerContext, 0);
}

- (WFWorkflowIconDrawer)initWithIcon:(id)a3
{
  return -[WFWorkflowIconDrawer initWithIcon:drawerContext:](self, "initWithIcon:drawerContext:", a3, 0);
}

- (WFWorkflowIconDrawer)initWithIcon:(id)a3 drawerContext:(id)a4
{
  id v6;
  WFWorkflowIconDrawer *v7;
  WFWorkflowIconDrawer *v8;
  WFWorkflowIconDrawer *v9;

  v6 = a3;
  v7 = -[WFWorkflowIconDrawer initWithDrawerContext:](self, "initWithDrawerContext:", a4);
  v8 = v7;
  if (v7)
  {
    -[WFWorkflowIconDrawer setIcon:](v7, "setIcon:", v6);
    v9 = v8;
  }

  return v8;
}

- (void)setIcon:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFWorkflowIconDrawer setGlyphCharacter:](self, "setGlyphCharacter:", objc_msgSend(v4, "glyphCharacter"));
  objc_msgSend(v4, "backgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[WFWorkflowIconDrawer setBackgroundColor:](self, "setBackgroundColor:", v5);
}

+ (id)imageWithIcon:(id)a3 size:(CGSize)a4
{
  return (id)objc_msgSend(a1, "imageWithIcon:size:background:", a3, 1, a4.width, a4.height);
}

+ (id)imageWithIcon:(id)a3 size:(CGSize)a4 background:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  +[WFColor whiteColor](WFColor, "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithIcon:size:scale:padding:glyphColor:background:", v9, v10, v5, width, height, 0.0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)imageWithIcon:(id)a3 size:(CGSize)a4 scale:(double)a5 padding:(CGSize)a6 glyphColor:(id)a7 background:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  double v12;
  double v13;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v8 = a8;
  height = a6.height;
  width = a6.width;
  v12 = a4.height;
  v13 = a4.width;
  v16 = a7;
  v17 = a3;
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIcon:", v17);

  objc_msgSend(v18, "setGlyphColor:", v16);
  objc_msgSend(v18, "setDrawBackground:", v8);
  objc_msgSend(v18, "imageWithSize:scale:padding:", v13, v12, a5, width, height);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)glyphImageWithIcon:(id)a3 size:(CGSize)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "imageWithIcon:size:background:", a3, 0, a4.width, a4.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "platformImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pngDataForImageWithIcon:(id)a3 size:(CGSize)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "imageWithIcon:size:", a3, a4.width, a4.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PNGRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
