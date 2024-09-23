@implementation SRCSSpokenCommand

- (SRCSSpokenCommand)initWithIdentifier:(id)a3
{
  id v5;
  SRCSSpokenCommand *v6;
  SRCSSpokenCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRCSSpokenCommand;
  v6 = -[SRCSSpokenCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (SRCSSpokenCommand)initWithStrings:(id)a3
{
  NSArray *v4;
  void *v5;
  SRCSSpokenCommand *v6;
  NSArray *strings;

  v4 = (NSArray *)a3;
  -[SRCSSpokenCommand _uniqueCustomCommandIdentifier](self, "_uniqueCustomCommandIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SRCSSpokenCommand initWithIdentifier:](self, "initWithIdentifier:", v5);

  strings = v6->_strings;
  v6->_strings = v4;

  return v6;
}

- (id)_initWithSpokenCommand:(id)a3
{
  id v4;
  SRCSSpokenCommand *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSArray *strings;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRCSSpokenCommand;
  v5 = -[SRCSSpokenCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "strings");
    v8 = objc_claimAutoreleasedReturnValue();
    strings = v5->_strings;
    v5->_strings = (NSArray *)v8;

    objc_msgSend(v4, "commandRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_commandRecognizer, v10);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithSpokenCommand:", self);
}

- (id)commandRecognizer
{
  return objc_loadWeakRetained((id *)&self->_commandRecognizer);
}

- (void)setCommandRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_commandRecognizer, a3);
}

- (NSArray)strings
{
  return self->_strings;
}

- (id)languageModelTree
{
  SRCSSpokenCommand *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *p_super;
  NSString *identifier;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSString *v18;
  NSMutableDictionary *v19;
  NSString *v20;
  NSMutableDictionary *v21;
  id v23;
  id v24;
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_languageModelTree)
  {
    if (-[NSArray count](v2->_strings, "count"))
    {
      -[NSArray componentsJoinedByString:](v2->_strings, "componentsJoinedByString:", CFSTR("|"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      +[SRCSCommandStringsTable languageModelDictionaryFromCommandText:parsingErrorString:](SRCSCommandStringsTable, "languageModelDictionaryFromCommandText:parsingErrorString:", v3, &v24);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v24;

      if (v4 && !-[NSObject length](v5, "length"))
      {
        objc_msgSend(v4, "setObject:forKey:", v2->_identifier, kSRCSCommandParseDictionaryKeyIdentifier[0]);
        v19 = v4;
        p_super = &v2->_languageModelTree->super.super;
        v2->_languageModelTree = v19;
      }
      else
      {
        SRCSLogGeneral();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          identifier = v2->_identifier;
          -[NSArray componentsJoinedByString:](v2->_strings, "componentsJoinedByString:", CFSTR("|"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v26 = identifier;
          v27 = 2112;
          v28 = v8;
          v29 = 2112;
          v30 = v5;
          _os_log_impl(&dword_22BD8C000, p_super, OS_LOG_TYPE_DEFAULT, "Error found while creating language model for (%@) \"%@\": %@", buf, 0x20u);

        }
      }

    }
    else if (-[NSString length](v2->_identifier, "length"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&v2->_commandRecognizer);
      objc_msgSend(WeakRetained, "commandRecognitionSystem");
      v5 = objc_claimAutoreleasedReturnValue();

      +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities](SRCSSpokenCommandUtilities, "sharedSpokenCommandUtilities");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject localeIdentifier](v5, "localeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "commandStringsTableForLocaleIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v2->_identifier;
      -[NSObject targetTypes](v5, "targetTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v12, "languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:", v13, v14, &v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v23;

      if (v15 && !objc_msgSend(v16, "length"))
      {
        objc_msgSend(v15, "setObject:forKey:", v2->_identifier, kSRCSCommandParseDictionaryKeyIdentifier[0]);
        v21 = v15;
        v17 = &v2->_languageModelTree->super.super;
        v2->_languageModelTree = v21;
      }
      else
      {
        SRCSLogGeneral();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v2->_identifier;
          *(_DWORD *)buf = 138412546;
          v26 = v18;
          v27 = 2112;
          v28 = v16;
          _os_log_impl(&dword_22BD8C000, v17, OS_LOG_TYPE_DEFAULT, "Error found while creating language model for %@: %@", buf, 0x16u);
        }
      }

    }
    else
    {
      SRCSLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v2->_identifier;
        *(_DWORD *)buf = 138412290;
        v26 = v20;
        _os_log_impl(&dword_22BD8C000, v5, OS_LOG_TYPE_DEFAULT, "Error found while creating language model for %@", buf, 0xCu);
      }
    }

    if (v2->_languageModelTree)
      -[SRCSSpokenCommand _replaceBuiltInIdentiferNodesWithSubTreesInMutableLM:](v2, "_replaceBuiltInIdentiferNodesWithSubTreesInMutableLM:");
  }
  objc_sync_exit(v2);

  return v2->_languageModelTree;
}

- (void)_replaceBuiltInIdentiferNodesWithSubTreesInMutableLM:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "BOOLValue"))
  {
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyIdentifier[0]);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v5 = (void *)v8;
      WeakRetained = objc_loadWeakRetained((id *)&self->_commandRecognizer);
      objc_msgSend(WeakRetained, "commandRecognitionSystem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "languageModelTreeForBuiltInLMIdentifier:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v4, "removeAllObjects");
        objc_msgSend(v4, "addEntriesFromDictionary:", v11);
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0], 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[SRCSSpokenCommand _replaceBuiltInIdentiferNodesWithSubTreesInMutableLM:](self, "_replaceBuiltInIdentiferNodesWithSubTreesInMutableLM:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (id)fstGrammar
{
  SRCSSpokenCommand *v2;
  void *v3;
  CMDPGrammar *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id fstGrammar;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_fstGrammar)
  {
    -[SRCSSpokenCommand languageModelTree](v2, "languageModelTree");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = [CMDPGrammar alloc];
      WeakRetained = objc_loadWeakRetained((id *)&v2->_commandRecognizer);
      objc_msgSend(WeakRetained, "commandRecognitionSystem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CMDPGrammar initWithCommandTreeDictionary:forLocaleIdentifier:](v4, "initWithCommandTreeDictionary:forLocaleIdentifier:", v3, v7);
      fstGrammar = v2->_fstGrammar;
      v2->_fstGrammar = (id)v8;

    }
  }
  objc_sync_exit(v2);

  return v2->_fstGrammar;
}

- (id)_uniqueCustomCommandIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Custom.%lf"), CFAbsoluteTimeGetCurrent());
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SRCSSpokenCommand identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSSpokenCommand strings](self, "strings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@, Rec Params: %@"), v4, v5, self->_recognizedParameters);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)recognizedParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRecognizedParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandRecognizer);
  objc_storeStrong(&self->_fstGrammar, 0);
  objc_storeStrong((id *)&self->_languageModelTree, 0);
  objc_storeStrong((id *)&self->_recognizedParameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_strings, 0);
}

@end
