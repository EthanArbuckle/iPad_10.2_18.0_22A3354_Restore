@implementation PKPhysicsFieldNoise

- (PKPhysicsFieldNoise)init
{
  PKPhysicsFieldNoise *v2;
  PKPhysicsFieldNoise *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9[3];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPhysicsFieldNoise;
  v2 = -[PKPhysicsField init](&v10, sel_init);
  _ZNSt3__115allocate_sharedB8ne180100I13PKCFieldNoiseNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v8);
  *(_OWORD *)v9 = v8;
  std::shared_ptr<PKPath>::operator=[abi:ne180100](&v2->super._field.__ptr_, v9);
  v3 = v2;
  v4 = (std::__shared_weak_count *)v9[1];
  if (v9[1])
  {
    v5 = (unint64_t *)(v9[1] + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  return v3;
}

- (PKPhysicsFieldNoise)initWithField:(shared_ptr<PKCField>)a3
{
  uint64_t *ptr;
  PKPhysicsFieldNoise *v4;
  objc_super v6;

  ptr = (uint64_t *)a3.__ptr_;
  v6.receiver = self;
  v6.super_class = (Class)PKPhysicsFieldNoise;
  v4 = -[PKPhysicsField init](&v6, sel_init, a3.__ptr_, a3.__cntrl_);
  std::shared_ptr<PKPath>::operator=[abi:ne180100](&v4->super._field.__ptr_, ptr);
  return v4;
}

+ (id)field
{
  return objc_alloc_init(PKPhysicsFieldNoise);
}

- (float)smoothness
{
  PKCField *ptr;

  ptr = self->super._field.__ptr_;
  if (ptr)
    return *((float *)ptr + 62);
  else
    return 1.0;
}

- (void)setSmoothness:(float)a3
{
  PKCField *ptr;

  ptr = self->super._field.__ptr_;
  if (ptr)
    *((float *)ptr + 62) = a3;
}

- (float)animationSpeed
{
  PKCField *ptr;

  ptr = self->super._field.__ptr_;
  if (ptr)
    return *((float *)ptr + 63);
  else
    return 1.0;
}

- (void)setAnimationSpeed:(float)a3
{
  PKCField *ptr;

  ptr = self->super._field.__ptr_;
  if (ptr)
    *((float *)ptr + 63) = a3;
}

@end
