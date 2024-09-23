@implementation PVInstructionGraphNode

- (PVInstructionGraphNode)init
{
  PVInstructionGraphNode *result;
  unint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PVInstructionGraphNode;
  result = -[PVInstructionGraphNode init](&v4, sel_init);
  if (result)
  {
    do
      v3 = __ldaxr(&sAtomicIGNodeCount);
    while (__stlxr(v3 + 1, &sAtomicIGNodeCount));
    result->_uuid = v3;
  }
  return result;
}

- (id)requiredSourceTrackIDs
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)requiredSourceSampleDataTrackIDs
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)getAllSourceNodes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)isPassthru
{
  return 0;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)a3.m_Obj;
  v5 = v4;
  if (v4)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v4 + 16))(v4, a2);
  -[PVInstructionGraphNode loadIGNode:returnLoadedEffects:](self, "loadIGNode:returnLoadedEffects:", &v5, 0);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGNode **v6;
  HGNode **v12;
  const char *v13;
  char *v14;
  uint64_t **v15;
  unsigned __int8 v16;
  PerfTimer *v17;
  uint64_t **v18;
  uint64_t **v19;
  const char *v20;
  char *v21;
  unsigned __int8 v22;
  HGNode *v23;
  HGNode *v24;
  uint64_t v25;
  HGNode *v26;
  id var2;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  HGRef<HGNode> v33;
  uint64_t v34;
  HGNode *v35;
  PVIGHGNodeCacheKey v36;
  uint64_t v37;
  __int128 v38;
  int64_t var3;
  PVIGHGNodeCacheKey v40;
  HGNode *v41;
  PVIGHGNodeCacheKey v42;
  PerfTimer v43;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44;
  PVIGHGNodeCacheKey v45;
  _BYTE v46[24];

  v12 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v46, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphNode hgNodeForTime:...]");
  v44 = *a3;
  -[PVInstructionGraphNode contextHGNodeCacheKeyAtTime:](self, "contextHGNodeCacheKeyAtTime:", &v44);
  v15 = (uint64_t **)PVInstructionGraphContext::HGNodeCache(*(PVInstructionGraphContext **)a6.m_Obj);
  *v12 = 0;
  v16 = atomic_load(HGLogger::_enabled);
  if ((v16 & 1) != 0)
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Checking context node cache for (uuid: %llu) (time: %lld.%d)\n", v13, v14, v45.var0, v45.var1.var0, v45.var1.var1);
  PerfTimer::PerfTimer(&v43);
  PerfTimer::Start(v17);
  PVIGHGNodeCacheKey::PVIGHGNodeCacheKey(&v42, &v45);
  v18 = (uint64_t **)std::__tree<std::__value_type<PVIGHGNodeCacheKey,HGRef<HGNode>>,std::__map_value_compare<PVIGHGNodeCacheKey,std::__value_type<PVIGHGNodeCacheKey,HGRef<HGNode>>,std::less<PVIGHGNodeCacheKey>,true>,std::allocator<std::__value_type<PVIGHGNodeCacheKey,HGRef<HGNode>>>>::find<PVIGHGNodeCacheKey>((uint64_t)v15, (uint64_t)&v42);
  v19 = v15 + 1;

  v22 = atomic_load(HGLogger::_enabled);
  if (v15 + 1 == v18)
  {
    if ((v22 & 1) != 0)
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Cache Miss\n", v20, v21);
    v38 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v25 = *(_QWORD *)a6.m_Obj;
    v37 = v25;
    if (v25)
      (*(void (**)(uint64_t))(*(_QWORD *)v25 + 16))(v25);
    -[PVInstructionGraphNode internalHGNodeForTime:trackInputs:renderer:igContext:](self, "internalHGNodeForTime:trackInputs:renderer:igContext:", &v38, a4, a5, &v37);
    v26 = *v12;
    if (*v12 == v41)
    {
      if (v26)
        (*(void (**)(HGNode *))(*(_QWORD *)v26 + 24))(*v12);
    }
    else
    {
      if (v26)
        (*(void (**)(HGNode *))(*(_QWORD *)v26 + 24))(*v12);
      v26 = v41;
      *v12 = v41;
      v41 = 0;
    }
    if (v37)
      (*(void (**)(uint64_t))(*(_QWORD *)v37 + 24))(v37);
    PVIGHGNodeCacheKey::PVIGHGNodeCacheKey(&v36, &v45);
    v35 = v26;
    if (v26)
      (*(void (**)(HGNode *))(*(_QWORD *)v26 + 16))(v26);
    PVInputHGNodeMap<PVIGHGNodeCacheKey>::SetNode(v15, &v36, (uint64_t *)&v35);
    if (v35)
      (*(void (**)(HGNode *))(*(_QWORD *)v35 + 24))(v35);
    var2 = v36.var2;
  }
  else
  {
    if ((v22 & 1) != 0)
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Cache Hit!\n", v20, v21);
    PVIGHGNodeCacheKey::PVIGHGNodeCacheKey(&v40, &v45);
    PVInputHGNodeMap<PVIGHGNodeCacheKey>::GetNode((uint64_t)v15, (uint64_t)&v40, &v41);
    v23 = *v12;
    v24 = v41;
    if (*v12 == v41)
    {
      if (v23)
        (*(void (**)(HGNode *))(*(_QWORD *)v23 + 24))(v23);
    }
    else
    {
      if (v23)
      {
        (*(void (**)(HGNode *))(*(_QWORD *)v23 + 24))(v23);
        v24 = v41;
      }
      *v12 = v24;
      v41 = 0;
    }
    var2 = v40.var2;
  }

  PerfTimer::End(&v43);
  v28 = (uint64_t *)PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
  if (HGDotGraph::on((HGDotGraph *)v28))
  {
    v29 = *(_QWORD *)a6.m_Obj;
    v34 = v29;
    if (v29)
      (*(void (**)(uint64_t))(*(_QWORD *)v29 + 16))(v29);
    -[PVInstructionGraphNode dotTreeLabel:](self, "dotTreeLabel:", &v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      (*(void (**)(uint64_t))(*(_QWORD *)v34 + 24))(v34);
    if ((int)PVInstructionGraphContext::DotTreeLogLevel(*(PVInstructionGraphContext **)a6.m_Obj) >= 2)
    {
      objc_msgSend(v30, "stringByAppendingFormat:", CFSTR("\nBuildTime: %.3f"), (v43._end - v43._start) * 1000.0);
      v31 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v31;
    }
    v32 = objc_retainAutorelease(v30);
    HGDotGraph::node(v28, (unint64_t)self, objc_msgSend(v32, "UTF8String"), 0);
    if (v19 != v18)
      HGDotGraph::filled((uint64_t)v28, (unint64_t)self, "#90c070");

  }
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v46);
  return v33;
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGNode **v6;
  HGNode **v7;
  unsigned __int8 v8;
  HGNode *v9;
  HGNode *v10;

  v7 = v6;
  v8 = atomic_load(HGLogger::_enabled);
  if ((v8 & 1) != 0)
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Base class returning empty HGNode.\n", (const char *)a4, (char *)a5, a6.m_Obj);
  v9 = (HGNode *)HGObject::operator new(0x1A0uLL);
  v10 = HGNode::HGNode(v9);
  *v7 = v9;
  return (HGRef<HGNode>)v10;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v4;
  PCRect<double> result;

  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v4 + 16) = _Q0;
  result.var0 = *(double *)&_Q0;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
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
  return self;
}

- (PVIGHGNodeCacheKey)contextHGNodeCacheKeyAtTime:(SEL)a3
{
  unint64_t uuid;
  PVIGHGNodeCacheKey *result;
  CMTime v6;

  uuid = self->_uuid;
  v6 = *(CMTime *)a4;
  PVIGHGNodeCacheKey::PVIGHGNodeCacheKey(retstr, uuid, &v6);
  return result;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PVInstructionGraph"), &stru_1E65EDDA0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PVInstructionGraphNode instructionGraphNodeDescription](self, "instructionGraphNodeDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)instructionGraphNodeDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self, CFSTR("address"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("class");
  v8[0] = v2;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isDebugDrawingEnabled
{
  return self->_isDebugDrawingEnabled;
}

- (void)setIsDebugDrawingEnabled:(BOOL)a3
{
  self->_isDebugDrawingEnabled = a3;
}

@end
