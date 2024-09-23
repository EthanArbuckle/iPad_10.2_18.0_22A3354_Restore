@implementation URLSessionDelegate

- (void)addCallbackHandler:(shared_ptr<ctu:(int64_t)a4 :Http::HttpRequestCallbackHandler>)a3 for:
{
  __shared_weak_count *var1;
  HttpRequestCallbackHandler *var0;
  std::__shared_weak_count_vtbl *v7;
  std::__shared_weak_count_vtbl *v8;
  void (__cdecl *v9)(std::__shared_weak_count *__hidden);
  std::__shared_weak_count *v10;
  unint64_t *p_shared_weak_owners;
  unint64_t v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *v19;
  unint64_t v20;
  uint64_t *v21;
  void *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = (std::__shared_weak_count_vtbl *)operator new(0x30uLL);
  v8 = v7;
  v9 = *(void (__cdecl **)(std::__shared_weak_count *__hidden))var0;
  v10 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  if (v10)
  {
    p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
    do
      v12 = __ldxr(p_shared_weak_owners);
    while (__stxr(v12 + 1, p_shared_weak_owners));
    v7->~__shared_weak_count = v9;
    v7->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    do
      v13 = __ldxr(p_shared_weak_owners);
    while (__stxr(v13 + 1, p_shared_weak_owners));
  }
  else
  {
    v7->~__shared_weak_count = v9;
    v7->~__shared_weak_count_0 = 0;
  }
  v7->__on_zero_shared_weak = 0;
  v7[1].~__shared_weak_count = 0;
  v7->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))objc_opt_new();
  v8->__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))objc_opt_new();
  v14 = (std::__shared_weak_count *)operator new(0x20uLL);
  v14->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v14->__shared_owners_;
  v14->__vftable = (std::__shared_weak_count_vtbl *)off_1E2D30E38;
  v14->__shared_weak_owners_ = 0;
  v14[1].__vftable = v8;
  if (v10)
    std::__shared_weak_count::__release_weak(v10);
  do
    v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        v19 = left;
        v20 = (unint64_t)left[4].__value_.__left_;
        if (v20 <= (unint64_t)var1)
          break;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v19->__value_.__left_;
        p_pair1 = v19;
        if (!v19->__value_.__left_)
          goto LABEL_19;
      }
      if (v20 >= (unint64_t)var1)
        break;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v19[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v19 + 1;
        goto LABEL_19;
      }
    }
    v23 = (unint64_t *)&v14->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  else
  {
    v19 = &self->fTaskHandlers.__tree_.__pair1_;
LABEL_19:
    v21 = (uint64_t *)operator new(0x38uLL);
    v21[4] = (uint64_t)var1;
    v21[5] = (uint64_t)v8;
    v21[6] = (uint64_t)v14;
    *v21 = 0;
    v21[1] = 0;
    v21[2] = (uint64_t)v19;
    p_pair1->__value_.__left_ = v21;
    v22 = *(void **)self->fTaskHandlers.__tree_.__begin_node_;
    if (v22)
    {
      self->fTaskHandlers.__tree_.__begin_node_ = v22;
      v21 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_, v21);
    ++self->fTaskHandlers.__tree_.__pair3_.__value_;
  }
  if (v14)
  {
    v25 = (unint64_t *)&v14->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

- (void)removeCallbackFor:(int64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *p_pair1;
  char *v5;
  unint64_t v6;
  BOOL v7;
  char **v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *v14;
  int v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *v17;
  int left_low;
  void *v19;
  void *v20;
  _QWORD *v21;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *v22;
  uint64_t *v23;
  uint64_t v24;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> v25;
  _BYTE *v26;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *v27;
  _QWORD *v28;
  _BYTE *v29;
  uint64_t *v30;
  BOOL v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  if (!left)
    return;
  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  v5 = (char *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  do
  {
    v6 = *((_QWORD *)v5 + 4);
    v7 = v6 >= a3;
    if (v6 >= a3)
      v8 = (char **)v5;
    else
      v8 = (char **)(v5 + 8);
    if (v7)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v5;
    v5 = *v8;
  }
  while (*v8);
  if (p_pair1 == &self->fTaskHandlers.__tree_.__pair1_ || p_pair1[4].__value_.__left_ > (void *)a3)
    return;
  v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)p_pair1[1].__value_.__left_;
  if (v9)
  {
    do
    {
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v9;
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v9->__value_.__left_;
    }
    while (v9);
  }
  else
  {
    v11 = p_pair1;
    do
    {
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v11[2].__value_.__left_;
      v31 = *v10 == v11;
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v10;
    }
    while (!v31);
  }
  if (self->fTaskHandlers.__tree_.__begin_node_ == p_pair1)
    self->fTaskHandlers.__tree_.__begin_node_ = v10;
  --self->fTaskHandlers.__tree_.__pair3_.__value_;
  v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)p_pair1->__value_.__left_;
  v13 = p_pair1;
  if (p_pair1->__value_.__left_)
  {
    v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)p_pair1[1].__value_.__left_;
    if (!v14)
    {
      v13 = p_pair1;
      goto LABEL_27;
    }
    do
    {
      v13 = v14;
      v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v14->__value_.__left_;
    }
    while (v14);
  }
  v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v13[1].__value_.__left_;
  if (v12)
  {
LABEL_27:
    v15 = 0;
    v12[2].__value_.__left_ = v13[2].__value_.__left_;
    goto LABEL_28;
  }
  v15 = 1;
