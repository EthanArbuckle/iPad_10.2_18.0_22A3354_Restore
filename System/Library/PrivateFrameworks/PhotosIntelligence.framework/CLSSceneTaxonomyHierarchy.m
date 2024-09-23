@implementation CLSSceneTaxonomyHierarchy

- (id)initForSceneNetOnly:(BOOL)a3
{
  CLSSceneTaxonomyHierarchy *v4;
  uint64_t v5;
  PFSceneTaxonomy *sceneTaxonomy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSSceneTaxonomyHierarchy;
  v4 = -[CLSSceneTaxonomyHierarchy init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE72440]), "initWithLatestTaxonomy");
    sceneTaxonomy = v4->_sceneTaxonomy;
    v4->_sceneTaxonomy = (PFSceneTaxonomy *)v5;

    v4->_forSceneNetOnly = a3;
  }
  return v4;
}

- (id)rootNode
{
  return -[CLSSceneTaxonomyHierarchyNode initWithSceneTaxonomyNodeRef:inSceneTaxonomy:forSceneNetOnly:]([CLSSceneTaxonomyHierarchyNode alloc], "initWithSceneTaxonomyNodeRef:inSceneTaxonomy:forSceneNetOnly:", -[PFSceneTaxonomy rootNodeRef](self->_sceneTaxonomy, "rootNodeRef"), self->_sceneTaxonomy, self->_forSceneNetOnly);
}

- (id)nodeForName:(id)a3
{
  uint64_t v4;

  v4 = -[PFSceneTaxonomy nodeRefForName:](self->_sceneTaxonomy, "nodeRefForName:", a3);
  if (self->_forSceneNetOnly && PFSceneTaxonomyNodeNetworkId() != 1)
    return 0;
  else
    return -[CLSSceneTaxonomyHierarchyNode initWithSceneTaxonomyNodeRef:inSceneTaxonomy:forSceneNetOnly:]([CLSSceneTaxonomyHierarchyNode alloc], "initWithSceneTaxonomyNodeRef:inSceneTaxonomy:forSceneNetOnly:", v4, self->_sceneTaxonomy, self->_forSceneNetOnly);
}

- (BOOL)nodeExistsForName:(id)a3
{
  uint64_t v4;

  v4 = -[PFSceneTaxonomy nodeRefForName:](self->_sceneTaxonomy, "nodeRefForName:", a3);
  if (self->_forSceneNetOnly && PFSceneTaxonomyNodeNetworkId() != 1)
    v4 = 0;
  return v4 != 0;
}

- (id)nodeForIdentifier:(unint64_t)a3
{
  uint64_t v4;

  v4 = -[PFSceneTaxonomy nodeRefForExtendedSceneClassId:](self->_sceneTaxonomy, "nodeRefForExtendedSceneClassId:", a3);
  if (self->_forSceneNetOnly && PFSceneTaxonomyNodeNetworkId() != 1)
    return 0;
  else
    return -[CLSSceneTaxonomyHierarchyNode initWithSceneTaxonomyNodeRef:inSceneTaxonomy:forSceneNetOnly:]([CLSSceneTaxonomyHierarchyNode alloc], "initWithSceneTaxonomyNodeRef:inSceneTaxonomy:forSceneNetOnly:", v4, self->_sceneTaxonomy, self->_forSceneNetOnly);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
}

@end
