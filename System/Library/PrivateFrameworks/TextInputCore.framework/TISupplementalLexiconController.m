@implementation TISupplementalLexiconController

- (TISupplementalLexiconController)initWithConnection:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  pid_t v11;
  dispatch_source_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD handler[4];
  id v19;
  id v20;
  id location;
  audit_token_t v22;
  audit_token_t atoken;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TISupplementalLexiconController;
  v5 = -[TISupplementalLexiconController init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    TINSXPCConnectionCodeSigningIdentifier(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v5 + 40) = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

    if (v4)
      objc_msgSend(v4, "auditToken");
    else
      memset(&atoken, 0, sizeof(atoken));
    *((_DWORD *)v5 + 11) = audit_token_to_pidversion(&atoken);
    v9 = objc_opt_new();
    v10 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v9;

    if (v4)
      objc_msgSend(v4, "auditToken");
    else
      memset(&v22, 0, sizeof(v22));
    v11 = audit_token_to_pid(&v22);
    v12 = dispatch_source_create(MEMORY[0x1E0C80DB0], v11, 0x80000000uLL, MEMORY[0x1E0C80D38]);
    v13 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v12;

    objc_initWeak(&location, v5);
    v14 = *((_QWORD *)v5 + 4);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __54__TISupplementalLexiconController_initWithConnection___block_invoke;
    handler[3] = &unk_1EA100C08;
    objc_copyWeak(&v20, &location);
    v15 = v5;
    v19 = v15;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_resume(*((dispatch_object_t *)v5 + 4));
    v16 = v15;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return (TISupplementalLexiconController *)v5;
}

- (void)addLexicon:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *entityStores;
  void *v12;
  NSMutableDictionary *lexicons;
  void *v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TISupplementalLexiconOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(v4, "identifier");
    objc_msgSend(v4, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v17 = v6;
    v18 = 2048;
    v19 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_INFO, "Add supplemental lexicon with identifier=%llu (#items=%lu)", buf, 0x16u);

  }
  -[TISupplementalLexiconController activeLexicon](self, "activeLexicon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_needsAtSignSearchPrefixQuirk && !objc_msgSend(v4, "searchPrefixes"))
    objc_msgSend(v4, "setSearchPrefixes:", 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Supplemental-%d-%llu"), self->_connectionIdentifier, objc_msgSend(v4, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  TICreateNamedEntityStore(v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  entityStores = self->_entityStores;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](entityStores, "setObject:forKeyedSubscript:", v10, v12);

  lexicons = self->_lexicons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](lexicons, "setObject:forKeyedSubscript:", v4, v14);

  -[TISupplementalLexiconController activeLexicon](self, "activeLexicon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v15)
    -[TISupplementalLexiconController _sendActiveLexiconDidChangeNotification](self);

}

- (void)removeLexiconWithIdentifier:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  NSMutableDictionary *entityStores;
  void *v8;
  NSMutableDictionary *lexicons;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  TISupplementalLexiconOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_INFO, "Remove supplemental lexicon with identifier=%llu", (uint8_t *)&v12, 0xCu);
  }

  -[TISupplementalLexiconController activeLexicon](self, "activeLexicon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_activeLexiconIdentifier == a3)
    self->_activeLexiconIdentifier = 0;
  entityStores = self->_entityStores;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](entityStores, "removeObjectForKey:", v8);

  lexicons = self->_lexicons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](lexicons, "removeObjectForKey:", v10);

  -[TISupplementalLexiconController activeLexicon](self, "activeLexicon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v11)
    -[TISupplementalLexiconController _sendActiveLexiconDidChangeNotification](self);

}

- (id)lexiconIdentifiers
{
  return (id)-[NSMutableDictionary allKeys](self->_entityStores, "allKeys");
}

