@implementation NSString(ChineseJapanese)

- (MCKeyboardInput)_asTypeInputs
{
  MCKeyboardInput *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  MCTypeInput *v6;

  v2 = objc_alloc_init(MCKeyboardInput);
  if (objc_msgSend(a1, "length"))
  {
    v3 = 0;
    v4 = MEMORY[0x1E0C9AA60];
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", objc_msgSend(a1, "characterAtIndex:", v3));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[MCTypeInput initWithCharacters:nearbyKeys:]([MCTypeInput alloc], "initWithCharacters:nearbyKeys:", v5, v4);
      -[MCKeyboardInput composeNew:](v2, "composeNew:", v6);

      ++v3;
    }
    while (objc_msgSend(a1, "length") > v3);
  }
  return v2;
}

- (id)_firstComposedCharacter
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = objc_msgSend(v1, "rangeOfComposedCharacterSequenceAtIndex:", 0);
    v4 = v3;
    if (v3 != objc_msgSend(v1, "length"))
    {
      objc_msgSend(v1, "substringWithRange:", v2, v4);
      v5 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v5;
    }
  }
  return v1;
}

@end
