@implementation SBDisplayScaleMapping

- (SBDisplayScaleMapping)initWithDisplayHardwareIdentifier:(id)a3 nativePPI:(double)a4 referenceSize:(CGSize)a5 scaleMethod:(unint64_t)a6 supportedScales:(unint64_t)a7 displayScaleToLogicalScale:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v15;
  id v16;
  SBDisplayScaleMapping *v17;
  uint64_t v18;
  NSString *displayHardwareIdentifier;
  objc_super v21;

  height = a5.height;
  width = a5.width;
  v15 = a3;
  v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)SBDisplayScaleMapping;
  v17 = -[SBDisplayScaleMapping init](&v21, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    displayHardwareIdentifier = v17->_displayHardwareIdentifier;
    v17->_displayHardwareIdentifier = (NSString *)v18;

    v17->_nativePPI = a4;
    v17->_referenceSize.width = width;
    v17->_referenceSize.height = height;
    v17->_scaleMethod = a6;
    v17->_supportedScales = a7;
    objc_storeStrong((id *)&v17->_displayScaleToLogicalScale, a8);
  }

  return v17;
}

+ (id)withDisplay:(id)a3 useNativeSize:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  SBDisplayScaleMapping *v6;
  void *v7;
  SBDisplayScaleMapping *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  NSObject *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  double v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  __CFString *v36;
  NSObject *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  NSObject *v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  NSObject *v49;
  void *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  NSObject *v55;
  void *v56;
  __CFString *v57;
  NSObject *v58;
  void *v59;
  __CFString *v60;
  NSObject *v61;
  void *v62;
  __CFString *v63;
  NSObject *v64;
  void *v65;
  __CFString *v66;
  __CFString *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  double v73;
  double v74;
  char v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  void *v83;
  NSObject *v84;
  void *v85;
  __CFString *v86;
  __CFString *v87;
  double v88;
  void *v89;
  uint64_t v90;
  id v91;
  id v92;
  void *v93;
  __CFString *v94;
  __CFString *v95;
  NSObject *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  SBDisplayScaleMapping *v112;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  __CFString *v118;
  __CFString *v119;
  double v120;
  double v121;
  SBDisplayScaleMapping *v122;
  void *v123;
  id v124;
  double size;
  void *v126;
  void *v129;
  _QWORD v130[7];
  _QWORD v131[4];
  _QWORD v132[4];
  id v133;
  id v134;
  double v135;
  id v136;
  SEL v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[3];
  _QWORD v143[3];
  _QWORD v144[2];
  _QWORD v145[2];
  void *v146;
  void *v147;
  uint8_t v148[4];
  void *v149;
  __int16 v150;
  id v151;
  __int16 v152;
  uint64_t v153;
  _BYTE buf[24];
  __CFString *v155;
  __int16 v156;
  _BYTE v157[14];
  __int16 v158;
  int v159;
  _BYTE v160[128];
  void *v161;
  _QWORD v162[4];
  CGSize v163;
  CGSize v164;
  CGSize v165;
  CGSize v166;
  CGSize v167;

  v4 = a4;
  v162[1] = *MEMORY[0x1E0C80C00];
  v124 = a3;
  objc_msgSend(v124, "CADisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = (void *)objc_msgSend(v5, "immutableCopy");

  objc_msgSend(v124, "hardwareIdentifier");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [SBDisplayScaleMapping alloc];
  v120 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v121 = *MEMORY[0x1E0C9D820];
  v122 = -[SBDisplayScaleMapping initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:](v6, "initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:", v129, 0, 0, 0, 0.0);
  +[_SBDisplayScaleMappingCache sharedInstance](_SBDisplayScaleMappingCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mappingForDisplayIdentifier:", v129);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  if (v123)
  {
    v8 = v123;
    goto LABEL_101;
  }
  if (!v129)
  {
    v8 = v122;
    goto LABEL_99;
  }
  if (objc_msgSend(v126, "displayType") == 2)
  {
    SBLogDisplayScaleMapping();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v126;
      _os_log_impl(&dword_18AB69000, v9, OS_LOG_TYPE_DEFAULT, "YOU CAN'T JUST ENABLE AIRPLAY DISPLAYS. YOU WILL REGRET THIS! %{public}@", buf, 0xCu);
    }

    v161 = &unk_1E203AD20;
    v162[0] = &unk_1E203BA08;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v162, &v161, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0CD2738]);
    objc_msgSend(v126, "preferredModeWithCriteria:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[SBDisplayScaleMapping initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:]([SBDisplayScaleMapping alloc], "initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:", v129, 0, 2, v10, 0.0, (double)(unint64_t)objc_msgSend(v12, "width"), (double)(unint64_t)objc_msgSend(v12, "height"));
    goto LABEL_99;
  }
  objc_msgSend(v126, "nativeSize");
  v14 = v13;
  v16 = v15;
  v17 = objc_alloc_init(MEMORY[0x1E0CD2738]);
  v18 = v17;
  v116 = v17;
  if (v4)
  {
    objc_msgSend(v17, "setResolution:", v14, v16);
    v18 = v116;
  }
  objc_msgSend(v126, "preferredModeWithCriteria:", v18);
  v119 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "currentMode");
  v118 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "physicalSize");
  v20 = v19;
  v117 = v21;
  v22 = (double)(unint64_t)-[__CFString width](v119, "width");
  v23 = (double)(unint64_t)-[__CFString height](v119, "height");
  if (v14 != v22 || v16 != v23)
  {
    SBLogDisplayScaleMapping();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem(a1, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v163.width = v22;
      v163.height = v23;
      NSStringFromCGSize(v163);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v164.width = v14;
      v164.height = v16;
      NSStringFromCGSize(v164);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v129;
      *(_WORD *)&buf[22] = 2114;
      v155 = v27;
      v156 = 2114;
      *(_QWORD *)v157 = v28;
      _os_log_impl(&dword_18AB69000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ CADisplay returned referencePixelSize of %{public}@ while the nativeSize is %{public}@", buf, 0x2Au);

    }
  }
  if (v23 <= v22)
    v29 = v23;
  else
    v29 = v22;
  size = v29;
  if (v23 > v22)
    v22 = v23;
  SBLogDisplayScaleMapping();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(a1, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v129;
    _os_log_impl(&dword_18AB69000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ about to calculate available logicalScales. dumping display mode info:", buf, 0x16u);

  }
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  objc_msgSend(v126, "availableModes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v138, v160, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v139;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v139 != v34)
          objc_enumerationMutation(v32);
        v36 = *(__CFString **)(*((_QWORD *)&v138 + 1) + 8 * i);
        SBLogDisplayScaleMapping();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          _SBFLoggingMethodProem(a1, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -[__CFString isHighBandwidth](v36, "isHighBandwidth");
          -[__CFString refreshRate](v36, "refreshRate");
          v41 = v40;
          v42 = -[__CFString isVirtual](v36, "isVirtual");
          *(_DWORD *)buf = 138544642;
          *(_QWORD *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v129;
          *(_WORD *)&buf[22] = 2114;
          v155 = v36;
          v156 = 1024;
          *(_DWORD *)v157 = v39;
          *(_WORD *)&v157[4] = 2048;
          *(_QWORD *)&v157[6] = v41;
          v158 = 1024;
          v159 = v42;
          _os_log_impl(&dword_18AB69000, v37, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ %{public}@ highBandwidth: %{BOOL}u refreshRate: %.2g virtual: %{BOOL}u", buf, 0x36u);

        }
      }
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v138, v160, 16);
    }
    while (v33);
  }

  SBLogDisplayScaleMapping();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(a1, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[__CFString isHighBandwidth](v119, "isHighBandwidth");
    -[__CFString refreshRate](v119, "refreshRate");
    v47 = v46;
    v48 = -[__CFString isVirtual](v119, "isVirtual");
    *(_DWORD *)buf = 138544642;
    *(_QWORD *)&buf[4] = v44;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v129;
    *(_WORD *)&buf[22] = 2114;
    v155 = v119;
    v156 = 1024;
    *(_DWORD *)v157 = v45;
    *(_WORD *)&v157[4] = 2048;
    *(_QWORD *)&v157[6] = v47;
    v158 = 1024;
    v159 = v48;
    _os_log_impl(&dword_18AB69000, v43, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ preferredMode: %{public}@ highBandwidth: %{BOOL}u refreshRate: %.2g virtual: %{BOOL}u", buf, 0x36u);

  }
  SBLogDisplayScaleMapping();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(a1, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[__CFString isHighBandwidth](v118, "isHighBandwidth");
    -[__CFString refreshRate](v118, "refreshRate");
    v53 = v52;
    v54 = -[__CFString isVirtual](v118, "isVirtual");
    *(_DWORD *)buf = 138544642;
    *(_QWORD *)&buf[4] = v50;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v129;
    *(_WORD *)&buf[22] = 2114;
    v155 = v118;
    v156 = 1024;
    *(_DWORD *)v157 = v51;
    *(_WORD *)&v157[4] = 2048;
    *(_QWORD *)&v157[6] = v53;
    v158 = 1024;
    v159 = v54;
    _os_log_impl(&dword_18AB69000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ currentMode: %{public}@ highBandwidth: %{BOOL}u refreshRate: %.2g virtual: %{BOOL}u", buf, 0x36u);

  }
  SBLogDisplayScaleMapping();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(a1, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v165.width = v14;
    v165.height = v16;
    NSStringFromCGSize(v165);
    v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v56;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v129;
    *(_WORD *)&buf[22] = 2114;
    v155 = v57;
    _os_log_impl(&dword_18AB69000, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ nativeSize: %{public}@", buf, 0x20u);

  }
  SBLogDisplayScaleMapping();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(a1, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v166.width = v22;
    v166.height = size;
    NSStringFromCGSize(v166);
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v59;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v129;
    *(_WORD *)&buf[22] = 2114;
    v155 = v60;
    _os_log_impl(&dword_18AB69000, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ referenceSize (from preferred): %{public}@", buf, 0x20u);

  }
  SBLogDisplayScaleMapping();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(a1, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v167.width = v20;
    v167.height = v117;
    NSStringFromCGSize(v167);
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v62;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v129;
    *(_WORD *)&buf[22] = 2114;
    v155 = v63;
    _os_log_impl(&dword_18AB69000, v61, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ physicalSize: %{public}@", buf, 0x20u);

  }
  SBLogDisplayScaleMapping();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(a1, 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "minimumLogicalScale");
    v67 = v66;
    objc_msgSend(v126, "maximumLogicalScale");
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v65;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v129;
    *(_WORD *)&buf[22] = 2048;
    v155 = v67;
    v156 = 2048;
    *(_QWORD *)v157 = v68;
    _os_log_impl(&dword_18AB69000, v64, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ logicalScale bounds: {%.3f, %.3f}", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", 3);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  if (3840.0 / v22 >= 2160.0 / size)
    v71 = 3840.0 / v22;
  else
    v71 = 2160.0 / size;
  v72 = 2;
  do
  {
    if (v70)
    {
      if (v70 == 1)
      {
        v74 = 5120.0;
        v73 = 2880.0;
      }
      else if (v70 == 2)
      {
        v73 = 3384.0;
        v74 = 6016.0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGSize SBSizeForResolution(SBDisplayResolution)");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "handleFailureInFunction:file:lineNumber:description:", v81, CFSTR("SBDisplayScaleMapping.m"), 68, CFSTR("invalid resolution"));

        v73 = v120;
        v74 = v121;
      }
      if (v72 != 2)
      {
        v77 = v74 / v22;
        v76 = v73 / size;
LABEL_60:
        if (v77 <= v76)
          v82 = v77;
        else
          v82 = v76;
        v72 = 1;
        goto LABEL_69;
      }
      v79 = v74 / v22;
      v78 = v73 / size;
    }
    else
    {
      v75 = SBValidateLogicalScale(v126, v71, v22, size);
      v76 = 2160.0 / size;
      v77 = 3840.0 / v22;
      v78 = 2160.0 / size;
      v79 = 3840.0 / v22;
      if ((v75 & 1) == 0)
        goto LABEL_60;
    }
    if (v79 >= v78)
      v82 = v79;
    else
      v82 = v78;
    v72 = 2;
LABEL_69:
    if (!SBValidateLogicalScale(v126, v82, v22, size))
      break;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObject:", v83);

    ++v70;
  }
  while (v70 != 3);
  SBLogDisplayScaleMapping();
  v84 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(a1, 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = CFSTR("<invalid>");
    if (v72 == 2)
      v86 = CFSTR(".AspectFill");
    if (v72 == 1)
      v86 = CFSTR(".AspectFit");
    v87 = v86;
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v85;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v129;
    *(_WORD *)&buf[22] = 2114;
    v155 = v87;
    v156 = 2114;
    *(_QWORD *)v157 = v69;
    _os_log_impl(&dword_18AB69000, v84, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ scaling using: %{public}@; logicalScales before filtering on PPI: %{public}@",
      buf,
      0x2Au);

  }
  v88 = 0.0;
  if (v117 > 0.0)
    v88 = (double)(unint64_t)-[__CFString height](v119, "height", v117) / v117;
  if ((BSFloatIsZero() & 1) == 0 && objc_msgSend(v69, "count"))
  {
    v89 = (void *)objc_msgSend(v69, "copy");
    v90 = MEMORY[0x1E0C809B0];
    v132[0] = MEMORY[0x1E0C809B0];
    v132[1] = 3221225472;
    v132[2] = __51__SBDisplayScaleMapping_withDisplay_useNativeSize___block_invoke;
    v132[3] = &unk_1E200F8D8;
    v135 = v88;
    v136 = a1;
    v137 = a2;
    v91 = v129;
    v133 = v91;
    v92 = v69;
    v134 = v92;
    objc_msgSend(v89, "enumerateObjectsUsingBlock:", v132);
    if (!objc_msgSend(v92, "count"))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v155 = 0;
      objc_msgSend(v89, "objectAtIndex:", 0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "doubleValue");
      v95 = v94;

      v155 = v95;
      v131[0] = 0;
      v131[1] = v131;
      v131[2] = 0x2020000000;
      v131[3] = 0x7FEFFFFFFFFFFFFFLL;
      v130[0] = v90;
      v130[1] = 3221225472;
      v130[2] = __51__SBDisplayScaleMapping_withDisplay_useNativeSize___block_invoke_81;
      v130[3] = &unk_1E200F900;
      *(double *)&v130[6] = v88;
      v130[4] = v131;
      v130[5] = buf;
      objc_msgSend(v89, "enumerateObjectsUsingBlock:", v130);
      SBLogDisplayScaleMapping();
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        _SBFLoggingMethodProem(a1, 1);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
        *(_DWORD *)v148 = 138543874;
        v149 = v97;
        v150 = 2114;
        v151 = v91;
        v152 = 2048;
        v153 = v98;
        _os_log_impl(&dword_18AB69000, v96, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ whoops -- we filtered out every logicalScale. stuff the best one back in: %.2f", v148, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)&buf[8] + 24));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "addObject:", v99);

      _Block_object_dispose(v131, 8);
      _Block_object_dispose(buf, 8);
    }

  }
  if (objc_msgSend(v69, "count"))
  {
    v100 = objc_msgSend(v69, "count");
    if ((unint64_t)(v100 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBDisplayScaleMapping.m"), 315, CFSTR("unexpected number of logicalScales: %lu"), v100);

    }
    if (v100 == 2)
    {
      v144[0] = &unk_1E203AD38;
      objc_msgSend(v69, "objectAtIndex:", 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v144[1] = &unk_1E203AD20;
      v145[0] = v101;
      objc_msgSend(v69, "objectAtIndex:", 1);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v145[1] = v106;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, v144, 2);
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      v103 = 3;
    }
    else if (v100 == 1)
    {
      v146 = &unk_1E203AD20;
      objc_msgSend(v69, "objectAtIndex:", 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = v101;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = 2;
    }
    else
    {
      v142[0] = &unk_1E203AD38;
      objc_msgSend(v69, "objectAtIndex:", 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v143[0] = v101;
      v142[1] = &unk_1E203AD20;
      objc_msgSend(v69, "objectAtIndex:", 1);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v143[1] = v107;
      v142[2] = &unk_1E203AD50;
      objc_msgSend(v69, "objectAtIndex:", 2);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v143[2] = v108;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v143, v142, 3);
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      v103 = 7;
    }

    v8 = -[SBDisplayScaleMapping initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:]([SBDisplayScaleMapping alloc], "initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:", v129, v72, v103, v102, v88, v22, size);
    +[_SBDisplayScaleMappingCache sharedInstance](_SBDisplayScaleMappingCache, "sharedInstance");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "cacheMapping:", v8);

  }
  else
  {
    SBLogDisplayScaleMapping();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem(a1, 1);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v105;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v129;
      _os_log_impl(&dword_18AB69000, v104, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ not supported because we couldn't derive any usable resolutions", buf, 0x16u);

    }
    v8 = v122;
  }

LABEL_99:
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBDisplayScaleMapping.m"), 344, CFSTR("we should always have a non-nil result, even for unsupported displays"));

    v8 = 0;
  }
LABEL_101:
  SBLogDisplayScaleMapping();
  v110 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem(a1, 1);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v111;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_18AB69000, v110, OS_LOG_TYPE_DEFAULT, "[%{public}@] result: %{public}@", buf, 0x16u);

  }
  v112 = v8;

  return v112;
}

void __51__SBDisplayScaleMapping_withDisplay_useNativeSize___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "doubleValue");
  v4 = v3;
  v5 = v3 * *(double *)(a1 + 48);
  if ((BSFloatLessThanFloat() & 1) != 0 || BSFloatGreaterThanFloat())
  {
    SBLogDisplayScaleMapping();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem(*(void **)(a1 + 56), 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138544130;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 2048;
      v16 = v4;
      v17 = 2048;
      v18 = v5;
      _os_log_impl(&dword_18AB69000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ logicalScale is out of the supported PPI range, so filtering out: %.2f; ppi: %.2f",
        (uint8_t *)&v11,
        0x2Au);

    }
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v10);

  }
}