- (TISupplementalLexicon)activeLexicon
{
  NSMutableDictionary *lexicons;
  void *v3;
  void *v4;

  if (self->_activeLexiconIdentifier)
  {
    lexicons = self->_lexicons;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](lexicons, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (TISupplementalLexicon *)v4;
}

- (void)setActiveLexiconWithIdentifier:(unint64_t)a3
{
  id v5;
  id v6;

  -[TISupplementalLexiconController activeLexicon](self, "activeLexicon");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  self->_activeLexiconIdentifier = a3;
  -[TISupplementalLexiconController activeLexicon](self, "activeLexicon");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
    -[TISupplementalLexiconController _sendActiveLexiconDidChangeNotification](self);

}

- (void)clearActiveLexicon
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  TISupplementalLexiconOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_INFO, "Clear active lexicon", v6, 2u);
  }

  -[TISupplementalLexiconController activeLexicon](self, "activeLexicon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_activeLexiconIdentifier = 0;
  -[TISupplementalLexiconController activeLexicon](self, "activeLexicon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
    -[TISupplementalLexiconController _sendActiveLexiconDidChangeNotification](self);

}

- (_LXLexicon)activeWordLexicon
{
  NSMutableDictionary *entityStores;
  void *v3;
  void *v4;
  void *v5;
  _LXLexicon *v6;

  if (!self->_activeLexiconIdentifier)
    return 0;
  entityStores = self->_entityStores;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](entityStores, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wordLexicon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_LXLexicon *)objc_msgSend(v5, "getLexiconImplementation");

  return v6;
}

- (_LXLexicon)activePhraseLexicon
{
  NSMutableDictionary *entityStores;
  void *v3;
  void *v4;
  void *v5;
  _LXLexicon *v6;

  if (!self->_activeLexiconIdentifier)
    return 0;
  entityStores = self->_entityStores;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](entityStores, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phraseLexicon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_LXLexicon *)objc_msgSend(v5, "getLexiconImplementation");

  return v6;
}

- (id)lexiconWithIdentifier:(unint64_t)a3
{
  NSMutableDictionary *lexicons;
  void *v4;
  void *v5;

  lexicons = self->_lexicons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](lexicons, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)identifiersOfItemsEqualToMecrabraCandidate:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *lexicons;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_activeLexiconIdentifier)
  {
    v5 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    lexicons = self->_lexicons;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_activeLexiconIdentifier, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](lexicons, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v14, "core_isEqualToMecabraCandidate:", v4))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v14, "identifier"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v15);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(v5, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (int)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (TISupplementalLexiconControllerDelegate)delegate
{
  return (TISupplementalLexiconControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_processExitDispatchSource, 0);
  objc_storeStrong((id *)&self->_entityStores, 0);
  objc_storeStrong((id *)&self->_lexicons, 0);
}

- (void)_sendActiveLexiconDidChangeNotification
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    TISupplementalLexiconOSLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1, "activeLexicon");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v11 = objc_msgSend(v3, "identifier");
      _os_log_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_INFO, "Active supplemental lexicon did change (active identifier=%llu)", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "activeLexicon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "activeLexicon", CFSTR("TIActiveLexiconDidChangeUserInfo_ActiveLexicon"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("TIActiveLexiconDidChangeNotification"), a1, v7);

    }
    else
    {
      objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("TIActiveLexiconDidChangeNotification"), a1, MEMORY[0x1E0C9AA70]);
    }

  }
}

void __54__TISupplementalLexiconController_initWithConnection___block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t v3;
  id v4;
  id v5;
  dispatch_source_t *v6;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    dispatch_source_cancel(WeakRetained[4]);
    v3 = v6[4];
    v6[4] = 0;

    v6[3] = 0;
    -[NSObject removeAllObjects](v6[2], "removeAllObjects");
    v4 = objc_loadWeakRetained((id *)v6 + 6);

    WeakRetained = v6;
    if (v4)
    {
      v5 = objc_loadWeakRetained((id *)v6 + 6);
      objc_msgSend(v5, "supplementalLexiconControllerProcessDidTerminate:", *(_QWORD *)(a1 + 32));

      WeakRetained = v6;
    }
  }

}

@end
