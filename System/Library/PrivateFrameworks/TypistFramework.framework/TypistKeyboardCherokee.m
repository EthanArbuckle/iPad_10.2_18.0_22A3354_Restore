@implementation TypistKeyboardCherokee

- (id)init:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardCherokee;
  return -[TypistKeyboard init:options:locale:](&v5, sel_init_options_locale_, a3, a4, CFSTR("chr"));
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TypistKeyboardCherokee;
  -[TypistKeyboard setupKeyboardInfo:options:](&v9, sel_setupKeyboardInfo_options_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[TypistKeyboardCherokee setVowelKeyMap:](self, "setVowelKeyMap:", &unk_251A99268);
    -[TypistKeyboard keyPlanes](self, "keyPlanes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboardCherokee generateBaseKeyMap:](self, "generateBaseKeyMap:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboardCherokee setBaseCharacters:](self, "setBaseCharacters:", v7);

  }
  return v5;
}

- (id)generateKeyplaneSwitchTable:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardCherokee;
  -[TypistKeyboard generateKeyplaneSwitchTable:](&v15, sel_generateKeyplaneSwitchTable_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsString:", CFSTR("shift")))
          objc_msgSend(v3, "removeObjectForKey:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)getPostfixKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[TypistKeyboardCherokee baseCharacters](self, "baseCharacters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TypistKeyboardCherokee baseCharacters](self, "baseCharacters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (id)generateBaseKeyMap:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v22 = *(_QWORD *)v31;
    v23 = v5;
    do
    {
      v9 = 0;
      v24 = v7;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v9), v22, v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = v10;
          v11 = v10;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v27 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
                objc_msgSend(v11, "objectForKeyedSubscript:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("basekey"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                {
                  objc_msgSend(v11, "objectForKeyedSubscript:", v16);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("basekey"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v16);
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v13);
          }

          v8 = v22;
          v5 = v23;
          v7 = v24;
          v10 = v25;
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)addAccentKeyAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TypistKeyboardCherokee vowelKeyMap](self, "vowelKeyMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TypistKeyboard keyPlanes](self, "keyPlanes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboardCherokee vowelKeyMap](self, "vowelKeyMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (TypistKeyboardCherokee)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardCherokee *v5;
  uint64_t v6;
  NSDictionary *vowelKeyMap;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKeyboardCherokee;
  v5 = -[TypistKeyboard initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vowelKeyMap"));
    v6 = objc_claimAutoreleasedReturnValue();
    vowelKeyMap = v5->_vowelKeyMap;
    v5->_vowelKeyMap = (NSDictionary *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *vowelKeyMap;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TypistKeyboardCherokee;
  -[TypistKeyboard encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  vowelKeyMap = self->_vowelKeyMap;
  if (vowelKeyMap)
    objc_msgSend(v4, "encodeObject:forKey:", vowelKeyMap, CFSTR("vowelKeyMap"));

}

- (NSDictionary)vowelKeyMap
{
  return self->_vowelKeyMap;
}

- (void)setVowelKeyMap:(id)a3
{
  objc_storeStrong((id *)&self->_vowelKeyMap, a3);
}

- (NSDictionary)baseCharacters
{
  return self->_baseCharacters;
}

- (void)setBaseCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_baseCharacters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseCharacters, 0);
  objc_storeStrong((id *)&self->_vowelKeyMap, 0);
}

@end
