@implementation CACCommandRecognizerCustom

+ (id)customCommandRecognizers
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  CACSpokenCommandCustom *v8;
  CACSpokenCommandCustom *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  CACCommandRecognizerCustom *v21;
  void *v22;
  void *v23;
  CACCommandRecognizerCustom *v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v27 = (id)objc_opt_new();
  v2 = (void *)objc_opt_new();
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "enabledCommandIdentifiersForCommandSetIdentifier:", CFSTR("Custom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = -[CACSpokenCommandCustom initWithCommandIdentifier:]([CACSpokenCommandCustom alloc], "initWithCommandIdentifier:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        v9 = v8;
        if (v8)
        {
          -[CACSpokenCommand strings](v8, "strings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            -[CACSpokenCommand contextEvaluation](v9, "contextEvaluation");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            +[CACSpokenCommand stringFromContextEvaluationDictionary:isCustom:](CACSpokenCommand, "stringFromContextEvaluationDictionary:isCustom:", v11, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v2, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              v13 = (void *)objc_opt_new();
              objc_msgSend(v2, "setObject:forKey:", v13, v12);
            }
            objc_msgSend(v13, "addObject:", v9);

          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v5);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v2;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v14, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = [CACCommandRecognizerCustom alloc];
        objc_msgSend(v20, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "contextEvaluation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[CACCommandRecognizer initWithCommands:contextEvaluators:builtInLMIdentifiers:](v21, "initWithCommands:contextEvaluators:builtInLMIdentifiers:", v20, v23, 0);

        -[CACCommandRecognizer setType:](v24, "setType:", v19);
        objc_msgSend(v27, "addObject:", v24);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
  }

  return v27;
}

- (void)_buildLanguageModelUsingCommands
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CACCommandRecognizerCustom;
  -[CACCommandRecognizer _buildLanguageModelUsingCommands](&v4, sel__buildLanguageModelUsingCommands);
  -[CACSpeechRecognizer languageModel](self->super._speechRecognizer, "languageModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forAttribute:", *MEMORY[0x24BDBD270], kCACLanguageModelAttributeCustomCommands);

}

@end
