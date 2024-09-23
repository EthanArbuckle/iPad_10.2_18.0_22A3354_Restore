@implementation PVInstructionGraphEffectNode

+ (id)newEffectNodeToFilterInput:(id)a3 effect:(id)a4
{
  id v5;
  id v6;
  PVInstructionGraphEffectNode *v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(PVInstructionGraphEffectNode);
  -[PVInstructionGraphEffectNode setInputNode:forInputID:](v7, "setInputNode:forInputID:", v5, 0);
  -[PVInstructionGraphEffectNode setEffect:](v7, "setEffect:", v6);

  return v7;
}

+ (id)newEffectNodeToTransitionFrom:(id)a3 to:(id)a4 effect:(id)a5
{
  id v7;
  id v8;
  id v9;
  PVInstructionGraphEffectNode *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PVInstructionGraphEffectNode);
  -[PVInstructionGraphEffectNode setInputNode:forInputID:](v10, "setInputNode:forInputID:", v7, 0);
  -[PVInstructionGraphEffectNode setInputNode:forInputID:](v10, "setInputNode:forInputID:", v8, 1);
  -[PVInstructionGraphEffectNode setEffect:](v10, "setEffect:", v9);

  return v10;
}

+ (id)newEffectNodeToOverlayInputs:(id)a3 inputIDs:(id)a4 effect:(id)a5
{
  id v7;
  id v8;
  id v9;
  PVInstructionGraphEffectNode *v10;
  unint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PVInstructionGraphEffectNode);
  for (i = 0; objc_msgSend(v7, "count") > i; ++i)
  {
    objc_msgSend(v7, "objectAtIndex:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedLongValue");

    -[PVInstructionGraphEffectNode setInputNode:forInputID:](v10, "setInputNode:forInputID:", v12, v14);
  }
  -[PVInstructionGraphEffectNode setEffect:](v10, "setEffect:", v9);

  return v10;
}

+ (id)newEffectNodeToAddTitle:(id)a3 effect:(id)a4
{
  id v5;
  id v6;
  PVInstructionGraphEffectNode *v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(PVInstructionGraphEffectNode);
  -[PVInstructionGraphEffectNode setInputNode:forInputID:](v7, "setInputNode:forInputID:", v5, 0);
  -[PVInstructionGraphEffectNode setEffect:](v7, "setEffect:", v6);

  return v7;
}

- (PVInstructionGraphEffectNode)init
{
  PVInstructionGraphEffectNode *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PVInstructionGraphEffectNode;
  result = -[PVInstructionGraphNode init](&v3, sel_init);
  if (result)
  {
    result->_bypassOutOfRangeEffects = 0;
    result->_applyRenderTransformAfterEffect = 0;
  }
  return result;
}

- (void)setInputNode:(id)a3 forInputID:(unsigned int)a4
{
  id v7;
  uint64_t **p_inputMap;
  uint64_t **v9;
  unsigned int v10;
  unsigned int *v11;

  v7 = a3;
  v10 = a4;
  p_inputMap = (uint64_t **)&self->_inputMap;
  if (v7)
  {
    v11 = &v10;
    v9 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_inputMap, &v10, (uint64_t)&std::piecewise_construct, &v11);
    objc_storeStrong((id *)v9 + 5, a3);
  }
  else
  {
    std::__tree<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>>>::__erase_unique<unsigned int>((uint64_t)p_inputMap, &v10);
  }

}

- (id)requiredSourceTrackIDs
{
  id v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *begin_node;
  id v6;
  void *v7;
  void *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *v10;
  BOOL v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      v6 = begin_node[5].__value_.__left_;
      objc_msgSend(v6, "requiredSourceTrackIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v8);

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v10 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }
  return v3;
}

- (id)requiredSourceSampleDataTrackIDs
{
  id v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *begin_node;
  id v6;
  void *v7;
  void *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *v10;
  BOOL v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      v6 = begin_node[5].__value_.__left_;
      objc_msgSend(v6, "requiredSourceSampleDataTrackIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v8);

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v10 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }
  return v3;
}

