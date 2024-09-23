@implementation CRCHNetworkCursor

- (void)addEdgeIndex:(unint64_t)a3
{
  __compressed_pair<unsigned long *, std::allocator<unsigned long>> *p_end_cap;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v8;
  unint64_t *begin;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t *v15;
  unint64_t *v16;
  unint64_t v17;

  p_end_cap = &self->_edgeIndexes.__end_cap_;
  value = self->_edgeIndexes.__end_cap_.__value_;
  end = self->_edgeIndexes.__end_;
  if (end >= value)
  {
    begin = self->_edgeIndexes.__begin_;
    v10 = end - begin;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v11 = (char *)value - (char *)begin;
    v12 = ((char *)value - (char *)begin) >> 2;
    if (v12 <= v10 + 1)
      v12 = v10 + 1;
    if (v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)p_end_cap, v13);
      begin = self->_edgeIndexes.__begin_;
      end = self->_edgeIndexes.__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = (unint64_t *)&v14[8 * v10];
    v16 = (unint64_t *)&v14[8 * v13];
    *v15 = a3;
    v8 = v15 + 1;
    while (end != begin)
    {
      v17 = *--end;
      *--v15 = v17;
    }
    self->_edgeIndexes.__begin_ = v15;
    self->_edgeIndexes.__end_ = v8;
    self->_edgeIndexes.__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = a3;
    v8 = end + 1;
  }
  self->_edgeIndexes.__end_ = v8;
}

- (unint64_t)edgeIndexCount
{
  return self->_edgeIndexes.__end_ - self->_edgeIndexes.__begin_;
}

- (unint64_t)edgeIndexAtPosition:(unint64_t)a3
{
  return self->_edgeIndexes.__begin_[a3];
}

- (void).cxx_destruct
{
  unint64_t *begin;

  begin = self->_edgeIndexes.__begin_;
  if (begin)
  {
    self->_edgeIndexes.__end_ = begin;
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
