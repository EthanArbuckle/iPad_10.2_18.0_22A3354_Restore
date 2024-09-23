@implementation CACCommandRecognizer

- (CACCommandRecognizer)initWithCommands:(id)a3 contextEvaluators:(id)a4 builtInLMIdentifiers:(id)a5
{
  id v9;
  id v10;
  id v11;
  CACCommandRecognizer *v12;
  uint64_t v13;
  CACSpeechRecognizer *speechRecognizer;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[CACCommandRecognizer init](self, "init");
  if (v12)
  {
    v13 = objc_opt_new();
    speechRecognizer = v12->_speechRecognizer;
    v12->_speechRecognizer = (CACSpeechRecognizer *)v13;

    -[CACSpeechRecognizer setDelegate:](v12->_speechRecognizer, "setDelegate:", v12);
    objc_storeStrong((id *)&v12->_spokenCommandsCache, a3);
    objc_storeStrong((id *)&v12->_contextEvaluators, a4);
    objc_storeStrong((id *)&v12->_builtInLMIdentifiers, a5);
    -[CACCommandRecognizer _synchronizeSpeechRecognizerSettings](v12, "_synchronizeSpeechRecognizerSettings");
    -[CACCommandRecognizer _buildLanguageModelUsingCommands](v12, "_buildLanguageModelUsingCommands");
  }

  return v12;
}

- (void)synchronizeWithReason:(id)a3
{
  CACCommandRecognizer *v4;
  void *v5;
  _BOOL4 v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isListening"))
  {

    goto LABEL_5;
  }
  v6 = -[CACCommandRecognizer isAppropriateForContext](v4, "isAppropriateForContext");

  if (!v6)
  {
LABEL_5:
    -[CACCommandRecognizer stopListening](v4, "stopListening");
    goto LABEL_6;
  }
  -[CACCommandRecognizer _synchronizeSpeechRecognizerSettings](v4, "_synchronizeSpeechRecognizerSettings");
  -[CACCommandRecognizer startListening](v4, "startListening");
LABEL_6:
  objc_sync_exit(v4);

}

- (void)_synchronizeSpeechRecognizerSettings
{
  void *v3;
  int v4;
  CACSpeechRecognizer *speechRecognizer;
  void *v6;
  void *v7;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dictationRecognizerMode");

  speechRecognizer = self->_speechRecognizer;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "userHintsFeatures") & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_contextEvaluators, "objectForKey:", kCACCommandContextPreventCloseMatchResults);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpeechRecognizer setRequestCloseMatchResults:](speechRecognizer, "setRequestCloseMatchResults:", objc_msgSend(v7, "BOOLValue") ^ 1);

  }
  else
  {
    -[CACSpeechRecognizer setRequestCloseMatchResults:](speechRecognizer, "setRequestCloseMatchResults:", 0);
  }

  -[CACSpeechRecognizer setSpellingMode:](self->_speechRecognizer, "setSpellingMode:", v4 == 3);
}

- (void)_buildLanguageModelUsingCommands
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_spokenCommandsCache;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(v9, "setCommandRecognizer:", self, (_QWORD)v11);
        objc_msgSend(v9, "languageModel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addChildLanguageModel:", v10);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[CACSpeechRecognizer setLanguageModel:](self->_speechRecognizer, "setLanguageModel:", v3);
}

- (BOOL)isAppropriateForContext
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "forceAllCommandsToBeActive");

  if ((v4 & 1) != 0)
    return 1;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSDictionary allKeys](self->_contextEvaluators, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_contextEvaluators, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = +[CACSpokenCommandManager doesEvaluatorKey:matchValue:](CACSpokenCommandManager, "doesEvaluatorKey:matchValue:", v11, v12);

        if (!(_DWORD)v11)
        {
          v5 = 0;
          goto LABEL_19;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "currentInteractionLevel"))
  {
    -[NSDictionary objectForKey:](self->_contextEvaluators, "objectForKey:", kCACCommandContextRequiresInteractionLevel);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      -[NSDictionary objectForKey:](self->_contextEvaluators, "objectForKey:", kCACCommandContextSupportsInteractionLevel);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        return 0;
      goto LABEL_15;
    }

  }
LABEL_15:
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "carPlayConnected"))
  {
    -[NSDictionary objectForKey:](self->_contextEvaluators, "objectForKey:", kCACCommandContextSupportsCarPlay);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15 != 0;

  }
  else
  {
    v5 = 1;
  }
