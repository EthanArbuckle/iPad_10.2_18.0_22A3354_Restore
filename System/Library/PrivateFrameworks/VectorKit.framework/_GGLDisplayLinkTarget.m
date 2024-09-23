@implementation _GGLDisplayLinkTarget

- (void)displayLinkFired:(id)a3
{
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  _RunLoopCallbacker *ptr;
  unint64_t *p_shared_owners;
  unint64_t v9;
  id v10;

  v10 = a3;
  cntrl = self->_callbacker.__cntrl_;
  if (cntrl)
  {
    v5 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v5)
    {
      v6 = v5;
      ptr = self->_callbacker.__ptr_;
      if (ptr)
      {
        objc_msgSend(v10, "targetTimestamp");
        (*(void (**)(_QWORD))(**(_QWORD **)ptr + 40))(*(_QWORD *)ptr);
        (*(void (**)(_QWORD))(**(_QWORD **)ptr + 24))(*(_QWORD *)ptr);
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (_GGLDisplayLinkTarget)initWithCallbacker:(weak_ptr<ggl::RunLoop::_RunLoopCallbacker>)a3
{
  _RunLoopCallbacker *ptr;
  _GGLDisplayLinkTarget *v4;
  _GGLDisplayLinkTarget *v5;
  uint64_t v6;
  _RunLoopCallbacker *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *cntrl;
  _GGLDisplayLinkTarget *v11;
  objc_super v13;

  ptr = a3.__ptr_;
  v13.receiver = self;
  v13.super_class = (Class)_GGLDisplayLinkTarget;
  v4 = -[_GGLDisplayLinkTarget init](&v13, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
  {
    v7 = *(_RunLoopCallbacker **)ptr;
    v6 = *((_QWORD *)ptr + 1);
    if (v6)
    {
      v8 = (unint64_t *)(v6 + 16);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    cntrl = (std::__shared_weak_count *)v4->_callbacker.__cntrl_;
    v5->_callbacker.__ptr_ = v7;
    v5->_callbacker.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
      std::__shared_weak_count::__release_weak(cntrl);
    v11 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;

  cntrl = self->_callbacker.__cntrl_;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
}

@end
