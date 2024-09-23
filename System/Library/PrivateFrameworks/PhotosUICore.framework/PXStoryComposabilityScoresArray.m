@implementation PXStoryComposabilityScoresArray

- (PXStoryComposabilityScoresArray)init
{
  return -[PXStoryComposabilityScoresArray initWithCapacity:](self, "initWithCapacity:", 0);
}

- (PXStoryComposabilityScoresArray)initWithCapacity:(unint64_t)a3
{
  PXStoryComposabilityScoresArray *v4;
  PXStoryComposabilityScoresArray *v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  char *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  uint64_t v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXStoryComposabilityScoresArray;
  v4 = -[PXStoryComposabilityScoresArray init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    begin = v4->_scores.__begin_;
    if (a3 > (v4->_scores.__end_cap_.__value_ - begin) >> 3)
    {
      if (a3 >> 61)
        std::vector<PXStoryAutoEditComposabilityScores>::__throw_length_error[abi:ne180100]();
      end = v4->_scores.__end_;
      v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PXStoryAutoEditComposabilityScores>>(a3);
      v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v8[(end - begin) & 0xFFFFFFFFFFFFFFF8];
      v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v8[8 * v10];
      v13 = v5->_scores.__begin_;
      v12 = v5->_scores.__end_;
      v14 = v9;
      if (v12 != v13)
      {
        do
        {
          v15 = *((_QWORD *)v12 - 1);
          v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v12 - 8);
          *((_QWORD *)v14 - 1) = v15;
          v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v14 - 8);
        }
        while (v12 != v13);
        v12 = v5->_scores.__begin_;
      }
      v5->_scores.__begin_ = v14;
      v5->_scores.__end_ = v9;
      v5->_scores.__end_cap_.__value_ = v11;
      if (v12)
        operator delete(v12);
    }
  }
  return v5;
}

- (PXStoryComposabilityScoresArray)initWithComposabilityResults:(id)a3
{
  id v4;
  PXStoryComposabilityScoresArray *v5;
  unint64_t i;
  int v7;
  int v8;
  int v9;
  int v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  char *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v21;
  uint64_t v22;

  v4 = a3;
  v5 = -[PXStoryComposabilityScoresArray initWithCapacity:](self, "initWithCapacity:", objc_msgSend(v4, "count"));
  if (v5)
  {
    for (i = 0; i < objc_msgSend(v4, "count"); ++i)
    {
      objc_msgSend(v4, "composabilityScoresAtIndex:", i);
      v9 = v7;
      v10 = v8;
      end = (char *)v5->_scores.__end_;
      value = v5->_scores.__end_cap_.__value_;
      if (end >= (char *)value)
      {
        begin = v5->_scores.__begin_;
        v15 = (end - (char *)begin) >> 3;
        v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 61)
          std::vector<PXStoryAutoEditComposabilityScores>::__throw_length_error[abi:ne180100]();
        v17 = value - begin;
        if (v17 >> 2 > v16)
          v16 = v17 >> 2;
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
          v18 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v18 = v16;
        if (v18)
        {
          v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<PXStoryAutoEditComposabilityScores>>(v18);
          begin = v5->_scores.__begin_;
          end = (char *)v5->_scores.__end_;
        }
        else
        {
          v19 = 0;
        }
        v20 = (_DWORD *)(v18 + 8 * v15);
        *v20 = v9;
        v20[1] = v10;
        v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v20;
        if (end != (char *)begin)
        {
          do
          {
            v22 = *((_QWORD *)end - 1);
            end -= 8;
            *((_QWORD *)v21 - 1) = v22;
            v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v21 - 8);
          }
          while (end != (char *)begin);
          begin = v5->_scores.__begin_;
        }
        v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 2);
        v5->_scores.__begin_ = v21;
        v5->_scores.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 2);
        v5->_scores.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v18 + 8 * v19);
        if (begin)
          operator delete(begin);
      }
      else
      {
        *(_DWORD *)end = v7;
        *((_DWORD *)end + 1) = v8;
        v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(end + 8);
      }
      v5->_scores.__end_ = v13;
    }
  }

  return v5;
}

- (NSString)debugDescription
{
  void *v3;
  unint64_t i;
  float v5;
  float v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[PXStoryComposabilityScoresArray count](self, "count"));
  for (i = 0; i < -[PXStoryComposabilityScoresArray count](self, "count"); ++i)
  {
    -[PXStoryComposabilityScoresArray composabilityScoresAtIndex:](self, "composabilityScoresAtIndex:", i);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("(d:%0.2f|t:%0.2f)"), v5, v6);
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_opt_class();
  v10 = -[PXStoryComposabilityScoresArray count](self, "count");
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@:%p %lu scores: %@>"), v9, self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unint64_t)count
{
  return (self->_scores.__end_ - self->_scores.__begin_) >> 3;
}

- ($94F468A8D4C62B317260615823C2B210)composabilityScoresAtIndex:(unint64_t)a3
{
  float *v3;
  float v4;
  float v5;
  $94F468A8D4C62B317260615823C2B210 result;

  v3 = (float *)((char *)self->_scores.__begin_ + 8 * a3);
  v4 = *v3;
  v5 = v3[1];
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXStoryComposabilityScoresArray *v4;
  PXStoryComposabilityScoresArray *v5;

  v4 = +[PXStoryComposabilityScoresArray allocWithZone:](PXStoryComposabilityScoresArray, "allocWithZone:", a3);
  v5 = v4;
  if (v4 != self)
    std::vector<PXStoryAutoEditComposabilityScores>::__assign_with_size[abi:ne180100]<PXStoryAutoEditComposabilityScores*,PXStoryAutoEditComposabilityScores*>(&v4->_scores.__begin_, (char *)self->_scores.__begin_, (char *)self->_scores.__end_, (self->_scores.__end_ - self->_scores.__begin_) >> 3);
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PXStoryComposabilityScoresMutableArray *v4;
  PXStoryComposabilityScoresMutableArray *v5;

  v4 = +[PXStoryComposabilityScoresMutableArray allocWithZone:](PXStoryComposabilityScoresMutableArray, "allocWithZone:", a3);
  v5 = v4;
  if (v4 != (PXStoryComposabilityScoresMutableArray *)self)
    std::vector<PXStoryAutoEditComposabilityScores>::__assign_with_size[abi:ne180100]<PXStoryAutoEditComposabilityScores*,PXStoryAutoEditComposabilityScores*>(&v4->super._scores.__begin_, (char *)self->_scores.__begin_, (char *)self->_scores.__end_, (self->_scores.__end_ - self->_scores.__begin_) >> 3);
  return v5;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->_scores.__begin_;
  if (begin)
  {
    self->_scores.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