- (id)getAllSourceNodes
{
  id v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *begin_node;
  id v6;
  void *v7;
  void *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *v10;
  BOOL v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      v6 = begin_node[5].__value_.__left_;
      objc_msgSend(v6, "getAllSourceNodes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v8);

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v10 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }
  return v3;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v6;
  PVEffect *effect;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *begin_node;
  id v10;
  uint64_t v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *v13;
  BOOL v14;
  uint64_t v15;

  v6 = a4;
  effect = self->_effect;
  if (effect)
  {
    -[PVEffect loadEffect](effect, "loadEffect");
    if (v6)
      objc_msgSend(v6, "addObject:", self->_effect);
  }
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      v10 = begin_node[5].__value_.__left_;
      v11 = *(_QWORD *)a3.m_Obj;
      v15 = v11;
      if (v11)
        (*(void (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
      objc_msgSend(v10, "loadIGNode:returnLoadedEffects:", &v15, v6);
      if (v15)
        (*(void (**)(uint64_t))(*(_QWORD *)v15 + 24))(v15);

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v13 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          v14 = v13->__value_.__left_ == begin_node;
          begin_node = v13;
        }
        while (!v14);
      }
      begin_node = v13;
    }
    while (v13 != p_pair1);
  }

}

- (void)unloadIGNode
{
  PVEffect *effect;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *begin_node;
  id v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *v8;
  BOOL v9;

  effect = self->_effect;
  if (effect)
    -[PVEffect releaseEffect](effect, "releaseEffect");
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      v6 = begin_node[5].__value_.__left_;
      objc_msgSend(v6, "unloadIGNode");

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v8 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          v9 = v8->__value_.__left_ == begin_node;
          begin_node = v8;
        }
        while (!v9);
      }
      begin_node = v8;
    }
    while (v8 != p_pair1);
  }
}

- (void)buildEffectInputMap:(void *)a3 forTime:(id *)a4 trackInputs:(const void *)a5 renderer:(const void *)a6 igContext:(HGRef<PVInstructionGraphContext>)a7
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *begin_node;
  PVInstructionGraphContext **m_Obj;
  PVInstructionGraphEffectNode *v10;
  uint64_t left_low;
  const char *v12;
  char *v13;
  id v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  const char *v18;
  char *v19;
  void *v20;
  void *v21;
  int v22;
  unsigned __int8 v23;
  HGColorClamp *v24;
  PVEffect *effect;
  uint64_t **v26;
  __int128 v27;
  PVEffect *v28;
  PVInstructionGraphContext *v29;
  id v30;
  int v31;
  void *v32;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *v34;
  BOOL v35;
  uint64_t **v37;
  uint64_t **v41;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *p_pair1;
  PVInstructionGraphContext *v44;
  _OWORD v45[8];
  PVInstructionGraphContext *v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  PVInstructionGraphContext *v50;
  __int128 v51;
  int64_t var3;
  uint64_t v53;
  unsigned int v54;
  unsigned int *v55[3];

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    m_Obj = (PVInstructionGraphContext **)a7.m_Obj;
    v10 = self;
    v41 = (uint64_t **)((char *)a3 + 24);
    v37 = (uint64_t **)((char *)a3 + 96);
    while (1)
    {
      left_low = LODWORD(begin_node[4].__value_.__left_);
      v14 = begin_node[5].__value_.__left_;
      v15 = atomic_load(HGLogger::_enabled);
      if ((v15 & 1) != 0)
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Getting HGNode for effect inputID: %d\n", v12, v13, left_low);
      v51 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      v50 = *m_Obj;
      if (v50)
        (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v50 + 16))(v50);
      if (v14)
        objc_msgSend(v14, "hgNodeForTime:trackInputs:renderer:igContext:", &v51, a5, a6, &v50);
      else
        v53 = 0;
      if (v50)
        (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v50 + 24))(v50);
      if (-[PVEffect supportsExtendedRangeInputs](v10->_effect, "supportsExtendedRangeInputs")
        || !+[PVEnvironment PV_CLAMP_XR_INPUTS_TO_FILTERS](PVEnvironment, "PV_CLAMP_XR_INPUTS_TO_FILTERS"))
      {
        goto LABEL_24;
      }
      PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PVColorSpace extendedSRGBColorSpace](PVColorSpace, "extendedSRGBColorSpace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqual:", v17))
        break;
      PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PVColorSpace extendedLinearSRGBColorSpace](PVColorSpace, "extendedLinearSRGBColorSpace");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      m_Obj = (PVInstructionGraphContext **)a7.m_Obj;
      v10 = self;
      if (v22)
        goto LABEL_17;
