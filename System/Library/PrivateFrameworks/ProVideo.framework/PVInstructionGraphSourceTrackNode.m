@implementation PVInstructionGraphSourceTrackNode

+ (id)newSourceTrackNode:(int)a3 transform:(CGAffineTransform *)a4 cropRect:(CGRect)a5 clipNaturalSize:(CGSize)a6
{
  double height;
  double width;
  double v8;
  double v9;
  double y;
  double x;
  uint64_t v13;
  PVInstructionGraphSourceTrackNode *v14;
  __int128 v15;
  _OWORD v17[3];

  height = a6.height;
  width = a6.width;
  v8 = a5.size.height;
  v9 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = *(_QWORD *)&a3;
  v14 = objc_alloc_init(PVInstructionGraphSourceTrackNode);
  -[PVInstructionGraphSourceTrackNode setTrackID:](v14, "setTrackID:", v13);
  v15 = *(_OWORD *)&a4->c;
  v17[0] = *(_OWORD *)&a4->a;
  v17[1] = v15;
  v17[2] = *(_OWORD *)&a4->tx;
  -[PVInstructionGraphSourceNode setTransform:](v14, "setTransform:", v17);
  -[PVInstructionGraphSourceTrackNode setCropRect:](v14, "setCropRect:", x, y, v9, v8);
  -[PVInstructionGraphSourceTrackNode setFillMode:](v14, "setFillMode:", 0);
  -[PVInstructionGraphSourceTrackNode setClipNaturalSize:](v14, "setClipNaturalSize:", width, height);
  return v14;
}

+ (id)newSourceTrackNode:(int)a3 animation:(id)a4 fillMode:(int)a5 clipNaturalSize:(CGSize)a6
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  id v10;
  PVInstructionGraphSourceTrackNode *v11;

  height = a6.height;
  width = a6.width;
  v8 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = objc_alloc_init(PVInstructionGraphSourceTrackNode);
  -[PVInstructionGraphSourceTrackNode setTrackID:](v11, "setTrackID:", v9);
  -[PVInstructionGraphSourceNode setTransformAnimation:](v11, "setTransformAnimation:", v10);
  -[PVInstructionGraphSourceTrackNode setFillMode:](v11, "setFillMode:", v8);
  -[PVInstructionGraphSourceTrackNode setClipNaturalSize:](v11, "setClipNaturalSize:", width, height);

  return v11;
}

+ (id)newSourceTrackNodeWithStabilizationDelegate:(id)a3 userContext:(id)a4 trackID:(int)a5 transform:(CGAffineTransform *)a6 clipNaturalSize:(CGSize)a7
{
  __int128 v7;
  _OWORD v9[3];

  v7 = *(_OWORD *)&a6->c;
  v9[0] = *(_OWORD *)&a6->a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a6->tx;
  return (id)objc_msgSend(a1, "newSourceTrackNodeWithStabilizationDelegate:userContext:trackID:dataTrackID:transform:clipNaturalSize:", a3, a4, *(_QWORD *)&a5, 0, v9, a7.width, a7.height);
}

+ (id)newSourceTrackNodeWithStabilizationDelegate:(id)a3 userContext:(id)a4 trackID:(int)a5 dataTrackID:(int)a6 transform:(CGAffineTransform *)a7 clipNaturalSize:(CGSize)a8
{
  double height;
  double width;
  uint64_t v11;
  uint64_t v12;
  id v15;
  id v16;
  __int128 v17;
  void *v18;
  _OWORD v20[3];

  height = a8.height;
  width = a8.width;
  v11 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a5;
  v15 = a3;
  v16 = a4;
  v17 = *(_OWORD *)&a7->c;
  v20[0] = *(_OWORD *)&a7->a;
  v20[1] = v17;
  v20[2] = *(_OWORD *)&a7->tx;
  v18 = (void *)objc_msgSend(a1, "newSourceTrackNode:transform:cropRect:clipNaturalSize:", v12, v20, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), width, height);
  objc_msgSend(v18, "setDataTrackID:", v11);
  objc_msgSend(v18, "setStabilizationDelegate:", v15);
  objc_msgSend(v18, "setStabilizationDelegateRespondsToDidStabilize:", objc_opt_respondsToSelector() & 1);
  objc_msgSend(v18, "setUserContext:", v16);

  return v18;
}

- (PVInstructionGraphSourceTrackNode)init
{
  PVInstructionGraphSourceTrackNode *v2;
  PVInstructionGraphSourceTrackNode *v3;
  void *v4;
  PVStabilizationDelegate *stabilizationDelegate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PVInstructionGraphSourceTrackNode;
  v2 = -[PVInstructionGraphSourceNode init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)&v2->_fillMode;
    *(_QWORD *)&v2->_fillMode = 0;

    BYTE4(v3->super._transform.ty) = 0;
    stabilizationDelegate = v3->_stabilizationDelegate;
    v3->_stabilizationDelegate = 0;

    v3->_sourceTrackloaded.__a_.__a_value = 0;
    *(_DWORD *)&v3->_stabilizationDelegateRespondsToDidStabilize = 0;
    atomic_store(0, (unsigned int *)&v3->super._transform.ty);
  }
  return v3;
}

- (id)requiredSourceTrackIDs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;

  if (self->_trackID)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sourceTrackloaded.__a_.__a_value);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_trackID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *(_DWORD *)&self->_stabilizationDelegateRespondsToDidStabilize;
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sourceTrackloaded.__a_.__a_value);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v8, "setWithObject:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&self->_stabilizationDelegateRespondsToDidStabilize);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithObjects:", v4, v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;

LABEL_6:
  return v9;
}

