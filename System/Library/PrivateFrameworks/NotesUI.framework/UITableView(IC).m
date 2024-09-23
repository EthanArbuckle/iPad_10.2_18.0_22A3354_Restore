@implementation UITableView(IC)

- (id)ic_middleVisibleIndexPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "ic_visibleRectConsideringInsets:", 1);
  objc_msgSend(a1, "indexPathsForRowsInRect:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v2, "count") >> 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
