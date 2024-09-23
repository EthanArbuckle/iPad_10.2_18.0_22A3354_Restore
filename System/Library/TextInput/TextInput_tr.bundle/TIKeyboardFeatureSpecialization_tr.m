@implementation TIKeyboardFeatureSpecialization_tr

- (void)createInputManager
{
  uint64_t v3;
  void *v4;
  const __CFLocale *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  uint64_t v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;

  v3 = operator new();
  MEMORY[0x2349038C0]();
  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v5 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();

  v6 = (std::__shared_weak_count *)operator new(0x28uLL);
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012D2D0;
  v8 = KB::InputManagerSpecialization::InputManagerSpecialization((KB::InputManagerSpecialization *)&v6[1], v5);
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_25012D308;
  v15 = v8;
  v16 = v6;
  do
    v9 = __ldxr(p_shared_owners);
  while (__stxr(v9 + 1, p_shared_owners));
  TIInputManager::set_input_manager_specialization((TIInputManager *)v3, &v15);
  v10 = v16;
  if (v16)
  {
    v11 = (unint64_t *)&v16->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  *(_DWORD *)(v3 + 584) = 0;
  *(_BYTE *)(v3 + 684) = -[TIKeyboardFeatureSpecialization useRelaxedOVSPolicy](self, "useRelaxedOVSPolicy", v15);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }

  return (void *)v3;
}

@end