LABEL_24:
      v49 = v53;
      if (v53)
        (*(void (**)(uint64_t))(*(_QWORD *)v53 + 16))(v53);
      PVInputHGNodeMap<unsigned int>::SetNode((uint64_t **)a3, left_low, &v49);
      if (v49)
        (*(void (**)(uint64_t))(*(_QWORD *)v49 + 24))(v49);
      effect = v10->_effect;
      v46 = *m_Obj;
      if (v46)
        (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v46 + 16))(v46);
      if (v14)
      {
        objc_msgSend(v14, "inputSizeForPVEffect:igContext:", effect, &v46);
      }
      else
      {
        v47 = 0u;
        v48 = 0u;
      }
      if (v46)
        (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v46 + 24))(v46);
      LODWORD(v55[0]) = left_low;
      *(_QWORD *)&v45[0] = v55;
      v26 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v41, (unsigned int *)v55, (uint64_t)&std::piecewise_construct, (_DWORD **)v45);
      v27 = v48;
      *(_OWORD *)(v26 + 5) = v47;
      *(_OWORD *)(v26 + 7) = v27;
      v28 = v10->_effect;
      v29 = *m_Obj;
      v44 = v29;
      if (v29)
        (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v29 + 16))(v29);
      if (v14)
        objc_msgSend(v14, "pixelTransformForPVEffect:igContext:", v28, &v44);
      else
        memset(v45, 0, sizeof(v45));
      if (v44)
        (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v44 + 24))(v44);
      PVInputHGNodeMap<unsigned int>::SetPixelTransform((uint64_t)a3, left_low, (uint64_t **)v45);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = v14;
        v31 = objc_msgSend(v30, "isPortrait");
        v54 = left_low;
        v55[0] = &v54;
        *((_DWORD *)std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v37, &v54, (uint64_t)&std::piecewise_construct, v55)+ 8) = v31 ^ 1;
        objc_msgSend(v30, "timedMetadataGroup");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PVInputHGNodeMap<unsigned int>::SetTimedMetadata((uint64_t)a3, left_low, v32);

        v10 = self;
      }
      if (v53)
        (*(void (**)(uint64_t))(*(_QWORD *)v53 + 24))(v53);

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v34 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v34 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          v35 = v34->__value_.__left_ == begin_node;
          begin_node = v34;
        }
        while (!v35);
      }
      begin_node = v34;
      if (v34 == p_pair1)
        return;
    }

    v10 = self;