- (id)requiredSourceSampleDataTrackIDs
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_dataTrackID || *(_DWORD *)&self->_stabilizationDelegateRespondsToDidStabilize)
  {
    v2 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithObjects:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isPassthru
{
  BOOL IsIdentity;
  void *v5;
  CGAffineTransform v6;

  if (!self->_sourceTrackloaded.__a_.__a_value
    || *(_DWORD *)&self->_stabilizationDelegateRespondsToDidStabilize
    || self->_trackID
    || self->_dataTrackID)
  {
    return 0;
  }
  -[PVInstructionGraphSourceTrackNode stabilizationDelegate](self, "stabilizationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    IsIdentity = 0;
  }
  else
  {
    -[PVInstructionGraphSourceNode transform](self, "transform");
    IsIdentity = CGAffineTransformIsIdentity(&v6);
  }

  return IsIdentity;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  char v5;
  unsigned int *p_ty;
  unsigned int v7;
  void *v8;
  id v9;
  id v10;

  -[PVInstructionGraphSourceTrackNode stabilizationDelegate](self, "stabilizationDelegate", a3.m_Obj, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    p_ty = (unsigned int *)&self->super._transform.ty;
    do
      v7 = __ldaxr(p_ty);
    while (__stlxr(v7 + 1, p_ty));
    if (!v7)
    {
      -[PVInstructionGraphSourceTrackNode stabilizationDelegate](self, "stabilizationDelegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[PVInstructionGraphSourceTrackNode userContext](self, "userContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loadWithUserContext:", v8);

    }
  }
}

- (void)unloadIGNode
{
  char v3;
  unsigned int *p_ty;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;

  -[PVInstructionGraphSourceTrackNode stabilizationDelegate](self, "stabilizationDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    p_ty = (unsigned int *)&self->super._transform.ty;
    do
    {
      v5 = __ldaxr(p_ty);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, p_ty));
    if (!v6)
    {
      -[PVInstructionGraphSourceTrackNode stabilizationDelegate](self, "stabilizationDelegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[PVInstructionGraphSourceTrackNode userContext](self, "userContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unloadWithUserContext:", v7);

    }
  }
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGSolidColor **v6;
  HGSolidColor **v11;
  const char *v12;
  char *v13;
  unsigned __int8 v14;
  uint64_t v15;
  __CVBuffer *v16;
  CVPixelBufferRef v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CVBuffer *v22;
  CGFloat a;
  CGFloat b;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  HGCrop *v43;
  HGSolidColor *v44;
  HGSolidColor *v45;
  __int128 v46;
  double v47;
  double v48;
  int v49;
  HGSolidColor *v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  int32x4_t v54;
  int32x4_t v55;
  int32x4_t v56;
  HGSolidColor *v57;
  int v58;
  HGSolidColor *v59;
  CGFloat v60;
  HGSolidColor *v61;
  int v62;
  HGSolidColor *v63;
  CGFloat v64;
  HGSolidColor *v65;
  int v66;
  HGSolidColor *v67;
  CGFloat v68;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double MinY;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  HGCrop *v83;
  HGSolidColor *v84;
  double v85;
  double v86;
  int v87;
  unsigned int v88;
  double v89;
  double v90;
  double v91;
  double v92;
  __int128 v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  HGSolidColor *v99;
  int v100;
  HGSolidColor *v101;
  CGFloat v102;
  void *v103;
  void *v104;
  int v105;
  _OWORD *v106;
  __int128 v107;
  double v108;
  id userContext;
  double v110;
  double v111;
  double v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  double v116;
  double v117;
  void *v118;
  int depthTrackID;
  double v120;
  void *v121;
  double v122;
  void *v123;
  _BOOL4 v124;
  float ty;
  float v126;
  float tx;
  float v128;
  float v129;
  float v130;
  double v131;
  double v132;
  int v133;
  __int128 v134;
  double v135;
  double v136;
  double v137;
  double v138;
  float v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  float v145;
  float v146;
  HGSolidColor *v147;
  int v148;
  HGSolidColor *v149;
  CGFloat v150;
  HGSolidColor *v151;
  int v152;
  HGSolidColor *v153;
  CGFloat v154;
  double v155;
  HGHWMultiBlend *v156;
  double v157;
  CGFloat v158;
  int64x2_t v159;
  int64x2_t v160;
  int8x16_t v161;
  CGFloat v167;
  unint64_t v168;
  int8x16_t v169;
  CGFloat v170;
  HGSolidColor *v171;
  HGRef<HGNode> v172;
  double v173;
  CGRect v174;
  double v175;
  double v176;
  simd_float4 v177;
  simd_float4 v178;
  simd_float4 v179;
  CGFloat v180;
  CGFloat v181;
  int32x4_t v182;
  int32x4_t v183;
  int32x4_t v184;
  void *v185;
  double v186;
  double v187;
  double d;
  double c;
  float v190;
  double v191;
  float v192;
  double v193;
  double v194;
  void *v195;
  __CVBuffer *v196;
  double rect2;
  __int128 v198[2];
  __int128 v199[2];
  __int128 v200[2];
  _OWORD v201[3];
  HGXForm *v202;
  CGAffineTransform v203;
  HGXForm *v204;
  CGAffineTransform v205;
  CGAffineTransform v206;
  CGAffineTransform v207;
  CGAffineTransform v208;
  CGAffineTransform v209;
  CGAffineTransform v210;
  CGAffineTransform v211;
  CGAffineTransform v212;
  CGAffineTransform v213;
  CGAffineTransform v214;
  CGAffineTransform v215;
  CGAffineTransform v216;
  CGAffineTransform v217;
  __int128 v218;
  int64_t v219;
  CGAffineTransform t1;
  double v221;
  __int128 v222;
  int64_t v223;
  CGAffineTransform v224;
  HGXForm *v225;
  CGAffineTransform v226;
  CGAffineTransform v227;
  CGAffineTransform v228;
  CGAffineTransform v229;
  CGAffineTransform v230;
  CGAffineTransform v231;
  CGAffineTransform v232;
  HGXForm *v233;
  HGSolidColor *v234;
  CGAffineTransform v235;
  HGXForm *v236;
  CGAffineTransform v237;
  HGXForm *v238;
  CGAffineTransform v239;
  __int128 v240;
  int64_t var3;
  _QWORD *v242;
  _BYTE v243[16];
  CGAffineTransform v244;
  CGAffineTransform v245;
  CGAffineTransform v246;
  CGAffineTransform t2;
  simd_float3x3 v249;
  simd_float4x4 v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;

  v11 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v243, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphSourceTrackNode hgNodeForTime:...]");
  v14 = atomic_load(HGLogger::_enabled);
  if ((v14 & 1) != 0)
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"SourceTrackID: %d dataTrackID: %d depthTrackID: %d metadataTrackID: %d\n", v12, v13, self->_sourceTrackloaded.__a_.__a_value, *(unsigned int *)&self->_stabilizationDelegateRespondsToDidStabilize, self->_trackID, self->_dataTrackID);
  PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::GetNode((uint64_t)a4, self, v11);
  PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::GetFrameDataPixelBuffer((uint64_t)a4, self, &v242);
  if (v242 && (v15 = v242[16]) != 0)
    v16 = *(__CVBuffer **)(v15 + 24);
  else
    v16 = 0;
  v17 = CVPixelBufferRetain(v16);
  if (v242)
    (*(void (**)(_QWORD *))(*v242 + 24))(v242);
  -[PVInstructionGraphSourceTrackNode stabilizationDelegate](self, "stabilizationDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  -[PVInstructionGraphSourceTrackNode userContext](self, "userContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = v17;
  objc_msgSend(v18, "timedStabilizationConfigForTime:frameData:userContext:", &v240, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v195 = v20;
  objc_msgSend(v20, "object");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v196;
  if (!objc_msgSend(v21, "isValid"))
    goto LABEL_104;
  PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::GetInputSize((uint64_t)a4, self, (uint64_t)&t1);
  a = t1.a;
  b = t1.b;
  d = t1.d;
  c = t1.c;
  objc_msgSend(v21, "cleanAperture");
  v191 = v26;
  v193 = v25;
  rect2 = v27;
  v29 = v28;
  v30 = *MEMORY[0x1E0C9D538];
  v31 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v21, "normalizedCleanAperture");
  v186 = v32;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v251.origin.x = a;
  v251.origin.y = b;
  v251.size.height = d;
  v251.size.width = c;
  v263.origin.y = v191;
  v263.origin.x = v193;
  v263.size.width = rect2;
  v263.size.height = v29;
  v39 = CGRectEqualToRect(v251, v263);
  if (!v39)
  {
    v252.origin.y = v191;
    v252.origin.x = v193;
    v252.size.width = rect2;
    v252.size.height = v29;
    v40 = HGRectMakeWithCGRect(v252);
    v42 = v41;
    v43 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v43);
    (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v43 + 96))(v43, 0, (float)(int)v40, (float)SHIDWORD(v40), (float)(int)v42, (float)SHIDWORD(v42));
    (*(void (**)(HGCrop *, _QWORD, HGSolidColor *))(*(_QWORD *)v43 + 120))(v43, 0, *v11);
    v44 = *v11;
    v45 = v43;
    if (*v11 != v43)
    {
      if (v44)
        (*(void (**)(HGSolidColor *))(*(_QWORD *)v44 + 24))(v44);
      *v11 = v43;
      (*(void (**)(HGCrop *))(*(_QWORD *)v43 + 16))(v43);
      v45 = *v11;
    }
    v46 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v239.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v239.c = v46;
    *(_OWORD *)&v239.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&t1.a = *(_OWORD *)&v239.a;
    *(_OWORD *)&t1.c = v46;
    *(_OWORD *)&t1.tx = *(_OWORD *)&v239.tx;
    CGAffineTransformMakeScale(&t2, rect2 / rect2, v29 / v29);
    CGAffineTransformConcat(&v239, &t1, &t2);
    v47 = *MEMORY[0x1E0C9D538];
    v48 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v245 = v239;
    CGAffineTransformMakeTranslation(&v244, v47 - v193 * (rect2 / rect2), v48 - v191 * (v29 / v29));
    CGAffineTransformConcat(&v246, &v245, &v244);
    v239 = v246;
    v238 = (HGXForm *)v45;
    if (v45)
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v45 + 16))(v45);
    v237 = v239;
    v49 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
    HGXFormForCGAffineTransform(&v238, &v237, v49, (HGXForm **)&t1);
    v50 = *v11;
    v51 = t1.a;
    if (*v11 == *(HGSolidColor **)&t1.a)
    {
      if (v50)
        (*(void (**)(HGSolidColor *))(*(_QWORD *)v50 + 24))(v50);
    }
    else
    {
      if (v50)
      {
        (*(void (**)(HGSolidColor *))(*(_QWORD *)v50 + 24))(v50);
        v51 = t1.a;
      }
      *(CGFloat *)v11 = v51;
      t1.a = 0.0;
    }
    if (v238)
      (*(void (**)(HGXForm *))(*(_QWORD *)v238 + 24))(v238);
    (*(void (**)(HGCrop *))(*(_QWORD *)v43 + 24))(v43);
  }
  objc_msgSend(v21, "homography");
  v52 = v30 - rect2 * 0.5;
  v53 = v31 - v29 * 0.5;
  v174.size.width = rect2;
  v174.size.height = v29;
  v174.origin.x = v52;
  v174.origin.y = v53;
  v262.origin.x = v34;
  v262.origin.y = v36;
  v262.size.width = v186;
  v262.size.height = v38;
  pv_convert_homography_coordinates(v249, v262, v174);
  v183 = v55;
  v184 = v54;
  v182 = v56;
  memset(&v239, 0, sizeof(v239));
  v180 = v53;
  v181 = v52;
  CGAffineTransformMakeTranslation(&v239, v52, v53);
  v57 = *v11;
  v236 = (HGXForm *)v57;
  if (v57)
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v57 + 16))(v57);
  v235 = v239;
  v58 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
  HGXFormForCGAffineTransform(&v236, &v235, v58, (HGXForm **)&t1);
  v59 = *v11;
  v60 = t1.a;
  if (*v11 == *(HGSolidColor **)&t1.a)
  {
    if (v59)
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v59 + 24))(v59);
  }
  else
  {
    if (v59)
    {
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v59 + 24))(v59);
      v60 = t1.a;
    }
    *(CGFloat *)v11 = v60;
    t1.a = 0.0;
  }
  if (v236)
    (*(void (**)(HGXForm *))(*(_QWORD *)v236 + 24))(v236);
  v61 = *v11;
  v234 = v61;
  if (v61)
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v61 + 16))(v61);
  v62 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
  v250.columns[0] = (simd_float4)vtrn1q_s32((int32x4_t)0, v184);
  v250.columns[0].i64[0] = v184.i64[0];
  v250.columns[1] = (simd_float4)vtrn1q_s32((int32x4_t)0, v183);
  v250.columns[1].i64[0] = v183.i64[0];
  v250.columns[3] = (simd_float4)vtrn1q_s32((int32x4_t)0, v182);
  v250.columns[3].i64[0] = v182.i64[0];
  v250.columns[2] = (simd_float4)xmmword_1B304F250;
  v177 = v250.columns[1];
  v178 = v250.columns[0];
  v179 = v250.columns[3];
  HGXFormForSIMDFloat4x4((const void **)&v234, v62, (HGXForm **)&t1, v250);
  v63 = *v11;
  v64 = t1.a;
  if (*v11 == *(HGSolidColor **)&t1.a)
  {
    if (v63)
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v63 + 24))(v63);
  }
  else
  {
    if (v63)
    {
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v63 + 24))(v63);
      v64 = t1.a;
    }
    *(CGFloat *)v11 = v64;
    t1.a = 0.0;
  }
  if (v234)
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v234 + 24))(v234);
  v65 = *v11;
  v233 = (HGXForm *)v65;
  if (v65)
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v65 + 16))(v65);
  v231 = v239;
  CGAffineTransformInvert(&v232, &v231);
  v66 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
  HGXFormForCGAffineTransform(&v233, &v232, v66, (HGXForm **)&t1);
  v67 = *v11;
  v68 = t1.a;
  if (*v11 == *(HGSolidColor **)&t1.a)
  {
    if (v67)
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v67 + 24))(v67);
  }
  else
  {
    if (v67)
    {
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v67 + 24))(v67);
      v68 = t1.a;
    }
    *(CGFloat *)v11 = v68;
    t1.a = 0.0;
  }
  if (v233)
    (*(void (**)(HGXForm *))(*(_QWORD *)v233 + 24))(v233);
  memset(&v230, 0, sizeof(v230));
  CGAffineTransformMakeScale(&v229, rect2 / v186, v29 / v38);
  CGAffineTransformMakeTranslation(&v228, rect2 * 0.5, v29 * 0.5);
  CGAffineTransformConcat(&v230, &v229, &v228);
  objc_msgSend(v21, "cropRect");
  v227 = v230;
  v254 = CGRectApplyAffineTransform(v253, &v227);
  x = v254.origin.x;
  y = v254.origin.y;
  width = v254.size.width;
  height = v254.size.height;
  MinX = CGRectGetMinX(v254);
  v255.origin.x = x;
  v255.origin.y = y;
  v255.size.width = width;
  v255.size.height = height;
  MaxX = CGRectGetMaxX(v255);
  v256.origin.x = x;
  v256.origin.y = y;
  v256.size.width = width;
  v256.size.height = height;
  MinY = CGRectGetMinY(v256);
  v257.origin.x = x;
  v257.origin.y = y;
  v257.size.width = width;
  v257.size.height = height;
  v76 = round(MinX);
  v77 = round(MinY);
  v78 = round(MaxX - (x - v76)) - v76;
  v79 = round(CGRectGetMaxY(v257) - (y - v77)) - v77;
  v258.origin.x = 0.0;
  v258.origin.y = 0.0;
  v258.size.width = rect2;
  v258.size.height = v29;
  v264.origin.x = v76;
  v264.origin.y = v77;
  v264.size.width = v78;
  v264.size.height = v79;
  if (CGRectEqualToRect(v258, v264))
  {
    if (v39)
      goto LABEL_102;
  }
  else
  {
    v259.origin.x = v76;
    v259.origin.y = v77;
    v259.size.width = v78;
    v259.size.height = v79;
    v80 = HGRectMakeWithCGRect(v259);
    v82 = v81;
    v83 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v83);
    (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v83 + 96))(v83, 0, (float)(int)v80, (float)SHIDWORD(v80), (float)(int)v82, (float)SHIDWORD(v82));
    (*(void (**)(HGCrop *, _QWORD, HGSolidColor *))(*(_QWORD *)v83 + 120))(v83, 0, *v11);
    v84 = *v11;
    if (*v11 != v83)
    {
      if (v84)
        (*(void (**)(HGSolidColor *))(*(_QWORD *)v84 + 24))(v84);
      *v11 = v83;
      (*(void (**)(HGCrop *))(*(_QWORD *)v83 + 16))(v83);
    }
    (*(void (**)(HGCrop *))(*(_QWORD *)v83 + 24))(v83);
  }
  v260.origin.x = 0.0;
  v260.origin.y = 0.0;
  v260.size.width = rect2;
  v260.size.height = v29;
  v265.origin.x = v76;
  v265.origin.y = v77;
  v265.size.width = v78;
  v265.size.height = v79;
  v261 = CGRectIntersection(v260, v265);
  v187 = v261.origin.x;
  v176 = v261.origin.y;
  v85 = v261.size.width;
  v86 = v261.size.height;
  v87 = objc_msgSend(v21, "fillMode");
  v88 = v87;
  if (!v87)
    goto LABEL_102;
  v175 = v78;
  if (v87 > 2)
  {
    v89 = d;
    v90 = c;
    if (v87 != 3)
    {
      if (v87 == 13)
      {
        v90 = c;
        v89 = c / (v85 / v86);
      }
      else
      {
        v90 = v85;
        v89 = v86;
        if (v87 == 14)
        {
          v89 = d;
          v90 = d * (v85 / v86);
        }
      }
    }
    goto LABEL_82;
  }
  if (v87 == 1)
  {
    if (c <= d)
    {
      v91 = d / v86;
      if (v85 * (d / v86) < c)
        v91 = c / v85;
    }
    else
    {
      v91 = c / v85;
      if (v86 * (c / v85) < d)
        v91 = d / v86;
    }
    goto LABEL_81;
  }
  v90 = v85;
  v89 = v86;
  if (v87 == 2)
  {
    v91 = c / v85;
    if (v86 * (c / v85) > d)
      v91 = d / v86;
LABEL_81:
    v90 = v85 * v91;
    v89 = v86 * v91;
  }
