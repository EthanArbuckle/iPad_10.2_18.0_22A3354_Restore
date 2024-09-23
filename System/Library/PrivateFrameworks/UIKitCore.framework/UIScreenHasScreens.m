@implementation UIScreenHasScreens

void ___UIScreenHasScreens_block_invoke(uint64_t a1)
{
  id v2;

  if (qword_1ECD799C0 != -1)
    dispatch_once(&qword_1ECD799C0, &__block_literal_global_820);
  v2 = (id)qword_1ECD799C8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "count") != 0;

}

@end
