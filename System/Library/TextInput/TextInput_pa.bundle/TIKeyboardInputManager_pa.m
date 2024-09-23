@implementation TIKeyboardInputManager_pa

- (void)initImplementation
{
  uint64_t v3;
  TIInputManager *v4;
  void *v5;
  const __CFLocale *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  std::__shared_weak_count *v18;
  std::__shared_weak_count *v19;

  v3 = (int)*MEMORY[0x24BEB5498];
  if (!*(Class *)((char *)&self->super.super.super.super.isa + v3))
  {
    v4 = (TIInputManager *)operator new();
    MEMORY[0x234902FD4]();
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locale");
    v6 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();
    v7 = (std::__shared_weak_count *)operator new(0x28uLL);
    v7->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    v7->__shared_weak_owners_ = 0;
    v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_25012B878;
    KB::InputManagerSpecialization::InputManagerSpecialization((KB::InputManagerSpecialization *)&v7[1], v6);
    v7[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_25012B8B0;

    v18 = v7 + 1;
    v19 = v7;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    TIInputManager::set_input_manager_specialization(v4, (uint64_t *)&v18);
    v10 = v19;
    if (v19)
    {
      v11 = (unint64_t *)&v19->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    *(Class *)((char *)&self->super.super.super.super.isa + v3) = v4;
    -[TIKeyboardInputManager_pa config](self, "config", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "usesContinuousPathRetrocorrection");

    if (v14)
    {
      v15 = (*(_QWORD **)((char *)&self->super.super.super.super.isa + v3))[23];
      if (v15)
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v15 + 392))(v15, 1);
    }
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return *(Class *)((char *)&self->super.super.super.super.isa + v3);
}

- (void)syncToLayoutState:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_pa;
  v4 = a3;
  -[TIKeyboardInputManagerIndic syncToLayoutState:](&v6, sel_syncToLayoutState_, v4);
  objc_msgSend(v4, "softwareLayout", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager_pa setIsPhoneticLayout:](self, "setIsPhoneticLayout:", objc_msgSend(v5, "isEqualToString:", CFSTR("Punjabi-Phonetic")));
}

- (id)deleteFromInput:(unint64_t *)a3
{
  uint64_t v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v11;
  const KB::String *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  KB *v16;
  NSString *v17;
  KB *v18;
  const __CFLocale *v19;
  const KB::String *v20;
  void *v21;
  void *v22;
  const KB::String *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _BYTE v28[32];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a3)
    *a3 = 1;
  v5 = (int)*MEMORY[0x24BEB5498];
  if (!*(Class *)((char *)&self->super.super.super.super.isa + v5))
    return 0;
  v6 = -[TIKeyboardInputManager_pa inputIndex](self, "inputIndex");
  if (*(Class *)((char *)&self->super.super.super.super.isa + v5))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7
    || (v8 = v6,
        v9 = (int)*MEMORY[0x24BEB5490],
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v9), "length") < (unint64_t)v6))
  {
    v27.receiver = self;
    v27.super_class = (Class)TIKeyboardInputManager_pa;
    -[TIKeyboardInputManager_pa deleteFromInput:](&v27, sel_deleteFromInput_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v8;
    TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
    KB::ns_string((KB *)v28, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_pa internalStringToExternal:](self, "internalStringToExternal:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    KB::String::~String((KB::String *)v28);
    if ((unint64_t)objc_msgSend(v14, "length") >= 2
      && (v15 = v8 - 2, v8 >= 2)
      && (objc_msgSend(v14, "characterAtIndex:", v15) == 2637
       || objc_msgSend(v14, "characterAtIndex:", v8 - 1) == 2620))
    {
      TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
      TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
      TIInputManager::delete_from_favonius_stroke_history(*(TIInputManager **)((char *)&self->super.super.super.super.isa
                                                                             + v5));
    }
    else if (-[TIKeyboardInputManager_pa isPhoneticLayout](self, "isPhoneticLayout", v15))
    {
      if ((unint64_t)objc_msgSend(v14, "length") >= 3
        && v8 >= 3
        && (objc_msgSend(v14, "characterAtIndex:", v8 - 2) == 2622
         || objc_msgSend(v14, "characterAtIndex:", v8 - 2) == 2566)
        && objc_msgSend(v14, "characterAtIndex:", v8 - 1) == 2562)
      {
        -[TIKeyboardInputManager_pa externalStringToInternal:](self, "externalStringToInternal:", CFSTR("ਾਂ"));
        v16 = (KB *)objc_claimAutoreleasedReturnValue();
        KB::utf8_string(v16, v17);
        TIInputManager::delete_suffix_from_input();
        KB::String::~String((KB::String *)v28);

      }
      else
      {
        TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
      }
    }
    else
    {
      v18 = (KB *)objc_msgSend(v14, "characterAtIndex:", v8 - 1);
      KB::lower_character(v18, 0, v19);
      TIInputManager::delete_suffix_from_input();
      KB::String::~String((KB::String *)v28);
    }
    TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
    KB::ns_string((KB *)v28, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_pa internalStringToExternal:](self, "internalStringToExternal:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    KB::String::~String((KB::String *)v28);
    TIInputManager::input_stem(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
    KB::ns_string((KB *)v28, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_pa internalStringToExternal:](self, "internalStringToExternal:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    KB::String::~String((KB::String *)v28);
    -[TIKeyboardInputManager_pa suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:](self, "suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:", v25, *(Class *)((char *)&self->super.super.super.super.isa + v9), v11, a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v9), "setString:", v22);
    if (!objc_msgSend(v26, "length"))
    {

      v26 = 0;
    }

    return v26;
  }
}

- (Class)scriptComposerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isPhoneticLayout
{
  return self->_isPhoneticLayout;
}

- (void)setIsPhoneticLayout:(BOOL)a3
{
  self->_isPhoneticLayout = a3;
}

@end