LABEL_82:
  v92 = v90 / v85;
  v93 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v226.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v226.c = v93;
  *(_OWORD *)&v226.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&t1.a = *(_OWORD *)&v226.a;
  *(_OWORD *)&t1.c = v93;
  *(_OWORD *)&t1.tx = *(_OWORD *)&v226.tx;
  v94 = v89 / v86;
  CGAffineTransformMakeScale(&t2, v92, v94);
  CGAffineTransformConcat(&v226, &t1, &t2);
  if (v88 - 1 >= 6 && v88 - 13 >= 2)
  {
    v96 = *MEMORY[0x1E0C9D538];
    v95 = c - v90;
  }
  else
  {
    v95 = c - v90;
    v96 = (c - v90) * 0.5;
  }
  v97 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v88 <= 0xE && ((1 << v88) & 0x619E) != 0)
  {
    v98 = d - v89;
    v97 = (d - v89) * 0.5;
  }
  else
  {
    v98 = d - v89;
  }
  v78 = v175;
  switch(v88)
  {
    case 6u:
    case 0xBu:
      goto LABEL_91;
    case 8u:
    case 0xAu:
      v96 = v95;
      break;
    case 0xCu:
      v96 = v95;
LABEL_91:
      v97 = v98;
      break;
    default:
      break;
  }
  v245 = v226;
  CGAffineTransformMakeTranslation(&v244, v96 - v187 * v92, v97 - v176 * v94);
  CGAffineTransformConcat(&v246, &v245, &v244);
  v226 = v246;
  v99 = *v11;
  v225 = (HGXForm *)v99;
  if (v99)
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v99 + 16))(v99);
  v224 = v226;
  v100 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
  HGXFormForCGAffineTransform(&v225, &v224, v100, (HGXForm **)&t1);
  v101 = *v11;
  v102 = t1.a;
  if (*v11 == *(HGSolidColor **)&t1.a)
  {
    if (v101)
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v101 + 24))(v101);
  }
  else
  {
    if (v101)
    {
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v101 + 24))(v101);
      v102 = t1.a;
    }
    *(CGFloat *)v11 = v102;
    t1.a = 0.0;
  }
  if (v225)
    (*(void (**)(HGXForm *))(*(_QWORD *)v225 + 24))(v225);
