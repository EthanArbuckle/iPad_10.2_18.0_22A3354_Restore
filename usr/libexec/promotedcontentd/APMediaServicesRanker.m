@implementation APMediaServicesRanker

+ (id)findValidObjectsInContentDataItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100218AF0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

+ (id)sortByRank:(id)a3
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &stru_100218AB0);
}

+ (void)_sortByRank:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id v7;

  v6 = (void (**)(id, id, _QWORD))a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortByRank:", a3));
  v6[2](v6, v7, 0);

}

+ (void)rankRepresentations:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "findValidObjectsInContentDataItems:", a3));
  objc_msgSend(a1, "_sortByRank:completionHandler:", v7, v6);

}

@end
