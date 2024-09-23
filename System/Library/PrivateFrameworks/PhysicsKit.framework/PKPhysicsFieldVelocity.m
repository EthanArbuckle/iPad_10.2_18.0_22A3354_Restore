@implementation PKPhysicsFieldVelocity

- (PKPhysicsFieldVelocity)initWithGrid:(id)a3
{
  id v4;
  PKPhysicsFieldVelocity *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  __int128 v16;
  uint64_t v17[3];
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPhysicsFieldVelocity;
  v5 = -[PKPhysicsField init](&v18, sel_init);
  if (v5)
  {
    _ZNSt3__115allocate_sharedB8ne180100I16PKCFieldVelocityNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v16);
    v13 = v16;
    *(_OWORD *)v17 = v16;
    if (v4)
    {
      objc_msgSend(v4, "gridPtr");
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    PKCFieldVelocity::setGrid(v13, &v14);
    v6 = v15;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    std::shared_ptr<PKPath>::operator=[abi:ne180100](&v5->super._field.__ptr_, v17);
    v9 = (std::__shared_weak_count *)v17[1];
    if (v17[1])
    {
      v10 = (unint64_t *)(v17[1] + 8);
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

  return v5;
}

- (void)setGrid:(id)a3
{
  id v4;
  void *v5;
  PKCField *ptr;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v4 = a3;
  v5 = v4;
  ptr = self->super._field.__ptr_;
  if (ptr)
  {
    if (v4)
    {
      objc_msgSend(v4, "gridPtr");
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    PKCFieldVelocity::setGrid((uint64_t)ptr, &v10);
    v7 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }

}

+ (id)fieldWithGrid:(id)a3
{
  id v3;
  PKPhysicsFieldVelocity *v4;

  v3 = a3;
  v4 = -[PKPhysicsFieldVelocity initWithGrid:]([PKPhysicsFieldVelocity alloc], "initWithGrid:", v3);

  return v4;
}

@end
