@implementation UIScreenAllScreens

void ___UIScreenAllScreens_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (qword_1ECD799C0 != -1)
    dispatch_once(&qword_1ECD799C0, &__block_literal_global_820);
  v5 = (id)qword_1ECD799C8;
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
