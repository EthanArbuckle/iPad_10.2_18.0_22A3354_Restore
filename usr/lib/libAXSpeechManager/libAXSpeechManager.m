uint64_t AXSpeechTransformText()
{
  return TTSSpeechTransformTextWithLanguage();
}

uint64_t AXSpeechTransformTextWithLanguage()
{
  return TTSSpeechTransformTextWithLanguageAndVoiceIdentifier();
}

uint64_t TTSLanguageCanonicalFormToGeneralLanguage()
{
  return MEMORY[0x24BEB62A8]();
}

uint64_t TTSSpeechTransformTextWithLanguage()
{
  return MEMORY[0x24BEB62B8]();
}

uint64_t TTSSpeechTransformTextWithLanguageAndVoiceIdentifier()
{
  return MEMORY[0x24BEB62C0]();
}

