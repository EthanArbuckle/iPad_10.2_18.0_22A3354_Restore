@implementation _UIScreenComplexBoundingPathUtilities

- (id)boundingPathForWindow:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  unint64_t v34;
  void *v35;
  double v36;
  int64_t v37;
  double MinX;
  double v39;
  double MinY;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  int64_t v46;
  double v47;
  double MaxY;
  double v49;
  int64_t v50;
  double MaxX;
  double v52;
  double v53;
  int64_t v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  uint64_t width;
  int64_t v68;
  int64_t v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  void *v76;
  double v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  double v87;
  double v88;
  double v89;
  _UIBoundingPathBitmap *v90;
  _UIBoundingPathBitmap *v91;
  double v92;
  double v93;
  _UIBoundingPathBitmap *v94;
  void *v95;
  _UIComplexBoundingPath *v96;
  unint64_t v97;
  NSObject *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  int64_t v104;
  int64_t v105;
  int64_t v106;
  int64_t v107;
  _UIScreenComplexBoundingPathUtilities *v108;
  unint64_t v109;
  NSObject *v110;
  NSObject *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  _UIBoundingPathBitmap *v115;
  uint64_t v116;
  unint64_t v117;
  void *v118;
  NSObject *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  _UIBoundingPathBitmap *bitmap;
  void *v125;
  id v126;
  void *v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  uint64_t v140;
  uint64_t v141;
  double v142;
  double v143;
  CGFloat v144;
  double v145;
  CGFloat v146;
  double v147;
  CGFloat v148;
  double x;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  unint64_t v155;
  NSObject *v156;
  NSObject *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  NSObject *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  NSObject *v172;
  NSObject *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  SEL v182;
  CGFloat v183;
  uint64_t v184;
  CGFloat v185;
  CGFloat v186;
  CGFloat rect;
  uint64_t recta;
  CGFloat v189;
  uint64_t y;
  CGFloat v191;
  void *v192;
  CGFloat v193;
  CGFloat v194;
  _UIScreenComplexBoundingPathUtilities *v195;
  void *v196;
  unint64_t v197;
  unint64_t v198;
  CGAffineTransform v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  uint64_t v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  uint64_t v207;
  CGAffineTransform v208;
  _QWORD v209[4];
  CGAffineTransform v210;
  _BYTE buf[24];
  uint64_t height;
  __int16 v213;
  void *v214;
  uint64_t v215;
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
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;

  v215 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_UIScreenBoundingPathUtilities _screen](self, "_screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScreenComplexBoundingPathUtilities.m"), 231, CFSTR("Cannot provide the bounding path for a window associated with a different screen."));

  }
  objc_msgSend(v6, "coordinateSpace");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v10 = v9;
  if (v9 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScreenComplexBoundingPathUtilities.m"), 235, CFSTR("Scale cannot be zero in %@"), v164);

  }
  v195 = self;
  v196 = (void *)v8;
  if (objc_msgSend(v6, "_interfaceOrientation"))
    v11 = objc_msgSend(v6, "_interfaceOrientation");
  else
    v11 = 1;
  v12 = v5;
  objc_msgSend(v12, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_effectiveSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v194 = v10;
  if ((objc_msgSend(v14, "isUISubclass") & 1) != 0)
  {
    v184 = v11;
    objc_msgSend(v14, "frame");
    v16 = v15;
    v185 = v18;
    v186 = v17;
    v20 = v19;
    objc_msgSend(v12, "screen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_referenceBounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    objc_msgSend(v12, "_currentScreenScale");
    v31 = v30;
    objc_msgSend(v12, "screen");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_displayCornerRadius");
    v34 = llround(v31 * v33);

    objc_msgSend(v14, "cornerRadiusConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topLeft");
    v37 = llround(v31 * v36);
    v189 = v27;
    v191 = v25;
    rect = v29;
    if (v37 != v34)
      goto LABEL_14;
    v216.origin.x = v16;
    v216.size.width = v185;
    v216.origin.y = v186;
    v216.size.height = v20;
    v183 = v16;
    MinX = CGRectGetMinX(v216);
    v217.origin.x = v23;
    v217.origin.y = v25;
    v217.size.width = v27;
    v217.size.height = v29;
    v39 = vabdd_f64(MinX, CGRectGetMinX(v217));
    v16 = v183;
    if (v39 >= 0.01)
      goto LABEL_14;
    v218.origin.x = v183;
    v218.size.width = v185;
    v218.origin.y = v186;
    v218.size.height = v20;
    MinY = CGRectGetMinY(v218);
    v219.origin.x = v23;
    v219.origin.y = v25;
    v219.size.width = v27;
    v219.size.height = v29;
    v41 = vabdd_f64(MinY, CGRectGetMinY(v219));
    v16 = v183;
    if (v41 < 0.01)
    {
      v43 = v185;
      v42 = v186;
      v44 = v183;
      v37 = 0;
    }
    else
    {
LABEL_14:
      v43 = v185;
      v42 = v186;
      v44 = v16;
    }
    objc_msgSend(v35, "bottomLeft");
    v46 = llround(v31 * v45);
    v182 = a2;
    if (v46 == v34)
    {
      v220.origin.x = v44;
      v220.origin.y = v42;
      v220.size.width = v43;
      v220.size.height = v20;
      v47 = CGRectGetMinX(v220);
      v221.origin.x = v23;
      v221.size.width = v189;
      v221.origin.y = v191;
      v221.size.height = rect;
      if (vabdd_f64(v47, CGRectGetMinX(v221)) < 0.01)
      {
        v222.origin.x = v44;
        v222.origin.y = v42;
        v222.size.width = v43;
        v222.size.height = v20;
        MaxY = CGRectGetMaxY(v222);
        v223.origin.x = v23;
        v223.size.width = v189;
        v223.origin.y = v191;
        v223.size.height = rect;
        if (vabdd_f64(MaxY, CGRectGetMaxY(v223)) < 0.01)
          v46 = 0;
      }
    }
    objc_msgSend(v35, "bottomRight");
    v50 = llround(v31 * v49);
    if (v50 == v34)
    {
      v224.origin.x = v44;
      v224.origin.y = v42;
      v224.size.width = v43;
      v224.size.height = v20;
      MaxX = CGRectGetMaxX(v224);
      v225.origin.x = v23;
      v225.size.width = v189;
      v225.origin.y = v191;
      v225.size.height = rect;
      if (vabdd_f64(MaxX, CGRectGetMaxX(v225)) < 0.01)
      {
        v226.origin.x = v44;
        v226.origin.y = v42;
        v226.size.width = v43;
        v226.size.height = v20;
        v52 = CGRectGetMaxY(v226);
        v227.origin.x = v23;
        v227.size.width = v189;
        v227.origin.y = v191;
        v227.size.height = rect;
        if (vabdd_f64(v52, CGRectGetMaxY(v227)) < 0.01)
          v50 = 0;
      }
    }
    objc_msgSend(v35, "topRight");
    v54 = llround(v31 * v53);
    if (v54 == v34)
    {
      v228.origin.x = v44;
      v228.origin.y = v42;
      v228.size.width = v43;
      v228.size.height = v20;
      v55 = CGRectGetMaxX(v228);
      v229.origin.x = v23;
      v229.origin.y = v191;
      v229.size.height = rect;
      v229.size.width = v189;
      if (vabdd_f64(v55, CGRectGetMaxX(v229)) < 0.01)
      {
        v230.origin.x = v44;
        v230.origin.y = v42;
        v230.size.width = v43;
        v230.size.height = v20;
        v56 = CGRectGetMinY(v230);
        v231.origin.x = v23;
        v231.origin.y = v191;
        v231.size.height = rect;
        v231.size.width = v189;
        if (vabdd_f64(v56, CGRectGetMinY(v231)) < 0.01)
          v54 = 0;
      }
    }
    v11 = v184;

    v10 = v194;
    if (v46 | v37 | v50 | v54)
    {
      objc_msgSend(v12, "windowScene");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "_effectiveSettings");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v58, "isUISubclass") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "handleFailureInMethod:object:file:lineNumber:description:", v182, v195, CFSTR("_UIScreenComplexBoundingPathUtilities.m"), 248, CFSTR("Expected UIApplicationSceneSettings subclass but got %@"), v58);

      }
      v192 = v58;
      objc_msgSend(v58, "frame");
      v60 = v59;
      v62 = v61;
      v64 = v63;
      v66 = v65;
      CGAffineTransformMakeScale(&v210, v194, v194);
      v232.origin.x = v60;
      v232.origin.y = v62;
      v232.size.width = v64;
      v232.size.height = v66;
      v233 = CGRectApplyAffineTransform(v232, &v210);
      v234 = CGRectIntegral(v233);
      width = (uint64_t)v234.size.width;
      if (v184 == 2)
      {
        v68 = v37;
        v69 = v54;
        v54 = v50;
        v50 = v46;
      }
      else if (v184 == 3)
      {
        v68 = v54;
        v69 = v50;
        v54 = v46;
        v50 = v37;
      }
      else
      {
        v68 = v46;
        v69 = v37;
        if (v184 != 4)
          goto LABEL_54;
      }
      v37 = v54;
      v54 = v50;
      v50 = v68;
      v46 = v69;
