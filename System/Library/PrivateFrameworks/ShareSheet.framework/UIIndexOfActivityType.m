@implementation UIIndexOfActivityType

uint64_t ___UIIndexOfActivityType_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  void *v6;

  objc_msgSend(a2, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return *a4;
}

@end
