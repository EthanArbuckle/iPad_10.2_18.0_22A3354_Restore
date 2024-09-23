@implementation TIKeyboardFeatureSpecialization

- (id)internalStringToExternal:(id)a3
{
  KB *v4;
  void *v5;
  KB *v6;
  const KB::String *v7;
  _BYTE v9[8];
  void *v10;
  _BYTE v11[8];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (KB *)a3;
  if (-[TIKeyboardFeatureSpecialization doesComposeText](self, "doesComposeText"))
  {
    -[TIKeyboardFeatureSpecialization compositionMapForLayout:reverse:](self, "compositionMapForLayout:reverse:", self->m_softwareLayout, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[TIKeyboardFeatureSpecialization getComposedStringFor:usingMap:](self, "getComposedStringFor:usingMap:", v4, v5);
      v6 = (KB *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      KB::utf8_string(v4, (uint64_t)v9);
      KB::compose_diacritics((KB *)v9, -[TIKeyboardFeatureSpecialization precomposedCharacterSet](self, "precomposedCharacterSet"), (uint64_t)v11);
      KB::ns_string((KB *)v11, v7);
      v6 = (KB *)objc_claimAutoreleasedReturnValue();
      if (v12 && v11[6] == 1)
        free(v12);
      if (v10 && v9[6] == 1)
        free(v10);
    }

  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (const)precomposedCharacterSet
{
  const USet *result;

  result = self->m_precomposedCharacterSet;
  if (!result)
  {
    -[TIKeyboardFeatureSpecialization reloadPrecomposedCharacterSetWithIdiom:](self, "reloadPrecomposedCharacterSetWithIdiom:", -[TIKeyboardFeatureSpecialization currentUserInterfaceIdiom](self, "currentUserInterfaceIdiom"));
    return self->m_precomposedCharacterSet;
  }
  return result;
}

- (id)compositionMapForLayout:(id)a3 reverse:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id *v8;
  id v9;
  id v10;
  void (**v11)(void *, id);
  void *v12;
  uint64_t v13;
  _QWORD aBlock[4];
  id v16;
  TIKeyboardFeatureSpecialization *v17;
  BOOL v18;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = 32;
    if (v4)
      v7 = 40;
    v8 = (id *)((char *)&self->super.isa + v7);
    v9 = *(id *)((char *)&self->super.isa + v7);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v8, v9);
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__TIKeyboardFeatureSpecialization_ZephyrSpecialization__compositionMapForLayout_reverse___block_invoke;
    aBlock[3] = &unk_1EA0FC428;
    v18 = v4;
    v16 = v9;
    v17 = self;
    v10 = v9;
    v11 = (void (**)(void *, id))_Block_copy(aBlock);
    v11[2](v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "count"))
    {
      v11[2](v11, CFSTR("AnyLayout"));
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __89__TIKeyboardFeatureSpecialization_ZephyrSpecialization__compositionMapForLayout_reverse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  id v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    v5 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "inputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "reverseCompositionMap");
    else
      objc_msgSend(v6, "compositionMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v3);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  if (!objc_msgSend(v4, "count"))
  {
    v10 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "inputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      objc_msgSend(v11, "compositionMap");
    else
      objc_msgSend(v11, "reverseCompositionMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = v14;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v16, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v22);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v18);
      }

      v23 = v15;
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v23, v3);

      v4 = v23;
      v14 = v25;
    }

  }
  return v4;
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (id)replacementForDoubleSpace
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replacementForDoubleSpace");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR(". ");
  v5 = v3;

  return v5;
}

- (id)accentKeyStringForKeyboardState:(id)a3
{
  return 0;
}

- (BOOL)shouldExtendPriorWord
{
  return 1;
}

