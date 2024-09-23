@implementation PFLLayoutProvider

- (PFLLayoutProvider)initWithTimePosition:(unint64_t)a3
{
  PFLLayoutProvider *v4;
  PFLLayoutProvider *v5;
  PFLCLayout *watchLayout;
  NSObject *v7;
  unint64_t timePosition;
  objc_super v10;
  uint8_t buf[4];
  PFLLayoutProvider *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)PFLLayoutProvider;
  v4 = -[PFLLayoutProvider init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_timePosition = a3;
    v4->_resultsAreValid = 0;
    watchLayout = v4->_watchLayout;
    v4->_watchLayout = 0;

  }
  pfl_layout_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    timePosition = v5->_timePosition;
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2048;
    v14 = timePosition;
    _os_log_impl(&dword_243C29000, v7, OS_LOG_TYPE_DEFAULT, "PFL: PFLLayoutProvider(%@): CREATED for time position %ld.", buf, 0x16u);
  }

  return v5;
}

- (void)invalidateResults
{
  PFLCLayout *watchLayout;

  self->_resultsAreValid = 0;
  watchLayout = self->_watchLayout;
  self->_watchLayout = 0;

}

- (id)generateOrientedLayoutsForFullExtent:(CGRect)a3 layoutConfiguration:(id)a4 layoutRegions:(id)a5 segmentationMatteImage:(id)a6 segmentationClassification:(unint64_t)a7 error:(id *)a8
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  CGImage *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
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
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  void *v59;
  NSObject *v60;
  double v61;
  double v62;
  double v63;
  id v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  uint64_t i;
  double v74;
  double v75;
  double v76;
  double v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  double v82;
  uint64_t v83;
  double v84;
  double v85;
  uint64_t j;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  CGFloat v95;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  double x;
  double y;
  double v102;
  double v103;
  NSObject *v104;
  PFLLayoutProvider *v105;
  double v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  double v111;
  CGFloat v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t k;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  double v123;
  double v124;
  uint64_t v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  id v137;
  double v138;
  double v139;
  double v140;
  void *v141;
  PFLCLayout *watchLayout;
  id v143;
  NSObject *v144;
  void *v145;
  uint64_t v147;
  double v148;
  CGFloat v149;
  CGFloat v150;
  CGFloat v151;
  CGFloat v152;
  void *v153;
  void *v154;
  CGFloat v155;
  CGFloat v156;
  id v157;
  id v158;
  double v159;
  double v160;
  unint64_t v161;
  double v162;
  CGFloat v163;
  CGFloat v164;
  CGFloat v165;
  CGAffineTransform v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  void *v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  uint8_t buf[4];
  PFLLayoutProvider *v181;
  __int16 v182;
  uint64_t v183;
  __int16 v184;
  CGImage *v185;
  uint64_t v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;

  height = a3.size.height;
  width = a3.size.width;
  v186 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  pfl_layout_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v181 = self;
    _os_log_impl(&dword_243C29000, v16, OS_LOG_TYPE_DEFAULT, "PFL: PFLLayoutProvider(%@): generateOrientedLayout CALLED.", buf, 0xCu);
  }
  v162 = height;
  v163 = width;

  v17 = (void *)MEMORY[0x24BDBF648];
  v18 = v15;
  objc_msgSend(v17, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "extent");
  v20 = (CGImage *)objc_msgSend(v19, "createCGImage:fromRect:", v18);

  objc_msgSend(v14, "faceRegions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  flipYNormalizedRects(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "petRegions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  flipYNormalizedRects(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  pfl_layout_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v13;
    v27 = objc_msgSend(v22, "count");
    v28 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 134218496;
    v181 = (PFLLayoutProvider *)v27;
    v13 = v26;
    v182 = 2048;
    v183 = v28;
    v184 = 2048;
    v185 = v20;
    _os_log_impl(&dword_243C29000, v25, OS_LOG_TYPE_DEFAULT, "PFL:   %ld face rects, %ld pet rects, mask == %p", buf, 0x20u);
  }

  objc_msgSend(v13, "timeRect");
  v33 = flipYNormalizedRect(v29, v30, v31, v32);
  v164 = v34;
  v165 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend(v14, "preferredCropRect");
  flipYNormalizedRect(v39, v40, v41, v42);
  objc_msgSend(v14, "acceptableCropRect");
  v47 = flipYNormalizedRect(v43, v44, v45, v46);
  v49 = v48;
  v51 = v50;
  v53 = v52;
  objc_msgSend(v13, "screenSize");
  v55 = v54;
  v57 = v56;
  -[PFLLayoutProvider timePosition](self, "timePosition");
  v155 = v38;
  v156 = v36;
  v147 = v57;
  v58 = v163;
  PFLCCalculateLayout();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v20);
  objc_msgSend(v59, "visibleRect", *(_QWORD *)&v47, *(_QWORD *)&v49, *(_QWORD *)&v51, *(_QWORD *)&v53, v55, v147, *(_QWORD *)&v165, *(_QWORD *)&v164, *(_QWORD *)&v36, *(_QWORD *)&v38);
  if (CGRectIsEmpty(v187))
  {
    pfl_layout_log();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C29000, v60, OS_LOG_TYPE_DEFAULT, "PFL: Using backup", buf, 2u);
    }

    objc_msgSend(v13, "screenSize");
    v159 = v62;
    v160 = v61;
    v63 = *MEMORY[0x24BE723B0] * 0.5;
    v161 = objc_msgSend(v22, "count");
    v151 = v49;
    v152 = v47;
    v149 = v53;
    v150 = v51;
    if (v161)
    {
      v64 = v22;
      v65 = *MEMORY[0x24BDBEFB0];
      v66 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v171 = 0u;
      v172 = 0u;
      v173 = 0u;
      v174 = 0u;
      v67 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v171, buf, 16);
      if (v67)
      {
        v68 = v67;
        v148 = v63;
        v153 = v24;
        v157 = v13;
        v69 = 0;
        v70 = *(_QWORD *)v172;
        v71 = v66;
        v72 = v65;
        do
        {
          for (i = 0; i != v68; ++i)
          {
            if (*(_QWORD *)v172 != v70)
              objc_enumerationMutation(v64);
            objc_msgSend(*(id *)(*((_QWORD *)&v171 + 1) + 8 * i), "rectValue");
            v72 = v72 + v75 + v74 * 0.5;
            v71 = v71 + v77 + v76 * 0.5;
          }
          v69 += v68;
          v68 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v171, buf, 16);
        }
        while (v68);
        if (v69)
        {
          v169 = 0u;
          v170 = 0u;
          v167 = 0u;
          v168 = 0u;
          v78 = v64;
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v167, &v176, 16);
          if (v79)
          {
            v80 = v79;
            v81 = (double)v69;
            v82 = v72 / (double)v69;
            v83 = *(_QWORD *)v168;
            v84 = 1.79769313e308;
            v85 = v71 / v81;
            do
            {
              for (j = 0; j != v80; ++j)
              {
                if (*(_QWORD *)v168 != v83)
                  objc_enumerationMutation(v78);
                objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * j), "rectValue");
                v89 = v88 + v87 * 0.5;
                v92 = (v91 + v90 * 0.5 - v85) * (v91 + v90 * 0.5 - v85);
                if (v92 + (v89 - v82) * (v89 - v82) < v84)
                {
                  v84 = v92 + (v89 - v82) * (v89 - v82);
                  v65 = v89;
                }
              }
              v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v167, &v176, 16);
            }
            while (v80);
          }

          v13 = v157;
          v24 = v153;
          v58 = v163;
        }
        else
        {
          v13 = v157;
          v24 = v153;
        }
        v63 = v148;
      }

    }
    else
    {
      v188.origin.x = v47;
      v188.origin.y = v49;
      v188.size.width = v51;
      v188.size.height = v53;
      if (CGRectIsEmpty(v188))
        v65 = 0.5;
      else
        v65 = v47 + v51 * 0.5;
    }
    v93 = reduceRectToAspectRatioWithCushion(0.0, 0.0, v58, v162, v160 / v159, v63, v58 * v65);
    v95 = v94;
    v97 = v96;
    v99 = v98;
    CGAffineTransformMakeScale(&v166, 1.0 / v58, 1.0 / v162);
    v189.origin.x = v93;
    v189.origin.y = v95;
    v189.size.width = v97;
    v189.size.height = v99;
    v190 = CGRectApplyAffineTransform(v189, &v166);
    x = v190.origin.x;
    y = v190.origin.y;
    v102 = v190.size.width;
    v103 = v190.size.height;
    pfl_layout_log();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      _rectAsString(x, y, v102, v103);
      v105 = (PFLLayoutProvider *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v181 = v105;
      _os_log_impl(&dword_243C29000, v104, OS_LOG_TYPE_DEFAULT, "PFL: Backup crop == %@", buf, 0xCu);

    }
    v106 = renormalizeRect(v165, v164, v156, v155, x, y, v102, v103);
    v108 = v107;
    v110 = v109;
    v112 = v111;
    if (v161)
    {
      v113 = v22;
      v176 = 0u;
      v177 = 0u;
      v178 = 0u;
      v179 = 0u;
      v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v176, buf, 16);
      if (v114)
      {
        v115 = v114;
        v154 = v24;
        v158 = v13;
        v116 = 0;
        v117 = *(_QWORD *)v177;
        do
        {
          for (k = 0; k != v115; ++k)
          {
            if (*(_QWORD *)v177 != v117)
              objc_enumerationMutation(v113);
            objc_msgSend(*(id *)(*((_QWORD *)&v176 + 1) + 8 * k), "rectValue");
            v194.origin.x = v119;
            v194.origin.y = v120;
            v194.size.width = v121;
            v194.size.height = v122;
            v191.origin.x = v106;
            v191.origin.y = v108;
            v191.size.width = v110;
            v191.size.height = v112;
            v116 += CGRectIntersectsRect(v191, v194);
          }
          v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v176, buf, 16);
        }
        while (v115);
        v123 = (double)v116 * 0.1;
        v13 = v158;
        v24 = v154;
      }
      else
      {
        v123 = 0.0;
      }

      v124 = 0.1 - v123 / (double)v161;
    }
    else
    {
      v192.origin.x = v152;
      v192.origin.y = v151;
      v192.size.width = v150;
      v192.size.height = v149;
      if (CGRectIsEmpty(v192))
      {
        v124 = 0.1;
      }
      else
      {
        v193.origin.x = v106;
        v193.origin.y = v108;
        v193.size.width = v110;
        v193.size.height = v112;
        v195.origin.x = v152;
        v195.origin.y = v151;
        v195.size.width = v150;
        v195.size.height = v149;
        if (CGRectIntersectsRect(v193, v195))
          v124 = 0.0;
        else
          v124 = 0.1;
      }
    }
    v125 = objc_msgSend(objc_alloc(MEMORY[0x24BE723C8]), "initWithCropScore:layoutScore:foregroundCoverage:visibleRect:usesMask:", 0, v124, 0.0, 0.0, x, y, v102, v103);

    v59 = (void *)v125;
  }
  objc_msgSend(v59, "visibleRect");
  v130 = flipYNormalizedRect(v126, v127, v128, v129);
  v132 = v131;
  v134 = v133;
  v136 = v135;
  v137 = objc_alloc(MEMORY[0x24BE72408]);
  objc_msgSend(v59, "cropScore");
  v139 = v138;
  objc_msgSend(v59, "layoutScore");
  v141 = (void *)objc_msgSend(v137, "initWithVisibleRect:cropScore:layoutScore:", v130, v132, v134, v136, v139, v140);
  self->_resultsAreValid = 1;
  watchLayout = self->_watchLayout;
  self->_watchLayout = (PFLCLayout *)v59;
  v143 = v59;

  pfl_layout_log();
  v144 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v181 = self;
    _os_log_impl(&dword_243C29000, v144, OS_LOG_TYPE_DEFAULT, "PFL: PFLLayoutProvider(%@): generateOrientedLayout DONE", buf, 0xCu);
  }

  v175 = v141;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v175, 1);
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  return v145;
}

- (unint64_t)timePosition
{
  return self->_timePosition;
}

- (BOOL)resultsAreValid
{
  return self->_resultsAreValid;
}

- (PFLCLayout)watchLayout
{
  return self->_watchLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchLayout, 0);
}

@end