LABEL_54:
      if (width >= 0x8000 || (v103 = (uint64_t)v234.size.height, (uint64_t)v234.size.height >= 0x8000))
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v166 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v166, OS_LOG_TYPE_FAULT))
          {
            v249.origin.x = v60;
            v249.origin.y = v62;
            v249.size.width = v64;
            v249.size.height = v66;
            NSStringFromCGRect(v249);
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "windowScene");
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIWindow _fbsScene]((id *)v12);
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v174;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v175;
            *(_WORD *)&buf[22] = 2112;
            height = (uint64_t)v176;
            _os_log_fault_impl(&dword_185066000, v166, OS_LOG_TYPE_FAULT, "Scene frame %@ exceeds maximum size for bitmap data: %@ %@", buf, 0x20u);

          }
          v76 = v196;
          v118 = v192;
        }
        else
        {
          v117 = _MergedGlobals_1087;
          v76 = v196;
          v118 = v192;
          if (!_MergedGlobals_1087)
          {
            v117 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v117, (unint64_t *)&_MergedGlobals_1087);
          }
          v119 = *(NSObject **)(v117 + 8);
          if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          {
            v120 = v119;
            v241.origin.x = v60;
            v241.origin.y = v62;
            v241.size.width = v64;
            v241.size.height = v66;
            NSStringFromCGRect(v241);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "windowScene");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIWindow _fbsScene]((id *)v12);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v121;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v122;
            *(_WORD *)&buf[22] = 2112;
            height = (uint64_t)v123;
            _os_log_impl(&dword_185066000, v120, OS_LOG_TYPE_ERROR, "Scene frame %@ exceeds maximum size for bitmap data: %@ %@", buf, 0x20u);

          }
        }
        +[_UIScreenRectangularBoundingPathUtilities boundingPathForWindow:inScreenCoordinateSpace:](_UIScreenRectangularBoundingPathUtilities, "boundingPathForWindow:inScreenCoordinateSpace:", v12, v76);
        v96 = (_UIComplexBoundingPath *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v37 <= v46)
          v104 = v46;
        else
          v104 = v37;
        if (v54 <= v50)
          v105 = v50;
        else
          v105 = v54;
        if (v104 + v105 <= width
          && (v37 <= v54 ? (v106 = v54) : (v106 = v37), v46 <= v50 ? (v107 = v50) : (v107 = v46), v106 + v107 <= v103))
        {
          bitmap = v195->_bitmap;
          *(_QWORD *)buf = (uint64_t)v234.origin.x;
          *(_QWORD *)&buf[8] = (uint64_t)v234.origin.y;
          *(_QWORD *)&buf[16] = (uint64_t)v234.size.width;
          height = (uint64_t)v234.size.height;
          v209[0] = v37;
          v209[1] = v46;
          v209[2] = v50;
          v209[3] = v54;
          -[_UIBoundingPathBitmap boundingPathBitmapWithRect:cornerRadii:](bitmap, "boundingPathBitmapWithRect:cornerRadii:", buf, v209, v234.origin.x, v234.origin.y);
          v116 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          recta = (uint64_t)v234.origin.x;
          y = (uint64_t)v234.origin.y;
          if (os_variant_has_internal_diagnostics())
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v167 = v103;
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v192, "frame");
            NSStringFromCGRect(v248);
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v192, "cornerRadiusConfiguration");
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = v195;
            objc_msgSend(v168, "handleFailureInMethod:object:file:lineNumber:description:", v182, v195, CFSTR("_UIScreenComplexBoundingPathUtilities.m"), 278, CFSTR("Invalid scene settings detected: the scene frame (%@) is too small to fit the scene's rounded corners: %@. Scene settings: %@"), v169, v170, v192);

            v103 = v167;
          }
          else
          {
            v108 = v195;
            if (os_variant_has_internal_diagnostics())
            {
              v171 = v103;
              __UIFaultDebugAssertLog();
              v172 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v172, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(v192, "frame");
                NSStringFromCGRect(v250);
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v192, "cornerRadiusConfiguration");
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v177;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v178;
                _os_log_fault_impl(&dword_185066000, v172, OS_LOG_TYPE_FAULT, "Invalid scene settings detected: the scene frame (%@) is too small to fit the scene's rounded corners: %@", buf, 0x16u);

              }
              v10 = v194;
              v11 = v184;
              v103 = v171;
            }
            else
            {
              v109 = qword_1ECD7E258;
              if (!qword_1ECD7E258)
              {
                v109 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v109, (unint64_t *)&qword_1ECD7E258);
              }
              v110 = *(NSObject **)(v109 + 8);
              if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
              {
                v111 = v110;
                objc_msgSend(v192, "frame");
                NSStringFromCGRect(v240);
                v112 = v103;
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v192, "cornerRadiusConfiguration");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v113;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v114;
                _os_log_impl(&dword_185066000, v111, OS_LOG_TYPE_ERROR, "Invalid scene settings detected: the scene frame (%@) is too small to fit the scene's rounded corners: %@", buf, 0x16u);

                v103 = v112;
              }
            }
          }
          v115 = v108->_bitmap;
          *(_QWORD *)buf = recta;
          *(_QWORD *)&buf[8] = y;
          *(_QWORD *)&buf[16] = width;
          height = v103;
          -[_UIBoundingPathBitmap boundingPathBitmapWithRect:](v115, "boundingPathBitmapWithRect:", buf);
          v116 = objc_claimAutoreleasedReturnValue();
        }
        v125 = (void *)v116;
        v126 = v12;
        objc_msgSend(v126, "layer");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "bounds");
        objc_msgSend(v127, "convertRect:toLayer:", 0);
        v129 = v128;
        v131 = v130;
        v133 = v132;
        v135 = v134;

        objc_msgSend(v126, "_sceneReferenceBounds");
        v137 = v136;
        v139 = v138;
        v140 = objc_msgSend(v126, "_sceneOrientation");
        v141 = objc_msgSend(v126, "interfaceOrientation");

        v142 = _UIWindowConvertRectFromOrientationToOrientation(v140, v141, v129, v131, v133, v135, v137, v139);
        v144 = v143;
        v146 = v145;
        v148 = v147;
        CGAffineTransformMakeScale(&v208, v10, v10);
        v242.origin.x = v142;
        v242.origin.y = v144;
        v242.size.width = v146;
        v242.size.height = v148;
        v243 = CGRectApplyAffineTransform(v242, &v208);
        x = v243.origin.x;
        v150 = v243.origin.y;
        v151 = v243.size.width;
        v152 = v243.size.height;
        v118 = v192;
        if (v125)
        {
          objc_msgSend(v125, "bitmapData");
          objc_msgSend(v125, "bitmapData");
          v153 = (double)(unint64_t)v204;
          v154 = (double)*((unint64_t *)&v200 + 1);
        }
        else
        {
          v207 = 0;
          v205 = 0u;
          v206 = 0u;
          v204 = 0u;
          v200 = 0u;
          v201 = 0u;
          v202 = 0u;
          v154 = 0.0;
          v153 = 0.0;
          v203 = 0;
        }
        v76 = v196;
        v244.origin.x = _UIWindowConvertRectFromOrientationToOrientation(v11, 1, x, v150, v151, v152, v153, v154);
        v245 = CGRectIntegral(v244);
        if ((uint64_t)v245.size.width < 0x8000 && (uint64_t)v245.size.height < 0x8000)
        {
          *(_QWORD *)buf = (uint64_t)v245.origin.x;
          *(_QWORD *)&buf[8] = (uint64_t)v245.origin.y;
          *(_QWORD *)&buf[16] = (uint64_t)v245.size.width;
          height = (uint64_t)v245.size.height;
          objc_msgSend(v125, "boundingPathBitmapWithRect:", buf);
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_42;
        }
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v173 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v173, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v126, "bounds");
            NSStringFromCGRect(v251);
            v179 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "windowScene");
            v180 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIWindow _fbsScene]((id *)v126);
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v179;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v126;
            *(_WORD *)&buf[22] = 2112;
            height = (uint64_t)v180;
            v213 = 2112;
            v214 = v181;
            _os_log_fault_impl(&dword_185066000, v173, OS_LOG_TYPE_FAULT, "Window bounds %@ exceeds maximum size for bitmap data: %@ %@ %@", buf, 0x2Au);

          }
          v76 = v196;
          v118 = v192;
        }
        else
        {
          v155 = qword_1ECD7E260;
          if (!qword_1ECD7E260)
          {
            v155 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v155, (unint64_t *)&qword_1ECD7E260);
          }
          v156 = *(NSObject **)(v155 + 8);
          if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
          {
            v157 = v156;
            objc_msgSend(v126, "bounds");
            NSStringFromCGRect(v246);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "windowScene");
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIWindow _fbsScene]((id *)v126);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v158;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v126;
            *(_WORD *)&buf[22] = 2112;
            height = (uint64_t)v159;
            v213 = 2112;
            v214 = v160;
            _os_log_impl(&dword_185066000, v157, OS_LOG_TYPE_ERROR, "Window bounds %@ exceeds maximum size for bitmap data: %@ %@ %@", buf, 0x2Au);

            v76 = v196;
          }
        }
        +[_UIScreenRectangularBoundingPathUtilities boundingPathForWindow:inScreenCoordinateSpace:](_UIScreenRectangularBoundingPathUtilities, "boundingPathForWindow:inScreenCoordinateSpace:", v126, v76);
        v96 = (_UIComplexBoundingPath *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_97;
    }
  }
  else
  {

  }
  objc_msgSend(v12, "bounds");
  v71 = v70;
  v73 = v72;
  v75 = v74;
  v76 = v196;
  v193 = v77;
  objc_msgSend(v196, "convertRect:fromCoordinateSpace:", v12);
  v79 = v78;
  v81 = v80;
  v83 = v82;
  v85 = v84;
  CGAffineTransformMakeScale(&v199, v10, v10);
  v235.origin.x = v79;
  v235.origin.y = v81;
  v235.size.width = v83;
  v235.size.height = v85;
  v236 = CGRectApplyAffineTransform(v235, &v199);
  v86 = v236.origin.x;
  v87 = v236.origin.y;
  v88 = v236.size.width;
  v89 = v236.size.height;
  v90 = v195->_bitmap;
  if (!v90)
  {
    v92 = 0.0;
    goto LABEL_38;
  }
  -[_UIBoundingPathBitmap bitmapData](v90, "bitmapData");
  v91 = v195->_bitmap;
  v92 = (double)v198;
  if (!v91)
  {
LABEL_38:
    v93 = 0.0;
    goto LABEL_39;
  }
  -[_UIBoundingPathBitmap bitmapData](v91, "bitmapData");
  v93 = (double)v197;
