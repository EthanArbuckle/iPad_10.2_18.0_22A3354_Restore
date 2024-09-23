@implementation PFSceneTaxonomyNode

- (PFSceneTaxonomyNode)initWithNodeRef:(void *)a3 taxonomy:(id)a4
{
  id v7;
  PFSceneTaxonomyNode *v8;
  PFSceneTaxonomyNode *v9;
  objc_super v11;

  v7 = a4;
  if (a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)PFSceneTaxonomyNode;
    v8 = -[PFSceneTaxonomyNode init](&v11, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_nodeRef = a3;
      objc_storeStrong((id *)&v8->_taxonomy, a4);
    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (BOOL)isRoot
{
  return PFSceneTaxonomyNodeIsRoot((pf::SceneTaxonomyNode *)self->_nodeRef);
}

- (NSString)name
{
  return (NSString *)PFSceneTaxonomyNodeName((uint64_t)self->_nodeRef);
}

- (unsigned)sceneClassId
{
  if (-[PFSceneTaxonomyNode extendedSceneClassId](self, "extendedSceneClassId") >> 32)
    return 0;
  else
    return -[PFSceneTaxonomyNode extendedSceneClassId](self, "extendedSceneClassId");
}

- (unint64_t)extendedSceneClassId
{
  return PFSceneTaxonomyNodeExtendedSceneClassId((uint64_t)self->_nodeRef);
}

- (unint64_t)networkId
{
  return PFSceneTaxonomyNodeNetworkId((uint64_t)self->_nodeRef);
}

- (BOOL)isIndexed
{
  return PFSceneTaxonomyNodeIsIndexed((uint64_t)self->_nodeRef);
}

- (double)searchThreshold
{
  return PFSceneTaxonomyNodeSearchThreshold((uint64_t)self->_nodeRef);
}

- (double)highRecallThreshold
{
  return PFSceneTaxonomyNodeHighRecallThreshold((uint64_t)self->_nodeRef);
}

- (double)highPrecisionThreshold
{
  return PFSceneTaxonomyNodeHighPrecisionThreshold((uint64_t)self->_nodeRef);
}

- (double)precision0point6Threshold
{
  return PFSceneTaxonomyNodePrecision0Point6Threshold((uint64_t)self->_nodeRef);
}

- (double)f0point5Threshold
{
  return PFSceneTaxonomyNodeF0Point5Threshold((uint64_t)self->_nodeRef);
}

- (double)f1Threshold
{
  return PFSceneTaxonomyNodeF1Threshold((uint64_t)self->_nodeRef);
}

- (double)f2Threshold
{
  return PFSceneTaxonomyNodeF2Threshold((uint64_t)self->_nodeRef);
}

- (double)graphHighPrecisionThreshold
{
  return PFSceneTaxonomyNodeGraphHighPrecisionThreshold((uint64_t)self->_nodeRef);
}

- (double)graphHighRecallThreshold
{
  return PFSceneTaxonomyNodeGraphHighRecallThreshold((double *)self->_nodeRef);
}

- (NSSet)parents
{
  uint64_t v3;
  void *v4;
  void *nodeRef;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v3 = PFSceneTaxonomyNodeParentsCount((uint64_t)self->_nodeRef);
  if (!v3)
    return (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v3);
  nodeRef = self->_nodeRef;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__PFSceneTaxonomyNode_parents__block_invoke;
  v10[3] = &unk_1E45A3370;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  PFSceneTaxonomyNodeVisitParents((uint64_t)nodeRef, v10);
  v7 = v11;
  v8 = v6;

  return (NSSet *)v8;
}

- (NSSet)children
{
  uint64_t v3;
  void *v4;
  void *nodeRef;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v3 = PFSceneTaxonomyNodeChildrenCount((uint64_t)self->_nodeRef);
  if (!v3)
    return (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v3);
  nodeRef = self->_nodeRef;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31__PFSceneTaxonomyNode_children__block_invoke;
  v10[3] = &unk_1E45A3370;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  PFSceneTaxonomyNodeVisitChildren((uint64_t)nodeRef, v10);
  v7 = v11;
  v8 = v6;

  return (NSSet *)v8;
}

- (NSSet)detectors
{
  uint64_t v3;
  void *v4;
  void *nodeRef;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v3 = PFSceneTaxonomyNodeDetectorsCount((uint64_t)self->_nodeRef);
  if (!v3)
    return (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v3);
  nodeRef = self->_nodeRef;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__PFSceneTaxonomyNode_detectors__block_invoke;
  v10[3] = &unk_1E45A3370;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  PFSceneTaxonomyNodeVisitDetectors((uint64_t)nodeRef, v10);
  v7 = v11;
  v8 = v6;

  return (NSSet *)v8;
}

- (void)traverse:(int64_t)a3 visitor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *nodeRef;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  v7 = v6;
  if (a3 == 1)
  {
    nodeRef = self->_nodeRef;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__PFSceneTaxonomyNode_traverse_visitor___block_invoke_2;
    v11[3] = &unk_1E45A3398;
    v11[4] = self;
    v12 = v6;
    PFSceneTaxonomyNodeTraverseChildren((uint64_t)nodeRef, v11);
    v9 = v12;
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid PFSceneTaxonomyNodeTraversal passed: %lu"), a3);
      goto LABEL_7;
    }
    v8 = self->_nodeRef;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__PFSceneTaxonomyNode_traverse_visitor___block_invoke;
    v13[3] = &unk_1E45A3398;
    v13[4] = self;
    v14 = v6;
    PFSceneTaxonomyNodeTraverseParents((uint64_t)v8, v13);
    v9 = v14;
  }

LABEL_7:
}

