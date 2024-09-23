@implementation SUItemValidatorTest

+ (id)defaultTest
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)validateItem:(id)a3 offer:(id)a4 error:(id *)a5
{
  if (a5)
    *a5 = 0;
  return 1;
}

- (BOOL)validateItems:(id)a3 offers:(id)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;

  v9 = objc_msgSend(a3, "count");
  v10 = objc_msgSend(a4, "count");
  if (v9 < 1)
  {
    return 1;
  }
  else
  {
    v11 = v10;
    v12 = 0;
    for (i = 0; i != v9; v12 = i >= v9)
    {
      v14 = objc_msgSend(a3, "objectAtIndex:", i);
      if (i >= v11)
        v15 = 0;
      else
        v15 = objc_msgSend(a4, "objectAtIndex:", i);
      if (!-[SUItemValidatorTest validateItem:offer:error:](self, "validateItem:offer:error:", v14, v15, a5))
        break;
      ++i;
    }
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

@end
