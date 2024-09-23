@implementation TIKeyboardFeatureSpecialization_bo

- (BOOL)doesComposeText
{
  return 1;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)internalStringToExternal:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (!-[TIKeyboardFeatureSpecialization_bo internalStringToExternal:]::gFullToSubscriptMap)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("ྐ"), CFSTR("ཀ"), CFSTR("ྑ"), CFSTR("ཁ"), CFSTR("ྒ"), CFSTR("ག"), CFSTR("ྒྷ"), CFSTR("གྷ"), CFSTR("ྔ"), CFSTR("ང"), CFSTR("ྕ"), CFSTR("ཅ"), CFSTR("ྖ"), CFSTR("ཆ"), CFSTR("ྗ"), CFSTR("ཇ"), CFSTR("ྙ"),
           CFSTR("ཉ"),
           CFSTR("ྚ"),
           CFSTR("ཊ"),
           CFSTR("ྛ"),
           CFSTR("ཋ"),
           CFSTR("ྜ"),
           CFSTR("ཌ"),
           CFSTR("ྜྷ"),
           CFSTR("ཌྷ"),
           CFSTR("ྞ"),
           CFSTR("ཎ"),
           CFSTR("ྟ"),
           CFSTR("ཏ"),
           CFSTR("ྠ"),
           CFSTR("ཐ"),
           CFSTR("ྡ"),
           CFSTR("ད"),
           CFSTR("ྡྷ"),
           CFSTR("དྷ"),
           CFSTR("ྣ"),
           CFSTR("ན"),
           CFSTR("ྤ"),
           CFSTR("པ"),
           CFSTR("ྥ"),
           CFSTR("ཕ"),
           CFSTR("ྦ"),
           CFSTR("བ"),
           CFSTR("ྦྷ"),
           CFSTR("བྷ"),
           CFSTR("ྨ"),
           CFSTR("མ"),
           CFSTR("ྩ"),
           CFSTR("ཙ"),
           CFSTR("ྪ"),
           CFSTR("ཚ"),
           CFSTR("ྫ"),
           CFSTR("ཛ"),
           CFSTR("ྫྷ"),
           CFSTR("ཛྷ"),
           CFSTR("ྭ"),
           CFSTR("ཝ"),
           CFSTR("ྮ"),
           CFSTR("ཞ"),
           CFSTR("ྯ"));
    v5 = (void *)-[TIKeyboardFeatureSpecialization_bo internalStringToExternal:]::gFullToSubscriptMap;
    -[TIKeyboardFeatureSpecialization_bo internalStringToExternal:]::gFullToSubscriptMap = v4;

  }
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = objc_msgSend(v3, "characterAtIndex:", v7);
      if (v8 == 2)
      {
        if (v9 != 3972)
        {
          objc_msgSend(v3, "substringWithRange:", v7, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendString:", v10);
          goto LABEL_19;
        }
      }
      else
      {
        if (v8 != 1)
        {
          if (v9 == 3972)
            v8 = 1;
          else
            v8 = 3;
          objc_msgSend(v3, "substringWithRange:", v7, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendString:", v10);
          goto LABEL_20;
        }
        if (v9 != 3972)
        {
          objc_msgSend(v3, "substringWithRange:", v7, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)-[TIKeyboardFeatureSpecialization_bo internalStringToExternal:]::gFullToSubscriptMap, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v6, "replaceCharactersInRange:withString:", objc_msgSend(v6, "length") - 1, 1, v11);
          else
            objc_msgSend(v6, "appendString:", v10);

LABEL_19:
          v8 = 3;
LABEL_20:

          goto LABEL_21;
        }
      }
      v8 = 2;
LABEL_21:
      ++v7;
    }
    while (objc_msgSend(v3, "length") > v7);
  }

  return v6;
}

- (id)externalStringToInternal:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (!-[TIKeyboardFeatureSpecialization_bo externalStringToInternal:]::gSubscriptToFullMap)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("྄ཀ"), CFSTR("ྐ"), CFSTR("྄ཁ"), CFSTR("ྑ"), CFSTR("྄ག"), CFSTR("ྒ"), CFSTR("྄གྷ"), CFSTR("ྒྷ"), CFSTR("྄ང"), CFSTR("ྔ"), CFSTR("྄ཅ"), CFSTR("ྕ"), CFSTR("྄ཆ"), CFSTR("ྖ"), CFSTR("྄ཇ"), CFSTR("ྗ"), CFSTR("྄ཉ"),
           CFSTR("ྙ"),
           CFSTR("྄ཊ"),
           CFSTR("ྚ"),
           CFSTR("྄ཋ"),
           CFSTR("ྛ"),
           CFSTR("྄ཌ"),
           CFSTR("ྜ"),
           CFSTR("྄ཌྷ"),
           CFSTR("ྜྷ"),
           CFSTR("྄ཎ"),
           CFSTR("ྞ"),
           CFSTR("྄ཏ"),
           CFSTR("ྟ"),
           CFSTR("྄ཐ"),
           CFSTR("ྠ"),
           CFSTR("྄ད"),
           CFSTR("ྡ"),
           CFSTR("྄དྷ"),
           CFSTR("ྡྷ"),
           CFSTR("྄ན"),
           CFSTR("ྣ"),
           CFSTR("྄པ"),
           CFSTR("ྤ"),
           CFSTR("྄ཕ"),
           CFSTR("ྥ"),
           CFSTR("྄བ"),
           CFSTR("ྦ"),
           CFSTR("྄བྷ"),
           CFSTR("ྦྷ"),
           CFSTR("྄མ"),
           CFSTR("ྨ"),
           CFSTR("྄ཙ"),
           CFSTR("ྩ"),
           CFSTR("྄ཚ"),
           CFSTR("ྪ"),
           CFSTR("྄ཛ"),
           CFSTR("ྫ"),
           CFSTR("྄ཛྷ"),
           CFSTR("ྫྷ"),
           CFSTR("྄ཝ"),
           CFSTR("ྭ"),
           CFSTR("྄ཞ"),
           CFSTR("ྮ"),
           CFSTR("྄ཟ"));
    v5 = (void *)-[TIKeyboardFeatureSpecialization_bo externalStringToInternal:]::gSubscriptToFullMap;
    -[TIKeyboardFeatureSpecialization_bo externalStringToInternal:]::gSubscriptToFullMap = v4;

  }
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v3, "substringWithRange:", v7, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)-[TIKeyboardFeatureSpecialization_bo externalStringToInternal:]::gSubscriptToFullMap, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = v9;
      else
        v10 = v8;
      objc_msgSend(v6, "appendString:", v10);

      ++v7;
    }
    while (objc_msgSend(v3, "length") > v7);
  }

  return v6;
}

@end