- (id)localizedLabel
{
  return PFSceneTaxonomyNodeLocalizedLabel((pf::SceneTaxonomyNode *)self->_nodeRef, self->_taxonomy);
}

- (id)localizedSynonyms
{
  void *v2;
  void *v3;

  PFSceneTaxonomyNodeLocalizedSynonyms((pf::SceneTaxonomyNode *)self->_nodeRef, self->_taxonomy);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isEqualToNode:(id)a3
{
  _QWORD *nodeRef;
  _QWORD *v4;
  BOOL v5;
  BOOL result;

  result = a3
        && ((nodeRef = self->_nodeRef, v4 = (_QWORD *)*((_QWORD *)a3 + 1), nodeRef) ? (v5 = v4 == 0) : (v5 = 1), !v5)
        && *nodeRef == *v4;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PFSceneTaxonomyNode *v4;
  BOOL v5;

  v4 = (PFSceneTaxonomyNode *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PFSceneTaxonomyNode isEqualToNode:](self, "isEqualToNode:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t *nodeRef;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  nodeRef = (uint64_t *)self->_nodeRef;
  v3 = *nodeRef;
  v4 = nodeRef[9];
  v5 = (char *)nodeRef + v4 + 72;
  if (v4 == 1)
    v6 = 0;
  else
    v6 = (uint64_t)v5;
  return boost::hash<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>::operator()(v6) ^ v3;
}

- (id)description
{
  return PFSceneTaxonomyNodeDescription((uint64_t *)self->_nodeRef, self->_taxonomy);
}

- (PFSceneTaxonomy)taxonomy
{
  return (PFSceneTaxonomy *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taxonomy, 0);
}

uint64_t __40__PFSceneTaxonomyNode_traverse_visitor___block_invoke(uint64_t a1, uint64_t a2)
{
  PFSceneTaxonomyNode *v3;
  uint64_t v4;

  v3 = -[PFSceneTaxonomyNode initWithNodeRef:taxonomy:]([PFSceneTaxonomyNode alloc], "initWithNodeRef:taxonomy:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v4;
}

uint64_t __40__PFSceneTaxonomyNode_traverse_visitor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  PFSceneTaxonomyNode *v3;
  uint64_t v4;

  v3 = -[PFSceneTaxonomyNode initWithNodeRef:taxonomy:]([PFSceneTaxonomyNode alloc], "initWithNodeRef:taxonomy:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v4;
}

uint64_t __32__PFSceneTaxonomyNode_detectors__block_invoke(uint64_t a1, uint64_t a2)
{
  PFSceneTaxonomyNode *v3;

  v3 = -[PFSceneTaxonomyNode initWithNodeRef:taxonomy:]([PFSceneTaxonomyNode alloc], "initWithNodeRef:taxonomy:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return 0;
}

uint64_t __31__PFSceneTaxonomyNode_children__block_invoke(uint64_t a1, uint64_t a2)
{
  PFSceneTaxonomyNode *v3;

  v3 = -[PFSceneTaxonomyNode initWithNodeRef:taxonomy:]([PFSceneTaxonomyNode alloc], "initWithNodeRef:taxonomy:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return 0;
}

uint64_t __30__PFSceneTaxonomyNode_parents__block_invoke(uint64_t a1, uint64_t a2)
{
  PFSceneTaxonomyNode *v3;

  v3 = -[PFSceneTaxonomyNode initWithNodeRef:taxonomy:]([PFSceneTaxonomyNode alloc], "initWithNodeRef:taxonomy:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return 0;
}

@end
