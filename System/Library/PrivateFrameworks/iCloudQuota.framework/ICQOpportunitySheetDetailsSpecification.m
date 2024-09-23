@implementation ICQOpportunitySheetDetailsSpecification

- (void)makeMessageFromServerDict:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  uint64_t v18;
  NSDictionary *messagesInfo;
  ICQOpportunitySheetDetailsSpecification *v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = self;
    v21 = v5;
    v22 = v4;
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v6;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("key"), v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("format"));
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v13)
            v16 = v14 == 0;
          else
            v16 = 1;
          if (!v16
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v15, v13);
          }
          else
          {
            _ICQGetLogSystem();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v30 = (const __CFString *)v7;
              _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, "Malformed key/format properties in message property of opportunitySheet: %@", buf, 0xCu);
            }

          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    v18 = objc_msgSend(v23, "copy");
    messagesInfo = v20->_messagesInfo;
    v20->_messagesInfo = (NSDictionary *)v18;

    v5 = v21;
    v4 = v22;
  }
  else
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = CFSTR("message");
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Missing message property %@ in opportunityBubble: %@", buf, 0x16u);
    }
  }

}

- (id)messageForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICQOpportunitySheetDetailsSpecification messagesInfo](self, "messagesInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[ICQOpportunitySheetDetailsSpecification messagesInfo](self, "messagesInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("default"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSDictionary)messagesInfo
{
  return self->_messagesInfo;
}

- (void)setMessagesInfo:(id)a3
{
  objc_storeStrong((id *)&self->_messagesInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesInfo, 0);
}

@end
