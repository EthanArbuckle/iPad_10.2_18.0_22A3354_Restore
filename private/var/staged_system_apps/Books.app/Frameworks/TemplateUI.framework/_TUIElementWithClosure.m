@implementation _TUIElementWithClosure

- (_TUIElementWithClosure)initWithRef:(Ref<TUI:(void *)a4 :Evaluation::Variables::_NamedElement>)a3 context:
{
  unint64_t index;
  RefResolving *resolver;
  _TUIElementWithClosure *v6;
  _TUIElementWithClosure *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v13;
  __int128 v14;
  objc_super v15;

  index = a3._index;
  resolver = a3._resolver;
  v15.receiver = self;
  v15.super_class = (Class)_TUIElementWithClosure;
  v6 = -[_TUIElementWithClosure init](&v15, "init", a3._resolver, a3._index, a4);
  v7 = v6;
  if (v6)
  {
    v6->_ref._resolver = resolver;
    v6->_ref._index = index;
    v8 = (*(uint64_t (**)(RefResolving *, unint64_t))(*(_QWORD *)resolver + 72))(resolver, index);
    objc_storeStrong((id *)&v7->_element._parsedElement, *(id *)v8);
    v7->_element.var0.index = *(_DWORD *)(v8 + 8);
    (*(void (**)(uint64_t *__return_ptr, RefResolving *, unint64_t))(*(_QWORD *)resolver + 112))(&v13, resolver, index);
    v7->_closureAndCapture.first.index = v13;
    sub_255FC((uint64_t)&v7->_closureAndCapture.second, &v14);
    v9 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
    if (*((_QWORD *)&v14 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  return v7;
}

- (_TUIElementWithClosure)initWithParsedElement:(id)a3 closureAndCapture:()pair<TUIClosure
{
  id v7;
  _TUIElementWithClosure *v8;
  _TUIElementWithClosure *v9;
  int v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUIElementWithClosure;
  v8 = -[_TUIElementWithClosure init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    v10 = TUIElementNodeNil;
    objc_storeStrong((id *)&v8->_element._parsedElement, a3);
    v9->_element.var0.index = v10;
    v9->_closureAndCapture.first.index = a4->first.index;
    sub_26314(&v9->_closureAndCapture.second.__ptr_, (uint64_t *)&a4->second);
  }

  return v9;
}

- (id)parsedElement
{
  return self->_element._parsedElement;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)node
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_element.var0.index;
}

- (pair<TUIClosure,)closureAndCapture
{
  Capture *ptr;
  unint64_t *v4;
  unint64_t v5;

  retstr->first.index = self[1].second.__cntrl_;
  ptr = self[2].second.__ptr_;
  retstr->second.__ptr_ = *(Capture **)&self[2].first.index;
  retstr->second.__cntrl_ = (__shared_weak_count *)ptr;
  if (ptr)
  {
    v4 = (unint64_t *)((char *)ptr + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return self;
}

- (Ref<TUI::Evaluation::Variables::_NamedElement>)ref
{
  unint64_t index;
  RefResolving *resolver;
  Ref<TUI::Evaluation::Variables::_NamedElement> result;

  index = self->_ref._index;
  resolver = self->_ref._resolver;
  result._index = index;
  result._resolver = resolver;
  return result;
}

- (void).cxx_destruct
{
  sub_148E8((uint64_t)&self->_closureAndCapture.second);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_DWORD *)self + 4) = TUIElementNodeNil;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = -1;
  *((_DWORD *)self + 10) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
