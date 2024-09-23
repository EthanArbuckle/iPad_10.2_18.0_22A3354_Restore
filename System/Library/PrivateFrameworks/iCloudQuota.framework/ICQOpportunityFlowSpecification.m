@implementation ICQOpportunityFlowSpecification

- (ICQOpportunityFlowSpecification)initWithServerDictionary:(id)a3
{
  id v4;
  ICQOpportunityFlowSpecification *v5;
  uint64_t v6;
  NSString *title;
  NSObject *v8;
  _ICQOpportunityBubbleImageDetails *v9;
  _ICQOpportunityBubbleImageDetails *imageDetails;
  ICQOpportunityFlowSpecification *v11;
  objc_class *v12;
  const char *Name;
  NSString *v14;
  NSObject *v15;
  objc_class *v16;
  const char *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICQOpportunityFlowSpecification;
  v5 = -[ICQOpportunityFlowSpecification init](&v19, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v6 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v5->_title)
    {
LABEL_14:
      v11 = 0;
      goto LABEL_15;
    }
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      Name = class_getName(v12);
      v14 = v5->_title;
      *(_DWORD *)buf = 136315394;
      v21 = Name;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageDetails"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v8)
    {
      _ICQGetLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class();
        v17 = class_getName(v16);
        *(_DWORD *)buf = 136315394;
        v21 = v17;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }

    }
    goto LABEL_13;
  }
  v9 = -[_ICQOpportunityBubbleImageDetails initWithServerDictionary:]([_ICQOpportunityBubbleImageDetails alloc], "initWithServerDictionary:", v8);
  imageDetails = v5->_imageDetails;
  v5->_imageDetails = v9;

  -[ICQOpportunityFlowSpecification makeMessageFromServerDict:](v5, "makeMessageFromServerDict:", v4);
  -[ICQOpportunityFlowSpecification makeActionsFromServerDict:](v5, "makeActionsFromServerDict:", v4);

LABEL_5:
  v11 = v5;
LABEL_15:

  return v11;
}

- (void)makeMessageFromServerDict:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_message, v5);
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = CFSTR("message");
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Missing message property %@ in opportunityBubble: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)makeActionsFromServerDict:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t i;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *actions;
  void *v25;
  NSObject *v26;
  ICQOpportunityFlowSpecification *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const __CFString *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = self;
    v28 = v5;
    v29 = v4;
    v6 = v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = v6;
    v33 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v36;
      v30 = v8;
      v31 = v7;
      while (2)
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v36 != v32)
            objc_enumerationMutation(v8);
          v10 = *(__CFString **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _ICQGetLogSystem();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v10;
              _os_log_impl(&dword_1CDEBD000, v26, OS_LOG_TYPE_DEFAULT, "Malformed actions property in opportunityBubble: %@", buf, 0xCu);
            }

            actions = (NSArray *)v8;
            v5 = v28;
            v4 = v29;
            v25 = v31;
            goto LABEL_28;
          }
          v11 = v10;
          -[__CFString objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("btnTitle"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            -[__CFString objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("btnAction"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = _ICQActionForServerActionString(v13);
            -[__CFString objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("btnActParams"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            _ICQActionParametersForServerActionParameters(v14, v15, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("btnId"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v13;
            if (v17)
            {
              if (v16)
                v18 = (void *)objc_msgSend(v16, "mutableCopy");
              else
                v18 = (void *)objc_opt_new();
              v20 = v18;
              objc_msgSend(v18, "setObject:forKey:", v17, CFSTR("ServerLinkId"));
              -[__CFString objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("btnDefault"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("btnDefault"));
              }
              v22 = objc_msgSend(v20, "copy");

              v16 = (void *)v22;
              v8 = v30;
              v7 = v31;
            }
            +[ICQLink linkWithText:options:action:parameters:](ICQLink, "linkWithText:options:action:parameters:", v12, 0, v14, v16);
            v19 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v19);

          }
          else
          {
            _ICQGetLogSystem();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v11;
              _os_log_impl(&dword_1CDEBD000, v19, OS_LOG_TYPE_DEFAULT, "Missing title from server action dictionary %@", buf, 0xCu);
            }
          }

        }
        v33 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v33)
          continue;
        break;
      }
    }

    v23 = objc_msgSend(v7, "copy");
    actions = v27->_actions;
    v27->_actions = (NSArray *)v23;
    v25 = v7;
    v5 = v28;
    v4 = v29;
LABEL_28:

  }
  else
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v41 = CFSTR("actions");
      v42 = 2112;
      v43 = v4;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Missing message property %@ in opportunityBubble: %@", buf, 0x16u);
    }
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (_ICQOpportunityBubbleImageDetails)imageDetails
{
  return self->_imageDetails;
}

- (void)setImageDetails:(id)a3
{
  objc_storeStrong((id *)&self->_imageDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDetails, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