LABEL_39:
  v237.origin.x = _UIWindowConvertRectFromOrientationToOrientation(v11, 1, v86, v87, v88, v89, v92, v93);
  v238 = CGRectIntegral(v237);
  if ((uint64_t)v238.size.width >= 0x8000 || (uint64_t)v238.size.height >= 0x8000)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v99 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
        goto LABEL_49;
      v247.origin.x = v71;
      v247.origin.y = v73;
      v247.size.width = v75;
      v247.size.height = v193;
      NSStringFromCGRect(v247);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "windowScene");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWindow _fbsScene]((id *)v12);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v100;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      height = (uint64_t)v101;
      v213 = 2112;
      v214 = v102;
      _os_log_fault_impl(&dword_185066000, v99, OS_LOG_TYPE_FAULT, "Window bounds %@ exceeds maximum size for bitmap data: %@ %@ %@", buf, 0x2Au);
    }
    else
    {
      v97 = qword_1ECD7E268;
      if (!qword_1ECD7E268)
      {
        v97 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v97, (unint64_t *)&qword_1ECD7E268);
      }
      v98 = *(NSObject **)(v97 + 8);
      if (!os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
      v99 = v98;
      v239.origin.x = v71;
      v239.origin.y = v73;
      v239.size.width = v75;
      v239.size.height = v193;
      NSStringFromCGRect(v239);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "windowScene");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWindow _fbsScene]((id *)v12);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v100;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      height = (uint64_t)v101;
      v213 = 2112;
      v214 = v102;
      _os_log_impl(&dword_185066000, v99, OS_LOG_TYPE_ERROR, "Window bounds %@ exceeds maximum size for bitmap data: %@ %@ %@", buf, 0x2Au);
    }

