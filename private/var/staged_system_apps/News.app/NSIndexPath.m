@implementation NSIndexPath

+ (id)fr_firstIndexPath
{
  return +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0);
}

- (id)indexPathInvalidatingIndexesFollowingPosition:(int64_t)a3
{
  void *v5;
  NSIndexPath *v6;

  if ((char *)-[NSIndexPath length](self, "length") - 1 <= (char *)a3)
  {
    v6 = self;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSIndexPath indexPathByRemovingLastIndex](self, "indexPathByRemovingLastIndex"));
    v6 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathInvalidatingIndexesFollowingPosition:", a3));

  }
  return v6;
}

+ (id)fr_indexPathsForRows:(id)a3 inSection:(int64_t)a4
{
  id v5;
  NSMutableArray *v6;
  id v7;
  id i;
  void *v9;

  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = objc_msgSend(v5, "firstIndex");
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v7; i != (id)0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v5, "indexGreaterThanIndex:", i))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, a4));
        -[NSMutableArray addObject:](v6, "addObject:", v9);

      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10007FC58();
    v6 = 0;
  }

  return v6;
}

@end
