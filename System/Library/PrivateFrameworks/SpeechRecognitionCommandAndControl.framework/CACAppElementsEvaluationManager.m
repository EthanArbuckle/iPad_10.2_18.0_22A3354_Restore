@implementation CACAppElementsEvaluationManager

+ (id)sharedManager
{
  if (sharedManager_singletonInit_0 != -1)
    dispatch_once(&sharedManager_singletonInit_0, &__block_literal_global_36);
  return (id)sCACAppElementsEvaluationManager;
}

void __48__CACAppElementsEvaluationManager_sharedManager__block_invoke()
{
  CACAppElementsEvaluationManager *v0;
  void *v1;

  v0 = objc_alloc_init(CACAppElementsEvaluationManager);
  v1 = (void *)sCACAppElementsEvaluationManager;
  sCACAppElementsEvaluationManager = (uint64_t)v0;

}

- (CACAppElementsEvaluationManager)init
{
  CACAppElementsEvaluationManager *v2;
  uint64_t v3;
  NSSet *appIdentifersForStandardFilter;
  uint64_t v5;
  NSString *evaluatorOverrideClassName;
  NSString *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CACAppElementsEvaluationManager;
  v2 = -[CACAppElementsEvaluationManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    appIdentifersForStandardFilter = v2->_appIdentifersForStandardFilter;
    v2->_appIdentifersForStandardFilter = (NSSet *)v3;

    CFPreferencesCopyAppValue(CFSTR("AppElementEvaluatorOverrideClassName"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"));
    v5 = objc_claimAutoreleasedReturnValue();
    evaluatorOverrideClassName = v2->_evaluatorOverrideClassName;
    v2->_evaluatorOverrideClassName = (NSString *)v5;

    if (!-[NSString length](v2->_evaluatorOverrideClassName, "length")
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v7 = v2->_evaluatorOverrideClassName;
      v2->_evaluatorOverrideClassName = 0;

    }
  }
  return v2;
}

- (Class)evaluatorClassForAppIdentifier:(id)a3
{
  id v4;
  NSString *evaluatorOverrideClassName;
  Class v6;
  void *v7;
  void *v8;
  NSString *v9;
  __CFString *v10;
  objc_class *v11;

  v4 = a3;
  evaluatorOverrideClassName = self->_evaluatorOverrideClassName;
  if (!evaluatorOverrideClassName || (v6 = NSClassFromString(evaluatorOverrideClassName)) == 0)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("CACAppElementsEvaluator_%@"), v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = NSClassFromString(v9);

    if (!v6)
    {
      if (-[NSSet containsObject:](self->_appIdentifersForStandardFilter, "containsObject:", v4))
        v10 = CFSTR("CACAppElementsEvaluatorStandardFilter");
      else
        v10 = CFSTR("CACAppElementsEvaluatorNoFilter");
      v6 = NSClassFromString(&v10->isa);
    }
  }
  v11 = v6;

  return v11;
}

- (id)actionableAXElementsFromAXElements:(id)a3 forAppIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CACAppElementsEvaluationManager evaluatorClassForAppIdentifier:](self, "evaluatorClassForAppIdentifier:", a4);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "actionableAXElementsFromAXElements:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACAppElementsEvaluationManager _trimmedArrayOfActionableAXElements:](self, "_trimmedArrayOfActionableAXElements:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CACLogElementEvaluation();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138478339;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2113;
    v17 = v9;
    _os_log_debug_impl(&dword_229A40000, v10, OS_LOG_TYPE_DEBUG, "Actionable elements from %{private}@ using evaluator %@ were %{private}@", (uint8_t *)&v12, 0x20u);
  }

  return v9;
}

- (id)_trimmedArrayOfActionableAXElements:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[5];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v17);
  v4 = 0;
  v5 = *MEMORY[0x24BDFEEF0];
  v23[0] = *MEMORY[0x24BDFEEE0];
  v23[1] = v5;
  v23[2] = *MEMORY[0x24BDFEFD0];
  do
  {
    if ((unint64_t)objc_msgSend(v3, "count") < 0x97)
      break;
    v6 = (void *)objc_opt_new();
    v7 = objc_msgSend(v3, "count");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = v7 - 150;
      v12 = *(_QWORD *)v19;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        if (objc_msgSend(v14, "hasAnyTraits:", v23[v4]))
        {
          objc_msgSend(v6, "addObject:", v14);
          if (!--v11)
            break;
        }
        if (v10 == ++v13)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v10)
            goto LABEL_5;
          break;
        }
      }
    }

    if (objc_msgSend(v6, "count"))
      objc_msgSend(v8, "removeObjectsInArray:", v6);
    v15 = objc_msgSend(v8, "count");

    if (v15 < 0x97)
      break;
    ++v4;
  }
  while (v4 != 3);

  return v3;
}

- (BOOL)isRecognitionString:(id)a3 supportedForElement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  const __CFAttributedString *v9;
  CTLineRef v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "length"))
    goto LABEL_10;
  if (objc_msgSend(v6, "hasAnyTraits:", *MEMORY[0x24BDFEEE0]))
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "allowLetterKeysAsTapCommands");

    if ((v8 & 1) == 0)
    {
      v9 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v5);
      v10 = CTLineCreateWithAttributedString(v9);

      if (v10)
      {
        if (CTLineGetGlyphCount(v10) == 1)
        {
          v11 = objc_msgSend(v5, "integerValue");
          CFRelease(v10);
          if (!v11)
            goto LABEL_10;
        }
        else
        {
          CFRelease(v10);
        }
      }
    }
  }
  v12 = *MEMORY[0x24BDFEE50];
  if ((objc_msgSend(v6, "hasAnyTraits:", *MEMORY[0x24BDFEE50]) & 1) == 0)
  {
    v13 = objc_msgSend(v6, "hasAnyTraits:", v12) ^ 1;
    goto LABEL_12;
  }
LABEL_10:
  LOBYTE(v13) = 0;
LABEL_12:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluatorOverrideClassName, 0);
  objc_storeStrong((id *)&self->_appIdentifersForStandardFilter, 0);
}

@end
