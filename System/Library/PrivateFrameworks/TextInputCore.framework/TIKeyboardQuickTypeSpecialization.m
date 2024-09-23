@implementation TIKeyboardQuickTypeSpecialization

- (BOOL)doesComposeText
{
  return 1;
}

- (void)createInputManager
{
  uint64_t v3;
  void *v4;
  id v5;
  int v6;

  v3 = operator new();
  TIInputManager::TIInputManager((TIInputManager *)v3);
  -[TIKeyboardFeatureSpecialization dictionaryInputMode](self, "dictionaryInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedIdentifier");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = TILexiconIDForLocaleIdentifier((char *)objc_msgSend(v5, "UTF8String"));

  *(_DWORD *)(v3 + 248) = v6;
  *(_DWORD *)(v3 + 584) = 1;
  *(_BYTE *)(v3 + 684) = -[TIKeyboardFeatureSpecialization useRelaxedOVSPolicy](self, "useRelaxedOVSPolicy");
  return (void *)v3;
}

@end
