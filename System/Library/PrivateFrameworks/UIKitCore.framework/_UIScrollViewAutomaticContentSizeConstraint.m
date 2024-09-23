@implementation _UIScrollViewAutomaticContentSizeConstraint

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIScrollViewAutomaticContentSizeConstraint firstAttribute](self, "firstAttribute");
  -[_UIScrollViewAutomaticContentSizeConstraint firstItem](self, "firstItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 101)
    objc_msgSend(v7, "_contentWidthVariable");
  else
    objc_msgSend(v7, "_contentHeightVariable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIScrollViewAutomaticContentSizeConstraint constant](self, "constant");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ == %f>"), v5, self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
