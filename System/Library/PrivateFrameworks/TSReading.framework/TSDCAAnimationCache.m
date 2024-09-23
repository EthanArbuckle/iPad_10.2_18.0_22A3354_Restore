@implementation TSDCAAnimationCache

- (BOOL)p_setupAndCacheAnimationValues:(BOOL)a3 verifyOnly:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id v7;
  char isKindOfClass;
  CAAnimation *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSDictionary *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSDictionary *v28;
  _BOOL8 v29;
  void *v30;
  TSDCAAnimationCache *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  id v37;
  CGFloat v38;
  CGFloat v39;
  int v40;
  int64_t cacheValuesCount;
  uint64_t v42;
  uint64_t k;
  CGPoint *v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  id v48;
  double v49;
  int v50;
  int64_t v51;
  uint64_t m;
  double v53;
  double v54;
  CGColor *v55;
  id v56;
  double v57;
  int v58;
  int64_t v59;
  uint64_t n;
  double v61;
  double v62;
  id v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  int v68;
  int64_t v69;
  uint64_t v70;
  uint64_t ii;
  CGRect *v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGImage *v78;
  id v79;
  int v80;
  int64_t v81;
  uint64_t jj;
  double v83;
  id v84;
  int v85;
  int64_t v86;
  uint64_t kk;
  double v88;
  id v89;
  double v90;
  int v91;
  int64_t v92;
  uint64_t mm;
  double v94;
  double v95;
  id v96;
  CGFloat v97;
  CGFloat v98;
  int v99;
  int64_t v100;
  uint64_t v101;
  uint64_t nn;
  CGPoint *v103;
  double v104;
  CGFloat v105;
  CGFloat v106;
  id v107;
  int v108;
  int64_t v109;
  uint64_t v110;
  uint64_t i1;
  CATransform3D *transformCache;
  double v113;
  id v114;
  _OWORD *p_m11;
  id v116;
  double v117;
  int v118;
  int64_t v119;
  uint64_t i2;
  double v121;
  double v122;
  id v123;
  double v124;
  int v125;
  int64_t v126;
  uint64_t i3;
  double v128;
  double v129;
  id v130;
  double v131;
  int v132;
  int64_t v133;
  uint64_t i4;
  double v135;
  double v136;
  id v137;
  double v138;
  int v139;
  int64_t v140;
  uint64_t i5;
  double v142;
  double v143;
  id v144;
  double v145;
  int v146;
  int64_t v147;
  uint64_t i6;
  double v149;
  double v150;
  id v151;
  double v152;
  int v153;
  int64_t v154;
  uint64_t i7;
  double v156;
  double v157;
  id v158;
  double v159;
  int v160;
  int64_t v161;
  uint64_t i8;
  double v163;
  double v164;
  id v165;
  CGFloat v166;
  CGFloat v167;
  int v168;
  int64_t v169;
  uint64_t v170;
  uint64_t i9;
  CGPoint *v172;
  double v173;
  CGFloat v174;
  CGFloat v175;
  id v176;
  double v177;
  int v178;
  int64_t v179;
  uint64_t i10;
  double v181;
  double v182;
  id v183;
  double v184;
  int v185;
  int64_t v186;
  uint64_t i11;
  double v188;
  double v189;
  id v190;
  double v191;
  int v192;
  int64_t v193;
  uint64_t i12;
  double v195;
  double v196;
  id v197;
  double v198;
  int v199;
  int64_t v200;
  uint64_t i13;
  double v202;
  double v203;
  _BOOL4 v205;
  void *v206;
  void *v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  _BYTE v224[128];
  _BYTE v225[128];
  _QWORD v226[3];

  v4 = a4;
  v5 = a3;
  v226[1] = *MEMORY[0x24BDAC8D0];
  v7 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  if (-[TSDCAAnimationCache animation](self, "animation"))
  {
    -[TSDCAAnimationCache animation](self, "animation");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = -[TSDCAAnimationCache animation](self, "animation");
    if ((isKindOfClass & 1) != 0)
    {
      v10 = -[CAAnimation animations](v9, "animations");
    }
    else
    {
      v226[0] = v9;
      v10 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v226, 1);
    }
    v11 = (void *)v10;
  }
  else
  {
    v11 = 0;
  }
  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v220, v225, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v221;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v221 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 8 * i), "keyPath"));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v220, v225, 16);
    }
    while (v13);
  }
  v205 = v5;
  v206 = v7;
  v16 = (NSDictionary *)objc_opt_new();
  v216 = 0u;
  v217 = 0u;
  v218 = 0u;
  v219 = 0u;
  v17 = (void *)objc_msgSend(MEMORY[0x24BDE5630], "TSD_supportedKeyPaths");
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v216, v224, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 1;
    v21 = *(_QWORD *)v217;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v217 != v21)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v216 + 1) + 8 * j);
        v24 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", v23);
        if (v24
          || (v24 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", v23)) != 0)
        {
          -[NSDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v24, v23);
        }
        if (v4)
        {
          v25 = -[NSDictionary objectForKeyedSubscript:](-[TSDCAAnimationCache initialValues](self, "initialValues"), "objectForKeyedSubscript:", v23);
          if ((objc_msgSend(v24, "isEqual:", v25) & 1) == 0)
          {
            v207 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v26 = v19;
            v27 = v21;
            v28 = v16;
            v29 = v4;
            v30 = v17;
            v31 = self;
            v32 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCAAnimationCache p_setupAndCacheAnimationValues:verifyOnly:]");
            v33 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m");
            v34 = v32;
            self = v31;
            v17 = v30;
            v4 = v29;
            v16 = v28;
            v21 = v27;
            v19 = v26;
            objc_msgSend(v207, "handleFailureInFunction:file:lineNumber:description:", v34, v33, 645, CFSTR("Initial value not equal! Current:%@, Cached:%@"), v24, v25);
            v20 = 0;
          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v216, v224, 16);
    }
    while (v19);
    if (v4)
      goto LABEL_28;
  }
  else
  {
    v20 = 1;
    if (v4)
    {
LABEL_28:

      v35 = v206;
      goto LABEL_253;
    }
  }
  v35 = v206;
  if (v205)
  {
    -[CAAnimation duration](self->_animation, "duration");
    self->_cacheValuesCount = (uint64_t)(ceil(v36 * 600.0) + 1.0);
  }
  self->_initialValues = v16;
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("anchorPoint")))
  {
    v37 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("anchorPoint"));
  }
  else
  {
    v37 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("anchorPoint"));
  }
  objc_msgSend(v37, "CGPointValue");
  self->_anchorPointInitialValue.x = v38;
  self->_anchorPointInitialValue.y = v39;
  v40 = objc_msgSend(v206, "containsObject:", CFSTR("anchorPoint"));
  self->_anchorPointAnimationExists = v40;
  if (v205)
  {
    if (v40)
    {
      self->_anchorPointCache = (CGPoint *)malloc_type_calloc(0x10uLL, self->_cacheValuesCount, 0x2B011792uLL);
      cacheValuesCount = self->_cacheValuesCount;
      if (cacheValuesCount >= 1)
      {
        v42 = 0;
        for (k = 0; k < cacheValuesCount; ++k)
        {
          v44 = &self->_anchorPointCache[v42];
          v45 = (double)k / (double)(cacheValuesCount - 2);
          if (v45 > 1.0)
            v45 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("anchorPoint"), self, v45 * self->_animationDuration), "CGPointValue");
          v44->x = v46;
          v44->y = v47;
          cacheValuesCount = self->_cacheValuesCount;
          ++v42;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("anchorPointZ")))
  {
    v48 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("anchorPointZ"));
  }
  else
  {
    v48 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("anchorPointZ"));
  }
  objc_msgSend(v48, "doubleValue");
  self->_anchorPointZInitialValue = v49;
  v50 = objc_msgSend(v206, "containsObject:", CFSTR("anchorPointZ"));
  self->_anchorPointZAnimationExists = v50;
  if (v205)
  {
    if (v50)
    {
      self->_anchorPointZCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x9151739FuLL);
      v51 = self->_cacheValuesCount;
      if (v51 >= 1)
      {
        for (m = 0; m < v51; ++m)
        {
          v53 = (double)m / (double)(v51 - 2);
          if (v53 > 1.0)
            v53 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("anchorPointZ"), self, v53 * self->_animationDuration), "doubleValue");
          self->_anchorPointZCache[m] = v54;
          v51 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("borderColor")))
  {
    v55 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("borderColor"));
  }
  else
  {
    v55 = (CGColor *)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("borderColor"));
  }
  self->_borderColorInitialValue = v55;
  self->_borderColorAnimationExists = objc_msgSend(v206, "containsObject:", CFSTR("borderColor"));
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("borderWidth")))
  {
    v56 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("borderWidth"));
  }
  else
  {
    v56 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("borderWidth"));
  }
  objc_msgSend(v56, "doubleValue");
  self->_borderWidthInitialValue = v57;
  v58 = objc_msgSend(v206, "containsObject:", CFSTR("borderWidth"));
  self->_borderWidthAnimationExists = v58;
  if (v205)
  {
    if (v58)
    {
      self->_borderWidthCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0xF876FCEDuLL);
      v59 = self->_cacheValuesCount;
      if (v59 >= 1)
      {
        for (n = 0; n < v59; ++n)
        {
          v61 = (double)n / (double)(v59 - 2);
          if (v61 > 1.0)
            v61 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("borderWidth"), self, v61 * self->_animationDuration), "doubleValue");
          self->_borderWidthCache[n] = v62;
          v59 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("bounds")))
  {
    v63 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("bounds"));
  }
  else
  {
    v63 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("bounds"));
  }
  objc_msgSend(v63, "CGRectValue");
  self->_boundsInitialValue.origin.x = v64;
  self->_boundsInitialValue.origin.y = v65;
  self->_boundsInitialValue.size.width = v66;
  self->_boundsInitialValue.size.height = v67;
  v68 = objc_msgSend(v206, "containsObject:", CFSTR("bounds"));
  self->_boundsAnimationExists = v68;
  if (v205)
  {
    if (v68)
    {
      self->_boundsCache = (CGRect *)malloc_type_calloc(0x20uLL, self->_cacheValuesCount, 0xFF7426DEuLL);
      v69 = self->_cacheValuesCount;
      if (v69 >= 1)
      {
        v70 = 0;
        for (ii = 0; ii < v69; ++ii)
        {
          v72 = &self->_boundsCache[v70];
          v73 = (double)ii / (double)(v69 - 2);
          if (v73 > 1.0)
            v73 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("bounds"), self, v73 * self->_animationDuration), "CGRectValue");
          v72->origin.x = v74;
          v72->origin.y = v75;
          v72->size.width = v76;
          v72->size.height = v77;
          v69 = self->_cacheValuesCount;
          ++v70;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("contents")))
  {
    v78 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("contents"));
  }
  else
  {
    v78 = (CGImage *)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("contents"));
  }
  self->_contentsInitialValue = v78;
  self->_contentsAnimationExists = objc_msgSend(v206, "containsObject:", CFSTR("contents"));
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("doubleSided")))
  {
    v79 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("doubleSided"));
  }
  else
  {
    v79 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("doubleSided"));
  }
  self->_doubleSidedInitialValue = objc_msgSend(v79, "BOOLValue");
  v80 = objc_msgSend(v206, "containsObject:", CFSTR("doubleSided"));
  self->_doubleSidedAnimationExists = v80;
  if (v205)
  {
    if (v80)
    {
      self->_doubleSidedCache = (BOOL *)malloc_type_calloc(1uLL, self->_cacheValuesCount, 0x5332C594uLL);
      v81 = self->_cacheValuesCount;
      if (v81 >= 1)
      {
        for (jj = 0; jj < v81; ++jj)
        {
          v83 = (double)jj / (double)(v81 - 2);
          if (v83 > 1.0)
            v83 = 1.0;
          self->_doubleSidedCache[jj] = objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("doubleSided"), self, v83 * self->_animationDuration), "BOOLValue");
          v81 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("hidden")))
  {
    v84 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("hidden"));
  }
  else
  {
    v84 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("hidden"));
  }
  self->_hiddenInitialValue = objc_msgSend(v84, "BOOLValue");
  v85 = objc_msgSend(v206, "containsObject:", CFSTR("hidden"));
  self->_hiddenAnimationExists = v85;
  if (v205)
  {
    if (v85)
    {
      self->_hiddenCache = (BOOL *)malloc_type_calloc(1uLL, self->_cacheValuesCount, 0x21335BB9uLL);
      v86 = self->_cacheValuesCount;
      if (v86 >= 1)
      {
        for (kk = 0; kk < v86; ++kk)
        {
          v88 = (double)kk / (double)(v86 - 2);
          if (v88 > 1.0)
            v88 = 1.0;
          self->_hiddenCache[kk] = objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("hidden"), self, v88 * self->_animationDuration), "BOOLValue");
          v86 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("opacity")))
  {
    v89 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("opacity"));
  }
  else
  {
    v89 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("opacity"));
  }
  objc_msgSend(v89, "doubleValue");
  self->_opacityInitialValue = v90;
  v91 = objc_msgSend(v206, "containsObject:", CFSTR("opacity"));
  self->_opacityAnimationExists = v91;
  if (v205)
  {
    if (v91)
    {
      self->_opacityCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0xE8ED81EEuLL);
      v92 = self->_cacheValuesCount;
      if (v92 >= 1)
      {
        for (mm = 0; mm < v92; ++mm)
        {
          v94 = (double)mm / (double)(v92 - 2);
          if (v94 > 1.0)
            v94 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("opacity"), self, v94 * self->_animationDuration), "doubleValue");
          self->_opacityCache[mm] = v95;
          v92 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("position")))
  {
    v96 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("position"));
  }
  else
  {
    v96 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("position"));
  }
  objc_msgSend(v96, "CGPointValue");
  self->_positionInitialValue.x = v97;
  self->_positionInitialValue.y = v98;
  v99 = objc_msgSend(v206, "containsObject:", CFSTR("position"));
  self->_positionAnimationExists = v99;
  if (v205)
  {
    if (v99)
    {
      self->_positionCache = (CGPoint *)malloc_type_calloc(0x10uLL, self->_cacheValuesCount, 0x8AA5F6DBuLL);
      v100 = self->_cacheValuesCount;
      if (v100 >= 1)
      {
        v101 = 0;
        for (nn = 0; nn < v100; ++nn)
        {
          v103 = &self->_positionCache[v101];
          v104 = (double)nn / (double)(v100 - 2);
          if (v104 > 1.0)
            v104 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("position"), self, v104 * self->_animationDuration), "CGPointValue");
          v103->x = v105;
          v103->y = v106;
          v100 = self->_cacheValuesCount;
          ++v101;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform")))
  {
    v107 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform"));
    if (v107)
    {
LABEL_120:
      objc_msgSend(v107, "CATransform3DValue");
      goto LABEL_123;
    }
  }
  else
  {
    v107 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform"));
    if (v107)
      goto LABEL_120;
  }
  v214 = 0u;
  v215 = 0u;
  v212 = 0u;
  v213 = 0u;
  v210 = 0u;
  v211 = 0u;
  v208 = 0u;
  v209 = 0u;
LABEL_123:
  *(_OWORD *)&self->_transformInitialValue.m31 = v212;
  *(_OWORD *)&self->_transformInitialValue.m33 = v213;
  *(_OWORD *)&self->_transformInitialValue.m41 = v214;
  *(_OWORD *)&self->_transformInitialValue.m43 = v215;
  *(_OWORD *)&self->_transformInitialValue.m11 = v208;
  *(_OWORD *)&self->_transformInitialValue.m13 = v209;
  *(_OWORD *)&self->_transformInitialValue.m21 = v210;
  *(_OWORD *)&self->_transformInitialValue.m23 = v211;
  v108 = objc_msgSend(v206, "containsObject:", CFSTR("transform"));
  self->_transformAnimationExists = v108;
  if (v205)
  {
    if (v108)
    {
      self->_transformCache = (CATransform3D *)malloc_type_calloc(0x80uLL, self->_cacheValuesCount, 0xD7642468uLL);
      v109 = self->_cacheValuesCount;
      if (v109 >= 1)
      {
        v110 = 0;
        for (i1 = 0; i1 < v109; ++i1)
        {
          transformCache = self->_transformCache;
          v113 = (double)i1 / (double)(v109 - 2);
          if (v113 > 1.0)
            v113 = 1.0;
          v114 = -[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform"), self, v113 * self->_animationDuration);
          if (v114)
          {
            objc_msgSend(v114, "CATransform3DValue");
          }
          else
          {
            v214 = 0u;
            v215 = 0u;
            v212 = 0u;
            v213 = 0u;
            v210 = 0u;
            v211 = 0u;
            v208 = 0u;
            v209 = 0u;
          }
          p_m11 = (_OWORD *)&transformCache[v110].m11;
          p_m11[2] = v210;
          p_m11[3] = v211;
          *p_m11 = v208;
          p_m11[1] = v209;
          p_m11[6] = v214;
          p_m11[7] = v215;
          p_m11[4] = v212;
          p_m11[5] = v213;
          v109 = self->_cacheValuesCount;
          ++v110;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.rotation")))
  {
    v116 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.rotation"));
  }
  else
  {
    v116 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform.rotation"));
  }
  objc_msgSend(v116, "doubleValue");
  self->_transformRotationInitialValue = v117;
  v118 = objc_msgSend(v206, "containsObject:", CFSTR("transform.rotation"));
  self->_transformRotationAnimationExists = v118;
  if (v205)
  {
    if (v118)
    {
      self->_transformRotationCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x87ADA1BDuLL);
      v119 = self->_cacheValuesCount;
      if (v119 >= 1)
      {
        for (i2 = 0; i2 < v119; ++i2)
        {
          v121 = (double)i2 / (double)(v119 - 2);
          if (v121 > 1.0)
            v121 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform.rotation"), self, v121 * self->_animationDuration), "doubleValue");
          self->_transformRotationCache[i2] = v122;
          v119 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.rotation.x")))
  {
    v123 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.rotation.x"));
  }
  else
  {
    v123 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform.rotation.x"));
  }
  objc_msgSend(v123, "doubleValue");
  self->_transformRotationXInitialValue = v124;
  v125 = objc_msgSend(v206, "containsObject:", CFSTR("transform.rotation.x"));
  self->_transformRotationXAnimationExists = v125;
  if (v205)
  {
    if (v125)
    {
      self->_transformRotationXCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0xB2EEC662uLL);
      v126 = self->_cacheValuesCount;
      if (v126 >= 1)
      {
        for (i3 = 0; i3 < v126; ++i3)
        {
          v128 = (double)i3 / (double)(v126 - 2);
          if (v128 > 1.0)
            v128 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform.rotation.x"), self, v128 * self->_animationDuration), "doubleValue");
          self->_transformRotationXCache[i3] = v129;
          v126 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.rotation.y")))
  {
    v130 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.rotation.y"));
  }
  else
  {
    v130 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform.rotation.y"));
  }
  objc_msgSend(v130, "doubleValue");
  self->_transformRotationYInitialValue = v131;
  v132 = objc_msgSend(v206, "containsObject:", CFSTR("transform.rotation.y"));
  self->_transformRotationYAnimationExists = v132;
  if (v205)
  {
    if (v132)
    {
      self->_transformRotationYCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x524F4D6FuLL);
      v133 = self->_cacheValuesCount;
      if (v133 >= 1)
      {
        for (i4 = 0; i4 < v133; ++i4)
        {
          v135 = (double)i4 / (double)(v133 - 2);
          if (v135 > 1.0)
            v135 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform.rotation.y"), self, v135 * self->_animationDuration), "doubleValue");
          self->_transformRotationYCache[i4] = v136;
          v133 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.rotation.z")))
  {
    v137 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.rotation.z"));
  }
  else
  {
    v137 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform.rotation.z"));
  }
  objc_msgSend(v137, "doubleValue");
  self->_transformRotationZInitialValue = v138;
  v139 = objc_msgSend(v206, "containsObject:", CFSTR("transform.rotation.z"));
  self->_transformRotationZAnimationExists = v139;
  if (v205)
  {
    if (v139)
    {
      self->_transformRotationZCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x9491BFCCuLL);
      v140 = self->_cacheValuesCount;
      if (v140 >= 1)
      {
        for (i5 = 0; i5 < v140; ++i5)
        {
          v142 = (double)i5 / (double)(v140 - 2);
          if (v142 > 1.0)
            v142 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform.rotation.z"), self, v142 * self->_animationDuration), "doubleValue");
          self->_transformRotationZCache[i5] = v143;
          v140 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.scale.x")))
  {
    v144 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.scale.x"));
  }
  else
  {
    v144 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform.scale.x"));
  }
  objc_msgSend(v144, "doubleValue");
  self->_transformScaleXInitialValue = v145;
  v146 = objc_msgSend(v206, "containsObject:", CFSTR("transform.scale.x"));
  self->_transformScaleXAnimationExists = v146;
  if (v205)
  {
    if (v146)
    {
      self->_transformScaleXCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x804E1FF1uLL);
      v147 = self->_cacheValuesCount;
      if (v147 >= 1)
      {
        for (i6 = 0; i6 < v147; ++i6)
        {
          v149 = (double)i6 / (double)(v147 - 2);
          if (v149 > 1.0)
            v149 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform.scale.x"), self, v149 * self->_animationDuration), "doubleValue");
          self->_transformScaleXCache[i6] = v150;
          v147 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.scale.y")))
  {
    v151 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.scale.y"));
  }
  else
  {
    v151 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform.scale.y"));
  }
  objc_msgSend(v151, "doubleValue");
  self->_transformScaleYInitialValue = v152;
  v153 = objc_msgSend(v206, "containsObject:", CFSTR("transform.scale.y"));
  self->_transformScaleYAnimationExists = v153;
  if (v205)
  {
    if (v153)
    {
      self->_transformScaleYCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x3BFCA566uLL);
      v154 = self->_cacheValuesCount;
      if (v154 >= 1)
      {
        for (i7 = 0; i7 < v154; ++i7)
        {
          v156 = (double)i7 / (double)(v154 - 2);
          if (v156 > 1.0)
            v156 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform.scale.y"), self, v156 * self->_animationDuration), "doubleValue");
          self->_transformScaleYCache[i7] = v157;
          v154 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.scale.xy")))
  {
    v158 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.scale.xy"));
  }
  else
  {
    v158 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform.scale.xy"));
  }
  objc_msgSend(v158, "doubleValue");
  self->_transformScaleXYInitialValue = v159;
  v160 = objc_msgSend(v206, "containsObject:", CFSTR("transform.scale.xy"));
  self->_transformScaleXYAnimationExists = v160;
  if (v205)
  {
    if (v160)
    {
      self->_transformScaleXYCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x9B527B3uLL);
      v161 = self->_cacheValuesCount;
      if (v161 >= 1)
      {
        for (i8 = 0; i8 < v161; ++i8)
        {
          v163 = (double)i8 / (double)(v161 - 2);
          if (v163 > 1.0)
            v163 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform.scale.xy"), self, v163 * self->_animationDuration), "doubleValue");
          self->_transformScaleXYCache[i8] = v164;
          v161 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.translation")))
  {
    v165 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.translation"));
  }
  else
  {
    v165 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform.translation"));
  }
  objc_msgSend(v165, "CGPointValue");
  self->_transformTranslationInitialValue.x = v166;
  self->_transformTranslationInitialValue.y = v167;
  v168 = objc_msgSend(v206, "containsObject:", CFSTR("transform.translation"));
  self->_transformTranslationAnimationExists = v168;
  if (v205)
  {
    if (v168)
    {
      self->_transformTranslationCache = (CGPoint *)malloc_type_calloc(0x10uLL, self->_cacheValuesCount, 0x874AB9ADuLL);
      v169 = self->_cacheValuesCount;
      if (v169 >= 1)
      {
        v170 = 0;
        for (i9 = 0; i9 < v169; ++i9)
        {
          v172 = &self->_transformTranslationCache[v170];
          v173 = (double)i9 / (double)(v169 - 2);
          if (v173 > 1.0)
            v173 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform.translation"), self, v173 * self->_animationDuration), "CGPointValue");
          v172->x = v174;
          v172->y = v175;
          v169 = self->_cacheValuesCount;
          ++v170;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.translation.x")))
  {
    v176 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.translation.x"));
  }
  else
  {
    v176 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform.translation.x"));
  }
  objc_msgSend(v176, "doubleValue");
  self->_transformTranslationXInitialValue = v177;
  v178 = objc_msgSend(v206, "containsObject:", CFSTR("transform.translation.x"));
  self->_transformTranslationXAnimationExists = v178;
  if (v205)
  {
    if (v178)
    {
      self->_transformTranslationXCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x933D5258uLL);
      v179 = self->_cacheValuesCount;
      if (v179 >= 1)
      {
        for (i10 = 0; i10 < v179; ++i10)
        {
          v181 = (double)i10 / (double)(v179 - 2);
          if (v181 > 1.0)
            v181 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform.translation.x"), self, v181 * self->_animationDuration), "doubleValue");
          self->_transformTranslationXCache[i10] = v182;
          v179 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.translation.y")))
  {
    v183 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.translation.y"));
  }
  else
  {
    v183 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform.translation.y"));
  }
  objc_msgSend(v183, "doubleValue");
  self->_transformTranslationYInitialValue = v184;
  v185 = objc_msgSend(v206, "containsObject:", CFSTR("transform.translation.y"));
  self->_transformTranslationYAnimationExists = v185;
  if (v205)
  {
    if (v185)
    {
      self->_transformTranslationYCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0xC95C124BuLL);
      v186 = self->_cacheValuesCount;
      if (v186 >= 1)
      {
        for (i11 = 0; i11 < v186; ++i11)
        {
          v188 = (double)i11 / (double)(v186 - 2);
          if (v188 > 1.0)
            v188 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform.translation.y"), self, v188 * self->_animationDuration), "doubleValue");
          self->_transformTranslationYCache[i11] = v189;
          v186 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.translation.z")))
  {
    v190 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("transform.translation.z"));
  }
  else
  {
    v190 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("transform.translation.z"));
  }
  objc_msgSend(v190, "doubleValue");
  self->_transformTranslationZInitialValue = v191;
  v192 = objc_msgSend(v206, "containsObject:", CFSTR("transform.translation.z"));
  self->_transformTranslationZAnimationExists = v192;
  if (v205)
  {
    if (v192)
    {
      self->_transformTranslationZCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0x2383D89EuLL);
      v193 = self->_cacheValuesCount;
      if (v193 >= 1)
      {
        for (i12 = 0; i12 < v193; ++i12)
        {
          v195 = (double)i12 / (double)(v193 - 2);
          if (v195 > 1.0)
            v195 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("transform.translation.z"), self, v195 * self->_animationDuration), "doubleValue");
          self->_transformTranslationZCache[i12] = v196;
          v193 = self->_cacheValuesCount;
        }
      }
    }
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("zPosition")))
  {
    v197 = -[NSDictionary objectForKeyedSubscript:](self->_overrideInitialValuesDict, "objectForKeyedSubscript:", CFSTR("zPosition"));
  }
  else
  {
    v197 = (id)-[CALayer valueForKeyPath:](-[TSDCAAnimationCache layer](self, "layer"), "valueForKeyPath:", CFSTR("zPosition"));
  }
  objc_msgSend(v197, "doubleValue");
  self->_zPositionInitialValue = v198;
  v199 = objc_msgSend(v206, "containsObject:", CFSTR("zPosition"));
  self->_zPositionAnimationExists = v199;
  if (v205)
  {
    if (v199)
    {
      self->_zPositionCache = (double *)malloc_type_calloc(8uLL, self->_cacheValuesCount, 0xACDB41E1uLL);
      v200 = self->_cacheValuesCount;
      if (v200 >= 1)
      {
        for (i13 = 0; i13 < v200; ++i13)
        {
          v202 = (double)i13 / (double)(v200 - 2);
          if (v202 > 1.0)
            v202 = 1.0;
          objc_msgSend(-[CAAnimation TSD_valueForKeyPath:atTime:animationCache:](self->_animation, "TSD_valueForKeyPath:atTime:animationCache:", CFSTR("zPosition"), self, v202 * self->_animationDuration), "doubleValue");
          self->_zPositionCache[i13] = v203;
          v200 = self->_cacheValuesCount;
        }
      }
    }
  }
LABEL_253:

  return v20 & 1;
}

- (BOOL)verifyCache
{
  return -[TSDCAAnimationCache p_setupAndCacheAnimationValues:verifyOnly:](self, "p_setupAndCacheAnimationValues:verifyOnly:", 1, 1);
}

- (TSDCAAnimationCache)initWithLayer:(id)a3 animation:(id)a4 overrideInitialValues:(id)a5 cacheAnimationValues:(BOOL)a6
{
  _BOOL8 v6;
  TSDCAAnimationCache *v10;
  TSDCAAnimationCache *v11;
  double v12;
  objc_super v14;

  v6 = a6;
  v14.receiver = self;
  v14.super_class = (Class)TSDCAAnimationCache;
  v10 = -[TSDCAAnimationCache init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_layer = (CALayer *)a3;
    v10->_animation = (CAAnimation *)a4;
    objc_msgSend(a4, "duration");
    v11->_animationDuration = v12;
    v11->_overrideInitialValuesDict = (NSDictionary *)objc_msgSend(a5, "copy");
    -[TSDCAAnimationCache p_setupAndCacheAnimationValues:verifyOnly:](v11, "p_setupAndCacheAnimationValues:verifyOnly:", v6, 0);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_anchorPointCache);
  free(self->_anchorPointZCache);
  free(self->_borderWidthCache);
  free(self->_boundsCache);
  free(self->_doubleSidedCache);
  free(self->_hiddenCache);
  free(self->_opacityCache);
  free(self->_positionCache);
  free(self->_transformCache);
  free(self->_transformRotationCache);
  free(self->_transformRotationXCache);
  free(self->_transformRotationYCache);
  free(self->_transformRotationZCache);
  free(self->_transformScaleXCache);
  free(self->_transformScaleYCache);
  free(self->_transformScaleXYCache);
  free(self->_transformTranslationCache);
  free(self->_transformTranslationXCache);
  free(self->_transformTranslationYCache);
  free(self->_transformTranslationZCache);
  free(self->_zPositionCache);
  v3.receiver = self;
  v3.super_class = (Class)TSDCAAnimationCache;
  -[TSDCAAnimationCache dealloc](&v3, sel_dealloc);
}

- (CGPoint)anchorPointCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;
  CGPoint *v7;
  double x;
  double y;
  CGPoint result;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  v7 = &self->_anchorPointCache[(uint64_t)v6];
  x = v7->x;
  y = v7->y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)anchorPointZCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_anchorPointZCache[(uint64_t)v6];
}

- (double)borderWidthCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_borderWidthCache[(uint64_t)v6];
}

- (CGRect)boundsCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;
  CGRect *v7;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  v7 = &self->_boundsCache[(uint64_t)v6];
  x = v7->origin.x;
  y = v7->origin.y;
  width = v7->size.width;
  height = v7->size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)doubleSidedCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_doubleSidedCache[(uint64_t)v6];
}

- (BOOL)hiddenCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_hiddenCache[(uint64_t)v6];
}

- (double)opacityCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_opacityCache[(uint64_t)v6];
}

- (CGPoint)positionCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;
  CGPoint *v7;
  double x;
  double y;
  CGPoint result;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  v7 = &self->_positionCache[(uint64_t)v6];
  x = v7->x;
  y = v7->y;
  result.y = y;
  result.x = x;
  return result;
}

- (CATransform3D)transformCachedValueAtTime:(SEL)a3 layer:(double)a4 animation:(id)a5
{
  CGFloat m14;
  double v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  m14 = self->m14;
  v7 = a4 / self->m13 * (double)*(uint64_t *)&m14;
  if (v7 > (double)(*(_QWORD *)&m14 - 1))
    v7 = (double)(*(_QWORD *)&m14 - 1);
  if (v7 < 0.0)
    v7 = 0.0;
  v8 = (_OWORD *)(*(_QWORD *)&self->m41 + ((uint64_t)v7 << 7));
  v9 = v8[5];
  *(_OWORD *)&retstr->m31 = v8[4];
  *(_OWORD *)&retstr->m33 = v9;
  v10 = v8[7];
  *(_OWORD *)&retstr->m41 = v8[6];
  *(_OWORD *)&retstr->m43 = v10;
  v11 = v8[1];
  *(_OWORD *)&retstr->m11 = *v8;
  *(_OWORD *)&retstr->m13 = v11;
  v12 = v8[3];
  *(_OWORD *)&retstr->m21 = v8[2];
  *(_OWORD *)&retstr->m23 = v12;
  return self;
}

- (double)transformRotationCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_transformRotationCache[(uint64_t)v6];
}

- (double)transformRotationXCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_transformRotationXCache[(uint64_t)v6];
}

- (double)transformRotationYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_transformRotationYCache[(uint64_t)v6];
}

- (double)transformRotationZCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_transformRotationZCache[(uint64_t)v6];
}

- (double)transformScaleXCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_transformScaleXCache[(uint64_t)v6];
}

- (double)transformScaleYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_transformScaleYCache[(uint64_t)v6];
}

- (double)transformScaleXYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_transformScaleXYCache[(uint64_t)v6];
}

- (CGPoint)transformTranslationCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;
  CGPoint *v7;
  double x;
  double y;
  CGPoint result;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  v7 = &self->_transformTranslationCache[(uint64_t)v6];
  x = v7->x;
  y = v7->y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)transformTranslationXCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_transformTranslationXCache[(uint64_t)v6];
}

- (double)transformTranslationYCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_transformTranslationYCache[(uint64_t)v6];
}

- (double)transformTranslationZCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_transformTranslationZCache[(uint64_t)v6];
}

- (double)zPositionCachedValueAtTime:(double)a3 layer:(id)a4 animation:(id)a5
{
  int64_t cacheValuesCount;
  double v6;

  cacheValuesCount = self->_cacheValuesCount;
  v6 = a3 / self->_animationDuration * (double)cacheValuesCount;
  if (v6 > (double)(cacheValuesCount - 1))
    v6 = (double)(cacheValuesCount - 1);
  if (v6 < 0.0)
    v6 = 0.0;
  return self->_zPositionCache[(uint64_t)v6];
}

- (CALayer)layer
{
  return self->_layer;
}

- (CAAnimation)animation
{
  return self->_animation;
}

- (BOOL)anchorPointAnimationExists
{
  return self->_anchorPointAnimationExists;
}

- (CGPoint)anchorPointInitialValue
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPointInitialValue.x;
  y = self->_anchorPointInitialValue.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)anchorPointZAnimationExists
{
  return self->_anchorPointZAnimationExists;
}

- (double)anchorPointZInitialValue
{
  return self->_anchorPointZInitialValue;
}

- (BOOL)borderColorAnimationExists
{
  return self->_borderColorAnimationExists;
}

- (CGColor)borderColorInitialValue
{
  return self->_borderColorInitialValue;
}

- (BOOL)borderWidthAnimationExists
{
  return self->_borderWidthAnimationExists;
}

- (double)borderWidthInitialValue
{
  return self->_borderWidthInitialValue;
}

- (BOOL)boundsAnimationExists
{
  return self->_boundsAnimationExists;
}

- (CGRect)boundsInitialValue
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundsInitialValue.origin.x;
  y = self->_boundsInitialValue.origin.y;
  width = self->_boundsInitialValue.size.width;
  height = self->_boundsInitialValue.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)contentsAnimationExists
{
  return self->_contentsAnimationExists;
}

- (CGImage)contentsInitialValue
{
  return self->_contentsInitialValue;
}

- (BOOL)doubleSidedAnimationExists
{
  return self->_doubleSidedAnimationExists;
}

- (BOOL)doubleSidedInitialValue
{
  return self->_doubleSidedInitialValue;
}

- (BOOL)hiddenAnimationExists
{
  return self->_hiddenAnimationExists;
}

- (BOOL)hiddenInitialValue
{
  return self->_hiddenInitialValue;
}

- (BOOL)opacityAnimationExists
{
  return self->_opacityAnimationExists;
}

- (double)opacityInitialValue
{
  return self->_opacityInitialValue;
}

- (BOOL)positionAnimationExists
{
  return self->_positionAnimationExists;
}

- (CGPoint)positionInitialValue
{
  double x;
  double y;
  CGPoint result;

  x = self->_positionInitialValue.x;
  y = self->_positionInitialValue.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)transformAnimationExists
{
  return self->_transformAnimationExists;
}

- (CATransform3D)transformInitialValue
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[4].m21;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[4].m13;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[4].m31;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[4].m23;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[3].m41;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[3].m33;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[4].m11;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[3].m43;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (BOOL)transformRotationAnimationExists
{
  return self->_transformRotationAnimationExists;
}

- (double)transformRotationInitialValue
{
  return self->_transformRotationInitialValue;
}

- (BOOL)transformRotationXAnimationExists
{
  return self->_transformRotationXAnimationExists;
}

- (double)transformRotationXInitialValue
{
  return self->_transformRotationXInitialValue;
}

- (BOOL)transformRotationYAnimationExists
{
  return self->_transformRotationYAnimationExists;
}

- (double)transformRotationYInitialValue
{
  return self->_transformRotationYInitialValue;
}

- (BOOL)transformRotationZAnimationExists
{
  return self->_transformRotationZAnimationExists;
}

- (double)transformRotationZInitialValue
{
  return self->_transformRotationZInitialValue;
}

- (BOOL)transformScaleXAnimationExists
{
  return self->_transformScaleXAnimationExists;
}

- (double)transformScaleXInitialValue
{
  return self->_transformScaleXInitialValue;
}

- (BOOL)transformScaleYAnimationExists
{
  return self->_transformScaleYAnimationExists;
}

- (double)transformScaleYInitialValue
{
  return self->_transformScaleYInitialValue;
}

- (BOOL)transformScaleXYAnimationExists
{
  return self->_transformScaleXYAnimationExists;
}

- (double)transformScaleXYInitialValue
{
  return self->_transformScaleXYInitialValue;
}

- (BOOL)transformTranslationAnimationExists
{
  return self->_transformTranslationAnimationExists;
}

- (CGPoint)transformTranslationInitialValue
{
  double x;
  double y;
  CGPoint result;

  x = self->_transformTranslationInitialValue.x;
  y = self->_transformTranslationInitialValue.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)transformTranslationXAnimationExists
{
  return self->_transformTranslationXAnimationExists;
}

- (double)transformTranslationXInitialValue
{
  return self->_transformTranslationXInitialValue;
}

- (BOOL)transformTranslationYAnimationExists
{
  return self->_transformTranslationYAnimationExists;
}

- (double)transformTranslationYInitialValue
{
  return self->_transformTranslationYInitialValue;
}

- (BOOL)transformTranslationZAnimationExists
{
  return self->_transformTranslationZAnimationExists;
}

- (double)transformTranslationZInitialValue
{
  return self->_transformTranslationZInitialValue;
}

- (BOOL)zPositionAnimationExists
{
  return self->_zPositionAnimationExists;
}

- (double)zPositionInitialValue
{
  return self->_zPositionInitialValue;
}

- (NSDictionary)initialValues
{
  return self->_initialValues;
}

@end
