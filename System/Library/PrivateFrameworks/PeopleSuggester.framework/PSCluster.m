@implementation PSCluster

uint64_t __24___PSCluster_sortArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "compareByAnglePoint:andPoint:withRef:", a2, a3, *(_QWORD *)(a1 + 40));
}

@end
