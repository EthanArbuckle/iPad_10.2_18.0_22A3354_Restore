@implementation CMHandDetectionDelegateInternal

- (void)callHandednessManager:(id)a3 didUpdateState:(int64_t)a4
{
  uint64_t v4;

  if (a3)
  {
    v4 = *((_QWORD *)self + 1);
    if (v4)
      (*(void (**)(uint64_t, int64_t))(v4 + 16))(v4, a4);
  }
}

- (void)registerHandler:(void *)a3
{
  void *v4;
  const void *v5;

  v4 = *a3;
  if (*a3)
    v4 = _Block_copy(v4);
  v5 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    _Block_release(v5);
}

- (void).cxx_destruct
{
  const void *v2;

  v2 = (const void *)*((_QWORD *)self + 1);
  if (v2)
    _Block_release(v2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