LABEL_28:
  v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v13[2].__value_.__left_;
  v17 = *v16;
  if (*v16 == v13)
  {
    *v16 = v12;
    if (v13 == left)
    {
      v17 = 0;
      left = v12;
    }
    else
    {
      v17 = v16[1];
    }
  }
  else
  {
    v16[1] = v12;
  }
  left_low = LOBYTE(v13[3].__value_.__left_);
  if (v13 != p_pair1)
  {
    v19 = p_pair1[2].__value_.__left_;
    v13[2].__value_.__left_ = v19;
    *((_QWORD *)v19 + (*(_QWORD *)p_pair1[2].__value_.__left_ != (_QWORD)p_pair1)) = v13;
    v21 = p_pair1->__value_.__left_;
    v20 = p_pair1[1].__value_.__left_;
    v21[2] = v13;
    v13->__value_.__left_ = v21;
    v13[1].__value_.__left_ = v20;
    if (v20)
      *((_QWORD *)v20 + 2) = v13;
    LOBYTE(v13[3].__value_.__left_) = p_pair1[3].__value_.__left_;
    if (left == p_pair1)
      left = v13;
  }
  if (!left_low || !left)
    goto LABEL_92;
  if (!v15)
  {
    LOBYTE(v12[3].__value_.__left_) = 1;
    goto LABEL_92;
  }
  while (1)
  {
    v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_;
    if (v22->__value_.__left_ != v17)
      break;
    if (!LOBYTE(v17[3].__value_.__left_))
    {
      LOBYTE(v17[3].__value_.__left_) = 1;
      LOBYTE(v22[3].__value_.__left_) = 0;
      v28 = v17[1].__value_.__left_;
      v22->__value_.__left_ = v28;
      if (v28)
        v28[2] = v22;
      v17[2].__value_.__left_ = v22[2].__value_.__left_;
      *((_QWORD *)v22[2].__value_.__left_ + (*(_QWORD *)v22[2].__value_.__left_ != (_QWORD)v22)) = v17;
      v17[1].__value_.__left_ = v22;
      v22[2].__value_.__left_ = v17;
      if (left == v22)
        left = v17;
      v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v22->__value_.__left_;
    }
    v29 = v17->__value_.__left_;
    if (v17->__value_.__left_ && !v29[24])
      goto LABEL_87;
    v30 = (uint64_t *)v17[1].__value_.__left_;
    if (v30 && !*((_BYTE *)v30 + 24))
    {
      if (v29 && !v29[24])
      {
LABEL_87:
        v30 = (uint64_t *)v17;
      }
      else
      {
        *((_BYTE *)v30 + 24) = 1;
        LOBYTE(v17[3].__value_.__left_) = 0;
        v36 = *v30;
        v17[1].__value_.__left_ = (void *)*v30;
        if (v36)
          *(_QWORD *)(v36 + 16) = v17;
        v30[2] = (uint64_t)v17[2].__value_.__left_;
        *((_QWORD *)v17[2].__value_.__left_ + (*(_QWORD *)v17[2].__value_.__left_ != (_QWORD)v17)) = v30;
        *v30 = (uint64_t)v17;
        v17[2].__value_.__left_ = v30;
        v29 = v17;
      }
      v33 = v30[2];
      *((_BYTE *)v30 + 24) = *(_BYTE *)(v33 + 24);
      *(_BYTE *)(v33 + 24) = 1;
      v29[24] = 1;
      v34 = *(uint64_t **)v33;
      v37 = *(_QWORD *)(*(_QWORD *)v33 + 8);
      *(_QWORD *)v33 = v37;
      if (v37)
        *(_QWORD *)(v37 + 16) = v33;
      v34[2] = *(_QWORD *)(v33 + 16);
      *(_QWORD *)(*(_QWORD *)(v33 + 16) + 8 * (**(_QWORD **)(v33 + 16) != v33)) = v34;
      v34[1] = v33;
      goto LABEL_91;
    }
    LOBYTE(v17[3].__value_.__left_) = 0;
    v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_;
    if (LOBYTE(v27[3].__value_.__left_))
      v31 = v27 == left;
    else
      v31 = 1;
    if (v31)
      goto LABEL_72;
LABEL_69:
    v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)*((_QWORD *)v27[2].__value_.__left_ + (*(_QWORD *)v27[2].__value_.__left_ == (_QWORD)v27));
  }
  if (!LOBYTE(v17[3].__value_.__left_))
  {
    LOBYTE(v17[3].__value_.__left_) = 1;
    LOBYTE(v22[3].__value_.__left_) = 0;
    v23 = (uint64_t *)v22[1].__value_.__left_;
    v24 = *v23;
    v22[1].__value_.__left_ = (void *)*v23;
    if (v24)
      *(_QWORD *)(v24 + 16) = v22;
    v23[2] = (uint64_t)v22[2].__value_.__left_;
    *((_QWORD *)v22[2].__value_.__left_ + (*(_QWORD *)v22[2].__value_.__left_ != (_QWORD)v22)) = v23;
    *v23 = (uint64_t)v22;
    v22[2].__value_.__left_ = v23;
    if (left == v17->__value_.__left_)
      left = v17;
    v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)*((_QWORD *)v17->__value_.__left_ + 1);
  }
  v25.__value_.__left_ = v17->__value_.__left_;
  if (!v17->__value_.__left_ || *((_BYTE *)v25.__value_.__left_ + 24))
  {
    v26 = v17[1].__value_.__left_;
    if (v26 && !v26[24])
      goto LABEL_78;
    LOBYTE(v17[3].__value_.__left_) = 0;
    v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_;
    if (v27 == left)
    {
      v27 = left;
LABEL_72:
      LOBYTE(v27[3].__value_.__left_) = 1;
      goto LABEL_92;
    }
    if (!LOBYTE(v27[3].__value_.__left_))
      goto LABEL_72;
    goto LABEL_69;
  }
  v26 = v17[1].__value_.__left_;
  if (v26 && !v26[24])
  {
LABEL_78:
    v25.__value_.__left_ = v17;
  }
  else
  {
    *((_BYTE *)v25.__value_.__left_ + 24) = 1;
    LOBYTE(v17[3].__value_.__left_) = 0;
    v32 = (_QWORD *)*((_QWORD *)v25.__value_.__left_ + 1);
    v17->__value_.__left_ = v32;
    if (v32)
      v32[2] = v17;
    *((__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v25.__value_.__left_
    + 2) = v17[2];
    *((__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_
    + (*(_QWORD *)v17[2].__value_.__left_ != (_QWORD)v17)) = v25;
    *((_QWORD *)v25.__value_.__left_ + 1) = v17;
    v17[2].__value_.__left_ = v25.__value_.__left_;
    v26 = v17;
  }
  v33 = *((_QWORD *)v25.__value_.__left_ + 2);
  *((_BYTE *)v25.__value_.__left_ + 24) = *(_BYTE *)(v33 + 24);
  *(_BYTE *)(v33 + 24) = 1;
  v26[24] = 1;
  v34 = *(uint64_t **)(v33 + 8);
  v35 = *v34;
  *(_QWORD *)(v33 + 8) = *v34;
  if (v35)
    *(_QWORD *)(v35 + 16) = v33;
  v34[2] = *(_QWORD *)(v33 + 16);
  *(_QWORD *)(*(_QWORD *)(v33 + 16) + 8 * (**(_QWORD **)(v33 + 16) != v33)) = v34;
  *v34 = v33;
LABEL_91:
  *(_QWORD *)(v33 + 16) = v34;
LABEL_92:
  std::shared_ptr<xpc::object>::~shared_ptr[abi:ne180100]((uint64_t)&p_pair1[5]);
  operator delete(p_pair1);
}

- (void)dealloc
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *p_pair1;
  objc_super v4;

  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  std::__tree<std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>>>::destroy((_QWORD *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_);
  self->fTaskHandlers.__tree_.__begin_node_ = p_pair1;
  self->fTaskHandlers.__tree_.__pair3_.__value_ = 0;
  p_pair1->__value_.__left_ = 0;
  v4.receiver = self;
  v4.super_class = (Class)URLSessionDelegate;
  -[URLSessionDelegate dealloc](&v4, sel_dealloc);
}

- (shared_ptr<SessionTaskContext>)getContext:(int64_t)a3
{
  _QWORD *v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *v7;
  unint64_t v8;
  BOOL v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **v10;
  char *v11;
  void *v12;
  unint64_t *v13;
  unint64_t v14;
  shared_ptr<SessionTaskContext> result;

  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  v5 = left;
  if (!left)
    goto LABEL_12;
  v7 = p_pair1;
  do
  {
    v8 = (unint64_t)v5[4].__value_.__left_;
    v9 = v8 >= a3;
    if (v8 >= a3)
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v5;
    else
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)&v5[1];
    if (v9)
      v7 = v5;
    v5 = *v10;
  }
  while (*v10);
  if (v7 != p_pair1 && v7[4].__value_.__left_ <= (void *)a3)
  {
    v12 = v7[5].__value_.__left_;
    v11 = (char *)v7[6].__value_.__left_;
    *v3 = v12;
    v3[1] = v11;
    if (v11)
    {
      v13 = (unint64_t *)(v11 + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
  }
  else
  {
LABEL_12:
    *v3 = 0;
    v3[1] = 0;
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (SessionTaskContext *)p_pair1;
  return result;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v10;
  ctu::Http::HttpResponseConcrete *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;

  v14 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  v10 = objc_msgSend(a4, "taskIdentifier", a3);
  if (self)
  {
    -[URLSessionDelegate getContext:](self, "getContext:", v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (ctu::Http::HttpResponseConcrete *)operator new(0x68uLL);
      ctu::Http::HttpResponseConcrete::HttpResponseConcrete(v11, (NSHTTPURLResponse *)a5);
      *((_WORD *)v11 + 48) = objc_msgSend(a4, "_TLSNegotiatedCipherSuite");
      std::shared_ptr<ctu::Http::HttpResponse>::reset[abi:ne180100]<ctu::Http::HttpResponseConcrete,void>((_QWORD *)0xAAAAAAAAAAAAAACALL, (uint64_t)v11);
    }
  }
  else
  {
    v14 = 0;
  }
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  _QWORD *v11;
  const void *v12;
  _QWORD *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  _DWORD *v18;
  const void **v19;
  const void **v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  int v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t *p_shared_owners;
  unint64_t v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  const void **v40;
  unint64_t v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  _QWORD *v44;
  unint64_t v45;
  id v46;

  v44 = (_QWORD *)0xAAAAAAAAAAAAAAAALL;
  v45 = 0xAAAAAAAAAAAAAAAALL;
  v7 = objc_msgSend(a4, "taskIdentifier", a3);
  if (!self)
  {
    v44 = 0;
    v45 = 0;
    goto LABEL_9;
  }
  -[URLSessionDelegate getContext:](self, "getContext:", v7);
  v8 = (std::__shared_weak_count *)v44[1];
  if (!v8)
    goto LABEL_9;
  v9 = std::__shared_weak_count::lock(v8);
  v43 = v9;
  if (!v9)
    goto LABEL_9;
  v10 = *v44;
  v42 = v10;
  if (!v10)
  {
    v17 = v9;
LABEL_43:
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v37 = __ldaxr(p_shared_owners);
    while (__stlxr(v37 - 1, p_shared_owners));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
    goto LABEL_9;
  }
  v11 = v44;
  v13 = v44 + 4;
  v12 = (const void *)v44[4];
  if (v12)
  {
    v41 = 0xAAAAAAAAAAAAAAAALL;
  }
  else
  {
    v18 = operator new(0x68uLL);
    *(_QWORD *)v18 = off_1E2D2F9B8;
    v18[2] = 0;
    *((_QWORD *)v18 + 4) = 0;
    *((_QWORD *)v18 + 3) = 0;
    *((_QWORD *)v18 + 2) = v18 + 6;
    v18[10] = -1;
    *((_OWORD *)v18 + 3) = 0u;
    *((_OWORD *)v18 + 4) = 0u;
    *((_OWORD *)v18 + 5) = 0u;
    *((_WORD *)v18 + 48) = -1;
    std::shared_ptr<ctu::Http::HttpResponse>::reset[abi:ne180100]<ctu::Http::HttpResponseConcrete,void>(v13, (uint64_t)v18);
    v11 = v44;
    v12 = (const void *)v44[4];
    if (!v12)
    {
LABEL_25:
      v40 = 0;
      v41 = 0;
      goto LABEL_29;
    }
  }
  if (!v19)
    goto LABEL_25;
  v20 = v19;
  v21 = v11[5];
  v40 = v19;
  v41 = v21;
  if (v21)
  {
    v22 = (unint64_t *)(v21 + 8);
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  if (a5)
  {
    v24 = (void *)objc_msgSend(a5, "domain");
    if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0CB32E8])
      && (v25 = objc_msgSend(a5, "code"), (unint64_t)(v25 + 1009) <= 9))
    {
      v26 = *((_DWORD *)&unk_190DA40D8 + v25 + 1009);
    }
    else
    {
      v26 = 0;
    }
    *((_DWORD *)v20 + 2) = v26;
    v20[6] = (const void *)objc_msgSend(a5, "code");
    v46 = a5;
    ctu::cf::CFSharedRef<__CFError>::operator=(v20 + 11, (CFTypeRef *)&v46);
  }
  else
  {
    v46 = (id)v11[2];
    ctu::cf::CFSharedRef<__CFData const>::operator=(v19 + 10, (CFTypeRef *)&v46);
    *((_DWORD *)v20 + 2) = 1;
  }
LABEL_29:
  v27 = (std::__shared_weak_count *)v44[5];
  v38 = v44[4];
  v39 = v27;
  if (v27)
  {
    v28 = (unint64_t *)&v27->__shared_owners_;
    do
      v29 = __ldxr(v28);
    while (__stxr(v29 + 1, v28));
  }
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v10 + 16))(v10, &v38);
  v30 = v39;
  if (v39)
  {
    v31 = (unint64_t *)&v39->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  v33 = (std::__shared_weak_count *)v41;
  if (v41)
  {
    v34 = (unint64_t *)(v41 + 8);
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v17 = v43;
  if (v43)
    goto LABEL_43;
LABEL_9:
  v14 = (std::__shared_weak_count *)v45;
  if (v45)
  {
    v15 = (unint64_t *)(v45 + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;

  v14 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  v7 = objc_msgSend(a4, "taskIdentifier", a3);
  if (self)
  {
    -[URLSessionDelegate getContext:](self, "getContext:", v7);
    if (a5)
    {
      objc_msgSend(MEMORY[0xAAAAAAAAAAAAAABA], "appendData:", a5);
      if (MEMORY[0xAAAAAAAAAAAAAAB2])
      {
        v8 = std::__shared_weak_count::lock(MEMORY[0xAAAAAAAAAAAAAAB2]);
        if (v8)
        {
          v9 = v8;
          if (MEMORY[0xAAAAAAAAAAAAAAAA])
            (*(void (**)(_QWORD, uint64_t, uint64_t))(*MEMORY[0xAAAAAAAAAAAAAAAA] + 32))(MEMORY[0xAAAAAAAAAAAAAAAA], objc_msgSend(a5, "length", MEMORY[0xAAAAAAAAAAAAAAAA], v8), objc_msgSend(MEMORY[0xAAAAAAAAAAAAAABA], "length"));
          p_shared_owners = (unint64_t *)&v9->__shared_owners_;
          do
            v11 = __ldaxr(p_shared_owners);
          while (__stlxr(v11 - 1, p_shared_owners));
          if (!v11)
          {
            ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
            std::__shared_weak_count::__release_weak(v9);
          }
        }
      }
    }
  }
  else
  {
    v14 = 0;
  }
  if (v14)
  {
    v12 = (unint64_t *)&v14->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  uint64_t v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;

  v18 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  v11 = objc_msgSend(a4, "taskIdentifier", a3);
  if (self)
  {
    -[URLSessionDelegate getContext:](self, "getContext:", v11);
    if (MEMORY[0xAAAAAAAAAAAAAAB2])
    {
      v12 = std::__shared_weak_count::lock(MEMORY[0xAAAAAAAAAAAAAAB2]);
      if (v12)
      {
        v13 = v12;
        if (MEMORY[0xAAAAAAAAAAAAAAAA])
          (*(void (**)(_QWORD, int64_t, int64_t, int64_t))(*MEMORY[0xAAAAAAAAAAAAAAAA]
                                                                                         + 40))(MEMORY[0xAAAAAAAAAAAAAAAA], a5, a6, a7);
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
    }
  }
  else
  {
    v18 = 0;
  }
  if (v18)
  {
    v16 = (unint64_t *)&v18->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v9;
  void *v10;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  const void *Value;
  CFTypeID TypeID;
  uint64_t v18;
  std::__shared_weak_count *v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  CFIndex Count;
  __SecTrust *v24;
  OSStatus v25;
  int v26;
  NSObject *v27;
  const char *v28;
  uint32_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  unint64_t *v35;
  int v36;
  CFArrayRef theArray;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t *v40;
  unint64_t v41;
  CFDictionaryRef theDict[2];

  theDict[1] = *(CFDictionaryRef *)MEMORY[0x1E0C80C00];
  v40 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v41 = 0xAAAAAAAAAAAAAAAALL;
  v9 = objc_msgSend(a4, "taskIdentifier", a3);
  if (!self)
  {
    Value = 0;
    v40 = 0;
    v41 = 0;
LABEL_29:
    v18 = 1;
    goto LABEL_30;
  }
  -[URLSessionDelegate getContext:](self, "getContext:", v9);
  v10 = (void *)objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "authenticationMethod");
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB32A8]))
  {
    v11 = (std::__shared_weak_count *)v40[1];
    if (v11)
    {
      v12 = std::__shared_weak_count::lock(v11);
      v39 = v12;
      if (v12)
      {
        v13 = v12;
        v14 = *v40;
        v38 = v14;
        if (!v14)
        {
          Value = 0;
          v18 = 1;
          goto LABEL_40;
        }
        theDict[0] = (CFDictionaryRef)0xAAAAAAAAAAAAAAAALL;
        (*(void (**)(CFDictionaryRef *__return_ptr))(*(_QWORD *)v14 + 48))(theDict);
        v15 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
        if (!theDict[0])
          v15 = 0;
        if (v15)
        {
          Value = CFDictionaryGetValue(theDict[0], (const void *)*MEMORY[0x1E0CD6D60]);
          if (!Value)
          {
LABEL_38:
            v18 = 1;
            goto LABEL_39;
          }
          TypeID = SecIdentityGetTypeID();
          if (TypeID == CFGetTypeID(Value))
          {
            Value = (const void *)objc_msgSend(MEMORY[0x1E0CB39A8], "credentialWithIdentity:certificates:persistence:", Value, 0, 0);
            v18 = 0;
LABEL_39:
            ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)theDict);
LABEL_40:
            p_shared_owners = (unint64_t *)&v13->__shared_owners_;
            do
              v34 = __ldaxr(p_shared_owners);
            while (__stlxr(v34 - 1, p_shared_owners));
            goto LABEL_48;
          }
        }
        Value = 0;
        goto LABEL_38;
      }
    }
    goto LABEL_28;
  }
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB32C8])
    || (v19 = (std::__shared_weak_count *)v40[1]) == 0
    || (v20 = std::__shared_weak_count::lock(v19), (v39 = v20) == 0))
  {
LABEL_28:
    Value = 0;
    goto LABEL_29;
  }
  v13 = v20;
  v21 = *v40;
  v38 = v21;
  if (!v21)
    goto LABEL_45;
  (*(void (**)(CFDictionaryRef *__return_ptr, uint64_t))(*(_QWORD *)v21 + 56))(theDict, v21);
  if (theDict[0])
    v22 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
  else
    v22 = 0;
  if (!v22)
  {
    ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)theDict);
    goto LABEL_45;
  }
  (*(void (**)(CFArrayRef *__return_ptr, uint64_t))(*(_QWORD *)v21 + 56))(&theArray, v21);
  Count = CFArrayGetCount(theArray);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)theDict);
  if (!Count)
  {
LABEL_45:
    Value = 0;
    v18 = 1;
    goto LABEL_46;
  }
  v24 = (__SecTrust *)objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "serverTrust");
  if (((*(uint64_t (**)(uint64_t, __SecTrust *))(*(_QWORD *)v21 + 64))(v21, v24) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(theDict[0]) = 0;
      v27 = MEMORY[0x1E0C81028];
      v28 = "DEBUG: Failed to validate certs.";
      v29 = 2;
      goto LABEL_54;
    }
    goto LABEL_45;
  }
  (*(void (**)(CFDictionaryRef *__return_ptr, uint64_t))(*(_QWORD *)v21 + 56))(theDict, v21);
  v25 = SecTrustSetAnchorCertificates(v24, theDict[0]);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)theDict);
  if (v25)
    goto LABEL_45;
  LODWORD(theArray) = -1431655766;
  v26 = MEMORY[0x194019714](v24, &theArray);
  if (v26)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(theDict[0]) = 67109120;
      HIDWORD(theDict[0]) = v26;
      v27 = MEMORY[0x1E0C81028];
      v28 = "Server pinned certs' trust evaluation failed due to STATUS code: %d";
