@implementation UIViewSortedConstraintsForDebugging

NSString *___UIViewSortedConstraintsForDebugging_block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

uint64_t ___UIViewSortedConstraintsForDebugging_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

@end
