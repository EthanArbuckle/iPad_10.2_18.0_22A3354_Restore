@implementation NSMutableArray

+ (id)tui_stackWithObjectsFromArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5));

  }
  else
  {
    v6 = objc_opt_new(NSMutableArray);
  }

  return v6;
}

- (void)tui_pushObjectsFromArray:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:", v5);

  }
}

- (void)tui_push:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self, "addObject:");
}

- (id)tui_pop
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self, "lastObject"));
  if (v3)
    -[NSMutableArray removeLastObject](self, "removeLastObject");
  return v3;
}

@end
