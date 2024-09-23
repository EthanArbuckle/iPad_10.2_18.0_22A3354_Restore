@implementation SVTimeBasedAction

- (_QWORD)initWithTime:(double)a3 block:
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v5 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SVTimeBasedAction;
    v6 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v6;
    if (v6)
    {
      *((double *)v6 + 1) = a3;
      v7 = MEMORY[0x2207327F0](v5);
      v8 = (void *)a1[2];
      a1[2] = v7;

    }
  }

  return a1;
}

- (double)time
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)block
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
