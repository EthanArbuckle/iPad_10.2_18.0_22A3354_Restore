@implementation _UIRTree

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allIndexes, 0);
  std::shared_ptr<_UIRTreeContainerNode<unsigned long>>::~shared_ptr[abi:nn180100]((uint64_t)&self->_root);
}

- (_QWORD)insertFrame:(CGFloat)a3 forIndex:(CGFloat)a4
{
  _QWORD *v7;
  int64x2_t *v8;
  std::__shared_weak_count *v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t v16;
  __n128 v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  std::__shared_weak_count *v38;
  __int128 v39;
  int64x2_t *v40;
  std::__shared_weak_count *v41;
  CGRect v42;

  if (result)
  {
    v7 = result;
    if (CGRectIsNull(*(CGRect *)&a3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel_insertFrame_forIndex_, v7, CFSTR("_UIRTree.mm"), 603, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CGRectIsNull(frame)"));

    }
    v42.origin.x = a3;
    v42.size.width = a5;
    v42.origin.y = a4;
    v42.size.height = a6;
    if (CGRectIsInfinite(v42))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel_insertFrame_forIndex_, v7, CFSTR("_UIRTree.mm"), 604, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CGRectIsInfinite(frame)"));

    }
    v8 = (int64x2_t *)v7[1];
    v9 = (std::__shared_weak_count *)v7[2];
    v11.f64[0] = a3;
    v10.f64[0] = a5;
    v11.f64[1] = a4;
    v10.f64[1] = a6;
    v12 = vaddq_f64(v11, vminnmq_f64(v10, (float64x2_t)0));
    v13 = vabsq_f64(v10);
    v38 = v9;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
      v40 = v8;
      v41 = v9;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }
    else
    {
      v40 = (int64x2_t *)v7[1];
      v41 = 0;
    }
    v17 = _UIRTreeContainerNode<unsigned long>::addChild(&v39, (uint64_t)v8, a2, &v40, v12, v13);
    v18 = v41;
    if (v41)
    {
      v19 = (unint64_t *)&v41->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v18->__on_zero_shared)(v18, v17);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    std::shared_ptr<_UIRTreeContainerNode<unsigned long>>::operator=[abi:nn180100]((uint64_t)(v7 + 1), &v39);
    v21 = (std::__shared_weak_count *)*((_QWORD *)&v39 + 1);
    if (*((_QWORD *)&v39 + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&v39 + 1) + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    if (v38)
    {
      v24 = (unint64_t *)&v38->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    result = (_QWORD *)v7[5];
    v26 = v7[3];
    if (result)
    {
      v27 = v7 + 4;
      v28 = v7[4];
      if (v28 + v26 != a2)
      {
LABEL_30:
        result = (_QWORD *)objc_msgSend(result, "addIndex:", a2);
        if (v7[3] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v7[3] = 0x7FFFFFFFFFFFFFFFLL;
          v7[4] = 0;
        }
        return result;
      }
    }
    else
    {
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7[3] = a2;
        v7[4] = 1;
        return result;
      }
      v27 = v7 + 4;
      v28 = v7[4];
      if (v28 + v26 != a2)
      {
        v29 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        v30 = (void *)v7[5];
        v7[5] = v29;

        v31 = v7[3];
        result = (_QWORD *)v7[5];
        if (v31 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(result, "addIndexesInRange:", v31, v7[4]);
          result = (_QWORD *)v7[5];
        }
        goto LABEL_30;
      }
    }
    *v27 = v28 + 1;
  }
  return result;
}

- (_UIRTree)init
{
  char *v2;
  char *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  void *v7;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIRTree;
  v2 = -[_UIRTree init](&v10, sel_init);
  if (v2)
  {
    v3 = (char *)operator new(0xB0uLL);
    *((_QWORD *)v3 + 1) = 0;
    *((_QWORD *)v3 + 2) = 0;
    *(_QWORD *)v3 = &off_1E168B670;
    *((_QWORD *)v3 + 4) = &off_1E168B618;
    *((_QWORD *)v3 + 5) = 0;
    *(_OWORD *)(v3 + 72) = 0u;
    *((_QWORD *)v3 + 6) = 0;
    *(_OWORD *)(v3 + 56) = 0u;
    *(_OWORD *)(v3 + 88) = 0u;
    *(_OWORD *)(v3 + 104) = 0u;
    *(_OWORD *)(v3 + 120) = 0u;
    *((_QWORD *)v3 + 17) = 0;
    _UIRTreeContainerNode<unsigned long>::commonInit((int64x2_t *)v3 + 2);
    *(_QWORD *)&v9 = v3 + 32;
    *((_QWORD *)&v9 + 1) = v3;
    std::shared_ptr<_UIRTreeContainerNode<unsigned long>>::__enable_weak_this[abi:nn180100]<_UIRTreeContainerNode<unsigned long>,_UIRTreeContainerNode<unsigned long>,void>((uint64_t)&v9, (_QWORD *)v3 + 5, (uint64_t)(v3 + 32));
    std::shared_ptr<_UIRTreeContainerNode<unsigned long>>::operator=[abi:nn180100]((uint64_t)(v2 + 8), &v9);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
    if (*((_QWORD *)&v9 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v7 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = 0;

    *(_OWORD *)(v2 + 24) = xmmword_186679030;
  }
  return (_UIRTree *)v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[4];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__33;
  v15 = __Block_byref_object_dispose__33;
  v16 = (id)objc_msgSend(CFSTR("{"), "mutableCopy");
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __23___UIRTree_description__block_invoke;
  v9[3] = &unk_1E16B93E8;
  v9[4] = v10;
  v9[5] = &v11;
  -[_UIRTree enumerateFramesWithBlock:]((uint64_t)self, (uint64_t)v9);
  objc_msgSend((id)v12[5], "appendString:", CFSTR("}"));
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRTree allIndexes]((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p indexes=%@; frames=%@>"), v5, self, v6, v12[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (uint64_t)enumerateFramesWithBlock:(uint64_t)result
{
  uint64_t v2;
  _QWORD v3[5];
  char v4;

  if (result)
  {
    v4 = 0;
    v2 = *(_QWORD *)(result + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __37___UIRTree_enumerateFramesWithBlock___block_invoke;
    v3[3] = &unk_1E16B9410;
    v3[4] = a2;
    return _UIRTreeContainerNode<unsigned long>::enumerate(v2, &v4, (uint64_t)v3);
  }
  return result;
}

- (id)allIndexes
{
  id *v1;
  id v2;

  if (a1)
  {
    v1 = a1;
    a1 = (id *)a1[5];
    if (!a1)
    {
      v2 = v1[3];
      if (v2 == (id)0x7FFFFFFFFFFFFFFFLL)
        return (id *)objc_alloc_init(MEMORY[0x1E0CB36B8]);
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v2, v1[4]);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (CGRect)_frameForIndex:(unint64_t)a3
{
  __int128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[6];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  __n128 (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)();
  void *v18;
  __int128 v19;
  __int128 v20;
  CGRect result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x5012000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__30;
  v18 = &unk_18685B0AF;
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v19 = *MEMORY[0x1E0C9D628];
  v20 = v3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __27___UIRTree__frameForIndex___block_invoke;
  v12[3] = &unk_1E16B9438;
  v12[4] = &v13;
  v12[5] = a3;
  -[_UIRTree enumerateFramesWithBlock:]((uint64_t)self, (uint64_t)v12);
  v4 = v14[6];
  v5 = v14[7];
  v6 = v14[8];
  v7 = v14[9];
  _Block_object_dispose(&v13, 8);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

@end