- (id)allAccentKeyStrings
{
  void *v2;
  void *v3;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allAccentKeyStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)externalStringToInternal:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TIKeyboardFeatureSpecialization externalStringToInternal:byConvertingEagerly:](self, "externalStringToInternal:byConvertingEagerly:", v4, -[TIKeyboardFeatureSpecialization shouldConvertEagerly](self, "shouldConvertEagerly"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)externalStringToInternal:(id)a3 byConvertingEagerly:(BOOL)a4
{
  _BOOL8 v4;
  KB *v6;
  void *v7;
  KB *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  int v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  int v25;
  const KB::String *v26;
  TIKeyboardFeatureSpecialization *v28;
  void *v29;
  KB *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char *v35;
  char *v36;
  unint64_t v37;
  unsigned __int16 v38[3];
  char v39;
  void *v40;
  _BYTE v41[8];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = (KB *)a3;
  if (-[TIKeyboardFeatureSpecialization doesComposeText](self, "doesComposeText"))
  {
    -[TIKeyboardFeatureSpecialization compositionMapForLayout:reverse:](self, "compositionMapForLayout:reverse:", self->m_softwareLayout, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      -[TIKeyboardFeatureSpecialization getComposedStringFor:usingMap:byConvertingEagerly:](self, "getComposedStringFor:usingMap:byConvertingEagerly:", v6, v7, v4);
      v8 = (KB *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = v7;
      v30 = v6;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v28 = self;
      -[TIKeyboardFeatureSpecialization allAccentKeyStrings](self, "allAccentKeyStrings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v9);
            v17 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "_firstLongCharacter");
            v18 = v17;
            if ((unint64_t)v12 >= v14)
            {
              v19 = (v12 - v13) >> 2;
              v20 = v19 + 1;
              if ((unint64_t)(v19 + 1) >> 62)
                abort();
              if ((uint64_t)(v14 - (_QWORD)v13) >> 1 > v20)
                v20 = (uint64_t)(v14 - (_QWORD)v13) >> 1;
              if (v14 - (unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
                v21 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v21 = v20;
              if (v21)
                v21 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v21);
              else
                v22 = 0;
              v23 = (char *)(v21 + 4 * v19);
              *(_DWORD *)v23 = v18;
              v24 = v23 + 4;
              while (v12 != v13)
              {
                v25 = *((_DWORD *)v12 - 1);
                v12 -= 4;
                *((_DWORD *)v23 - 1) = v25;
                v23 -= 4;
              }
              v14 = v21 + 4 * v22;
              v36 = v24;
              if (v13)
                operator delete(v13);
              v13 = v23;
              v12 = v24;
            }
            else
            {
              *(_DWORD *)v12 = v17;
              v12 += 4;
            }
            v36 = v12;
          }
          v37 = v14;
          v35 = v13;
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        }
        while (v11);
      }
      else
      {
        v13 = 0;
      }

      v6 = v30;
      KB::utf8_string(v30, (uint64_t)v38);
      KB::decompose_diacritics(v38, (unsigned int **)&v35, (uint64_t)-[TIKeyboardFeatureSpecialization precomposedCharacterSet](v28, "precomposedCharacterSet"), (uint64_t)v41);
      KB::ns_string((KB *)v41, v26);
      v8 = (KB *)objc_claimAutoreleasedReturnValue();
      if (v42 && v41[6] == 1)
        free(v42);
      v7 = v29;
      if (v40 && v39 == 1)
        free(v40);
      if (v13)
      {
        v36 = v13;
        operator delete(v13);
      }
    }

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (BOOL)shouldConvertEagerly
{
  return 1;
}

- (id)wordSeparator
{
  return CFSTR(" ");
}

- (TIKeyboardFeatureSpecialization)initWithInputMode:(id)a3
{
  id v5;
  TIKeyboardFeatureSpecialization *v6;
  TIKeyboardFeatureSpecialization *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardFeatureSpecialization;
  v6 = -[TIKeyboardFeatureSpecialization init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inputMode, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->m_acceptableCharacterSet)
    uset_close();
  if (self->m_precomposedCharacterSet)
    uset_close();
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardFeatureSpecialization;
  -[TIKeyboardFeatureSpecialization dealloc](&v3, sel_dealloc);
}

- (void)setCurrentUserInterfaceIdiom:(int64_t)a3
{
  if (self->_currentUserInterfaceIdiom != a3)
  {
    self->_currentUserInterfaceIdiom = a3;
    -[TIKeyboardFeatureSpecialization reloadPrecomposedCharacterSetWithIdiom:](self, "reloadPrecomposedCharacterSetWithIdiom:");
  }
}

- (void)reloadPrecomposedCharacterSetWithIdiom:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  if (self->m_precomposedCharacterSet)
    uset_close();
  self->m_precomposedCharacterSet = (USet *)uset_openEmpty();
  if (a3 != -1)
  {
    -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "normalizedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TIKeyboardPopupVariantsForInputMode();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__TIKeyboardFeatureSpecialization_reloadPrecomposedCharacterSetWithIdiom___block_invoke;
    v8[3] = &unk_1EA0FC400;
    v8[4] = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  JUMPOUT(0x1DF0A2DF8);
}

- (id)keyboardBehaviors
{
  return 0;
}

- (BOOL)supportsReversionUI
{
  return 1;
}

- (BOOL)supportsLearning
{
  return 1;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 1;
}

- (BOOL)shouldLearnLowercaseAtBeginningOfSentence
{
  return 1;
}

- (id)layoutTags
{
  void *v2;
  void *v3;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutTags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)currentUserInterfaceIdiom
{
  return self->_currentUserInterfaceIdiom;
}

- (BOOL)useRelaxedOVSPolicy
{
  return self->_useRelaxedOVSPolicy;
}

- (void)setUseRelaxedOVSPolicy:(BOOL)a3
{
  self->_useRelaxedOVSPolicy = a3;
}

- (BOOL)skipCandidateQualityFilter
{
  return self->_skipCandidateQualityFilter;
}

- (void)setSkipCandidateQualityFilter:(BOOL)a3
{
  self->_skipCandidateQualityFilter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->m_reverseCompositionMaps, 0);
  objc_storeStrong((id *)&self->m_compositionMaps, 0);
  objc_storeStrong((id *)&self->m_softwareLayout, 0);
}

uint64_t __74__TIKeyboardFeatureSpecialization_reloadPrecomposedCharacterSetWithIdiom___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__TIKeyboardFeatureSpecialization_reloadPrecomposedCharacterSetWithIdiom___block_invoke_2;
  v4[3] = &unk_1EA0FC3D8;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __74__TIKeyboardFeatureSpecialization_reloadPrecomposedCharacterSetWithIdiom___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_firstLongCharacter");
  if ((_DWORD)result)
    JUMPOUT(0x1DF0A2DBCLL);
  return result;
}

