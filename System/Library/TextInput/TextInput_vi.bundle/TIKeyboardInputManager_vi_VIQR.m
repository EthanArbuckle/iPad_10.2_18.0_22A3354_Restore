@implementation TIKeyboardInputManager_vi_VIQR

- (int)vietnameseType
{
  return 3;
}

- (BOOL)inputTypeSupportsDecomposition
{
  return 0;
}

- (id)wordCharacters
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)-[TIKeyboardInputManager_vi_VIQR wordCharacters]::__wordCharacterSet;
  if (!-[TIKeyboardInputManager_vi_VIQR wordCharacters]::__wordCharacterSet)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E90]), "initWithBaseCharacterSet:", 10);
    v4 = objc_msgSend(v3, "copy");
    v5 = (void *)-[TIKeyboardInputManager_vi_VIQR wordCharacters]::__wordCharacterSet;
    -[TIKeyboardInputManager_vi_VIQR wordCharacters]::__wordCharacterSet = v4;

    v2 = (void *)-[TIKeyboardInputManager_vi_VIQR wordCharacters]::__wordCharacterSet;
  }
  return v2;
}

- (BOOL)allowsAutocorrectionForCurrentInputString
{
  const KB::String *v2;
  void *v3;
  void *v4;
  BOOL v5;
  _BYTE v7[32];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa
                                                  + (int)*MEMORY[0x24BEB5498]));
  KB::ns_string((KB *)v7, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v7);
  objc_msgSend(MEMORY[0x24BDD14A8], "TI_vietnameseVIQRSpecialsCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v4) == 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

@end
