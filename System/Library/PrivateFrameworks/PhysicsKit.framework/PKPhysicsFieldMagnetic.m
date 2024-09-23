@implementation PKPhysicsFieldMagnetic

- (PKPhysicsFieldMagnetic)init
{
  PKPhysicsFieldMagnetic *v2;
  PKPhysicsFieldMagnetic *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9[3];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPhysicsFieldMagnetic;
  v2 = -[PKPhysicsField init](&v10, sel_init);
  _ZNSt3__115allocate_sharedB8ne180100I16PKCFieldMagneticNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v8);
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

+ (id)field
{
  return objc_alloc_init(PKPhysicsFieldMagnetic);
}

@end
