@implementation UIScrollViewGestureSimulator

void __47___UIScrollViewGestureSimulator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD824E0;
  qword_1ECD824E0 = (uint64_t)v1;

}

uint64_t __44___UIScrollViewGestureSimulator__threadMain__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_signalMainThreadIfNecessary");
}

@end
