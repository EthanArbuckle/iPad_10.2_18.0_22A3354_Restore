@implementation RETransformerInvocation

+ (id)invocationWithArguments:(unint64_t *)a3 count:(unint64_t)a4
{
  RETransformerInvocation *v6;
  uint64_t v7;

  v6 = objc_alloc_init(RETransformerInvocation);
  if (a4)
  {
    v7 = 0;
    do
    {
      -[RETransformerInvocation setArgument:atIndex:](v6, "setArgument:atIndex:", a3[v7], v7);
      ++v7;
    }
    while (a4 != v7);
  }
  return v6;
}

- (RETransformerInvocation)init
{
  RETransformerInvocation *v2;
  RETransformerInvocation *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RETransformerInvocation;
  v2 = -[RETransformerInvocation init](&v5, sel_init);
  v3 = v2;
  if (v2)
    std::vector<unsigned long>::resize((uint64_t)&v2->_values, 0);
  return v3;
}

- (void)dealloc
{
  unint64_t *i;
  unint64_t *begin;
  objc_super v5;

  begin = self->_values.__begin_;
  for (i = self->_values.__end_; begin != i; i = self->_values.__end_)
    REReleaseFeatureValueTaggedPointer((CFTypeRef)*begin++);
  v5.receiver = self;
  v5.super_class = (Class)RETransformerInvocation;
  -[RETransformerInvocation dealloc](&v5, sel_dealloc);
}

- (unint64_t)getArgumentAtIndex:(unint64_t)a3
{
  return self->_values.__begin_[a3];
}

- (void)setArgument:(unint64_t)a3 atIndex:(unint64_t)a4
{
  vector<unsigned long, std::allocator<unsigned long>> *p_values;

  p_values = &self->_values;
  if (a4 >= self->_values.__end_ - self->_values.__begin_)
    std::vector<unsigned long>::resize((uint64_t)&self->_values, a4 + 1);
  RERetainFeatureValueTaggedPointer((CFTypeRef)a3);
  REReleaseFeatureValueTaggedPointer((CFTypeRef)p_values->__begin_[a4]);
  p_values->__begin_[a4] = a3;
}

- (unint64_t)numberOfArguments
{
  return self->_values.__end_ - self->_values.__begin_;
}

- (void).cxx_destruct
{
  unint64_t *begin;

  begin = self->_values.__begin_;
  if (begin)
  {
    self->_values.__end_ = begin;
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
