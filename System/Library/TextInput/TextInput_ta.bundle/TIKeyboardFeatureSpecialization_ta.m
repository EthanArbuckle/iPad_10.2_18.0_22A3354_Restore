@implementation TIKeyboardFeatureSpecialization_ta

- (void)specializeInputManager:(void *)a3 forLayoutState:(id)a4
{
  void *v6;
  void *v7;
  const __CFLocale *v8;
  _QWORD *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  objc_msgSend(a4, "softwareLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardFeatureSpecialization_ta setQwertyLayout:](self, "setQwertyLayout:", objc_msgSend(v6, "isEqualToString:", CFSTR("QWERTY-Tamil")));

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locale");
  v8 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TIKeyboardFeatureSpecialization_ta isQwertyLayout](self, "isQwertyLayout");
  v9 = operator new(0x30uLL);
  v9[2] = 0;
  *v9 = &unk_25012C168;
  v9[1] = 0;
  v10 = KB::InputManagerSpecialization::InputManagerSpecialization((KB::InputManagerSpecialization *)(v9 + 3), v8);
  v9[3] = &unk_25012C1A0;
  *((_BYTE *)v9 + 40) = (_BYTE)self;
  v14 = v10;
  v15 = (std::__shared_weak_count *)v9;
  TIInputManager::set_input_manager_specialization((TIInputManager *)a3, &v14);
  v11 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

}

- (BOOL)doesComposeText
{
  return 1;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  return !-[TIKeyboardFeatureSpecialization_ta isQwertyLayout](self, "isQwertyLayout");
}

- (id)nonstopPunctuationCharacters
{
}

- (BOOL)allowsAutocorrectionOfValidWords
{
  return !-[TIKeyboardFeatureSpecialization_ta isQwertyLayout](self, "isQwertyLayout");
}

- (BOOL)isQwertyLayout
{
  return self->_qwertyLayout;
}

- (void)setQwertyLayout:(BOOL)a3
{
  self->_qwertyLayout = a3;
}

@end
