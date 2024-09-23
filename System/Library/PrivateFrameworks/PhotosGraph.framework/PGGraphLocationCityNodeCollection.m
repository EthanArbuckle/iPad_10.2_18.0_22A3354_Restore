@implementation PGGraphLocationCityNodeCollection

- (PGGraphAddressNodeCollection)addressNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationCityNode addressOfCity](PGGraphLocationCityNode, "addressOfCity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationCityNode momentInCity](PGGraphLocationCityNode, "momentInCity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphLocationCountryNodeCollection)countryNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationCityNode countryOfCity](PGGraphLocationCityNode, "countryOfCity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationCountryNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationCountryNodeCollection *)v4;
}

- (PGGraphLocationStateNodeCollection)stateNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationCityNode stateOfCity](PGGraphLocationCityNode, "stateOfCity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationStateNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationStateNodeCollection *)v4;
}

- (PGGraphLocationCountyNodeCollection)countyNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationCityNode countyOfCity](PGGraphLocationCityNode, "countyOfCity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationCountyNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationCountyNodeCollection *)v4;
}

- (unint64_t)numberOfMomentNodes
{
  void *v3;
  unint64_t v4;

  +[PGGraphLocationCityNode momentInCity](PGGraphLocationCityNode, "momentInCity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MANodeCollection numberOfNodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "numberOfNodesRelatedToNodes:withRelation:", self, v3);

  return v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