LABEL_17:
    v23 = atomic_load(HGLogger::_enabled);
    if ((v23 & 1) != 0)
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Clamping input (%d). XR working space and effect doesn't support it.\n", v18, v19, left_low);
    v24 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
    HGColorClamp::HGColorClamp(v24);
    (*(void (**)(HGColorClamp *, _QWORD, uint64_t))(*(_QWORD *)v24 + 120))(v24, 0, v53);
    if ((HGColorClamp *)v53 != v24)
    {
      if (v53)
        (*(void (**)(uint64_t))(*(_QWORD *)v53 + 24))(v53);
      v53 = (uint64_t)v24;
      (*(void (**)(HGColorClamp *))(*(_QWORD *)v24 + 16))(v24);
    }
    (*(void (**)(HGColorClamp *))(*(_QWORD *)v24 + 24))(v24);
    goto LABEL_24;
  }
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGXForm **v6;
  HGXForm **v11;
  const char *v12;
  const char *v13;
  char *v14;
  BOOL bypassOutOfRangeEffects;
  PVEffect *effect;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t **p_inputMap;
  uint64_t *v20;
  int v21;
  id v22;
  _DWORD *v23;
  CMTimeValue value;
  uint64_t *v25;
  uint64_t **v26;
  BOOL v27;
  uint64_t *v28;
  uint64_t v29;
  PVEffect *v30;
  unsigned __int8 v31;
  id v32;
  uint64_t v33;
  const char *v34;
  char *v35;
  PVEffect *v36;
  __int128 v37;
  const char *v38;
  char *v39;
  PVEffect *v40;
  void *v41;
  unsigned __int8 v42;
  uint64_t v43;
  HGSolidColor *v44;
  HGNode *v45;
  unsigned __int8 v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  unsigned __int8 v52;
  uint64_t v53;
  const char *v54;
  char *v55;
  PVRendererInstructionGraphContext *v56;
  PVVideoCompositingContext *v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  char v61;
  PVRendererInstructionGraphContext *v62;
  unsigned __int8 v63;
  id v64;
  uint64_t v65;
  const char *v66;
  char *v67;
  PVEffect *v68;
  HGXForm *v69;
  int v70;
  HGXForm *v71;
  CMTimeValue v72;
  HGRef<HGNode> v73;
  HGXForm **v74;
  _BOOL4 applyRenderTransformAfterEffect;
  uint64_t v77;
  __int128 v78;
  int64_t v79;
  CMTimeRange range2;
  CMTimeRange range1;
  __int128 v82;
  HGXForm *v83;
  PVRendererInstructionGraphContext *v84;
  __int128 v85;
  int64_t v86;
  PVRendererInstructionGraphContext *v87;
  __int128 v88;
  int64_t v89;
  CMTime v90;
  _QWORD *v91;
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[3];
  _QWORD v96[2];
  PVRendererInstructionGraphContext *v97;
  CMTime v98;
  CMTimeRange v99;
  CMTime time;
  CMTimeRange range;
  uint64_t v102;
  __int128 v103;
  int64_t var3;
  uint64_t v105;
  _BYTE v106[23];
  CGSize v108;

  v11 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v106, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphEffectNode hgNodeForTime:...]");
  v105 = *(_QWORD *)a6.m_Obj;
  if (v105)
    (*(void (**)(uint64_t))(*(_QWORD *)v105 + 16))(v105);
  -[PVInstructionGraphEffectNode addDotTreeLinks:](self, "addDotTreeLinks:", &v105);
  if (v105)
    (*(void (**)(uint64_t))(*(_QWORD *)v105 + 24))(v105);
  if (-[PVEffect isHidden](self->_effect, "isHidden")
    && !-[PVEffect hasTimedPropertiesDelegates](self->_effect, "hasTimedPropertiesDelegates"))
  {
    v17 = atomic_load(HGLogger::_enabled);
    if ((v17 & 1) != 0)
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"effect is hidden. Returning HGNode of first input, or new HGNode if no inputs...\n", v13, v14);
    v18 = PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
    HGDotGraph::filled(v18, (unint64_t)self, "#e8eba0");
    v90.value = (CMTimeValue)&v90;
    *(_QWORD *)&v90.timescale = &v90;
    v90.epoch = 0;
    p_inputMap = (uint64_t **)&self->_inputMap;
    v20 = *p_inputMap;
    if (*p_inputMap == (uint64_t *)(p_inputMap + 1))
      goto LABEL_41;
    do
    {
      v21 = *((_DWORD *)v20 + 8);
      v22 = (id)v20[5];
      v23 = operator new(0x18uLL);
      v23[4] = v21;
      value = v90.value;
      *(_QWORD *)v23 = v90.value;
      *((_QWORD *)v23 + 1) = &v90;
      *(_QWORD *)(value + 8) = v23;
      v90.value = (CMTimeValue)v23;
      ++v90.epoch;

      v25 = (uint64_t *)v20[1];
      if (v25)
      {
        do
        {
          v26 = (uint64_t **)v25;
          v25 = (uint64_t *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (uint64_t **)v20[2];
          v27 = *v26 == v20;
          v20 = (uint64_t *)v26;
        }
        while (!v27);
      }
      v20 = (uint64_t *)v26;
    }
    while (v26 != p_inputMap + 1);
    if (!v90.epoch)
    {
LABEL_41:
      v45 = (HGNode *)HGObject::operator new(0x1A0uLL);
      HGNode::HGNode(v45);
      *v11 = (HGXForm *)v45;
    }
    else
    {
      std::list<unsigned int>::__sort<std::__less<void,void>>(*(uint64_t *)&v90.timescale, (uint64_t)&v90, v90.epoch, (uint64_t)&v98);
      v98.value = *(_QWORD *)&v90.timescale + 16;
      v28 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_inputMap, (unsigned int *)(*(_QWORD *)&v90.timescale + 16), (uint64_t)&std::piecewise_construct, &v98)[5];
      v103 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      v29 = *(_QWORD *)a6.m_Obj;
      v102 = v29;
      if (v29)
        (*(void (**)(uint64_t))(*(_QWORD *)v29 + 16))(v29);
      if (v28)
      {
        objc_msgSend(v28, "hgNodeForTime:trackInputs:renderer:igContext:", &v103, a4, a5, &v102);
        v29 = v102;
        if (!v102)
          goto LABEL_99;
        goto LABEL_98;
      }
      *v11 = 0;
      if (v29)
LABEL_98:
        (*(void (**)(uint64_t))(*(_QWORD *)v29 + 24))(v29);
    }
