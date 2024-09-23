@implementation TIKeyboardInputManagerTransliterationBase

- (void)initImplementation
{
  _QWORD *m_impl;
  void *v4;
  id v5;
  int v6;
  void *v7;

  m_impl = self->super.m_impl;
  if (!m_impl)
  {
    m_impl = (_QWORD *)operator new();
    bzero(m_impl, 0x2C8uLL);
    TIInputManager::TIInputManager((TIInputManager *)m_impl);
    *m_impl = &off_1EA102760;
    -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "normalizedIdentifier");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = TILexiconIDForLocaleIdentifier((char *)objc_msgSend(v5, "UTF8String"));

    *((_DWORD *)m_impl + 62) = v6;
    *((_DWORD *)m_impl + 146) = 1;
    -[TIKeyboardInputManager config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)m_impl + 684) = objc_msgSend(v7, "allowRelaxedOVSPolicy");

    self->super.m_impl = m_impl;
  }
  return m_impl;
}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  return 0;
}

- (BOOL)isHighMemoryManager
{
  return 1;
}

@end