LABEL_49:
LABEL_50:
    +[_UIScreenRectangularBoundingPathUtilities boundingPathForWindow:inScreenCoordinateSpace:](_UIScreenRectangularBoundingPathUtilities, "boundingPathForWindow:inScreenCoordinateSpace:", v12, v196);
    v96 = (_UIComplexBoundingPath *)objc_claimAutoreleasedReturnValue();
    goto LABEL_97;
  }
  v94 = v195->_bitmap;
  *(_QWORD *)buf = (uint64_t)v238.origin.x;
  *(_QWORD *)&buf[8] = (uint64_t)v238.origin.y;
  *(_QWORD *)&buf[16] = (uint64_t)v238.size.width;
  height = (uint64_t)v238.size.height;
  -[_UIBoundingPathBitmap boundingPathBitmapWithRect:](v94, "boundingPathBitmapWithRect:", buf);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v194;
LABEL_42:
  v96 = -[_UIComplexBoundingPath initWithCoordinateSpace:orientation:scale:boundingPathBitmap:]([_UIComplexBoundingPath alloc], "initWithCoordinateSpace:orientation:scale:boundingPathBitmap:", v12, v11, v95, v10);

LABEL_97:
  return v96;
}

- (_UIScreenComplexBoundingPathUtilities)initWithScreen:(id)a3
{
  id v5;
  _UIScreenComplexBoundingPathUtilities *v6;
  uint64_t v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIScreenComplexBoundingPathUtilities;
  v6 = -[_UIScreenBoundingPathUtilities initWithScreen:](&v12, sel_initWithScreen_, v5);
  if (v6)
  {
    v7 = objc_msgSend(v5, "_screenType");
    if (v7 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_UIScreenComplexBoundingPathUtilities.m"), 130, CFSTR("Attempted to initialize %@ with an unsupported screen: %@"), v11, v5);

    }
    v6->_type = v7;
    -[_UIScreenComplexBoundingPathUtilities _loadBitmapForScreen:type:](v6, "_loadBitmapForScreen:type:", v5, v7);
  }

  return v6;
}

