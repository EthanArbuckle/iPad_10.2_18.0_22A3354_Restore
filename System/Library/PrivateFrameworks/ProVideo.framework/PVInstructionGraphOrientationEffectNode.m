@implementation PVInstructionGraphOrientationEffectNode

+ (id)newOrientationEffectNodeWithInputs:(id)a3 inputIDs:(id)a4 effect:(id)a5
{
  id v7;
  id v8;
  id v9;
  PVInstructionGraphOrientationEffectNode *v10;
  unint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PVInstructionGraphOrientationEffectNode);
  for (i = 0; objc_msgSend(v7, "count") > i; ++i)
  {
    objc_msgSend(v7, "objectAtIndex:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedLongValue");

    -[PVInstructionGraphEffectNode setInputNode:forInputID:](v10, "setInputNode:forInputID:", v12, v14);
  }
  -[PVInstructionGraphOrientationEffectNode setEffect:](v10, "setEffect:", v9);

  return v10;
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGSolidColor **v6;
  const char *v11;
  const char *v12;
  char *v13;
  BOOL bypassOutOfRangeEffects;
  PVEffect *effect;
  PVEffect *v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  const char *v20;
  char *v21;
  PVEffect *v22;
  __int128 v23;
  const char *v24;
  char *v25;
  PVEffect *v26;
  void *v27;
  unsigned __int8 v28;
  uint64_t v29;
  HGSolidColor *v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  uint64_t v38;
  const char *v39;
  char *v40;
  uint64_t v41;
  PVEffect *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  const char *v46;
  char *v47;
  uint64_t *v48;
  unsigned __int8 v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  char *v55;
  void *v56;
  void *v57;
  unsigned __int8 v58;
  HGColorClamp *v59;
  unsigned int v60;
  PVEffect *v61;
  uint64_t v62;
  uint64_t **v63;
  __int128 v64;
  PVEffect *v65;
  uint64_t v66;
  uint64_t *v67;
  int v68;
  unsigned __int8 v69;
  id v70;
  uint64_t v71;
  const char *v72;
  char *v73;
  PVEffect *v74;
  uint64_t v75;
  HGRef<HGNode> v76;
  int v77;
  void *v78;
  PVEffect *v79;
  HGSolidColor **v81;
  uint64_t v82;
  __int128 v83;
  int64_t var3;
  CMTimeRange range2;
  CMTimeRange range1;
  uint64_t v87;
  __int128 v88;
  int64_t v89;
  uint64_t v90;
  _DWORD *v91[17];
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  unsigned int *v96;
  _QWORD v97[2];
  uint64_t *v98;
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[2];
  uint64_t *v102;
  _QWORD v103[3];
  _QWORD v104[2];
  uint64_t v105;
  __int128 v106;
  int64_t v107;
  uint64_t v108;
  __int128 v109;
  int64_t v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  __int128 v114;
  int64_t v115;
  CMTimeRange v116;
  CMTime time;
  CMTimeRange range;
  uint64_t v119;
  _BYTE v120[16];
  unsigned int v121;
  unsigned int *v122[3];

  v81 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v120, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphEffectOrientationNode hgNodeForTime:...]");
  v119 = *(_QWORD *)a6.m_Obj;
  if (v119)
    (*(void (**)(uint64_t))(*(_QWORD *)v119 + 16))(v119);
  -[PVInstructionGraphEffectNode addDotTreeLinks:](self, "addDotTreeLinks:", &v119);
  if (v119)
    (*(void (**)(uint64_t))(*(_QWORD *)v119 + 24))(v119);
  bypassOutOfRangeEffects = self->_bypassOutOfRangeEffects;
  if (bypassOutOfRangeEffects)
  {
    effect = self->_effect;
    if (effect)
      -[PVEffect effectRange](effect, "effectRange");
    else
      memset(&range, 0, sizeof(range));
    time = (CMTime)*a3;
    bypassOutOfRangeEffects = CMTimeRangeContainsTime(&range, &time) == 0;
  }
  v16 = self->_effect;
  if (!v16 || bypassOutOfRangeEffects)
  {
    if (v16)
    {
      -[PVEffect effectRange](v16, "effectRange");
      v23 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      *(_OWORD *)&range2.start.value = *MEMORY[0x1E0CA2E40];
      *(_OWORD *)&range2.start.epoch = v23;
      *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      if (CMTimeRangeEqual(&range1, &range2))
      {
        v26 = self->_effect;
        -[PVEffect debugDisplayName](v26, "debugDisplayName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("WARNING: -hgNodeForTime called on invalid effect animation range! (%p, %@)"), v26, v27);

      }
      v28 = atomic_load(HGLogger::_enabled);
      if ((v28 & 1) != 0)
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Current Time is out of Effect Range. Returning HGNode of first input, assuming input0 is set...\n", v24, v25);
      v29 = PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
      HGDotGraph::filled(v29, (unint64_t)self, "#FFA500");
      if (+[PVEnvironment PV_DEBUG_COLOR_OUT_OF_RANGE_EFFECTS](PVEnvironment, "PV_DEBUG_COLOR_OUT_OF_RANGE_EFFECTS"))
      {
        v30 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
        HGSolidColor::HGSolidColor(v30);
        (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v30 + 96))(v30, 0, 0.0, 1.0, 1.0, 1.0);
        *v81 = v30;
        goto LABEL_103;
      }
    }
    else
    {
      v31 = atomic_load(HGLogger::_enabled);
      if ((v31 & 1) != 0)
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"effect is Nil. Returning HGNode of first input, assuming input0 is set...\n", v12, v13);
      v32 = PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
      HGDotGraph::filled(v32, (unint64_t)self, "#822222");
    }
    LODWORD(v91[0]) = 0;
    v96 = (unsigned int *)v91;
    v33 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)&self->super._inputMap, (unsigned int *)v91, (uint64_t)&std::piecewise_construct, &v96)[5];
    v83 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v34 = *(_QWORD *)a6.m_Obj;
    v82 = v34;
    if (v34)
      (*(void (**)(uint64_t))(*(_QWORD *)v34 + 16))(v34);
    if (v33)
    {
      objc_msgSend(v33, "hgNodeForTime:trackInputs:renderer:igContext:", &v83, a4, a5, &v82);
      v34 = v82;
      if (!v82)
        goto LABEL_103;
    }
    else
    {
      *v81 = 0;
      if (!v34)
        goto LABEL_103;
    }
    (*(void (**)(uint64_t))(*(_QWORD *)v34 + 24))(v34);
    goto LABEL_103;
  }
  v17 = atomic_load(HGLogger::_enabled);
  if ((v17 & 1) != 0)
  {
    -[PVEffect debugDisplayName](self->_effect, "debugDisplayName");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "UTF8String");
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Will Build render graph for effect (%s)\n", v20, v21, v19);

  }
  if ((int)HGLogger::getLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v11) >= 1)
  {
    v22 = self->_effect;
    if (v22)
      -[PVEffect effectRange](v22, "effectRange");
    else
      memset(&v116, 0, sizeof(v116));
    CMTimeRangeCopyDescription(0, &v116);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    v37 = atomic_load(HGLogger::_enabled);
    if ((v37 & 1) != 0)
    {
      v38 = objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Effect Time Range: %s\n", v39, v40, v38);
    }
    CFRelease(v36);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LODWORD(v91[0]) = 0;
    v96 = (unsigned int *)v91;
    v51 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)&self->super._inputMap, (unsigned int *)v91, (uint64_t)&std::piecewise_construct, &v96)[5];
    v114 = *(_OWORD *)&a3->var0;
    v115 = a3->var3;
    v52 = *(_QWORD *)a6.m_Obj;
    v113 = v52;
    if (v52)
      (*(void (**)(uint64_t))(*(_QWORD *)v52 + 16))(v52);
    if (v51)
    {
      objc_msgSend(v51, "hgNodeForTime:trackInputs:renderer:igContext:", &v114, a4, a5, &v113);
      v52 = v113;
      if (!v113)
        goto LABEL_103;
    }
    else
    {
      *v81 = 0;
      if (!v52)
        goto LABEL_103;
    }
    (*(void (**)(uint64_t))(*(_QWORD *)v52 + 24))(v52);
    goto LABEL_103;
  }
  v41 = *(_QWORD *)a6.m_Obj;
  v112 = v41;
  if (v41)
    (*(void (**)(uint64_t))(*(_QWORD *)v41 + 16))(v41);
  -[PVInstructionGraphNode loadIGNode:](self, "loadIGNode:", &v112);
  if (v112)
    (*(void (**)(uint64_t))(*(_QWORD *)v112 + 24))(v112);
  v42 = self->_effect;
  v111 = 0;
  v109 = *(_OWORD *)&a3->var0;
  v110 = a3->var3;
  v79 = v42;
  -[PVEffect inputsForTime:](v42, "inputsForTime:", &v109);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "firstObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "intValue");

  v111 = v45;
  v96 = &v111;
  v48 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)&self->super._inputMap, &v111, (uint64_t)&std::piecewise_construct, &v96)[5];
  v49 = atomic_load(HGLogger::_enabled);
  if ((v49 & 1) != 0)
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Getting HGNode for effect inputID: %d\n", v46, v47, v111);
  v106 = *(_OWORD *)&a3->var0;
  v107 = a3->var3;
  v50 = *(_QWORD *)a6.m_Obj;
  v105 = v50;
  if (v50)
    (*(void (**)(uint64_t))(*(_QWORD *)v50 + 16))(v50);
  if (v48)
    objc_msgSend(v48, "hgNodeForTime:trackInputs:renderer:igContext:", &v106, a4, a5, &v105);
  else
    v108 = 0;
  if (v105)
    (*(void (**)(uint64_t))(*(_QWORD *)v105 + 24))(v105);
  if (!-[PVEffect supportsExtendedRangeInputs](self->_effect, "supportsExtendedRangeInputs")
    && +[PVEnvironment PV_CLAMP_XR_INPUTS_TO_FILTERS](PVEnvironment, "PV_CLAMP_XR_INPUTS_TO_FILTERS"))
  {
    PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    +[PVColorSpace extendedSRGBColorSpace](PVColorSpace, "extendedSRGBColorSpace");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v78, "isEqual:", v53))
    {

    }
    else
    {
      PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[PVColorSpace extendedLinearSRGBColorSpace](PVColorSpace, "extendedLinearSRGBColorSpace");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v56, "isEqual:", v57);

      if (!v77)
        goto LABEL_71;
    }
    v58 = atomic_load(HGLogger::_enabled);
    if ((v58 & 1) != 0)
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Clamping input (%d). XR working space and effect doesn't support it.\n", v54, v55, v111);
    v59 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
    HGColorClamp::HGColorClamp(v59);
    (*(void (**)(HGColorClamp *, _QWORD, uint64_t))(*(_QWORD *)v59 + 120))(v59, 0, v108);
    if ((HGColorClamp *)v108 != v59)
    {
      if (v108)
        (*(void (**)(void))(*(_QWORD *)v108 + 24))();
      v108 = (uint64_t)v59;
      (*(void (**)(HGColorClamp *))(*(_QWORD *)v59 + 16))(v59);
    }
    (*(void (**)(HGColorClamp *))(*(_QWORD *)v59 + 24))(v59);
  }
