@implementation TIKeyboardFeatureSpecialization_es_419

- (id)dictionaryInputMode
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BEB5390];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "es_MX");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSiriMode");
  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "originalIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputModeWithIdentifier:isSiriMode:originalIdentifier:", v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
