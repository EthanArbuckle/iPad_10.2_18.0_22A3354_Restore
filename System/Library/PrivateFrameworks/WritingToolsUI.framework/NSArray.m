@implementation NSArray

void __29__NSArray__WTColor__CGColors__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(objc_retainAutorelease(v3), "CGColor"));

}

@end