LABEL_71:
  v96 = (unsigned int *)v97;
  v97[0] = 0;
  v99[0] = 0;
  v99[1] = 0;
  v97[1] = 0;
  v98 = v99;
  v99[2] = v100;
  v100[0] = 0;
  v101[0] = 0;
  v101[1] = 0;
  v100[1] = 0;
  v100[2] = v101;
  v103[0] = 0;
  v102 = v103;
  v104[1] = 0;
  v104[0] = 0;
  v103[1] = 0;
  v103[2] = v104;
  v60 = v111;
  v95 = v108;
  if (v108)
    (*(void (**)(uint64_t))(*(_QWORD *)v108 + 16))(v108);
  PVInputHGNodeMap<unsigned int>::SetNode((uint64_t **)&v96, v60, &v95);
  if (v95)
    (*(void (**)(uint64_t))(*(_QWORD *)v95 + 24))(v95);
  v61 = self->_effect;
  v62 = *(_QWORD *)a6.m_Obj;
  v92 = v62;
  if (v62)
    (*(void (**)(uint64_t))(*(_QWORD *)v62 + 16))(v62);
  if (v48)
  {
    objc_msgSend(v48, "inputSizeForPVEffect:igContext:", v61, &v92);
  }
  else
  {
    v93 = 0u;
    v94 = 0u;
  }
  if (v92)
    (*(void (**)(uint64_t))(*(_QWORD *)v92 + 24))(v92);
  LODWORD(v122[0]) = v111;
  v91[0] = v122;
  v63 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v98, (unsigned int *)v122, (uint64_t)&std::piecewise_construct, v91);
  v64 = v94;
  *(_OWORD *)(v63 + 5) = v93;
  *(_OWORD *)(v63 + 7) = v64;
  v65 = self->_effect;
  v66 = *(_QWORD *)a6.m_Obj;
  v90 = v66;
  if (v66)
    (*(void (**)(uint64_t))(*(_QWORD *)v66 + 16))(v66);
  if (v48)
    objc_msgSend(v48, "pixelTransformForPVEffect:igContext:", v65, &v90);
  else
    memset(v91, 0, 128);
  if (v90)
    (*(void (**)(uint64_t))(*(_QWORD *)v90 + 24))(v90);
  PVInputHGNodeMap<unsigned int>::SetPixelTransform((uint64_t)&v96, v111, (uint64_t **)v91);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = v48;
    v68 = objc_msgSend(v67, "isPortrait");
    v121 = v111;
    v122[0] = &v121;
    *((_DWORD *)std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v102, &v121, (uint64_t)&std::piecewise_construct, v122)+ 8) = v68 ^ 1;

  }
  v69 = atomic_load(HGLogger::_enabled);
  if ((v69 & 1) != 0)
  {
    -[PVEffect debugDisplayName](self->_effect, "debugDisplayName");
    v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v71 = objc_msgSend(v70, "UTF8String");
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Building Graph for PVEffect (%s).\n", v72, v73, v71);

  }
  v74 = self->_effect;
  v88 = *(_OWORD *)&a3->var0;
  v89 = a3->var3;
  v75 = *(_QWORD *)a6.m_Obj;
  v87 = v75;
  if (v75)
    (*(void (**)(uint64_t))(*(_QWORD *)v75 + 16))(v75);
  if (v74)
  {
    -[PVEffect hgNodeForTime:inputs:renderer:igContext:](v74, "hgNodeForTime:inputs:renderer:igContext:", &v88, &v96, a5, &v87);
    v75 = v87;
    if (!v87)
      goto LABEL_100;
    goto LABEL_99;
  }
  *v81 = 0;
  if (v75)
