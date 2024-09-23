@implementation PKPhysicsFieldLinearGravity

- (PKPhysicsFieldLinearGravity)init
{
  PKPhysicsFieldLinearGravity *v2;
  __n128 v3;
  PKPhysicsFieldLinearGravity *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v9;
  __n128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPhysicsFieldLinearGravity;
  v2 = -[PKPhysicsField init](&v11, sel_init);
  _ZNSt3__115allocate_sharedB8ne180100I21PKCFieldLinearGravityNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v9);
  v3 = (__n128)v9;
  v9 = xmmword_208FD6060;
  v10 = v3;
  PKCFieldLinearGravity::setGravity((__n128 *)v3.n128_u64[0], (__n128 *)&v9);
  std::shared_ptr<PKPath>::operator=[abi:ne180100](&v2->super._field.__ptr_, (uint64_t *)&v10);
  v4 = v2;
  v5 = (std::__shared_weak_count *)v10.n128_u64[1];
  if (v10.n128_u64[1])
  {
    v6 = (unint64_t *)(v10.n128_u64[1] + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  return v4;
}

+ (id)field
{
  return objc_alloc_init(PKPhysicsFieldLinearGravity);
}

- (double)direction
{
  uint64_t v1;
  __int128 v2;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
    v2 = *(_OWORD *)(v1 + 256);
  else
    *(_QWORD *)&v2 = 0;
  return *(double *)&v2;
}

- (void)setDirection:(PKPhysicsFieldLinearGravity *)self
{
  __n128 v2;
  PKCField *ptr;
  __n128 v4;

  v4 = v2;
  ptr = self->super._field.__ptr_;
  if (ptr)
    PKCFieldLinearGravity::setGravity((__n128 *)ptr, &v4);
}

@end