LABEL_99:
    std::__list_imp<unsigned int>::clear(&v90);
    goto LABEL_100;
  }
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
  v30 = self->_effect;
  if (!v30 || bypassOutOfRangeEffects)
  {
    if (v30)
    {
      -[PVEffect effectRange](v30, "effectRange");
      v37 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      *(_OWORD *)&range2.start.value = *MEMORY[0x1E0CA2E40];
      *(_OWORD *)&range2.start.epoch = v37;
      *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      if (CMTimeRangeEqual(&range1, &range2))
      {
        v40 = self->_effect;
        -[PVEffect debugDisplayName](v40, "debugDisplayName");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("WARNING: -hgNodeForTime called on invalid effect animation range! (%p, %@)"), v40, v41);

      }
      v42 = atomic_load(HGLogger::_enabled);
      if ((v42 & 1) != 0)
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Current Time is out of Effect Range. Returning HGNode of first input, assuming input0 is set...\n", v38, v39);
      v43 = PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
      HGDotGraph::filled(v43, (unint64_t)self, "#FFA500");
      if (+[PVEnvironment PV_DEBUG_COLOR_OUT_OF_RANGE_EFFECTS](PVEnvironment, "PV_DEBUG_COLOR_OUT_OF_RANGE_EFFECTS"))
      {
        v44 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
        HGSolidColor::HGSolidColor(v44);
        (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v44 + 96))(v44, 0, 0.0, 1.0, 1.0, 1.0);
        *v11 = (HGXForm *)v44;
        goto LABEL_100;
      }
    }
    else
    {
      v46 = atomic_load(HGLogger::_enabled);
      if ((v46 & 1) != 0)
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"effect is Nil. Returning HGNode of first input, assuming input0 is set...\n", v13, v14);
      v47 = PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a6.m_Obj);
      HGDotGraph::filled(v47, (unint64_t)self, "#822222");
    }
    LODWORD(v98.value) = 0;
    v90.value = (CMTimeValue)&v98;
    v48 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)&self->_inputMap, (unsigned int *)&v98, (uint64_t)&std::piecewise_construct, &v90)[5];
    v78 = *(_OWORD *)&a3->var0;
    v79 = a3->var3;
    v49 = *(_QWORD *)a6.m_Obj;
    v77 = v49;
    if (v49)
      (*(void (**)(uint64_t))(*(_QWORD *)v49 + 16))(v49);
    if (v48)
    {
      objc_msgSend(v48, "hgNodeForTime:trackInputs:renderer:igContext:", &v78, a4, a5, &v77);
      v49 = v77;
      if (!v77)
        goto LABEL_100;
    }
    else
    {
      *v11 = 0;
      if (!v49)
        goto LABEL_100;
    }
    (*(void (**)(uint64_t))(*(_QWORD *)v49 + 24))(v49);
    goto LABEL_100;
  }
  v31 = atomic_load(HGLogger::_enabled);
  if ((v31 & 1) != 0)
  {
    -[PVEffect debugDisplayName](self->_effect, "debugDisplayName");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = objc_msgSend(v32, "UTF8String");
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Will Build render graph for effect (%s)\n", v34, v35, v33);

  }
  if ((int)HGLogger::getLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v12) >= 1)
  {
    v36 = self->_effect;
    if (v36)
      -[PVEffect effectRange](v36, "effectRange");
    else
      memset(&v99, 0, sizeof(v99));
    CMTimeRangeCopyDescription(0, &v99);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    v52 = atomic_load(HGLogger::_enabled);
    if ((v52 & 1) != 0)
    {
      v53 = objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Effect Time Range: %s\n", v54, v55, v53);
    }
    CFRelease(v51);

  }
  v56 = *(PVRendererInstructionGraphContext **)a6.m_Obj;
  if (*(_QWORD *)a6.m_Obj)
    (*(void (**)(_QWORD))(*(_QWORD *)v56 + 16))(*(_QWORD *)a6.m_Obj);
  applyRenderTransformAfterEffect = self->_applyRenderTransformAfterEffect;
  if (self->_applyRenderTransformAfterEffect)
  {
    v74 = v11;
    PVRenderJob::GetDelegate(*(PVRenderJob **)a6.m_Obj);
    v57 = (PVVideoCompositingContext *)objc_claimAutoreleasedReturnValue();
    v58 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
    v60 = v59;
    v61 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
    (*(void (**)(CMTime *__return_ptr))(**(_QWORD **)a6.m_Obj + 72))(&v98);
    v62 = (PVRendererInstructionGraphContext *)HGObject::operator new(0xA8uLL);
    v90 = v98;
    v108.width = v58;
    v108.height = v60;
    PVRendererInstructionGraphContext::PVRendererInstructionGraphContext(v62, v57, v108, v61, &v90);
    if (v56 == v62)
    {
      if (v56)
        (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v56 + 24))(v56);
    }
    else
    {
      if (v56)
        (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v56 + 24))(v56);
      v56 = v62;
    }

    v11 = v74;
  }
  v97 = v56;
  if (v56)
    (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v56 + 16))(v56);
  -[PVInstructionGraphNode loadIGNode:](self, "loadIGNode:", &v97);
  if (v97)
    (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v97 + 24))(v97);
  v90.value = (CMTimeValue)&v90.timescale;
  *(_QWORD *)&v90.timescale = 0;
  v92[0] = 0;
  v92[1] = 0;
  v90.epoch = 0;
  v91 = v92;
  v92[2] = v93;
  v93[0] = 0;
  v94[0] = 0;
  v94[1] = 0;
  v93[1] = 0;
  v93[2] = v94;
  v94[2] = v95;
  v95[0] = 0;
  v96[0] = 0;
  v96[1] = 0;
  v95[1] = 0;
  v95[2] = v96;
  v89 = a3->var3;
  v88 = *(_OWORD *)&a3->var0;
  v87 = v56;
  if (v56)
    (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v56 + 16))(v56);
  -[PVInstructionGraphEffectNode buildEffectInputMap:forTime:trackInputs:renderer:igContext:](self, "buildEffectInputMap:forTime:trackInputs:renderer:igContext:", &v90, &v88, a4, a5, &v87);
  if (v87)
    (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v87 + 24))(v87);
  v63 = atomic_load(HGLogger::_enabled);
  if ((v63 & 1) != 0)
  {
    -[PVEffect debugDisplayName](self->_effect, "debugDisplayName");
    v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v65 = objc_msgSend(v64, "UTF8String");
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Building Graph for PVEffect (%s).\n", v66, v67, v65);

  }
  v68 = self->_effect;
  v85 = *(_OWORD *)&a3->var0;
  v86 = a3->var3;
  v84 = v56;
  if (v56)
    (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v56 + 16))(v56);
  if (v68)
    -[PVEffect hgNodeForTime:inputs:renderer:igContext:](v68, "hgNodeForTime:inputs:renderer:igContext:", &v85, &v90, a5, &v84);
  else
    *v11 = 0;
  if (v84)
    (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v84 + 24))(v84);
  if (applyRenderTransformAfterEffect)
  {
    v69 = *v11;
    v83 = v69;
    if (v69)
      (*(void (**)(HGXForm *))(*(_QWORD *)v69 + 16))(v69);
    (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)a6.m_Obj + 56))(&v82);
    v70 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
    HGXFormForCGAffineTransform(&v83, &v82, v70, (HGXForm **)&v98);
    v71 = *v11;
    v72 = v98.value;
    if (*v11 == (HGXForm *)v98.value)
    {
      if (v71)
        (*(void (**)(HGXForm *))(*(_QWORD *)v71 + 24))(v71);
    }
    else
    {
      if (v71)
      {
        (*(void (**)(HGXForm *))(*(_QWORD *)v71 + 24))(v71);
        v72 = v98.value;
      }
      *v11 = (HGXForm *)v72;
      v98.value = 0;
    }
    if (v83)
      (*(void (**)(HGXForm *))(*(_QWORD *)v83 + 24))(v83);
  }
  -[PVInstructionGraphEffectNode unloadIGNode](self, "unloadIGNode");
  PVInputHGNodeMap<unsigned int>::~PVInputHGNodeMap(&v90);
  if (v56)
    (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v56 + 24))(v56);
