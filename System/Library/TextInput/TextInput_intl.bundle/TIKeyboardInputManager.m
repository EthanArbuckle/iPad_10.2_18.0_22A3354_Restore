@implementation TIKeyboardInputManager

uint64_t __45__TIKeyboardInputManager_intl_HWR_recognizer__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x24BE1BDE0]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithMode:locale:", 1, v1);
  v3 = (void *)recognizer___recognizer;
  recognizer___recognizer = v2;

  return objc_msgSend((id)recognizer___recognizer, "setMaxRecognitionResultCount:", 4);
}

@end
