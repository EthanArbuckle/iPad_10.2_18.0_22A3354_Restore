@implementation _UICollectionViewRTree

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (uint64_t)insertFrame:(CGFloat)a3 forElement:(CGFloat)a4
{
  uint64_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  int8x16_t v21;
  int8x16_t v22;
  uint64_t v23;
  int64x2_t **v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  std::__shared_weak_count *v28;
  int64x2_t *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  __n128 v32;
  __n128 v33;
  unint64_t *v34;
  unint64_t v35;
  __n128 v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v49;
  __int128 v50;
  __int128 v51;
  int64x2_t *v52;
  std::__shared_weak_count *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  CGRect v57;

  if (result)
  {
    v7 = result;
    if (CGRectIsNull(*(CGRect *)&a3))
      return 0;
    v57.origin.x = a3;
    v57.size.width = a5;
    v57.origin.y = a4;
    v57.size.height = a6;
    if (CGRectIsInfinite(v57))
    {
      return 0;
    }
    else
    {
      v9.f64[0] = a3;
      v8.f64[0] = a5;
      v9.f64[1] = a4;
      v8.f64[1] = a6;
      v10 = vaddq_f64(v9, vminnmq_f64(v8, (float64x2_t)0));
      __asm { FMOV            V2.2D, #6.0 }
      v16 = vmulq_f64(v10, _Q2);
      v17 = vmulq_f64(vabsq_f64(v8), _Q2);
      v18 = vrndaq_f64(v16);
      v19 = vrndaq_f64(v17);
      v20 = (float64x2_t)vdupq_n_s64(0x3F43A92A30553262uLL);
      v21 = (int8x16_t)vcgtq_f64(v20, vabdq_f64(v16, v18));
      v22 = (int8x16_t)vcgtq_f64(v20, vabdq_f64(v17, v19));
      v25 = *(_QWORD *)(v7 + 8);
      v24 = (int64x2_t **)(v7 + 8);
      v23 = v25;
      v26 = *(_QWORD *)a2;
      v50 = *(_OWORD *)(a2 + 8);
      v27 = *(_OWORD *)(a2 + 24);
      *(_QWORD *)(a2 + 24) = 0;
      *(_QWORD *)(a2 + 32) = 0;
      v29 = *v24;
      v28 = (std::__shared_weak_count *)v24[1];
      v49 = v28;
      if (v28)
      {
        p_shared_owners = (unint64_t *)&v28->__shared_owners_;
        do
          v31 = __ldxr(p_shared_owners);
        while (__stxr(v31 + 1, p_shared_owners));
      }
      v32 = (__n128)vbslq_s8(v21, (int8x16_t)v18, (int8x16_t)v16);
      v33 = (__n128)vbslq_s8(v22, (int8x16_t)v19, (int8x16_t)v17);
      v53 = v28;
      v54 = v26;
      v55 = v50;
      v56 = v27;
      v52 = v29;
      if (v28)
      {
        v34 = (unint64_t *)&v28->__shared_owners_;
        do
          v35 = __ldxr(v34);
        while (__stxr(v35 + 1, v34));
      }
      v36 = _UIRTreeContainerNode<_UICollectionViewRTreeElement>::addChild(&v51, v23, &v54, &v52, v32, v33);
      v37 = v53;
      if (v53)
      {
        v38 = (unint64_t *)&v53->__shared_owners_;
        do
          v39 = __ldaxr(v38);
        while (__stlxr(v39 - 1, v38));
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *, __n128))v37->__on_zero_shared)(v37, v36);
          std::__shared_weak_count::__release_weak(v37);
        }
      }

      std::shared_ptr<_UIRTreeContainerNode<unsigned long>>::operator=[abi:nn180100]((uint64_t)v24, &v51);
      v40 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
      if (*((_QWORD *)&v51 + 1))
      {
        v41 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
        do
          v42 = __ldaxr(v41);
        while (__stlxr(v42 - 1, v41));
        if (!v42)
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
      }
      if (v49)
      {
        v43 = (unint64_t *)&v49->__shared_owners_;
        do
          v44 = __ldaxr(v43);
        while (__stlxr(v44 - 1, v43));
        if (!v44)
        {
          ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
          std::__shared_weak_count::__release_weak(v49);
        }
      }
      return 1;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<_UIRTreeContainerNode<unsigned long>>::~shared_ptr[abi:nn180100]((uint64_t)&self->_root);
}

- (_UICollectionViewRTree)init
{
  _UICollectionViewRTree *v2;
  char *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UICollectionViewRTree;
  v2 = -[_UICollectionViewRTree init](&v9, sel_init);
  if (v2)
  {
    v3 = (char *)operator new(0xB0uLL);
    *((_QWORD *)v3 + 1) = 0;
    *((_QWORD *)v3 + 2) = 0;
    *((_QWORD *)v3 + 4) = &off_1E168B5F8;
    *((_QWORD *)v3 + 5) = 0;
    *(_QWORD *)v3 = &off_1E168B638;
    *((_QWORD *)v3 + 6) = 0;
    *(_OWORD *)(v3 + 72) = 0u;
    *(_OWORD *)(v3 + 56) = 0u;
    *(_OWORD *)(v3 + 88) = 0u;
    *(_OWORD *)(v3 + 104) = 0u;
    *(_OWORD *)(v3 + 120) = 0u;
    *((_QWORD *)v3 + 17) = 0;
    _UIRTreeContainerNode<_UICollectionViewRTreeElement>::commonInit((int64x2_t *)v3 + 2);
    *(_QWORD *)&v8 = v3 + 32;
    *((_QWORD *)&v8 + 1) = v3;
    std::shared_ptr<_UIRTreeContainerNode<unsigned long>>::__enable_weak_this[abi:nn180100]<_UIRTreeContainerNode<unsigned long>,_UIRTreeContainerNode<unsigned long>,void>((uint64_t)&v8, (_QWORD *)v3 + 5, (uint64_t)(v3 + 32));
    std::shared_ptr<_UIRTreeContainerNode<unsigned long>>::operator=[abi:nn180100]((uint64_t)&v2->_root, &v8);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
    if (*((_QWORD *)&v8 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  return v2;
}

- (void)removeAttributesWithFramesIntersectingFrame:(float64_t)a3
{
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  int64x2_t *v17;
  float64x2_t v18[2];

  if (a1)
  {
    a2.f64[1] = a3;
    a4.f64[1] = a5;
    v5 = vaddq_f64(a2, vminnmq_f64(a4, (float64x2_t)0));
    v6 = vabsq_f64(a4);
    __asm { FMOV            V2.2D, #6.0 }
    v12 = vmulq_f64(v5, _Q2);
    v13 = vmulq_f64(v6, _Q2);
    v14 = vrndaq_f64(v12);
    v15 = vrndaq_f64(v13);
    v16 = (float64x2_t)vdupq_n_s64(0x3F43A92A30553262uLL);
    v17 = *(int64x2_t **)(a1 + 8);
    v18[0] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v16, vabdq_f64(v12, v14)), (int8x16_t)v14, (int8x16_t)v12);
    v18[1] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v16, vabdq_f64(v13, v15)), (int8x16_t)v15, (int8x16_t)v13);
    _UIRTreeContainerNode<_UICollectionViewRTreeElement>::removeElementsIntersecting(v17, v18);
  }
}

@end