LABEL_19:

  return v5;
}

- (void)startListening
{
  id v2;

  -[CACCommandRecognizer speechRecognizer](self, "speechRecognizer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startListening");

}

- (void)stopListening
{
  id v2;

  -[CACCommandRecognizer speechRecognizer](self, "speechRecognizer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopListening");

}

- (BOOL)isListening
{
  return -[CACSpeechRecognizer isListening](self->_speechRecognizer, "isListening");
}

- (void)handleSpokenCommand:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  CACLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CACCommandRecognizer handleSpokenCommand:].cold.1(v3, v4);

}

- (void)speechRecognizer:(id)a3 didRecognizeRXResult:(__RXLanguageObject *)a4
{
  id v6;
  uint64_t ObjectAtIndex;
  void *v8;
  void *v9;
  int Type;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  NSArray *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  CACCommandRecognizer *v69;
  NSArray *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  char v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 && RXLanguageObjectGetCount() == 1)
  {
    ObjectAtIndex = RXLanguageObjectGetObjectAtIndex();
    +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resultLanguageModelFromRXLanguageObject:", ObjectAtIndex);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    Type = RXLanguageObjectGetType();
    if (Type != 6)
    {
      if (Type == 5)
      {
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v11 = self->_spokenCommandsCache;
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
        if (!v12)
          goto LABEL_52;
        v13 = v12;
        v72 = v6;
        v14 = *(_QWORD *)v88;
LABEL_7:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v88 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v15);
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if (v19)
            break;
          if (v13 == ++v15)
          {
            v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
            if (v13)
              goto LABEL_7;
            v6 = v72;
            goto LABEL_52;
          }
        }
        v47 = v11;
        v48 = v9;
        -[CACCommandRecognizer commandParametersFromCACLanguageModel:](self, "commandParametersFromCACLanguageModel:", v9);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setRecognizedParameters:", v49);

        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "stopAnyRepeatingSpokenCommand");

        +[CACRecordedUserActionManager sharedManager](CACRecordedUserActionManager, "sharedManager");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "cancelExecution");

        +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "isConfirmationRequiredForCommandIdentifier:", v53))
        {
          +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v54, "isDisplayingConfirmationModalAlert") & 1) == 0)
          {
            +[CACRecordedUserActionManager sharedManager](CACRecordedUserActionManager, "sharedManager");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v55, "isRecording") & 1) == 0)
            {
              +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "commandRecognitionLogPath");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v57)
              {
                +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = objc_msgSend(v80, "usingAutomationMode");

                if ((v82 & 1) == 0)
                {
                  objc_msgSend(v16, "recognizedParameters");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  +[CACSpokenCommand attributedStringFromRecognizedCommandParameters:variantOverrides:](CACSpokenCommand, "attributedStringFromRecognizedCommandParameters:variantOverrides:", v58, 0);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "string");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();

                  v60 = (void *)MEMORY[0x24BDD17C8];
                  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ConfirmationAlertDescription.CommandStringFormat"));
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "stringWithValidatedFormat:validFormatSpecifiers:error:", v61, CFSTR("%@"), 0, v45);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();

                  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ConfirmationAlertTitle.ExecuteThisCommand"));
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ConfirmationAlertButton.Execute"));
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommonStrings.Cancel"));
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  v67 = (void *)objc_msgSend(v16, "copy");
                  objc_msgSend(v63, "presentModalAlertWithTitle:description:okButtonText:cancelButtonText:object:okButtonHandler:", v64, v62, v65, v66, v67, &__block_literal_global_19);

                  goto LABEL_50;
                }
LABEL_49:
                +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "handleRecognizedCommand:", v16);
