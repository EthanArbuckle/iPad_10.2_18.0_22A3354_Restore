@implementation TIKeyboardInputManager_vi_VNI

- (int)vietnameseType
{
  return 2;
}

- (BOOL)inputTypeSupportsDecomposition
{
  return 0;
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
  objc_msgSend(MEMORY[0x24BDD14A8], "TI_vietnameseVNISpecialsCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v4) == 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

@end