uint64_t __51__SBDisplayScaleMapping_withDisplay_useNativeSize___block_invoke_81(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  uint64_t result;

  objc_msgSend(a2, "doubleValue");
  v4 = v3;
  v5 = vabdd_f64(264.0, v3 * *(double *)(a1 + 48));
  result = BSFloatLessThanOrEqualToFloat();
  if ((_DWORD)result)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  }
  return result;
}

- (double)logicalScaleForDisplayScale:(unint64_t)a3
{
  NSDictionary *displayScaleToLogicalScale;
  void *v4;
  void *v5;
  double v6;
  double v7;

  displayScaleToLogicalScale = self->_displayScaleToLogicalScale;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](displayScaleToLogicalScale, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (double)ppiForDisplayScale:(unint64_t)a3
{
  double nativePPI;
  NSDictionary *displayScaleToLogicalScale;
  void *v5;
  void *v6;
  double v7;
  double v8;

  nativePPI = self->_nativePPI;
  displayScaleToLogicalScale = self->_displayScaleToLogicalScale;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](displayScaleToLogicalScale, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v8 = nativePPI * v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (id)createDefaultSettings
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAE38]), "initWithScale:overscanCompensation:", -[SBDisplayScaleMapping _defaultScale](self, "_defaultScale"), 0);
}