LABEL_102:
  if (-[PVInstructionGraphSourceTrackNode stabilizationDelegateRespondsToDidStabilize](self, "stabilizationDelegateRespondsToDidStabilize"))
  {
    -[PVInstructionGraphSourceTrackNode stabilizationDelegate](self, "stabilizationDelegate");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v222 = *(_OWORD *)&a3->var0;
    v223 = a3->var3;
    -[PVInstructionGraphSourceTrackNode userContext](self, "userContext");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v103, "didStabilize:time:frameData:inputSize:cleanAperture:centeredCleanAperture:cleanApertureOriginZero:cropRect:homography:homographyMatrix4x4:userContext:", v195, &v222, v196, v104, c, d, v193, v191, *(_QWORD *)&v181, *(_QWORD *)&v180, *(_QWORD *)&rect2, *(_QWORD *)&v29, 0, 0, *(_QWORD *)&rect2, *(_QWORD *)&v29,
             *(_QWORD *)&v76,
             *(_QWORD *)&v77,
             *(_QWORD *)&v78,
             *(_QWORD *)&v79,
             v184.i64[0],
             v184.u32[2],
             v183.i64[0],
             v183.u32[2],
             v182.i64[0],
             v182.u32[2],
             *(_OWORD *)&v178,
             *(_OWORD *)&v177,
             0,
             1065353216,
             *(_OWORD *)&v179);

    goto LABEL_105;
  }