+ (id)createSpecializationForInputMode:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "keyboardFeatureSpecializationClass")), "initWithInputMode:", v3);

  return v4;
}

- (void)createInputManager
{
  TIInputManager *v3;

  v3 = (TIInputManager *)operator new();
  TIInputManager::TIInputManager(v3);
  *((_BYTE *)v3 + 684) = -[TIKeyboardFeatureSpecialization useRelaxedOVSPolicy](self, "useRelaxedOVSPolicy");
  return v3;
}

- (void)specializeInputManager:(void *)a3 forLayoutState:(id)a4
{
  NSString *v5;
  NSString *m_softwareLayout;

  objc_msgSend(a4, "softwareLayout", a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  m_softwareLayout = self->m_softwareLayout;
  self->m_softwareLayout = v5;

}

- (BOOL)doesComposeText
{
  void *v2;
  char v3;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "doesComposeText");

  return v3;
}

- (BOOL)deletesByComposedCharacterSequence
{
  void *v2;
  char v3;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deletesByComposedCharacterSequence");

  return v3;
}

- (id)getComposedStringFor:(id)a3 usingMap:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[TIKeyboardFeatureSpecialization getComposedStringFor:usingMap:byConvertingEagerly:](self, "getComposedStringFor:usingMap:byConvertingEagerly:", v7, v6, -[TIKeyboardFeatureSpecialization shouldConvertEagerly](self, "shouldConvertEagerly"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getComposedStringFor:(id)a3 usingMap:(id)a4 byConvertingEagerly:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v19;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v7, "length"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v10 = 0;
      v11 = !v5;
      do
      {
        -[TIKeyboardFeatureSpecialization findPrefixMatchesFor:fromIndex:usingCompositionMap:matchesInputAsPrefix:](self, "findPrefixMatchesFor:fromIndex:usingCompositionMap:matchesInputAsPrefix:", v7, v10, v8, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "key");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");
          if (v15 > objc_msgSend(v7, "length") - v10)
          {
            objc_msgSend(v7, "substringFromIndex:", v10);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "appendString:", v19);

            break;
          }
          objc_msgSend(v13, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendString:", v16);
          v17 = objc_msgSend(v14, "length");

        }
        else
        {
          objc_msgSend(v9, "appendFormat:", CFSTR("%C"), objc_msgSend(v7, "characterAtIndex:", v10));
          v17 = 1;
        }
        v10 += v17;

      }
      while (v10 < objc_msgSend(v7, "length"));
    }
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (id)findPrefixMatchesFor:(id)a3 fromIndex:(unint64_t)a4 usingCompositionMap:(id)a5 matchesInputAsPrefix:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v6 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  objc_msgSend((id)objc_opt_class(), "findPrefixMatchesFor:fromIndex:usingCompositionMap:matchesInputAsPrefix:", v9, a4, v10, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[TICompositionMapItem itemWithKey:value:](TICompositionMapItem, "itemWithKey:value:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "addObject:", v19);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  return v11;
}

- (BOOL)shouldClearInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIKeyboardFeatureSpecialization compositionMapForLayout:reverse:](self, "compositionMapForLayout:reverse:", self->m_softwareLayout, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = 20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v11 <= objc_msgSend(v13, "length", (_QWORD)v16))
          v11 = objc_msgSend(v13, "length");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 20;
  }

  if (v6)
  {
    if (objc_msgSend(v4, "length") <= v11)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      -[TIKeyboardFeatureSpecialization getComposedStringFor:usingMap:byConvertingEagerly:](self, "getComposedStringFor:usingMap:byConvertingEagerly:", v4, v7, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        LODWORD(v6) = objc_msgSend(v14, "characterAtIndex:", objc_msgSend(v14, "length") - 1);
        LOBYTE(v6) = (_DWORD)v6 != objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1);
      }
      else
      {
        LOBYTE(v6) = 0;
      }

    }
  }

  return v6;
}

