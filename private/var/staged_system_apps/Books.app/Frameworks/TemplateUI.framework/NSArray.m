@implementation NSArray

- (id)tui_firstObjectPassingTest:(id)a3
{
  uint64_t (**v4)(id, void *, _QWORD);
  uint64_t v5;
  void *v6;

  v4 = (uint64_t (**)(id, void *, _QWORD))a3;
  if (-[NSArray count](self, "count"))
  {
    v5 = 0;
    while (1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v5));
      if ((v4[2](v4, v6, v5) & 1) != 0)
        break;

      if (++v5 >= -[NSArray count](self, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v6 = 0;
  }

  return v6;
}

- (BOOL)tui_hasProperty:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("empty")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("count"));

  return v4;
}

- (id)tui_valueForProperty:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("count")))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self, "count")));
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("empty")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NSArray count](self, "count") == 0));
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (id)tui_objectAtIndex:(int64_t)a3
{
  NSUInteger v5;
  void *v6;
  int64_t v7;

  v5 = -[NSArray count](self, "count");
  v6 = 0;
  v7 = (v5 & (a3 >> 63)) + a3;
  if (v7 >= 0 && v7 < v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self, "objectAtIndex:"));
  return v6;
}

- (id)tui_subarrayWithStart:(int64_t)a3 end:(int64_t)a4
{
  NSUInteger v7;
  int64_t v8;
  NSUInteger v9;
  void *v10;
  int64_t v11;

  v7 = -[NSArray count](self, "count");
  v8 = (v7 & (a3 >> 63)) + a3;
  if (v8 < 0)
  {
    v10 = 0;
  }
  else
  {
    v9 = v7;
    v10 = 0;
    if (v8 < v9)
    {
      v11 = (v9 & (a4 >> 63)) + a4;
      if ((v11 & 0x8000000000000000) == 0 && v11 < v9 && v8 <= v11)
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self, "subarrayWithRange:"));
    }
  }
  return v10;
}

@end