LABEL_104:
  v105 = 1;
LABEL_105:
  CVPixelBufferRelease(v196);
  if (!self->_depthTrackID)
  {
    -[PVInstructionGraphSourceNode transform](self, "transform");
    t2 = t1;
    v118 = v195;
    goto LABEL_162;
  }
  memset(&v246, 0, sizeof(v246));
  v185 = v21;
  -[PVInstructionGraphSourceNode transform](self, "transform");
  v106 = (_OWORD *)MEMORY[0x1E0C9BAA8];
  v107 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v245.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v245.c = v107;
  *(_OWORD *)&v245.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  userContext = self->_userContext;
  v108 = self->_clipNaturalSize.width;
  v110 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
  v112 = v111;
  v113 = -[PVInstructionGraphSourceNode transformAnimationContentMode](self, "transformAnimationContentMode");
  v114 = v113;
  if (!(_DWORD)v113 || (_DWORD)v113 == 3)
  {
    v115 = v105;
    v116 = v112;
    v117 = v110;
    goto LABEL_134;
  }
  depthTrackID = self->_depthTrackID;
  if (depthTrackID <= 2)
  {
    if (depthTrackID == 1)
    {
      if (v110 <= v112)
      {
        v120 = v112 / v108;
        if (*(double *)&userContext * (v112 / v108) < v110)
          v120 = v110 / *(double *)&userContext;
      }
      else
      {
        v120 = v110 / *(double *)&userContext;
        if (v108 * (v110 / *(double *)&userContext) < v112)
          v120 = v112 / v108;
      }
    }
    else
    {
      v117 = *(double *)&userContext;
      v116 = v108;
      if (depthTrackID != 2)
        goto LABEL_131;
      v120 = v110 / *(double *)&userContext;
      if (v108 * (v110 / *(double *)&userContext) > v112)
        v120 = v112 / v108;
    }
    v117 = *(double *)&userContext * v120;
    v116 = v108 * v120;
    goto LABEL_131;
  }
  if (depthTrackID == 3)
  {
    v117 = v110;
    goto LABEL_121;
  }
  if (depthTrackID == 13)
  {
    v116 = v110 / (*(double *)&userContext / v108);
    v117 = v110;
    goto LABEL_131;
  }
  v117 = *(double *)&userContext;
  v116 = v108;
  if (depthTrackID == 14)
  {
    v117 = *(double *)&userContext / v108 * v112;
LABEL_121:
    v116 = v112;
  }
