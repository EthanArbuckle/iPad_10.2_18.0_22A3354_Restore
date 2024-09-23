@implementation CLSSceneTaxonomyHierarchyNode

- (CLSSceneTaxonomyHierarchyNode)initWithSceneTaxonomyNodeRef:(void *)a3 inSceneTaxonomy:(id)a4 forSceneNetOnly:(BOOL)a5
{
  id v9;
  CLSSceneTaxonomyHierarchyNode *v10;
  CLSSceneTaxonomyHierarchyNode *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLSSceneTaxonomyHierarchyNode;
  v10 = -[CLSSceneTaxonomyHierarchyNode init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_taxonomyNodeRef = a3;
    objc_storeStrong((id *)&v10->_sceneTaxonomy, a4);
    v11->_forSceneNetOnly = a5;
  }

  return v11;
}

- (NSString)name
{
  return (NSString *)PFSceneTaxonomyNodeName();
}

- (unint64_t)identifier
{
  return PFSceneTaxonomyNodeExtendedSceneClassId();
}

- (NSString)localizedName
{
  return (NSString *)PFSceneTaxonomyNodeLocalizedLabel();
}

- (NSSet)localizedSynonyms
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  PFSceneTaxonomyNodeLocalizedSynonyms();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)isIndexed
{
  return PFSceneTaxonomyNodeIsIndexed();
}

- (void)traverseChildrenUsingNameBlock:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PFSceneTaxonomyNodeTraverseChildren();

}

- (void)visitChildrenUsingNameBlock:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PFSceneTaxonomyNodeVisitChildren();

}

- (void)visitParentsUsingNameBlock:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PFSceneTaxonomyNodeVisitParents();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
}

uint64_t __60__CLSSceneTaxonomyHierarchyNode_visitParentsUsingNameBlock___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;

  if (*(_BYTE *)(a1 + 40) && PFSceneTaxonomyNodeNetworkId() != 1)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v6;
}

uint64_t __61__CLSSceneTaxonomyHierarchyNode_visitChildrenUsingNameBlock___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;

  if (*(_BYTE *)(a1 + 40) && PFSceneTaxonomyNodeNetworkId() != 1)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v6;
}

uint64_t __64__CLSSceneTaxonomyHierarchyNode_traverseChildrenUsingNameBlock___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;

  if (*(_BYTE *)(a1 + 40) && PFSceneTaxonomyNodeNetworkId() != 1)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v6;
}

@end
