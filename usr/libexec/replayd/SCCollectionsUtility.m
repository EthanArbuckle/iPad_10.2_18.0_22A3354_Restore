@implementation SCCollectionsUtility

+ (id)getDifferenceBetween:(id)a3 andArray:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  objc_msgSend(v6, "minusSet:", v7);
  return v6;
}

@end
