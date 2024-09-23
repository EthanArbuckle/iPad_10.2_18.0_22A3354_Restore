@implementation PGGraphLocationStateNodeCollection

- (PGGraphAddressNodeCollection)addressNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationStateNode addressOfState](PGGraphLocationStateNode, "addressOfState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationStateNode momentOfState](PGGraphLocationStateNode, "momentOfState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphLocationCountryNodeCollection)countryNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationStateNode countryOfState](PGGraphLocationStateNode, "countryOfState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationCountryNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationCountryNodeCollection *)v4;
}

- (unint64_t)numberOfMomentNodes
{
  void *v3;
  unint64_t v4;

  +[PGGraphLocationStateNode momentOfState](PGGraphLocationStateNode, "momentOfState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MANodeCollection numberOfNodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "numberOfNodesRelatedToNodes:withRelation:", self, v3);

  return v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
