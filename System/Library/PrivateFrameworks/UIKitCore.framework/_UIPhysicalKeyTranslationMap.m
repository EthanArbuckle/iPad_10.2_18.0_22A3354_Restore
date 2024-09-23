@implementation _UIPhysicalKeyTranslationMap

- (_UIPhysicalKeyTranslationMap)initWithKeyCode:(unsigned __int16)a3 action:(unsigned int)a4 modifiers:(int64_t)a5
{
  unsigned int v7;
  _UIPhysicalKeyTranslationMap *v8;
  uint64_t v9;
  NSMapTable *translationMap;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIPhysicalKeyTranslationMap;
  v8 = -[_UIPhysicalKeyTranslationMap init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 512);
    v9 = objc_claimAutoreleasedReturnValue();
    translationMap = v8->_translationMap;
    v8->_translationMap = (NSMapTable *)v9;

    v8->_keyCode = v7;
    v8->_keyAction = a4;
    v8->_originalModifiers = a5;
  }
  return v8;
}

- (id)keyTranslationWithModifiers:(int64_t)a3 translator:(id)a4
{
  id v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  id v11;

  v6 = a4;
  v11 = 0;
  v7 = -[_UIPhysicalKeyTranslationMap keyTranslation:withModifiers:](self, "keyTranslation:withModifiers:", &v11, a3);
  v8 = v11;
  if (!v7)
  {
    objc_msgSend(v6, "translationForHIDUsageCode:modifiers:", (unsigned __int16)-[_UIPhysicalKeyTranslationMap keyCode](self, "keyCode"), a3);
    v9 = objc_claimAutoreleasedReturnValue();

    -[_UIPhysicalKeyTranslationMap setKeyTranslation:modifiers:](self, "setKeyTranslation:modifiers:", v9, a3);
    v8 = (id)v9;
  }

  return v8;
}

- (BOOL)keyTranslation:(id *)a3 withModifiers:(int64_t)a4
{
  NSMapTable *v6;
  void *v7;
  void *v8;
  id v9;

  -[_UIPhysicalKeyTranslationMap translationMap](self, "translationMap");
  v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  NSMapGet(v6, (const void *)(a4 + 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7 == v8))
  {
    v9 = 0;
  }
  else
  {
    v9 = objc_retainAutorelease(v7);
  }
  *a3 = v9;

  return v7 != 0;
}

