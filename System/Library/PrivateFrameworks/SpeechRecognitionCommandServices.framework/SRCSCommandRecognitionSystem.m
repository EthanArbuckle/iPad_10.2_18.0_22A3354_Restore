@implementation SRCSCommandRecognitionSystem

- (SRCSCommandRecognitionSystem)initWithLocaleIdentifier:(id)a3
{
  id v5;
  SRCSCommandRecognitionSystem *v6;
  uint64_t v7;
  NSMutableArray *recognizers;
  uint64_t v9;
  NSArray *targetTypes;
  uint64_t v11;
  NSMutableDictionary *resolvedBuiltInIdentifiers;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SRCSCommandRecognitionSystem;
  v6 = -[SRCSCommandRecognitionSystem init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    recognizers = v6->_recognizers;
    v6->_recognizers = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_localeIdentifier, a3);
    +[SRCSCommandStringsTable activeTargetTypes](SRCSCommandStringsTable, "activeTargetTypes");
    v9 = objc_claimAutoreleasedReturnValue();
    targetTypes = v6->_targetTypes;
    v6->_targetTypes = (NSArray *)v9;

    v11 = objc_opt_new();
    resolvedBuiltInIdentifiers = v6->_resolvedBuiltInIdentifiers;
    v6->_resolvedBuiltInIdentifiers = (NSMutableDictionary *)v11;

    -[SRCSCommandRecognitionSystem _initalizeLanguageModelTree](v6, "_initalizeLanguageModelTree");
    if (initWithLocaleIdentifier__staticInitialization != -1)
      dispatch_once(&initWithLocaleIdentifier__staticInitialization, &__block_literal_global_3);
  }

  return v6;
}

- (void)addRecognizer:(id)a3
{
  -[NSMutableArray addObject:](self->_recognizers, "addObject:", a3);
}

- (id)spokenCommandFromRecognizedEARTokenSausage:(__CFArray *)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CMDPResult *v17;
  SRCSCommandRecognitionSystem *v19;
  int v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = self;
  v5 = self->_recognizers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v10, "spokenCommands");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v24;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v24 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "fstGrammar");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                objc_msgSend(v4, "addObject:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  v17 = -[CMDPResult initWithTokenSausage:forLocaleIdentifier:]([CMDPResult alloc], "initWithTokenSausage:forLocaleIdentifier:", a3, v19->_localeIdentifier);
  v21 = -1082130432;
  v22 = -1;
  -[CMDPResult matchWithGrammars:winningIndex:winningDistance:](v17, "matchWithGrammars:winningIndex:winningDistance:", v4, &v22, &v21);

  return 0;
}

