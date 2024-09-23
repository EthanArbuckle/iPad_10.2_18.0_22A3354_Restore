@implementation TUIInstantiateContextSnapshot

- (TUIInstantiateContextSnapshot)initWithContextSnapshot:(shared_ptr<const TUI::Evaluation::Context::Snapshot>)a3
{
  uint64_t *ptr;
  TUIInstantiateContextSnapshot *v4;
  TUIInstantiateContextSnapshot *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)TUIInstantiateContextSnapshot;
  v4 = -[TUIInstantiateContextSnapshot init](&v7, "init", a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    sub_26314(&v4->_contextSnapshot.__ptr_, ptr);
  return v5;
}

- (shared_ptr<const)contextSnapshot
{
  Snapshot **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<const TUI::Evaluation::Context::Snapshot> result;

  cntrl = self->_contextSnapshot.__cntrl_;
  *v2 = self->_contextSnapshot.__ptr_;
  v2[1] = (Snapshot *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Snapshot *)self;
  return result;
}

- (void).cxx_destruct
{
  sub_148E8((uint64_t)&self->_contextSnapshot);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