LABEL_100:
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v106);
  return v73;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v4;
  uint64_t v7;
  id v8;
  uint64_t **p_inputMap;
  uint64_t *v15;
  PVEffect *effect;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  unsigned int v30;
  PCRect<double> result;

  v7 = v4;
  v8 = a3;
  *(_QWORD *)v7 = 0;
  *(_QWORD *)(v7 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v7 + 16) = _Q0;
  p_inputMap = (uint64_t **)&self->_inputMap;
  if (self->_inputMap.__tree_.__pair3_.__value_ == 1)
  {
    v30 = *((_DWORD *)*p_inputMap + 8);
    *(_QWORD *)&v28 = &v30;
    v15 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_inputMap, &v30, (uint64_t)&std::piecewise_construct, (_DWORD **)&v28)[5];
    effect = self->_effect;
    v17 = *(_QWORD *)a4.m_Obj;
    v27 = v17;
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 16))(v17);
    if (v15)
    {
      objc_msgSend(v15, "inputSizeForPVEffect:igContext:", effect, &v27);
      v17 = v27;
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
    }
    v22 = v29;
    *(_OWORD *)v7 = v28;
    *(_OWORD *)(v7 + 16) = v22;
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 24))(v17);

  }
  else
  {
    v18 = (*(double (**)(_QWORD))(**(_QWORD **)a4.m_Obj + 40))(*(_QWORD *)a4.m_Obj);
    v20 = v19;
    v21 = (*(float (**)(_QWORD))(**(_QWORD **)a4.m_Obj + 48))(*(_QWORD *)a4.m_Obj);
    *(double *)(v7 + 16) = v18 / v21;
    *(double *)(v7 + 24) = v20 / v21;
  }

  result.var3 = v26;
  result.var2 = v25;
  result.var1 = v24;
  result.var0 = v23;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float64x2_t v15;
  PCMatrix44Tmpl<double> *result;
  id v17;

  v17 = a4;
  v7 = (*(double (**)(_QWORD))(**(_QWORD **)a5.m_Obj + 40))(*(_QWORD *)a5.m_Obj);
  v9 = v8;
  v10 = (*(float (**)(_QWORD))(**(_QWORD **)a5.m_Obj + 48))(*(_QWORD *)a5.m_Obj);
  objc_msgSend(v17, "outputSize");
  v11 = v9;
  v12 = (float)(v10 * v11);
  v13 = v7;
  *(float *)&v7 = v10 * v13;
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
  *(float *)&v14 = v12 / v14;
  v15 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, *(float *)&v14, (float)-*(float *)&v14, 1.0);
  v15.f64[0] = *(float *)&v7 * 0.5;
  PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v15, v12 * 0.5, 0.0);

  return result;
}