- (id)spokenCommandFromRecognizedAFSpeechPhrases:(id)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  CMDPResult *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t k;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  CMDPResult *v45;
  id v46;
  NSMutableArray *obj;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  SRCSCommandRecognitionSystem *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  int v67;
  int v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __CFString *v77;
  uint64_t v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v46 = a3;
  v4 = (void *)objc_opt_new();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v53 = self;
  v5 = self->_recognizers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v74 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        objc_msgSend(v10, "spokenCommands");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v70;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v70 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "fstGrammar");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                objc_msgSend(v4, "addObject:", v16);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
          }
          while (v13);
        }

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    }
    while (v7);
  }

  v17 = -[CMDPResult initWithAFSpeechPhraseArray:forLocaleIdentifier:]([CMDPResult alloc], "initWithAFSpeechPhraseArray:forLocaleIdentifier:", v46, v53->_localeIdentifier);
  v68 = -1;
  v67 = -1082130432;
  v45 = v17;
  -[CMDPResult matchWithGrammars:winningIndex:winningDistance:](v17, "matchWithGrammars:winningIndex:winningDistance:", v4, &v68, &v67);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "objectForKey:", kCMDPMatchedCommandIdentifier[0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v49 = v19;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      obj = v53->_recognizers;
      v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
      v21 = 0;
      if (v51)
      {
        v50 = *(_QWORD *)v64;
        v48 = v20;
        do
        {
          for (k = 0; k != v51; ++k)
          {
            if (*(_QWORD *)v64 != v50)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v62 = 0u;
            objc_msgSend(v23, "spokenCommands");
            v54 = (id)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v60;
              while (2)
              {
                for (m = 0; m != v25; ++m)
                {
                  if (*(_QWORD *)v60 != v26)
                    objc_enumerationMutation(v54);
                  v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * m);
                  objc_msgSend(v28, "identifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "isEqualToString:", v20);

                  if (v30)
                  {
                    v52 = k;
                    v31 = v28;

                    v32 = (void *)objc_opt_new();
                    v55 = 0u;
                    v56 = 0u;
                    v57 = 0u;
                    v58 = 0u;
                    objc_msgSend(v49, "objectForKey:", kCMDPMatchedElements[0]);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
                    if (v34)
                    {
                      v35 = v34;
                      v36 = *(_QWORD *)v56;
                      do
                      {
                        for (n = 0; n != v35; ++n)
                        {
                          if (*(_QWORD *)v56 != v36)
                            objc_enumerationMutation(v33);
                          v38 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * n);
                          objc_msgSend(v38, "objectForKey:", kCMDPMatchedElementCategoryIdentifier);
                          v39 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v39)
                          {
                            objc_msgSend(v38, "objectForKey:", kCMDPMatchedElementText[0]);
                            v40 = objc_claimAutoreleasedReturnValue();
                            v41 = (void *)v40;
                            if (v40)
                            {
                              v77 = kSRCSCommandParameterText;
                              v78 = v40;
                              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
                              v42 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v32, "setObject:forKey:", v42, v39);

                            }
                            objc_msgSend(v31, "setRecognizedParameters:", v32);

                          }
                        }
                        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
                      }
                      while (v35);
                    }

                    v21 = v31;
                    v20 = v48;
                    k = v52;
                    goto LABEL_45;
                  }
                }
                v25 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
                if (v25)
                  continue;
                break;
              }
            }
LABEL_45:

          }
          v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
        }
        while (v51);
      }

      v19 = v49;
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }
  v43 = v21;

  return v43;
}

- (id)languageModelTreeForBuiltInLMIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_resolvedBuiltInIdentifiers;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](self->_resolvedBuiltInIdentifiers, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)_initalizeLanguageModelTree
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t j;
  void *v20;
  id v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t k;
  void *v28;
  id v29;
  void *v30;
  NSMutableDictionary *v31;
  __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKey:", kSRCSCommandParameterTextSegmentCardinalNumber[0], kSRCSCommandParseDictionaryKeyIdentifier[0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKey:", v5, kSRCSCommandParseDictionaryKeyChildren[0]);
  for (i = 2; i != 201; ++i)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%ld"), i);
    v8 = objc_alloc(MEMORY[0x24BDBCE70]);
    v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v7, kSRCSCommandParseDictionaryKeyText[0], 0);
    objc_msgSend(v5, "addObject:", v9);

  }
  v10 = self->_resolvedBuiltInIdentifiers;
  objc_sync_enter(v10);
  -[NSMutableDictionary setObject:forKey:](self->_resolvedBuiltInIdentifiers, "setObject:forKey:", v3, kSRCSCommandParameterTextSegmentCardinalNumber[0]);
  objc_sync_exit(v10);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", kSRCSCommandParameterDeviceName[0], kSRCSCommandParseDictionaryKeyIdentifier[0]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, kSRCSCommandParseDictionaryKeyChildren[0]);
  +[SRCSCommandStringsTable deviceName](SRCSCommandStringsTable, "deviceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = kSRCSCommandParseDictionaryKeyText[0];
  v33[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v14);

  v15 = self->_resolvedBuiltInIdentifiers;
  objc_sync_enter(v15);
  -[NSMutableDictionary setObject:forKey:](self->_resolvedBuiltInIdentifiers, "setObject:forKey:", v11, kSRCSCommandParameterDeviceName[0]);
  objc_sync_exit(v15);

  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setObject:forKey:", kSRCSCommandParameterNumberTwoThroughNinetyNine[0], kSRCSCommandParseDictionaryKeyIdentifier[0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]);

  v18 = (void *)objc_opt_new();
  objc_msgSend(v16, "setObject:forKey:", v18, kSRCSCommandParseDictionaryKeyChildren[0]);
  for (j = 2; j != 100; ++j)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%ld"), j);
    v21 = objc_alloc(MEMORY[0x24BDBCE70]);
    v22 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", v20, kSRCSCommandParseDictionaryKeyText[0], 0);
    objc_msgSend(v18, "addObject:", v22);

  }
  v23 = self->_resolvedBuiltInIdentifiers;
  objc_sync_enter(v23);
  -[NSMutableDictionary setObject:forKey:](self->_resolvedBuiltInIdentifiers, "setObject:forKey:", v16, kSRCSCommandParameterNumberTwoThroughNinetyNine[0]);
  objc_sync_exit(v23);

  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setObject:forKey:", kSRCSCommandParameterNumberTwoThroughNinetyNine2[0], kSRCSCommandParseDictionaryKeyIdentifier[0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v25, kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]);

  v26 = (void *)objc_opt_new();
  objc_msgSend(v24, "setObject:forKey:", v26, kSRCSCommandParseDictionaryKeyChildren[0]);
  for (k = 2; k != 100; ++k)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%ld"), k);
    v29 = objc_alloc(MEMORY[0x24BDBCE70]);
    v30 = (void *)objc_msgSend(v29, "initWithObjectsAndKeys:", v28, kSRCSCommandParseDictionaryKeyText[0], 0);
    objc_msgSend(v26, "addObject:", v30);

  }
  v31 = self->_resolvedBuiltInIdentifiers;
  objc_sync_enter(v31);
  -[NSMutableDictionary setObject:forKey:](self->_resolvedBuiltInIdentifiers, "setObject:forKey:", v24, kSRCSCommandParameterNumberTwoThroughNinetyNine2[0]);
  objc_sync_exit(v31);

}

- (void)_testWithPhrases:(id)a3
{
  id v3;
  SRCSCommandRecognizer *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SRCSCommandRecognitionSystem *v14;

  v3 = a3;
  v14 = -[SRCSCommandRecognitionSystem initWithLocaleIdentifier:]([SRCSCommandRecognitionSystem alloc], "initWithLocaleIdentifier:", CFSTR("en-US"));
  v4 = -[SRCSCommandRecognizer initWithCommandRecognitionSystem:commandIdentifiers:]([SRCSCommandRecognizer alloc], "initWithCommandRecognitionSystem:commandIdentifiers:", v14, &unk_24F65AF50);
  -[SRCSCommandRecognizer setActive:](v4, "setActive:", 1);
  -[SRCSCommandRecognitionSystem spokenCommandFromRecognizedAFSpeechPhrases:](v14, "spokenCommandFromRecognizedAFSpeechPhrases:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Text.ChangePhrase"));

    if (v7)
    {
      objc_msgSend(v5, "recognizedParameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", kSRCSCommandParameterDictation[0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", kSRCSCommandParameterText);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "recognizedParameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", kSRCSCommandParameterDictation2[0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", kSRCSCommandParameterText);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      NSLog(CFSTR("%@,%@"), v10, v13);
    }
    else
    {
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "isEqualToString:", CFSTR("Text.SelectNextWord"));
    }

  }
}

- (NSArray)targetTypes
{
  return self->_targetTypes;
}

- (NSString)localeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)recognizers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedBuiltInIdentifiers, 0);
  objc_storeStrong((id *)&self->_recognizers, 0);
  objc_storeStrong((id *)&self->_targetTypes, 0);
}

@end
