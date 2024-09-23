@implementation CACCommandRecognizerDictation

- (void)speechRecognizer:(id)a3 didRecognizeRXResult:(__RXLanguageObject *)a4
{
  id v6;
  int Type;
  uint64_t ObjectAtIndex;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CFStringRef v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  __CFString *v32;
  void *v33;
  void *v34;
  NSArray *obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __CFString *v40;
  void *v41;
  _BYTE v42[128];
  _QWORD v43[2];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
  {
    Type = RXLanguageObjectGetType();
    if (Type == 6)
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACCommandRecognizer speechRecognizer](self, "speechRecognizer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "registerSignPostEndProcessingForSpeechRecognizer:message:", v10, CFSTR("Close Result."));
      goto LABEL_23;
    }
    if (Type == 5 && RXLanguageObjectGetCount() == 1)
    {
      ObjectAtIndex = RXLanguageObjectGetObjectAtIndex();
      v9 = (void *)RXObjectCopyProperty();
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Dictation.Streaming")) & 1) == 0
        && (objc_msgSend(v9, "isEqualToString:", CFSTR("Dictation.Literal")) & 1) == 0
        && !objc_msgSend(v9, "isEqualToString:", CFSTR("Dictation.SpellAs")))
      {
        objc_msgSend(v9, "isEqualToString:", CFSTR("System.IgnoreSiriKeywordAndOptionalPhrase"));
        goto LABEL_24;
      }
      -[CACCommandRecognizerDictation _attributedStringFromResult:](self, "_attributedStringFromResult:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12)
      {
        v33 = v9;
        v13 = CFCopyDescription(a4);
        +[CACMessageTracerUtilities sharedCACMessageTracerUtilities](CACMessageTracerUtilities, "sharedCACMessageTracerUtilities");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = CFSTR("Text");
        v34 = v10;
        objc_msgSend(v10, "string");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = CFSTR("RXResultDescription");
        v44[0] = v15;
        v32 = (__CFString *)v13;
        v44[1] = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDictationProperties:", v16);

        +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "resultLanguageModelFromRXLanguageObject:", ObjectAtIndex);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        obj = self->super._spokenCommandsCache;
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v37;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v37 != v21)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_msgSend(v23, "identifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v24, "isEqualToString:", v25);

              if (v26)
              {
                -[CACCommandRecognizer commandParametersFromCACLanguageModel:](self, "commandParametersFromCACLanguageModel:", v18);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = kCACCommandParameterAttributedText;
                v41 = v34;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKey:", v28, *MEMORY[0x24BEAFEF0]);

                objc_msgSend(v23, "setRecognizedParameters:", v27);
                +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "handleRecognizedCommand:", v23);

                +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "dictationRecognizerMode");

                if (v31 == 3)
                  +[CACCommandRecognizer suspendCloseMatchAccumulatorForCommand](CACCommandRecognizer, "suspendCloseMatchAccumulatorForCommand");

                goto LABEL_22;
              }
            }
            v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
            if (v20)
              continue;
            break;
          }
        }
LABEL_22:

        v9 = v33;
        v10 = v34;
      }
LABEL_23:

LABEL_24:
    }
  }

}

- (void)handleDictation:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CACSystemStatusManager sharedManager](CACSystemStatusManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSystemDictationRunning");

  if (v5)
  {
    CACLogDictationCommands();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CACCommandRecognizerDictation handleDictation:].cold.1(v6);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDD1688]);
    objc_msgSend(v3, "recognizedParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (_QWORD *)MEMORY[0x24BEAFEF0];
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BEAFEF0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", kCACCommandParameterAttributedText);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "initWithAttributedString:", v11);

    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stagedTextInsertionSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInsertedCategoryID:", *v9);

    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v14, "dictationRecognizerMode");

    if (((_DWORD)v13 - 4) <= 0xFFFFFFFD)
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "doesCurrentLanguageSupportInterWordSpaces");

      if (v16)
      {
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "leadingTextForCurrentSelection");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bestLocaleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "vocabularyEntriesForLocaleIdentifier:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)objc_opt_new();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v23 = v21;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v35 != v26)
                objc_enumerationMutation(v23);
              objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "objectForKey:", CFSTR("Text"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v28);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v25);
        }

        +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "recognitionLocaleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v22, "copy");
        -[NSObject adjustCapsAndSpacingUsingLeadingText:localeIdentifier:vocabularyEntries:spellingGuessesBlock:](v6, "adjustCapsAndSpacingUsingLeadingText:localeIdentifier:vocabularyEntries:spellingGuessesBlock:", v33, v30, v31, &__block_literal_global_29);

      }
    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "insertDictatedAttributedString:", v6);

  }
}

id __49__CACCommandRecognizerDictation_handleDictation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;

  v8 = IMKIronwoodTextAlternativeCorrectedKey_block_invoke_textCheckerInialize;
  v9 = a5;
  v10 = a4;
  if (v8 != -1)
    dispatch_once(&IMKIronwoodTextAlternativeCorrectedKey_block_invoke_textCheckerInialize, &__block_literal_global_35);
  objc_msgSend((id)IMKIronwoodTextAlternativeCorrectedKey_block_invoke_sChecker, "guessesForWordRange:inString:language:", a2, a3, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __49__CACCommandRecognizerDictation_handleDictation___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)IMKIronwoodTextAlternativeCorrectedKey_block_invoke_sChecker;
  IMKIronwoodTextAlternativeCorrectedKey_block_invoke_sChecker = v0;

}

- (id)_attributedStringFromResult:(__RXLanguageObject *)a3
{
  void *v5;
  void *v6;
  CFLocaleRef v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_opt_new();
  if (-[CACCommandRecognizerDictation _adLibLanguageObjectFromLanguageModel:](self, "_adLibLanguageObjectFromLanguageModel:", a3))
  {
    +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFLocaleCreate(0, (CFLocaleIdentifier)objc_msgSend(v6, "recognitionLocaleIdentifier"));

    v8 = (void *)RXObjectCopyPropertyWithLocale();
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v8);
      objc_msgSend(v5, "appendAttributedString:", v9);

    }
    if (v7)
      CFRelease(v7);

  }
  return v5;
}

- (__RXLanguageObject)_adLibLanguageObjectFromLanguageModel:(__RXLanguageObject *)a3
{
  __RXLanguageObject *v3;
  uint64_t Count;
  uint64_t v6;
  uint64_t v7;
  __RXLanguageObject *v8;

  v3 = a3;
  if (a3 && RXLanguageObjectGetType() != 4)
  {
    Count = RXLanguageObjectGetCount();
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      v6 = Count;
      v7 = 0;
      while (1)
      {
        v8 = -[CACCommandRecognizerDictation _adLibLanguageObjectFromLanguageModel:](self, "_adLibLanguageObjectFromLanguageModel:", RXLanguageObjectGetObjectAtIndex());
        if (v8)
          break;
        if (v6 == ++v7)
          return 0;
      }
      return v8;
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootProfanityNode, 0);
}

- (void)handleDictation:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_229A40000, log, OS_LOG_TYPE_DEBUG, "Ignoring text, regular dictation is in use.", v1, 2u);
}

@end
