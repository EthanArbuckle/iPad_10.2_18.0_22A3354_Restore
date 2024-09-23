@implementation UIRecursivelyCacheCommandsInMenu

uint64_t ___UIRecursivelyCacheCommandsInMenu_block_invoke(uint64_t a1, uint64_t a2)
{
  return _UIRecursivelyCacheCommandsInMenu(a2, *(_QWORD *)(a1 + 32));
}

void ___UIRecursivelyCacheCommandsInMenu_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
