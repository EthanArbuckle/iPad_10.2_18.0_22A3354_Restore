@implementation SXJSONCollectionContentDisplay

+ (id)typeString
{
  return CFSTR("collection");
}

- (unint64_t)widowsWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("equalize")) & 1) != 0)
    {
      v7 = 1;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("allow")))
    {
      v7 = 2;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)alignmentWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("center")) & 1) != 0)
    {
      v7 = 1;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("right")))
    {
      v7 = 2;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)distributionWithValue:(id)a3 withType:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 == 3)
    return objc_msgSend(a3, "isEqualToString:", CFSTR("narrow"), v4, v5);
  else
    return 0;
}

@end