- (id)description
{
  void *v3;
  NSString *displayHardwareIdentifier;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(int8x16_t *);
  void *v12;
  id v13;
  SBDisplayScaleMapping *v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  displayHardwareIdentifier = self->_displayHardwareIdentifier;
  objc_msgSend(v3, "activeMultilinePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __36__SBDisplayScaleMapping_description__block_invoke;
  v12 = &unk_1E200E2A0;
  v13 = v3;
  v14 = self;
  v6 = v3;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", displayHardwareIdentifier, v5, &v9);

  objc_msgSend(v6, "build", v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __36__SBDisplayScaleMapping_description__block_invoke(int8x16_t *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  id v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  _QWORD v14[5];

  v2 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __36__SBDisplayScaleMapping_description__block_invoke_2;
  v14[3] = &unk_1E200F928;
  v3 = (void *)a1[2].i64[0];
  v14[4] = a1[2].i64[1];
  objc_msgSend(v3, "appendCustomFormatWithName:block:", CFSTR(".Reference"), v14);
  v4 = (void *)a1[2].i64[0];
  v5 = *(_QWORD *)(a1[2].i64[1] + 40);
  v6 = CFSTR("<invalid>");
  if (v5 == 2)
    v6 = CFSTR(".AspectFill");
  if (v5 == 1)
    v7 = CFSTR(".AspectFit");
  else
    v7 = (__CFString *)v6;
  v8 = v7;
  objc_msgSend(v4, "activeMultilinePrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v12[1] = 3221225472;
  v12[2] = __36__SBDisplayScaleMapping_description__block_invoke_3;
  v12[3] = &unk_1E200E2A0;
  v11 = a1[2];
  v10 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", v8, v9, v12);

}

void __36__SBDisplayScaleMapping_description__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int IsZero;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  IsZero = BSFloatIsZero();
  NSStringFromCGSize(*(CGSize *)(*(_QWORD *)(a1 + 32) + 24));
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  if (IsZero)
    objc_msgSend(v3, "appendFormat:", CFSTR("res: %@"), v5, v6);
  else
    objc_msgSend(v3, "appendFormat:", CFSTR("res: %@; ppi: %.2f"), v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

}

void __36__SBDisplayScaleMapping_description__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v2 = 0;
  v3 = MEMORY[0x1E0C809B0];
  do
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    if ((SBSDisplayScaleMaskFromScale() & ~v4) == 0)
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "_defaultScale");
      v6 = CFSTR("[ ]");
      if (v2 == v5)
        v6 = CFSTR("[d]");
      v7 = *(void **)(a1 + 40);
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = v6;
      SBSDisplayScaleDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __36__SBDisplayScaleMapping_description__block_invoke_4;
      v12[3] = &unk_1E200F950;
      v12[4] = *(_QWORD *)(a1 + 32);
      v12[5] = v2;
      objc_msgSend(v7, "appendCustomFormatWithName:block:", v11, v12);

    }
    ++v2;
  }
  while (v2 != 3);
}