- (id)nonstopPunctuationCharacters
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nonstopPunctuationCharacters");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  v5 = v3;

  return v5;
}

- (id)sentencePrefixingCharacters
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentencePrefixingCharacters");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("¡¿'\"‘“(");
  v5 = v3;

  return v5;
}

- (id)sentenceDelimitingCharacters
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentenceDelimitingCharacters");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR(".?!");
  v5 = v3;

  return v5;
}

- (id)sentenceTrailingCharacters
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentenceTrailingCharacters");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("'\"’”");
  v5 = v3;

  return v5;
}

- (id)wordMedialPunctuationCharacters
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wordMedialPunctuationCharacters");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("'’");
  v5 = v3;

  return v5;
}

- (id)wordCharacters
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDC98]), "initWithBaseCharacterSet:", 10);
  -[TIKeyboardFeatureSpecialization nonstopPunctuationCharacters](self, "nonstopPunctuationCharacters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCharactersInString:", v4);

  return v3;
}

- (id)supplementalLexiconWordExtraCharacters
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDC98]), "initWithCharactersInString:", CFSTR("-"));
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)terminatorsDeletingAutospace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__TIKeyboardFeatureSpecialization_ZephyrSpecialization__terminatorsDeletingAutospace__block_invoke;
  block[3] = &unk_1EA106A98;
  block[4] = self;
  if (-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) terminatorsDeletingAutospace]::onceToken != -1)
    dispatch_once(&-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) terminatorsDeletingAutospace]::onceToken, block);
  return (id)-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) terminatorsDeletingAutospace]::result;
}

- (id)spaceDeletingCharacters
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  _QWORD block[4];
  __CFString *v14;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spaceDeletingCharacters");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1EA1081D0;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__TIKeyboardFeatureSpecialization_ZephyrSpecialization__spaceDeletingCharacters__block_invoke;
  block[3] = &unk_1EA106A98;
  v14 = v6;
  v7 = -[TIKeyboardFeatureSpecialization(ZephyrSpecialization) spaceDeletingCharacters]::onceToken;
  v8 = v6;
  v9 = v8;
  if (v7 == -1)
  {
    v10 = v8;
  }
  else
  {
    dispatch_once(&-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) spaceDeletingCharacters]::onceToken, block);
    v10 = v14;
  }
  v11 = (id)-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) spaceDeletingCharacters]::result;

  return v11;
}

