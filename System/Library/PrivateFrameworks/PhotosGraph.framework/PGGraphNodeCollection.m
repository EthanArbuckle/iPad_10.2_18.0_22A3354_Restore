@implementation PGGraphNodeCollection

- (PGGraphNodeCollection)initWithSubsetInGraph:(id)a3 elementIdentifiers:(id)a4
{
  PGGraphNodeCollection *result;

  sub_1CA24EEC0(0, &qword_1EF95AE18);
  swift_unknownObjectRetain();
  sub_1CA507FC8(a3, a4);
  return result;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (MANodeFilter)filter
{
  return (MANodeFilter *)objc_msgSend((id)objc_msgSend(a1, "nodeClass"), "filter");
}

+ (id)nodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)subsetInCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesRelatedToNodes:withRelation:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