LABEL_50:
                v6 = v72;
                v9 = v48;
                v11 = v47;
                goto LABEL_51;
              }

            }
          }

        }
        goto LABEL_49;
      }
      goto LABEL_53;
    }
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (-[CACCommandRecognizer isListening](self, "isListening")
      && (-[NSArray userHintsFeatures](v11, "userHintsFeatures") & 1) != 0)
    {
      v73 = v6;
      -[NSArray bestLocaleIdentifier](v11, "bestLocaleIdentifier");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray builtInCommandsStringsTableForLocaleIdentifier:](v11, "builtInCommandsStringsTableForLocaleIdentifier:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (void *)objc_opt_new();
      v76 = (void *)RXObjectCopyProperty();
      v75 = objc_msgSend(v76, "count");
      v21 = 0x24F2A9000uLL;
      if (v75 >= 1)
      {
        v22 = 0;
        v23 = (_QWORD *)MEMORY[0x24BEAFF30];
        v70 = v11;
        v71 = v9;
        v69 = self;
        while (1)
        {
          v77 = v22;
          objc_msgSend(v76, "objectAtIndex:");
          v24 = RXLanguageObjectGetObjectAtIndex();
          objc_msgSend(*(id *)(v21 + 2296), "speechSystem");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "resultLanguageModelFromRXLanguageObject:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v81 = (void *)objc_opt_new();
          -[CACCommandRecognizer commandParametersFromCACLanguageModel:](self, "commandParametersFromCACLanguageModel:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_alloc(MEMORY[0x24BDD16A8]);
          v78 = v26;
          objc_msgSend(v26, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v28, "initWithString:", v29);

          if (!objc_msgSend(v30, "length") || (objc_msgSend(&unk_24F2CF560, "containsObject:", v30) & 1) != 0)
            goto LABEL_38;
          v79 = v30;
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          objc_msgSend(v27, "allKeys");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v84;
            do
            {
              for (i = 0; i != v33; ++i)
              {
                if (*(_QWORD *)v84 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
                if ((objc_msgSend(v36, "isEqualToString:", *v23) & 1) != 0
                  || objc_msgSend(v36, "isEqualToString:", *MEMORY[0x24BEAFF50]))
                {
                  objc_msgSend(v27, "objectForKey:", v36);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "objectForKey:", kCACCommandParameterText);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v20, "objectForKey:", v36);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v38, "length") && objc_msgSend(v39, "length"))
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@>"), v39);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "setObject:forKey:", v38, v40);

                    objc_msgSend(v79, "appendFormat:", CFSTR("_%@"), v38);
                  }

                }
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
            }
            while (v33);
          }

          objc_msgSend(v78, "identifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v74, "containsObject:", v41) & 1) != 0)
            break;
          +[CACUserHintsManager sharedManager](CACUserHintsManager, "sharedManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v79;
          v43 = objc_msgSend(v42, "shouldDisplayUserHintAfterRegisteringIdentifier:", v79);

          v11 = v70;
          v9 = v71;
          self = v69;
          v21 = 0x24F2A9000;
          if (v43)
          {
            objc_msgSend(v78, "identifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            +[CACCommandRecognizer _accumulateCloseMatchUsingCommandIdentifier:substitutionTable:](CACCommandRecognizer, "_accumulateCloseMatchUsingCommandIdentifier:substitutionTable:", v44, v81);

            v30 = v79;
            objc_msgSend(v78, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "addObject:", v41);
            goto LABEL_37;
          }
LABEL_38:

          v22 = v77 + 1;
          if (v77 + 1 == v75)
            goto LABEL_39;
        }
        v11 = v70;
        v9 = v71;
        self = v69;
        v30 = v79;
LABEL_37:

        v21 = 0x24F2A9000;
        goto LABEL_38;
      }
LABEL_39:

      v6 = v73;
    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACCommandRecognizer speechRecognizer](self, "speechRecognizer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "registerSignPostEndProcessingForSpeechRecognizer:message:", v46, CFSTR("Close Result."));

LABEL_51:
LABEL_52:

LABEL_53:
  }

}

void __62__CACCommandRecognizer_speechRecognizer_didRecognizeRXResult___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  dispatch_time_t v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__CACCommandRecognizer_speechRecognizer_didRecognizeRXResult___block_invoke_2;
  block[3] = &unk_24F2AA860;
  v6 = v2;
  v4 = v2;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);

}

void __62__CACCommandRecognizer_speechRecognizer_didRecognizeRXResult___block_invoke_2(uint64_t a1)
{
  id v2;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleRecognizedCommand:", *(_QWORD *)(a1 + 32));

}

- (id)commandParametersFromCACLanguageModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[CACCommandRecognizer _commandParametersFromCACLanguageModel:](self, "_commandParametersFromCACLanguageModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCommandRecognizer commandTextSequenceFromCACLanguageModel:](self, "commandTextSequenceFromCACLanguageModel:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKey:", v6, kCACCommandParameterTextSequence);
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "dictationRecognizerMode");

  if (v8 == 3)
    objc_msgSend(v5, "setObject:forKey:", &unk_24F2CEB60, CFSTR("SRCSClientDictationRecognizerModeIsSpelling"));

  return v5;
}

- (id)_commandParametersFromCACLanguageModel:(id)a3
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v5, "setObject:forKey:", v6, kCACCommandParameterText);
  v28 = v6;
  objc_msgSend(v4, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", kCACLanguageModelAttributeTextVariants);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", kCACLanguageModelAttributeTextVariants);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, kCACCommandParameterTextVariants);

  }
  objc_msgSend(v4, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", kCACLanguageModelAttributeCommandParameters);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
    objc_msgSend(v5, "addEntriesFromDictionary:", v12);
  v27 = v12;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = v4;
  objc_msgSend(v4, "children");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[CACCommandRecognizer _commandParametersFromCACLanguageModel:](self, "_commandParametersFromCACLanguageModel:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "count"))
        {
          if (objc_msgSend(v20, "length"))
          {
            objc_msgSend(v5, "setObject:forKey:", v19, v20);
          }
          else
          {
            objc_msgSend(v5, "objectForKey:", kCACCommandParameterText);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
              objc_msgSend(v19, "removeObjectForKey:", kCACCommandParameterText);
            objc_msgSend(v5, "addEntriesFromDictionary:", v19);
          }
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v15);
  }

  objc_msgSend(v29, "attributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", kCACLanguageModelAttributeProxyIdentifier);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (_QWORD *)MEMORY[0x24BEAFF20];
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEAFF20]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v5, "setObject:forKey:", v25, *MEMORY[0x24BEAFF28]);
      objc_msgSend(v5, "removeObjectForKey:", *v24);
    }

  }
  return v5;
}

- (id)commandTextSequenceFromCACLanguageModel:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v6, "setObject:forKey:", v7, kCACCommandParameterText);
  objc_msgSend(v4, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", kCACLanguageModelAttributeTextVariants);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v32 = v6;
      objc_msgSend(v10, "addObject:", v7);
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v4, "attributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", kCACLanguageModelAttributeTextVariants);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v38 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            if ((objc_msgSend(v17, "isEqualToString:", v7) & 1) == 0)
              objc_msgSend(v10, "addObject:", v17);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v14);
      }

      v6 = v32;
      objc_msgSend(v32, "setObject:forKey:", v10, kCACCommandParameterTextVariants);
    }
    else
    {
      objc_msgSend(v4, "attributes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", kCACLanguageModelAttributeTextVariants);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v19, kCACCommandParameterTextVariants);

    }
  }
  objc_msgSend(v4, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
    objc_msgSend(v4, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v22, kCACCommandParameterBuiltInIdentifier);

  }
  objc_msgSend(v4, "children");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v4, "children");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(v25);
          -[CACCommandRecognizer commandTextSequenceFromCACLanguageModel:](self, "commandTextSequenceFromCACLanguageModel:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v27);
    }

  }
  else
  {
    objc_msgSend(v5, "addObject:", v6);
  }

  return v5;
}

- (id)commandStrings
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_spokenCommandsCache;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "strings", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)objectForContextEvaluatorKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_contextEvaluators, "objectForKey:", a3);
}

+ (void)_accumulateCloseMatchUsingCommandIdentifier:(id)a3 substitutionTable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  if (gAccumulatedCloseMatchesForDisplay)
  {
    objc_msgSend((id)gAccumulatedCloseMatchesForDisplay, "setObject:forKey:", v7, v6);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__CACCommandRecognizer__accumulateCloseMatchUsingCommandIdentifier_substitutionTable___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  objc_sync_exit(v8);

}

uint64_t __86__CACCommandRecognizer__accumulateCloseMatchUsingCommandIdentifier_substitutionTable___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__showHintWithAccumulateCloseMatches, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__showHintWithAccumulateCloseMatches, 0, 0.25);
}

+ (void)resetCloseMatchAccumulator
{
  uint64_t v2;
  void *v3;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v2 = objc_opt_new();
  v3 = (void *)gAccumulatedCloseMatchesForDisplay;
  gAccumulatedCloseMatchesForDisplay = v2;

  objc_sync_exit(obj);
}

