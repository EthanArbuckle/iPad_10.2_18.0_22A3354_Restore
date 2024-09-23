@implementation NSArray

- (id)objectAtIndexOrNull:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (-[NSArray count](self, "count") <= a3)
  {
    v8 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self, "objectAtIndex:", a3));
    v6 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectEnumerator"));
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));

    }
    else
    {
      v8 = v5;
    }

  }
  return v8;
}

@end
