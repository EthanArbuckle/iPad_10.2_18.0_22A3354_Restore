@implementation TIDispatchAsync

void __TIDispatchAsync_block_invoke(uint64_t a1)
{
  unint64_t v1;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (_block_count(void)::once_token != -1)
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global_4);
  do
    v1 = __ldaxr(&_block_count(void)::count);
  while (__stlxr(v1 - 1, &_block_count(void)::count));
}

@end
