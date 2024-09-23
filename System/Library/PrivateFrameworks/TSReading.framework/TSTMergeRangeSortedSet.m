@implementation TSTMergeRangeSortedSet

- (TSTMergeRangeSortedSet)init
{
  TSTMergeRangeSortedSet *v2;
  _QWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSTMergeRangeSortedSet;
  v2 = -[TSTMergeRangeSortedSet init](&v5, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    v3[2] = 0;
    v3[1] = 0;
    *v3 = v3 + 1;
    v2->mSet = v3;
    v2->mSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    -[TSTMergeRangeSortedSet reset](v2, "reset");
  }
  return v2;
}

- (void)dealloc
{
  _QWORD **mSet;
  objc_super v4;

  mSet = (_QWORD **)self->mSet;
  if (mSet)
  {
    std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)self->mSet, mSet[1]);
    MEMORY[0x219A153B8](mSet, 0x1020C4062D53EE8);
  }
  dispatch_release((dispatch_object_t)self->mSem);
  v4.receiver = self;
  v4.super_class = (Class)TSTMergeRangeSortedSet;
  -[TSTMergeRangeSortedSet dealloc](&v4, sel_dealloc);
}

- (void)addRange:(id)a3 andSize:(CGSize)a4 andPaddingInsets:(UIEdgeInsets)a5 andIsCheckbox:(BOOL)a6
{
  $CA3468F20078D5D2DB35E78E73CA60DA v7;
  CGSize v8;
  UIEdgeInsets v9;
  int v10;
  BOOL v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = ((LOBYTE(a3.var1.var0) + a3.var0.var1 - 1) | ((*(_DWORD *)&a3.var0 + a3.var1.var1) << 16))
      - 0x10000;
  v11 = a6;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mSem, 0xFFFFFFFFFFFFFFFFLL);
  std::__tree<TSTMergeRangeElem,TSTMergeRangeElemCompare,std::allocator<TSTMergeRangeElem>>::__emplace_unique_key_args<TSTMergeRangeElem,TSTMergeRangeElem const&>((uint64_t **)self->mSet, (uint64_t)&v7, &v7);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mSem);
}

- (unint64_t)count
{
  return *((_QWORD *)self->mSet + 2);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)begin
{
  void **mSet;
  $CA3468F20078D5D2DB35E78E73CA60DA *v3;

  mSet = (void **)self->mSet;
  v3 = ($CA3468F20078D5D2DB35E78E73CA60DA *)*mSet;
  self->mIter.__ptr_ = *mSet;
  if (v3 == ($CA3468F20078D5D2DB35E78E73CA60DA *)(mSet + 1))
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  else
    return v3[4];
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)iter
{
  void *ptr;
  $CA3468F20078D5D2DB35E78E73CA60DA *v3;
  $CA3468F20078D5D2DB35E78E73CA60DA *v4;
  BOOL v5;

  ptr = self->mIter.__ptr_;
  v3 = ($CA3468F20078D5D2DB35E78E73CA60DA *)*((_QWORD *)ptr + 1);
  if (v3)
  {
    do
    {
      v4 = v3;
      v3 = ($CA3468F20078D5D2DB35E78E73CA60DA *)*v3;
    }
    while (v3);
  }
  else
  {
    do
    {
      v4 = ($CA3468F20078D5D2DB35E78E73CA60DA *)*((_QWORD *)ptr + 2);
      v5 = *v4 == (_QWORD)ptr;
      ptr = v4;
    }
    while (!v5);
  }
  self->mIter.__ptr_ = v4;
  if (v4 == ($CA3468F20078D5D2DB35E78E73CA60DA *)self->mSet + 1)
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  else
    return v4[4];
}

- (CGSize)getSize
{
  double *ptr;
  double v3;
  double v4;
  CGSize result;

  ptr = (double *)self->mIter.__ptr_;
  if (ptr == (double *)self->mSet + 1)
  {
    v3 = 0.0;
    v4 = 0.0;
  }
  else
  {
    v3 = ptr[5];
    v4 = ptr[6];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)isCheckbox
{
  _BYTE *ptr;

  ptr = self->mIter.__ptr_;
  return ptr != (_BYTE *)self->mSet + 8 && ptr[92] != 0;
}

- (UIEdgeInsets)getPaddingInsets
{
  double *ptr;
  double *v3;
  BOOL v4;
  double *v5;
  double *v6;
  double *v7;
  double *v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  ptr = (double *)self->mIter.__ptr_;
  v3 = (double *)&TSDEdgeInsetsZero + 1;
  v4 = ptr == (double *)self->mSet + 1;
  v5 = ptr + 7;
  v6 = ptr + 8;
  v7 = ptr + 9;
  v8 = ptr + 10;
  if (v4)
    v5 = (double *)&TSDEdgeInsetsZero;
  else
    v3 = v6;
  if (v4)
    v9 = (double *)&qword_217C29098;
  else
    v9 = v7;
  if (v4)
    v8 = (double *)&qword_217C290A0;
  v10 = *v8;
  v11 = *v9;
  v12 = *v5;
  v13 = *v3;
  result.right = v10;
  result.bottom = v11;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)reset
{
  char *mSet;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->mSem, 0xFFFFFFFFFFFFFFFFLL);
  mSet = (char *)self->mSet;
  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)mSet, *((_QWORD **)mSet + 1));
  *(_QWORD *)mSet = mSet + 8;
  *((_QWORD *)mSet + 2) = 0;
  *((_QWORD *)mSet + 1) = 0;
  self->mIter.__ptr_ = *(void **)self->mSet;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mSem);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