LABEL_131:
  -[PVInstructionGraphSourceNode transformAnimation](self, "transformAnimation");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "aspectRatio");
  v115 = v105;
  switch(self->_depthTrackID)
  {
    case 1:
      if (v117 / v122 <= v116)
        v116 = v117 / v122;
      v117 = v122 * v116;
      break;
    case 2:
      if (v117 <= v116)
      {
        v173 = v116;
        if (v116 * v122 < v117)
          v173 = v117 / v122;
      }
      else
      {
        v173 = v117 / v122;
        if (v117 / v122 < v116)
          v173 = v116;
      }
      v117 = v122 * v173;
      v116 = v173;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xA:
    case 0xB:
    case 0xC:
      v116 = 1.0;
      v117 = v122;
      break;
    case 0xD:
      v116 = v117 / v122;
      break;
    case 0xE:
      v117 = v116 * v122;
      break;
    default:
      break;
  }

LABEL_134:
  -[PVInstructionGraphSourceNode transformAnimation](self, "transformAnimation");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = v110;
  v218 = *(_OWORD *)&a3->var0;
  v219 = a3->var3;
  v124 = +[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v123, &v218, v114, 0, &t1, v117, v116);

  v118 = v195;
  if (v124)
  {
    ty = t1.ty;
    v126 = t1.d;
    v192 = v126;
    tx = t1.tx;
    v128 = v221;
  }
  else
  {
    v192 = 0.0;
    ty = 1.0;
    tx = 0.0;
    v128 = 0.0;
  }
  v129 = *(double *)&userContext * -0.5;
  v130 = v108 * -0.5;
  memset(&v244, 0, sizeof(v244));
  v131 = v129;
  v132 = v130;
  CGAffineTransformMakeTranslation(&v244, v129, v130);
  v217 = v245;
  v216 = v244;
  CGAffineTransformConcat(&v245, &v217, &v216);
  v133 = self->_depthTrackID;
  v190 = tx;
  if (v133)
  {
    v134 = v106[1];
    *(_OWORD *)&v215.a = *v106;
    *(_OWORD *)&v215.c = v134;
    *(_OWORD *)&v215.tx = v106[2];
    CGAffineTransformTranslate(&v239, &v215, v131, v132);
    *(_OWORD *)&v230.a = *(_OWORD *)&v239.tx;
    v214 = v239;
    v213 = v246;
    CGAffineTransformConcat(&v239, &v214, &v213);
    v135 = fabs(*(double *)&userContext * v239.a + v108 * v239.c);
    v136 = fabs(*(double *)&userContext * v239.b + v108 * v239.d);
    if (v133 <= 2)
    {
      if (v133 == 1)
      {
        v138 = v112;
        v22 = v196;
        if (v194 <= v112)
        {
          v144 = v112 / v136;
          v139 = v192;
          if (v135 * (v112 / v136) < v194)
            v144 = v194 / v135;
        }
        else
        {
          v144 = v194 / v135;
          v139 = v192;
          if (v136 * (v194 / v135) < v112)
            v144 = v112 / v136;
        }
        v137 = v135 * v144;
        goto LABEL_157;
      }
      v22 = v196;
      v138 = v112;
      v139 = v192;
      if (v133 == 2)
      {
        v142 = v136 * (v194 / v135);
        v143 = v112 / v136;
        if (v142 <= v112)
          v143 = v194 / v135;
        v137 = v135 * v143;
        goto LABEL_157;
      }
    }
    else
    {
      v137 = v194;
      v22 = v196;
      v138 = v112;
      v139 = v192;
      switch(v133)
      {
        case 3:
LABEL_157:
          v140 = v137 / v135;
          v141 = v194;
          goto LABEL_158;
        case 13:
          v141 = v194;
          v140 = v194 / (v135 / v136) / v136;
LABEL_158:
          v105 = v115;
          goto LABEL_159;
        case 14:
          v137 = v112 * (v135 / v136);
          goto LABEL_157;
      }
    }
    v137 = v135;
    goto LABEL_157;
  }
  v140 = 1.0;
  v22 = v196;
  v105 = v115;
  v138 = v112;
  v141 = v194;
  v139 = v192;
