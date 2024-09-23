@implementation UIGestureRecognizer(UIGestureRecognizer_SpringBoard)

- (id)sb_briefDescription
{
  void *v2;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v2)
  {
    objc_msgSend(a1, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>; name: %@"), v6, a1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (__CFString)sb_stringForState
{
  unint64_t v2;
  __CFString *v3;

  v2 = objc_msgSend(a1, "state");
  if (v2 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown: %lu"), objc_msgSend(a1, "state"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E8EBC320[v2];
  }
  return v3;
}

@end
