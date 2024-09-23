@implementation DefaultContentSizeCategory

void __DefaultContentSizeCategory_block_invoke()
{
  __objc2_class *v0;
  uint64_t v1;
  void *v2;

  if (UIApp)
    v0 = (__objc2_class *)objc_opt_class();
  else
    v0 = UIApplication;
  -[__objc2_class _defaultContentSizeCategory](v0, "_defaultContentSizeCategory");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECD7E910;
  qword_1ECD7E910 = v1;

}

@end