LABEL_159:
  v212 = v245;
  v211 = v246;
  CGAffineTransformConcat(&v239, &v212, &v211);
  v245 = v239;
  v21 = v185;
  if (v128 != 0.0)
  {
    v210 = v245;
    CGAffineTransformMakeRotation(&v209, (float)((float)(v128 * 3.1416) / 180.0));
    CGAffineTransformConcat(&v239, &v210, &v209);
    v245 = v239;
  }
  memset(&v239, 0, sizeof(v239));
  CGAffineTransformMakeScale(&v239, v140 * ty, v140 * ty);
  v208 = v245;
  v207 = v239;
  CGAffineTransformConcat(&v230, &v208, &v207);
  v245 = v230;
  v145 = *(double *)&userContext * 0.5 + floor(v141 - *(double *)&userContext) * 0.5 + v139;
  v146 = v108 * 0.5 + floor(v138 - v108) * 0.5 + v190;
  CGAffineTransformMakeTranslation(&v230, v145, v146);
  v244 = v230;
  v206 = v245;
  v205 = v230;
  CGAffineTransformConcat(&v230, &v206, &v205);
  v245 = v230;
  t2 = v230;
LABEL_162:
  v147 = *v11;
  v204 = (HGXForm *)v147;
  if (v147)
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v147 + 16))(v147);
  v203 = t2;
  v148 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
  HGXFormForCGAffineTransform(&v204, &v203, v148, (HGXForm **)&t1);
  v149 = *v11;
  v150 = t1.a;
  if (*v11 == *(HGSolidColor **)&t1.a)
  {
    if (v149)
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v149 + 24))(v149);
  }
  else
  {
    if (v149)
    {
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v149 + 24))(v149);
      v150 = t1.a;
    }
    *(CGFloat *)v11 = v150;
    t1.a = 0.0;
  }
  if (v204)
    (*(void (**)(HGXForm *))(*(_QWORD *)v204 + 24))(v204);
  v151 = *v11;
  v202 = (HGXForm *)v151;
  if (v151)
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v151 + 16))(v151);
  (*(void (**)(_OWORD *__return_ptr))(**(_QWORD **)a6.m_Obj + 56))(v201);
  v152 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
  HGXFormForCGAffineTransform(&v202, v201, v152, (HGXForm **)&t1);
  v153 = *v11;
  v154 = t1.a;
  if (*v11 == *(HGSolidColor **)&t1.a)
  {
    if (v153)
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v153 + 24))(v153);
  }
  else
  {
    if (v153)
    {
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v153 + 24))(v153);
      v154 = t1.a;
    }
    *(CGFloat *)v11 = v154;
    t1.a = 0.0;
  }
  if (v202)
    (*(void (**)(HGXForm *))(*(_QWORD *)v202 + 24))(v202);
  if (-[PVInstructionGraphNode isDebugDrawingEnabled](self, "isDebugDrawingEnabled")
    && objc_msgSend(v21, "isValid"))
  {
    v155 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
    v156 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
    HGHWMultiBlend::HGHWMultiBlend(v156);
    (*(void (**)(HGHWMultiBlend *, _QWORD, float, float, float, float))(*(_QWORD *)v156 + 96))(v156, 0, 9.0, 0.0, 0.0, 0.0);
    (*(void (**)(HGHWMultiBlend *, _QWORD, HGSolidColor *))(*(_QWORD *)v156 + 120))(v156, 0, *v11);
    v157 = v155 * 0.5;
    v200[0] = 0uLL;
    v200[1] = xmmword_1B304EEE0;
    coloredDotHGNode(v200, (HGCrop **)&t1, v157 + -13.0);
    v158 = t1.a;
    (*(void (**)(HGHWMultiBlend *, uint64_t, _QWORD))(*(_QWORD *)v156 + 120))(v156, 1, *(_QWORD *)&t1.a);
    if (v158 != 0.0)
      v159 = (int64x2_t)((__n128 (*)(_QWORD))*(_QWORD *)(**(_QWORD **)&v158 + 24))(*(_QWORD *)&v158);
    v159.i64[0] = 0;
    v160.i64[0] = (uint64_t)v22;
    v161 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v160, v159).i64[0], 0);
    __asm { FMOV            V1.2D, #1.0 }
    v199[0] = (__int128)vbicq_s8(_Q1, v161);
    v199[1] = (__int128)vbslq_s8(v161, (int8x16_t)xmmword_1B304EEE0, _Q1);
    coloredDotHGNode(v199, (HGCrop **)&t1, v157 + -12.0);
    v167 = t1.a;
    (*(void (**)(HGHWMultiBlend *, uint64_t, _QWORD))(*(_QWORD *)v156 + 120))(v156, 2, *(_QWORD *)&t1.a);
    if (v167 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v167 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v167));
    if (v105)
      v168 = -1;
    else
      v168 = 0;
    v169 = (int8x16_t)vdupq_n_s64(v168);
    v198[0] = (__int128)vbslq_s8(v169, (int8x16_t)xmmword_1B304F300, (int8x16_t)xmmword_1B304F2F0);
    v198[1] = (__int128)vbslq_s8(v169, (int8x16_t)xmmword_1B304F320, (int8x16_t)xmmword_1B304F310);
    coloredDotHGNode(v198, (HGCrop **)&t1, v157 + -6.0);
    v170 = t1.a;
    (*(void (**)(HGHWMultiBlend *, uint64_t, _QWORD))(*(_QWORD *)v156 + 120))(v156, 3, *(_QWORD *)&t1.a);
    if (v170 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v170 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v170));
    v171 = *v11;
    if (*v11 != v156)
    {
      if (v171)
        (*(void (**)(HGSolidColor *))(*(_QWORD *)v171 + 24))(v171);
      *v11 = v156;
      (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v156 + 16))(v156);
    }
    (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v156 + 24))(v156);
  }

  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v243);
  return v172;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v4;
  uint64_t v6;
  id v7;
  float64x2_t *p_userContext;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  PCRect<double> result;

  v6 = v4;
  v7 = a3;
  *(_QWORD *)v6 = 0;
  *(_QWORD *)(v6 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v6 + 16) = _Q0;
  p_userContext = (float64x2_t *)&self->_userContext;
  v15 = p_userContext->f64[0];
  v14 = p_userContext->f64[1];
  v23 = v7;
  if (v14 <= p_userContext->f64[0])
  {
    objc_msgSend(v7, "outputSize");
    v17 = v15 / v18;
  }
  else
  {
    objc_msgSend(v7, "outputSize");
    v17 = v14 / v16;
  }
  *(float64x2_t *)(v6 + 16) = vdivq_f64(*p_userContext, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v17, 0));

  result.var3 = v22;
  result.var2 = v21;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float64x2_t v25;
  PCMatrix44Tmpl<double> *result;
  id v27;

  v27 = a4;
  v7 = (*(double (**)(_QWORD))(**(_QWORD **)a5.m_Obj + 40))(*(_QWORD *)a5.m_Obj);
  v9 = v8;
  v10 = (*(float (**)(_QWORD))(**(_QWORD **)a5.m_Obj + 48))(*(_QWORD *)a5.m_Obj);
  objc_msgSend(v27, "outputSize");
  v12 = v11;
  objc_msgSend(v27, "outputSize");
  v13 = v7;
  v14 = v9;
  v15 = v10 * v13;
  v16 = v10 * v14;
  v18 = v12 / v17;
  v19 = (float)(v13 / v14);
  if (vabdd_f64(v18, v19) < 0.0000001)
  {
    v20 = v27;
    if (v16 > v15)
      goto LABEL_5;
LABEL_6:
    objc_msgSend(v20, "outputSize");
    v22 = v15 / v23;
    goto LABEL_7;
  }
  v20 = v27;
  if (v18 <= v19)
    goto LABEL_6;
