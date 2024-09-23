@implementation PKPhysicsFieldTurbulence

- (PKPhysicsFieldTurbulence)init
{
  PKPhysicsFieldTurbulence *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  objc_super v11;
  __int128 v12;
  __int128 v13;

  _ZNSt3__115allocate_sharedB8ne180100I18PKCFieldTurbulenceNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v12);
  v13 = v12;
  v12 = 0uLL;
  v11.receiver = self;
  v11.super_class = (Class)PKPhysicsFieldTurbulence;
  v3 = -[PKPhysicsFieldNoise initWithField:](&v11, sel_initWithField_, &v13);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
  if (*((_QWORD *)&v13 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
  if (*((_QWORD *)&v12 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return v3;
}

+ (id)field
{
  return objc_alloc_init(PKPhysicsFieldTurbulence);
}

@end
