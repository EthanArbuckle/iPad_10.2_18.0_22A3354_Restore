@implementation TypistKeyboardAmharic

- (id)init:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardAmharic;
  return -[TypistKeyboard init:options:locale:](&v5, sel_init_options_locale_, a3, a4, CFSTR("am"));
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = (void *)MEMORY[0x24BDD14A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "characterSetWithCharactersInString:", CFSTR("እኡኢኦ"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboardAmharic setKeycapAndPopoverVowels:](self, "setKeycapAndPopoverVowels:", v9);

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ሇዏዯፇ"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboardAmharic setKeycapAndPopoverConstants:](self, "setKeycapAndPopoverConstants:", v10);

  v13.receiver = self;
  v13.super_class = (Class)TypistKeyboardAmharic;
  -[TypistKeyboard setupKeyboardInfo:options:](&v13, sel_setupKeyboardInfo_options_, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isJoinedConsonantAndVowelCharacter:(unsigned __int16)a3
{
  BOOL v3;

  v3 = (a3 - 4608) < 0xA0 || (a3 - 4776) < 0xB3;
  return (a3 & 7) != 0 && v3;
}

- (BOOL)isConsonant:(unsigned __int16)a3
{
  return (a3 & 7) == 0 && (a3 - 4608) < 0x15B && a3 != 4768;
}

- (BOOL)isTapKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[TypistKeyboard keyPlanes](self, "keyPlanes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[TypistKeyboard keyPlanes](self, "keyPlanes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[TypistKeyboard keyPlanes](self, "keyPlanes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("action"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v19, "isEqualToString:", CFSTR("tap"));

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)isPopoverCombo:(id)a3 withIndex:(int64_t)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a3;
  if (a4 < 1)
  {
    v8 = 0;
  }
  else
  {
    -[TypistKeyboardAmharic keycapAndPopoverVowels](self, "keycapAndPopoverVowels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", a4)))
      v8 = -[TypistKeyboardAmharic isConsonant:](self, "isConsonant:", objc_msgSend(v6, "characterAtIndex:", a4 - 1));
    else
      v8 = 0;

  }
  return v8;
}

- (id)decomposeAmharicStrings:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v6 = 0;
    while (1)
    {
      v7 = objc_msgSend(v4, "characterAtIndex:", v6);
      if (-[TypistKeyboardAmharic isPopoverCombo:withIndex:](self, "isPopoverCombo:withIndex:", v4, v6))
      {
        objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%@%C"), CFSTR("‍"), v7);
      }
      else
      {
        if (-[TypistKeyboardAmharic isJoinedConsonantAndVowelCharacter:](self, "isJoinedConsonantAndVowelCharacter:", v7))
        {
          -[TypistKeyboardAmharic keycapAndPopoverConstants](self, "keycapAndPopoverConstants");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "characterIsMember:", v7);

          if ((v9 & 1) == 0)
          {
            -[TypistKeyboardAmharic decomposeAmharicChar:](self, "decomposeAmharicChar:", v7);
            v11 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "stringByAppendingString:", v11);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v5 = (void *)v11;
            goto LABEL_9;
          }
        }
        objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%C"), v7, v13);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      ++v6;
      v5 = v10;
      if (objc_msgSend(v4, "length") <= v6)
        goto LABEL_13;
    }
  }
  v10 = v5;
LABEL_13:

  return v10;
}

- (id)decomposeAmharicChar:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int16 v11;
  __int16 v12;
  __int16 v13;

  v3 = a3;
  v11 = a3 & 0xFFF8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), a3 & 0xFFF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TypistKeyboardAmharic isTapKey:](self, "isTapKey:", v5);

  if ((self & 1) != 0)
  {
    v6 = v3 & 7;
    if (v6 > 2)
    {
      v12 = objc_msgSend(CFSTR("⇧"), "characterAtIndex:", 0);
      v13 = v6 | 0x12A0;
      v7 = (void *)MEMORY[0x24BDD17C8];
      v8 = 3;
    }
    else
    {
      v12 = v6 | 0x12A0;
      v7 = (void *)MEMORY[0x24BDD17C8];
      v8 = 2;
    }
    objc_msgSend(v7, "stringWithCharacters:length:", &v11, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)generateKeystrokeStream:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  -[TypistKeyboardAmharic decomposeAmharicStrings:](self, "decomposeAmharicStrings:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardAmharic;
  -[TypistKeyboard generateKeystrokeStream:](&v7, sel_generateKeystrokeStream_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (TypistKeyboardAmharic)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardAmharic *v5;
  uint64_t v6;
  NSCharacterSet *keycapAndPopoverVowels;
  uint64_t v8;
  NSCharacterSet *keycapAndPopoverConstants;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardAmharic;
  v5 = -[TypistKeyboard initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keycapAndPopoverVowels"));
    v6 = objc_claimAutoreleasedReturnValue();
    keycapAndPopoverVowels = v5->_keycapAndPopoverVowels;
    v5->_keycapAndPopoverVowels = (NSCharacterSet *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keycapAndPopoverConstants"));
    v8 = objc_claimAutoreleasedReturnValue();
    keycapAndPopoverConstants = v5->_keycapAndPopoverConstants;
    v5->_keycapAndPopoverConstants = (NSCharacterSet *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSCharacterSet *keycapAndPopoverVowels;
  NSCharacterSet *keycapAndPopoverConstants;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardAmharic;
  -[TypistKeyboard encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  keycapAndPopoverVowels = self->_keycapAndPopoverVowels;
  if (keycapAndPopoverVowels)
    objc_msgSend(v4, "encodeObject:forKey:", keycapAndPopoverVowels, CFSTR("keycapAndPopoverVowels"));
  keycapAndPopoverConstants = self->_keycapAndPopoverConstants;
  if (keycapAndPopoverConstants)
    objc_msgSend(v4, "encodeObject:forKey:", keycapAndPopoverConstants, CFSTR("keycapAndPopoverConstants"));

}

- (NSCharacterSet)keycapAndPopoverVowels
{
  return self->_keycapAndPopoverVowels;
}

- (void)setKeycapAndPopoverVowels:(id)a3
{
  objc_storeStrong((id *)&self->_keycapAndPopoverVowels, a3);
}

- (NSCharacterSet)keycapAndPopoverConstants
{
  return self->_keycapAndPopoverConstants;
}

- (void)setKeycapAndPopoverConstants:(id)a3
{
  objc_storeStrong((id *)&self->_keycapAndPopoverConstants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keycapAndPopoverConstants, 0);
  objc_storeStrong((id *)&self->_keycapAndPopoverVowels, 0);
}

@end