LABEL_5:
  objc_msgSend(v20, "outputSize");
  v22 = v16 / v21;
LABEL_7:
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  v24 = v22;
  v25 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, v24, (float)-v24, 1.0);
  v25.f64[0] = v15 * 0.5;
  PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v25, v16 * 0.5, 0.0);

  return result;
}

- (BOOL)isPortrait
{
  return *(double *)&self->_userContext < self->_clipNaturalSize.width;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  void *v4;
  void *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *(_QWORD *)a3.m_Obj;
  if (v8)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v8 + 16))(v8, a2);
  v7.receiver = self;
  v7.super_class = (Class)PVInstructionGraphSourceTrackNode;
  -[PVInstructionGraphNode dotTreeLabel:](&v7, sel_dotTreeLabel_, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("\nTrack: %d\nSize: [%.0f x %.0f]"), self->_sourceTrackloaded.__a_.__a_value, self->_userContext, *(_QWORD *)&self->_clipNaturalSize.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)instructionGraphNodeDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PVInstructionGraphSourceTrackNode;
  -[PVInstructionGraphSourceNode instructionGraphNodeDescription](&v13, sel_instructionGraphNodeDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("class"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sourceTrackloaded.__a_.__a_value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("trackID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&self->_stabilizationDelegateRespondsToDidStabilize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("dataTrackID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_trackID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("depthTrackID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&self->_stabilizationDelegateRespondsToDidStabilize);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("metadataTrackID"));

  NSStringFromSIMDDouble2(2, *(__n128 *)&self->_userContext);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("clipNaturalSize"));

  return v4;
}

- (int)trackID
{
  return self->_sourceTrackloaded.__a_.__a_value;
}

- (void)setTrackID:(int)a3
{
  self->_sourceTrackloaded.__a_.__a_value = a3;
}

- (int)dataTrackID
{
  return *(_DWORD *)&self->_stabilizationDelegateRespondsToDidStabilize;
}

- (void)setDataTrackID:(int)a3
{
  *(_DWORD *)&self->_stabilizationDelegateRespondsToDidStabilize = a3;
}

- (int)depthTrackID
{
  return self->_trackID;
}

- (void)setDepthTrackID:(int)a3
{
  self->_trackID = a3;
}

- (int)metadataTrackID
{
  return self->_dataTrackID;
}

- (void)setMetadataTrackID:(int)a3
{
  self->_dataTrackID = a3;
}

- (CGRect)cropRect
{
  double height;
  double x;
  double y;
  double width;
  CGRect result;

  height = self->_clipNaturalSize.height;
  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  result.size.height = width;
  result.size.width = y;
  result.origin.y = x;
  result.origin.x = height;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  *(CGRect *)&self->_clipNaturalSize.height = a3;
}

- (int)fillMode
{
  return self->_depthTrackID;
}

- (void)setFillMode:(int)a3
{
  self->_depthTrackID = a3;
}

- (PVStabilizationDelegate)stabilizationDelegate
{
  return *(PVStabilizationDelegate **)&self->_fillMode;
}

- (void)setStabilizationDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_fillMode, a3);
}

- (id)userContext
{
  return self->_stabilizationDelegate;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_stabilizationDelegate, a3);
}

- (CGSize)clipNaturalSize
{
  id userContext;
  double width;
  CGSize result;

  userContext = self->_userContext;
  width = self->_clipNaturalSize.width;
  result.height = width;
  result.width = *(double *)&userContext;
  return result;
}

- (void)setClipNaturalSize:(CGSize)a3
{
  *(CGSize *)&self->_userContext = a3;
}

- (BOOL)stabilizationDelegateRespondsToDidStabilize
{
  return BYTE4(self->super._transform.ty);
}

- (void)setStabilizationDelegateRespondsToDidStabilize:(BOOL)a3
{
  BYTE4(self->super._transform.ty) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stabilizationDelegate, 0);
  objc_storeStrong((id *)&self->_fillMode, 0);
}

@end