- (PVIGHGNodeCacheKey)contextHGNodeCacheKeyAtTime:(SEL)a3
{
  objc_super v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a4;
  v5.receiver = self;
  v5.super_class = (Class)PVInstructionGraphEffectNode;
  return (PVIGHGNodeCacheKey *)-[PVIGHGNodeCacheKey contextHGNodeCacheKeyAtTime:](&v5, sel_contextHGNodeCacheKeyAtTime_, &v6);
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  void *v5;
  HGDotGraph *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PVEffect *effect;
  id receiver;
  uint64_t super_class_low;
  void *v17;
  PVEffect *v18;
  void *v19;
  uint64_t v20;
  CMTimeRange range;
  CMTime v23;
  objc_super v24[3];
  objc_super v25;
  uint64_t v26;
  CMTime time;

  v26 = *(_QWORD *)a3.m_Obj;
  if (v26)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v26 + 16))(v26, a2);
  v25.receiver = self;
  v25.super_class = (Class)PVInstructionGraphEffectNode;
  -[PVInstructionGraphNode dotTreeLabel:](&v25, sel_dotTreeLabel_, &v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    (*(void (**)(uint64_t))(*(_QWORD *)v26 + 24))(v26);
  if (self->_effect)
  {
    v6 = (HGDotGraph *)PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a3.m_Obj);
    if (HGDotGraph::on(v6))
    {
      v7 = PVInstructionGraphContext::DotTreeLogLevel(*(PVInstructionGraphContext **)a3.m_Obj);
      -[PVEffect displayName](self->_effect, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" [%@]"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 < 2)
      {
        v13 = v9;
      }
      else
      {
        -[PVEffect effectType](self->_effect, "effectType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PVEffect effectID](self->_effect, "effectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PVEffect categoryForEffectID:](PVEffect, "categoryForEffectID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(" {%@, %@}"), v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      effect = self->_effect;
      if (effect)
      {
        -[PVEffect effectRange](effect, "effectRange");
        receiver = v24[0].receiver;
        super_class_low = LODWORD(v24[0].super_class);
      }
      else
      {
        super_class_low = 0;
        receiver = 0;
        memset(v24, 0, sizeof(v24));
      }
      *(_QWORD *)&time.flags = *(Class *)((char *)&v24[0].super_class + 4);
      HIDWORD(time.epoch) = HIDWORD(v24[1].receiver);
      time.value = (CMTimeValue)receiver;
      time.timescale = super_class_low;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%lld/%d = %.3f}"), receiver, super_class_low, CMTimeGetSeconds(&time));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self->_effect;
      if (v18)
        -[PVEffect effectRange](v18, "effectRange");
      else
        memset(&range, 0, sizeof(range));
      CMTimeRangeGetEnd(&v23, &range);
      time = v23;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%lld/%d = %.3f}"), v23.value, v23.timescale, CMTimeGetSeconds(&time));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("\nRange: Start (%@) End (%@)"), v17, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v20;
    }
  }
  return v5;
}