void __36__SBDisplayScaleMapping_description__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;
  CGSize v14;
  CGSize v15;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "logicalScaleForDisplayScale:", v4);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v6 * *(double *)(v8 + 24);
  v10 = v6 * *(double *)(v8 + 32);
  if (BSFloatIsZero())
  {
    v14.width = v9;
    v14.height = v10;
    NSStringFromCGSize(v14);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("scale: %.2f; res: %@"), *(_QWORD *)&v7, v13, v12);
  }
  else
  {
    v11 = v7 * *(double *)(*(_QWORD *)(a1 + 32) + 16);
    v15.width = v9;
    v15.height = v10;
    NSStringFromCGSize(v15);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("scale: %.2f; res: %@; ppi: %.2f"), *(_QWORD *)&v7, v13, *(_QWORD *)&v11);
  }

}

- (unint64_t)_defaultScale
{
  unint64_t v3;
  unint64_t v4;
  unint64_t supportedScales;
  void *v9;

  if (!self->_supportedScales)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayScaleMapping.m"), 408, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_supportedScales != SBSDisplayScaleMaskNone"));

  }
  if ((BSFloatIsZero() & 1) != 0)
    return 1;
  v4 = 0;
  v3 = 1;
  do
  {
    supportedScales = self->_supportedScales;
    if ((SBSDisplayScaleMaskFromScale() & ~supportedScales) == 0)
    {
      -[SBDisplayScaleMapping ppiForDisplayScale:](self, "ppiForDisplayScale:", v4);
      if (BSFloatLessThanOrEqualToFloat())
        v3 = v4;
    }
    ++v4;
  }
  while (v4 != 3);
  return v3;
}

- (unint64_t)supportedScales
{
  return self->_supportedScales;
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)displayHardwareIdentifier
{
  return self->_displayHardwareIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayScaleToLogicalScale, 0);
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
}

@end
