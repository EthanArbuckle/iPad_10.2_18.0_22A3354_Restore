@implementation PXStoryComposabilityScoresMutableArray

- (void)addComposabilityScores:(id)a3
{
  float var1;
  float var0;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  uint64_t v18;

  var1 = a3.var1;
  var0 = a3.var0;
  end = self->super._scores.__end_;
  value = self->super._scores.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->super._scores.__begin_;
    v10 = (end - begin) >> 3;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<PXStoryAutoEditComposabilityScores>::__throw_length_error[abi:ne180100]();
    v12 = value - begin;
    if (v12 >> 2 > v11)
      v11 = v12 >> 2;
    v13 = (unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8;
    v14 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v13)
      v14 = v11;
    if (v14)
    {
      v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<PXStoryAutoEditComposabilityScores>>(v14);
      begin = self->super._scores.__begin_;
      end = self->super._scores.__end_;
    }
    else
    {
      v15 = 0;
    }
    v16 = v14 + 8 * v10;
    v17 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v14 + 8 * v15);
    *(float *)v16 = var0;
    *(float *)(v16 + 4) = var1;
    v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v16 + 8);
    if (end != begin)
    {
      do
      {
        v18 = *((_QWORD *)end - 1);
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 8);
        *(_QWORD *)(v16 - 8) = v18;
        v16 -= 8;
      }
      while (end != begin);
      begin = self->super._scores.__begin_;
    }
    self->super._scores.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v16;
    self->super._scores.__end_ = v8;
    self->super._scores.__end_cap_.__value_ = v17;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *($94F468A8D4C62B317260615823C2B210 *)end = a3;
    v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 8);
  }
  self->super._scores.__end_ = v8;
}

@end
