@implementation RBEncoderSet

- (RBEncoderSet)init
{
  RBEncoderSet *v2;
  uint64_t v3;
  FontSet *p;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RBEncoderSet;
  v2 = -[RBEncoderSet init](&v9, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_DWORD *)(v3 + 8) = 1;
    *(_QWORD *)v3 = off_24C2242E8;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_DWORD *)(v3 + 48) = 1065353216;
    p = v2->_font_set._p;
    v2->_font_set._p = (FontSet *)v3;
    if (p)
    {
      v5 = (unsigned int *)((char *)p + 8);
      do
      {
        v6 = __ldxr(v5);
        v7 = v6 - 1;
      }
      while (__stlxr(v7, v5));
      if (!v7)
      {
        __dmb(9u);
        (*(void (**)(FontSet *))(*(_QWORD *)p + 8))(p);
      }
    }
  }
  return v2;
}

- (void)addDisplayList:(id)a3
{
  uint64_t v4;
  RB::DisplayList::Contents *v5;
  FontSet *p;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  FontSet *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  void *v15[2];
  void *v16[2];
  __int128 v17;
  char v18;
  uint64_t v19;
  FontSet *v20;
  uint64_t v21;
  _DWORD v22[24];

  if (self->_final)
    RB::precondition_failure((RB *)"can't add to committed RBEncoderSet", a2, a3);
  v4 = objc_msgSend(a3, "_rb_contents");
  if (v4)
  {
    v5 = (RB::DisplayList::Contents *)v4;
    p = self->_font_set._p;
    *(_OWORD *)v15 = 0u;
    *(_OWORD *)v16 = 0u;
    v17 = 0u;
    v18 = 0;
    v19 = 0;
    if (p)
    {
      v7 = (unsigned int *)((char *)p + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    v20 = p;
    v21 = 0;
    RB::UntypedTable::UntypedTable((RB::UntypedTable *)v22, 0, 0, 0, 0, 0);
    do
    {
      v9 = __ldxr((unsigned int *)&RB::Encoder::_last_encoder_id);
      v10 = v9 + 1;
    }
    while (__stxr(v10, (unsigned int *)&RB::Encoder::_last_encoder_id));
    v22[20] = v10;
    v22[21] = 1;
    RB::DisplayList::Contents::prepare_encode(v5, (RB::Encoder *)v15);
    RB::UntypedTable::~UntypedTable((RB::UntypedTable *)v22);
    v11 = v20;
    if (v20)
    {
      v12 = (unsigned int *)((char *)v20 + 8);
      do
      {
        v13 = __ldxr(v12);
        v14 = v13 - 1;
      }
      while (__stlxr(v14, v12));
      if (!v14)
      {
        __dmb(9u);
        (*(void (**)(FontSet *))(*(_QWORD *)v11 + 8))(v11);
      }
    }
    if (v16[1])
      free(v16[1]);
    if (v15[0])
      free(v15[0]);
  }
}

- (void)commit
{
  self->_final = 1;
}

- (void).cxx_destruct
{
  FontSet *p;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  p = self->_font_set._p;
  if (p)
  {
    v3 = (unsigned int *)((char *)p + 8);
    do
    {
      v4 = __ldxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      __dmb(9u);
      (*(void (**)(FontSet *))(*(_QWORD *)p + 8))(p);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (uint64_t)addDisplayList:(uint64_t)result .cold.1(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = (unsigned int *)(result + 8);
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (!v3)
  {
    __dmb(9u);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  }
  return result;
}

@end
