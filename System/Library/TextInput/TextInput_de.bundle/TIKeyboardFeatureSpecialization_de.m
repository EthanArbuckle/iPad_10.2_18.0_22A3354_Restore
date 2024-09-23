@implementation TIKeyboardFeatureSpecialization_de

- (void)createInputManager
{
  TIInputManager *v3;
  void *v4;
  const __CFLocale *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  std::__shared_weak_count *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TIKeyboardFeatureSpecialization_de;
  v3 = -[TIKeyboardQuickTypeSpecialization createInputManager](&v16, sel_createInputManager);
  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v5 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();

  v6 = (std::__shared_weak_count *)operator new(0x30uLL);
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_25011FE80;
  v14 = KB::InputManagerSpecialization_de::InputManagerSpecialization_de((KB::InputManagerSpecialization_de *)&v6[1], v5);
  v15 = v6;
  do
    v8 = __ldxr(p_shared_owners);
  while (__stxr(v8 + 1, p_shared_owners));
  TIInputManager::set_input_manager_specialization(v3, &v14);
  v9 = v15;
  if (v15)
  {
    v10 = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }

  return v3;
}

- (BOOL)shouldLearnLowercaseAtBeginningOfSentence
{
  return 0;
}

- (id)externalStringToInternal:(id)a3
{
  KB *v4;
  NSString *v5;
  const KB::String *v6;
  void *v7;
  _QWORD *__p;
  _BYTE v10[32];
  _BYTE v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (KB *)a3;
  __p = operator new(8uLL);
  *__p = 0x2CB000000B4;
  KB::utf8_string(v4, v5);

  -[TIKeyboardFeatureSpecialization precomposedCharacterSet](self, "precomposedCharacterSet");
  KB::decompose_diacritics();
  KB::ns_string((KB *)v11, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v11);
  KB::String::~String((KB::String *)v10);
  if (__p)
    operator delete(__p);
  return v7;
}

- (id)internalStringToExternal:(id)a3
{
  const KB::String *v4;
  void *v5;
  _BYTE v7[32];
  _BYTE v8[32];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  KB::utf8_string((KB *)a3, (NSString *)a2);
  -[TIKeyboardFeatureSpecialization precomposedCharacterSet](self, "precomposedCharacterSet");
  KB::compose_diacritics();
  KB::ns_string((KB *)v8, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v7);
  return v5;
}

@end