- (void)setKeyTranslation:(id)a3 modifiers:(int64_t)a4
{
  id v6;
  NSMapTable *v7;
  const void *v8;
  id v9;

  v6 = a3;
  if (!v6)
  {
    _UISpecialKeyInputFromHIDUsage(-[_UIPhysicalKeyTranslationMap keyCode](self, "keyCode"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  -[_UIPhysicalKeyTranslationMap translationMap](self, "translationMap");
  v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  v8 = (const void *)objc_msgSend(v9, "lowercaseString");
  if (!v8)
    v8 = (const void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  NSMapInsert(v7, (const void *)(a4 + 1), v8);

}

+ (void)enumerateAllCombinationsOfModifiers:(int64_t)a3 staticModifiers:(int64_t)a4 usingBlock:(id)a5
{
  void (**v7)(id, int64_t, _BYTE *);
  uint8x8_t v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  int64_t v14;
  uint64_t v15;
  char v16;
  _OWORD v17[32];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, int64_t, _BYTE *))a5;
  v8 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v8.i16[0] = vaddlv_u8(v8);
  LODWORD(v9) = v8.i32[0];
  memset(v17, 0, sizeof(v17));
  if ((_DWORD)a3)
  {
    v10 = 0;
    v11 = 0;
    do
    {
      if (((1 << v10) & (unint64_t)a3) != 0)
        *((_QWORD *)v17 + v11++) = (1 << v10) & (unint64_t)a3;
      if (v10 > 0x3E)
        break;
      ++v10;
    }
    while (v11 < v8.i32[0]);
  }
  v12 = (int)ldexp(1.0, v8.i32[0]);
  v16 = 0;
  if (v12 >= 1)
  {
    v13 = 0;
    if (v9 <= 1)
      v9 = 1;
    else
      v9 = v9;
    do
    {
      v14 = a4;
      if ((_DWORD)a3)
      {
        v15 = 0;
        v14 = a4;
        do
        {
          if (((v13 >> v15) & 1) != 0)
            v14 |= *((_QWORD *)v17 + v15);
          ++v15;
        }
        while (v9 != v15);
      }
      v7[2](v7, v14, &v16);
      ++v13;
    }
    while (v13 < v12 && !v16);
  }

}

- (void)populateAllCombinationsOfModifiers:(int64_t)a3 translator:(id)a4
{
  id v6;
  _QWORD v7[5];
  id v8;

  v6 = a4;
  if (!-[_UIPhysicalKeyTranslationMap keyAction](self, "keyAction"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78___UIPhysicalKeyTranslationMap_populateAllCombinationsOfModifiers_translator___block_invoke;
    v7[3] = &unk_1E16DF050;
    v7[4] = self;
    v8 = v6;
    +[_UIPhysicalKeyTranslationMap enumerateAllCombinationsOfModifiers:staticModifiers:usingBlock:](_UIPhysicalKeyTranslationMap, "enumerateAllCombinationsOfModifiers:staticModifiers:usingBlock:", a3, 0, v7);

  }
}

- (id)allTranslations
{
  id v3;
  NSMapTable *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[_UIPhysicalKeyTranslationMap translationMap](self, "translationMap");
  v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  NSAllMapTableValues(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  return v6;
}

- (BOOL)areModifiers:(int64_t)a3 minimalExcessOfMask:(int64_t)a4 matching:(id)a5 translator:(id)a6 matchedModifierSubset:(int64_t *)a7 betterMatchFound:(BOOL *)a8
{
  id v14;
  id v15;
  uint8x8_t v16;
  __int32 v17;
  id v18;
  id v19;
  char v20;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  int64_t v27;
  BOOL *v28;
  __int32 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v14 = a5;
  v15 = a6;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v16 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v16.i16[0] = vaddlv_u8(v16);
  v17 = v16.i32[0];
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __124___UIPhysicalKeyTranslationMap_areModifiers_minimalExcessOfMask_matching_translator_matchedModifierSubset_betterMatchFound___block_invoke;
  v22[3] = &unk_1E16DF078;
  v22[4] = self;
  v18 = v15;
  v23 = v18;
  v19 = v14;
  v29 = v17;
  v24 = v19;
  v25 = &v30;
  v27 = a4;
  v28 = a8;
  v26 = &v34;
  +[_UIPhysicalKeyTranslationMap enumerateAllCombinationsOfModifiers:staticModifiers:usingBlock:](_UIPhysicalKeyTranslationMap, "enumerateAllCombinationsOfModifiers:staticModifiers:usingBlock:", a3, 0, v22);
  if (a7)
    *a7 = v35[3];
  v20 = *((_BYTE *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKeyCode:action:modifiers:", (unsigned __int16)-[_UIPhysicalKeyTranslationMap keyCode](self, "keyCode"), -[_UIPhysicalKeyTranslationMap keyAction](self, "keyAction"), -[_UIPhysicalKeyTranslationMap originalModifiers](self, "originalModifiers"));
  -[_UIPhysicalKeyTranslationMap translationMap](self, "translationMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[2];
  v5[2] = v7;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIPhysicalKeyTranslationMap)initWithCoder:(id)a3
{
  id v4;
  unsigned __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("keyCode"));
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("keyAction"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("modifierFlags"));

  return -[_UIPhysicalKeyTranslationMap initWithKeyCode:action:modifiers:](self, "initWithKeyCode:action:modifiers:", v5, v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[_UIPhysicalKeyTranslationMap keyCode](self, "keyCode"), CFSTR("keyCode"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[_UIPhysicalKeyTranslationMap keyAction](self, "keyAction"), CFSTR("keyAction"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIPhysicalKeyTranslationMap originalModifiers](self, "originalModifiers"), CFSTR("modifierFlags"));

}

- (NSMapTable)translationMap
{
  return self->_translationMap;
}

- (unsigned)keyCode
{
  return self->_keyCode;
}

- (unsigned)keyAction
{
  return self->_keyAction;
}

- (int64_t)originalModifiers
{
  return self->_originalModifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationMap, 0);
}

@end