- (unint64_t)maxPriorWordTokensAfterTrimming
{
  return 1;
}

- (BOOL)acceptsCharacter:(unsigned int)a3
{
  if (!self->m_acceptableCharacterSet)
    self->m_acceptableCharacterSet = -[TIKeyboardFeatureSpecialization createAcceptableCharacterSet](self, "createAcceptableCharacterSet");
  return MEMORY[0x1DF0A2DEC]() != 0;
}

- (USet)createAcceptableCharacterSet
{
  void *v2;
  void *v3;
  USet *v4;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[TIKeyboardFeatureSpecialization createAcceptableCharacterSetForKeyboardLocale:](TIKeyboardFeatureSpecialization, "createAcceptableCharacterSetForKeyboardLocale:", v3);

  return v4;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  return 1;
}

- (BOOL)canHandleKeyHitTest
{
  return 1;
}

- (BOOL)shouldConvertCandidateToExternal
{
  return 1;
}

- (BOOL)canConvertExternalToExternal
{
  return 1;
}

- (BOOL)allowsAutocorrectionOfValidWords
{
  return 1;
}

- (BOOL)shouldConvertAutocorrectionCandidatesToFullWidth
{
  return 0;
}

void __80__TIKeyboardFeatureSpecialization_ZephyrSpecialization__spaceDeletingCharacters__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB60]), "initWithCharactersInString:", *(_QWORD *)(a1 + 32));
  v2 = (void *)-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) spaceDeletingCharacters]::result;
  -[TIKeyboardFeatureSpecialization(ZephyrSpecialization) spaceDeletingCharacters]::result = v1;

}

void __85__TIKeyboardFeatureSpecialization_ZephyrSpecialization__terminatorsDeletingAutospace__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x1E0DBDB60]);
  objc_msgSend(*(id *)(a1 + 32), "sentenceDelimitingCharacters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(",.;:?!)]}/-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithCharactersInString:", v3);
  v5 = (void *)-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) terminatorsDeletingAutospace]::result;
  -[TIKeyboardFeatureSpecialization(ZephyrSpecialization) terminatorsDeletingAutospace]::result = v4;

}

+ (id)findPrefixMatchesFor:(id)a3 fromIndex:(unint64_t)a4 usingCompositionMap:(id)a5 matchesInputAsPrefix:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v6 = a6;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v9, "length") && objc_msgSend(v9, "length") > a4)
  {
    objc_msgSend(v9, "substringFromIndex:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v11, "hasPrefix:", v18, (_QWORD)v21) & 1) != 0
            || v6 && objc_msgSend(v18, "hasPrefix:", v11))
          {
            objc_msgSend(v12, "addObject:", v18);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_3678);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

+ (USet)createAcceptableCharacterSetForKeyboardLocale:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t ExemplarSet;
  uint64_t v6;
  USet *v7;

  objc_msgSend(a3, "localeIdentifier");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  v4 = ulocdata_open();

  ExemplarSet = ulocdata_getExemplarSet();
  v6 = ulocdata_getExemplarSet();
  v7 = (USet *)uset_openEmpty();
  MEMORY[0x1DF0A2DD4](v7, 48, 57);
  MEMORY[0x1DF0A2DBC](v7, 39);
  MEMORY[0x1DF0A2DBC](v7, 38);
  MEMORY[0x1DF0A2DBC](v7, 8217);
  if (ExemplarSet)
  {
    MEMORY[0x1DF0A2DC8](v7, ExemplarSet);
    uset_close();
  }
  if (v6)
  {
    MEMORY[0x1DF0A2DC8](v7, v6);
    uset_close();
  }
  if (v4)
    ulocdata_close();
  return v7;
}

uint64_t __129__TIKeyboardFeatureSpecialization_ZephyrSpecialization__findPrefixMatchesFor_fromIndex_usingCompositionMap_matchesInputAsPrefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (v6 >= objc_msgSend(v4, "length"))
  {
    v8 = objc_msgSend(v5, "length");
    v7 = v8 > objc_msgSend(v4, "length");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

@end