+ (void)suspendCloseMatchAccumulatorForCommand
{
  void *v3;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel__showHintWithAccumulateCloseMatches, 0);
  v3 = (void *)gAccumulatedCloseMatchesForDisplay;
  gAccumulatedCloseMatchesForDisplay = 0;

  objc_sync_exit(obj);
}

+ (void)_showHintWithAccumulateCloseMatches
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  int64_t v27;
  dispatch_time_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  id v34;
  void *v35;
  uint64_t v36;
  _QWORD block[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if (objc_msgSend((id)gAccumulatedCloseMatchesForDisplay, "count"))
  {
    v35 = (void *)objc_opt_new();
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "builtInCommandsTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("HistoricalCommandFrequencies"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)gAccumulatedCloseMatchesForDisplay, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke;
    v47[3] = &unk_24F2AB2A0;
    v6 = v4;
    v48 = v6;
    objc_msgSend(v5, "sortedArrayUsingComparator:", v47);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v34 = v7;
    v8 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    v32 = v6;
    if (v8)
    {
      v36 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(v34);
          v10 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend((id)gAccumulatedCloseMatchesForDisplay, "objectForKey:", v10, v32);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_alloc(MEMORY[0x24BDD16A8]);
          +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "primaryStringForCommandIdentifier:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v12, "initWithString:", v14);

          if (objc_msgSend(v15, "length"))
          {
            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            objc_msgSend(v11, "allKeys");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
            if (v17)
            {
              v18 = *(_QWORD *)v40;
              do
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v40 != v18)
                    objc_enumerationMutation(v16);
                  v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
                  objc_msgSend(v11, "objectForKey:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "replaceOccurrencesOfString:withString:options:range:", v20, v21, 0, 0, objc_msgSend(v15, "length"));

                }
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
              }
              while (v17);
            }

            objc_msgSend(v35, "addObject:", v15);
          }

        }
        v8 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v8);
    }

    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastDictationInsertionTimeStamp");
    v24 = v23;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v26 = v24 + 1.0 > v25;

    if (v26)
      v27 = 1000000000;
    else
      v27 = 10000;
    v28 = dispatch_time(0, v27);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke_2;
    block[3] = &unk_24F2AA860;
    v29 = v35;
    v38 = v29;
    dispatch_after(v28, MEMORY[0x24BDAC9B8], block);
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)gAccumulatedCloseMatchesForDisplay, "allKeys");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "didFindCloseSpokenCommandIdentifiers:", v31);

  }
  objc_sync_exit(obj);

}

uint64_t __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "floatValue");
  v12 = v11;

  if (v9 >= v12)
    v13 = 0;
  else
    v13 = -1;
  if (v9 > v12)
    return 1;
  else
    return v13;
}

void __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  id obja;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 2)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD17C8];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ClosestMatchingCommand"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obja, "displayMessageString:type:announcementCompletion:", v18, 4, &__block_literal_global_231);

  }
  else
  {
    v2 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = *(id *)(a1 + 32);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v22;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v6);
          v8 = (void *)MEMORY[0x24BDD17C8];
          +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ClosestMatchingMultipleCommandEntry"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendString:", v10);

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v4);
    }

    v11 = (void *)MEMORY[0x24BDD17C8];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ClosestMatchingMultipleCommands"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayMessageString:type:announcementCompletion:", v13, 4, &__block_literal_global_228);

  }
}

void __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke_3()
{
  id v0;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "speakVoiceOverDescriptionForActiveOverlayIfNeeded");

}

void __59__CACCommandRecognizer__showHintWithAccumulateCloseMatches__block_invoke_4()
{
  id v0;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "speakVoiceOverDescriptionForActiveOverlayIfNeeded");

}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)owner
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setOwner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CACSpeechRecognizer)speechRecognizer
{
  return (CACSpeechRecognizer *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)spokenCommands
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builtInLMIdentifiers, 0);
  objc_storeStrong((id *)&self->_contextEvaluators, 0);
  objc_storeStrong((id *)&self->_spokenCommandsCache, 0);
  objc_storeStrong((id *)&self->_speechRecognizer, 0);
  objc_storeStrong(&self->_owner, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)handleSpokenCommand:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_229A40000, a2, OS_LOG_TYPE_ERROR, "Unsupported command action handler: %@", (uint8_t *)&v4, 0xCu);

}

@end