LABEL_99:
    (*(void (**)(uint64_t))(*(_QWORD *)v75 + 24))(v75);
LABEL_100:
  -[PVInstructionGraphEffectNode unloadIGNode](self, "unloadIGNode");
  PVInputHGNodeMap<unsigned int>::~PVInputHGNodeMap((_QWORD **)&v96);
  if (v108)
    (*(void (**)(uint64_t))(*(_QWORD *)v108 + 24))(v108);

LABEL_103:
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v120);
  return v76;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v4;
  uint64_t v6;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PCRect<double> result;

  v6 = v4;
  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v4 + 16) = _Q0;
  v12 = (*(double (**)(_QWORD, SEL, id))(**(_QWORD **)a4.m_Obj + 40))(*(_QWORD *)a4.m_Obj, a2, a3);
  v14 = v13;
  v15 = (*(float (**)(_QWORD))(**(_QWORD **)a4.m_Obj + 48))(*(_QWORD *)a4.m_Obj);
  v18 = v12 / v15;
  v19 = v14 / v15;
  *(double *)(v6 + 16) = v18;
  *(double *)(v6 + 24) = v19;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v18;
  result.var0 = v19;
  return result;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  HGDotGraph *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PVEffect *effect;
  CMTimeValue v14;
  uint64_t v15;
  void *v17;
  PVEffect *v18;
  void *v19;
  void *v20;
  CMTimeRange range;
  CMTime v22;
  _OWORD v23[3];
  CMTime time;

  if (!self->_effect)
    return CFSTR("InstructionGraphOrientationEffectNode");
  v5 = (HGDotGraph *)PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a3.m_Obj);
  if (!HGDotGraph::on(v5))
    return CFSTR("InstructionGraphOrientationEffectNode");
  v6 = PVInstructionGraphContext::DotTreeLogLevel(*(PVInstructionGraphContext **)a3.m_Obj);
  -[PVEffect displayName](self->_effect, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("InstructionGraphOrientationEffectNode"), "stringByAppendingFormat:", CFSTR(" [%@]"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 >= 2)
  {
    -[PVEffect effectType](self->_effect, "effectType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffect effectID](self->_effect, "effectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PVEffect categoryForEffectID:](PVEffect, "categoryForEffectID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" {%@, %@}"), v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  effect = self->_effect;
  if (effect)
  {
    -[PVEffect effectRange](effect, "effectRange");
    v14 = *(_QWORD *)&v23[0];
    v15 = DWORD2(v23[0]);
  }
  else
  {
    v15 = 0;
    v14 = 0;
    memset(v23, 0, sizeof(v23));
  }
  *(_QWORD *)&time.flags = *(_QWORD *)((char *)v23 + 12);
  HIDWORD(time.epoch) = DWORD1(v23[1]);
  time.value = v14;
  time.timescale = v15;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%lld/%d = %.3f}"), v14, v15, CMTimeGetSeconds(&time));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_effect;
  if (v18)
    -[PVEffect effectRange](v18, "effectRange");
  else
    memset(&range, 0, sizeof(range));
  CMTimeRangeGetEnd(&v22, &range);
  time = v22;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%lld/%d = %.3f}"), v22.value, v22.timescale, CMTimeGetSeconds(&time));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("\nRange: Start (%@) End (%@)"), v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
  objc_storeStrong((id *)&self->_effect, a3);
}

- (BOOL)bypassOutOfRangeEffects
{
  return self->_bypassOutOfRangeEffects;
}

- (void)setBypassOutOfRangeEffects:(BOOL)a3
{
  self->_bypassOutOfRangeEffects = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effect, 0);
}

@end
