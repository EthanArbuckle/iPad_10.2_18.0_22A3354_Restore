@implementation PGGraphLocationCountryNodeCollection

- (PGGraphAddressNodeCollection)addressNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationCountryNode addressOfCountry](PGGraphLocationCountryNode, "addressOfCountry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationCountryNode momentInCountry](PGGraphLocationCountryNode, "momentInCountry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphLanguageNodeCollection)languageNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationCountryNode languageOfCountry](PGGraphLocationCountryNode, "languageOfCountry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLanguageNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLanguageNodeCollection *)v4;
}

- (unint64_t)numberOfMomentNodes
{
  void *v3;
  unint64_t v4;

  +[PGGraphLocationCountryNode momentInCountry](PGGraphLocationCountryNode, "momentInCountry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MANodeCollection numberOfNodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "numberOfNodesRelatedToNodes:withRelation:", self, v3);

  return v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