LABEL_27:
      v29 = 8;
LABEL_54:
      _os_log_debug_impl(&dword_190D2F000, v27, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)theDict, v29);
      goto LABEL_45;
    }
    goto LABEL_45;
  }
  v36 = (int)theArray;
  if ((_DWORD)theArray != 4 && (_DWORD)theArray != 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_45;
    LODWORD(theDict[0]) = 67109120;
    HIDWORD(theDict[0]) = v36;
    v27 = MEMORY[0x1E0C81028];
    v28 = "DEBUG: Server pinned certs' trust evaluation failed due to RESULT code: %u";
    goto LABEL_27;
  }
  Value = (const void *)objc_msgSend(MEMORY[0x1E0CB39A8], "credentialForTrust:", objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "serverTrust"));
  v18 = 0;
LABEL_46:
  v35 = (unint64_t *)&v13->__shared_owners_;
  do
    v34 = __ldaxr(v35);
  while (__stlxr(v34 - 1, v35));
LABEL_48:
  if (!v34)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
LABEL_30:
  (*((void (**)(id, uint64_t, const void *))a6 + 2))(a6, v18, Value);
  v30 = (std::__shared_weak_count *)v41;
  if (v41)
  {
    v31 = (unint64_t *)(v41 + 8);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;

  v19 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  v11 = objc_msgSend(a4, "taskIdentifier", a3);
  if (self)
  {
    -[URLSessionDelegate getContext:](self, "getContext:", v11);
    if (MEMORY[0xAAAAAAAAAAAAAAB2] && (v12 = std::__shared_weak_count::lock(MEMORY[0xAAAAAAAAAAAAAAB2])) != 0)
    {
      v13 = v12;
      if (MEMORY[0xAAAAAAAAAAAAAAAA])
        v14 = (*(uint64_t (**)(_QWORD, id, id))(*MEMORY[0xAAAAAAAAAAAAAAAA] + 24))(MEMORY[0xAAAAAAAAAAAAAAAA], a6, a5);
      else
        v14 = 0;
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    v19 = 0;
  }
  (*((void (**)(id, uint64_t))a7 + 2))(a7, v14);
  if (v19)
  {
    v17 = (unint64_t *)&v19->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>>>::destroy((_QWORD *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

@end
