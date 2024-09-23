@implementation EQKitLayoutElementaryStackCarryRow

- (EQKitLayoutElementaryStackCarryRow)initWithChildren:(id)a3 decimalPoint:(unint64_t)a4 position:(int64_t)a5 followingSpace:(double)a6 crossouts:(const void *)a7
{
  EQKitLayoutElementaryStackCarryRow *v8;
  EQKitLayoutElementaryStackCarryRow *v9;
  char *p_mCrossouts;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)EQKitLayoutElementaryStackCarryRow;
  v8 = -[EQKitLayoutElementaryStackDigitRow initWithChildren:decimalPoint:position:followingSpace:](&v12, sel_initWithChildren_decimalPoint_position_followingSpace_, a3, a4, a5, a6);
  v9 = v8;
  if (v8)
  {
    p_mCrossouts = (char *)&v8->mCrossouts;
    if (&v9->mCrossouts != a7)
      std::vector<EQKitTypes::Notation::Enum>::__assign_with_size[abi:nn180100]<EQKitTypes::Notation::Enum*,EQKitTypes::Notation::Enum*>(p_mCrossouts, *(char **)a7, *((_QWORD *)a7 + 1), (uint64_t)(*((_QWORD *)a7 + 1) - *(_QWORD *)a7) >> 2);
  }
  return v9;
}

- (int)crossoutAtColumnIndex:(unint64_t)a3
{
  int *begin;

  begin = self->mCrossouts.__begin_;
  if (a3 >= self->mCrossouts.__end_ - begin)
    return 0;
  else
    return begin[a3];
}

- (void).cxx_destruct
{
  vector<EQKitTypes::Crossout::Enum, std::allocator<EQKitTypes::Crossout::Enum>> *p_mCrossouts;
  int *begin;

  p_mCrossouts = &self->mCrossouts;
  begin = self->mCrossouts.__begin_;
  if (begin)
  {
    p_mCrossouts->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