+ (BOOL)isScreenSupported:(id)a3
{
  id v3;
  unint64_t v4;
  BOOL v5;

  v3 = a3;
  v5 = objc_msgSend(v3, "_isEmbeddedScreen")
    && (v4 = objc_msgSend(v3, "_screenType"), v4 != -1)
    && _UIScreenCornerRadiusForType(v4) != 0.0;

  return v5;
}

- (void)_loadBitmapForScreen:(id)a3 type:(int64_t)a4
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  _UIBoundingPathBitmap *v29;
  id v30;
  _UIBoundingPathBitmap *bitmap;
  double v32;
  _UIBoundingPathBitmap *v33;
  uint64_t v34;
  _UIBoundingPathBitmap *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v7 = a3;
  objc_msgSend(v7, "_referenceBounds");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "scale");
  v13 = v12;

  v14 = (unint64_t)round(v13);
  v15 = _UIScreenNativeDisplayBoundsSizeForType(a4);
  v17 = v16;
  v18 = _UIScreenReferenceBoundsSizeForType(a4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BoundingPathBitmap-%ldx%ld-%ldx%ld-%.2fx"), v15, v17, (uint64_t)v18, (uint64_t)v19, _UIScreenScaleForType(a4));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((unint64_t)(a4 - 17) < 6 || a4 == 40)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v20, CFSTR("A"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = v20;
  }
  v23 = v22;
  v24 = (double)v14;

  __UIKitSharedBoundingPathDataManager();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScreenComplexBoundingPathUtilities.m"), 351, CFSTR("The bounding path data manager should never be nil. This likely means that the BoundingPathData.bundle inside UIKitCore.framework is missing."));

  }
  v26 = v9 * v24;
  objc_msgSend(v25, "dataNamed:", v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "data");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v43 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v28, &v43);
    v29 = (_UIBoundingPathBitmap *)objc_claimAutoreleasedReturnValue();
    v30 = v43;
    bitmap = self->_bitmap;
    self->_bitmap = v29;

    if (!self->_bitmap || v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScreenComplexBoundingPathUtilities.m"), 357, CFSTR("Failed to deserialize bounding path bitmap data. Error: %@"), v30);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScreenComplexBoundingPathUtilities.m"), 353, CFSTR("Failed to load bounding path bitmap data from the asset manager for asset name: %@"), v23);

  }
  v32 = v11 * v24;
  v33 = self->_bitmap;
  if (v33)
  {
    -[_UIBoundingPathBitmap bitmapData](v33, "bitmapData");
    v34 = v42;
  }
  else
  {
    v34 = 0;
  }
  if (v34 != (unint64_t)v26
    || ((v35 = self->_bitmap) == 0 ? (v36 = 0) : (-[_UIBoundingPathBitmap bitmapData](v35, "bitmapData"), v36 = v41),
        v36 != (unint64_t)v32))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScreenComplexBoundingPathUtilities.m"), 381, CFSTR("The loaded bitmap does not match the expected size. Expected size: {width=%ld, height=%ld} Bitmap: %@"), (unint64_t)v26, (unint64_t)v32, self->_bitmap);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitmap, 0);
}

@end