- (id)instructionGraphNodeDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  PVEffect *effect;
  void *v7;
  void *v8;
  void *v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *p_pair1;
  uint64_t left_low;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *v19;
  BOOL v20;
  id v22;
  objc_super v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)PVInstructionGraphEffectNode;
  -[PVInstructionGraphNode instructionGraphNodeDescription](&v23, sel_instructionGraphNodeDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "mutableCopy");

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v5, CFSTR("class"));

  effect = self->_effect;
  if (effect)
  {
    -[PVEffect displayName](effect, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v7, CFSTR("effectName"));

    -[PVEffect effectDescription](self->_effect, "effectDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, CFSTR("effect"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  p_pair1 = &self->_inputMap.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
  if (begin_node != &self->_inputMap.__tree_.__pair1_)
  {
    do
    {
      left_low = LODWORD(begin_node[4].__value_.__left_);
      v13 = begin_node[5].__value_.__left_;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", left_low);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v15;
      objc_msgSend(v13, "instructionGraphNodeDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "addObject:", v17);
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v19 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
          v20 = v19->__value_.__left_ == begin_node;
          begin_node = v19;
        }
        while (!v20);
      }
      begin_node = v19;
    }
    while (v19 != p_pair1);
  }
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v9, CFSTR("inputs"));

  return v22;
}

- (void)addDotTreeLinks:(HGRef<PVInstructionGraphContext>)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *begin_node;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *p_p;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *v13;
  BOOL v14;
  PVInstructionGraphEffectNode *v15;
  uint64_t *v16;
  void *__p;
  char v18;
  _QWORD v19[13];
  char v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];

  v16 = (uint64_t *)PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a3.m_Obj);
  if (HGDotGraph::on((HGDotGraph *)v16))
  {
    v22 = v23;
    v23[0] = 0;
    v24[0] = 0;
    v24[1] = 0;
    v23[1] = 0;
    v23[2] = v24;
    v24[2] = v25;
    v25[0] = 0;
    v26[0] = 0;
    v26[1] = 0;
    v25[1] = 0;
    v25[2] = v26;
    v26[2] = v27;
    v27[0] = 0;
    v28[0] = 0;
    v28[1] = 0;
    v27[1] = 0;
    v27[2] = v28;
    v15 = self;
    p_pair1 = &self->_inputMap.__tree_.__pair1_;
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)self->_inputMap.__tree_.__begin_node_;
    if (begin_node != &self->_inputMap.__tree_.__pair1_)
    {
      v6 = *MEMORY[0x1E0DE4F50];
      v7 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
      v8 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
      v9 = MEMORY[0x1E0DE4FB8] + 16;
      do
      {
        v10 = begin_node[5].__value_.__left_;
        std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v19);
        std::ostream::operator<<();
        std::stringbuf::str();
        if (v18 >= 0)
          p_p = (const char *)&__p;
        else
          p_p = (const char *)__p;
        HGDotGraph::link(v16, (unint64_t)v10, (unint64_t)v15, p_p, 0);
        if (v18 < 0)
          operator delete(__p);
        v19[0] = v6;
        *(_QWORD *)((char *)v19 + *(_QWORD *)(v6 - 24)) = v7;
        v19[2] = v8;
        v19[3] = v9;
        if (v20 < 0)
          operator delete((void *)v19[11]);
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x1B5E290BC](&v21);

        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[1].__value_.__left_;
        if (left)
        {
          do
          {
            v13 = left;
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)left->__value_.__left_;
          }
          while (left);
        }
        else
        {
          do
          {
            v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, PVInstructionGraphNode *>, void *>>> *)begin_node[2].__value_.__left_;
            v14 = v13->__value_.__left_ == begin_node;
            begin_node = v13;
          }
          while (!v14);
        }
        begin_node = v13;
      }
      while (v13 != p_pair1);
    }
    PVInputHGNodeMap<unsigned int>::~PVInputHGNodeMap(&v22);
  }
}

- (PVEffect)effect
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

- (BOOL)applyRenderTransformAfterEffect
{
  return self->_applyRenderTransformAfterEffect;
}

- (void)setApplyRenderTransformAfterEffect:(BOOL)a3
{
  self->_applyRenderTransformAfterEffect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effect, 0);
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::destroy((uint64_t)&self->_inputMap, (_QWORD *)self->_inputMap.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = (char *)self + 32;
  return self;
}

@end
