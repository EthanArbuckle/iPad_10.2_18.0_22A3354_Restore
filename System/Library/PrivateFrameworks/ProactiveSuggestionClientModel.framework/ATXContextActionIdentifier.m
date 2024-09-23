@implementation ATXContextActionIdentifier

- (NSString)uniqueIdentifier
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@:%@"), self->_context, self->_subtype, self->_instanceId);
}

- (ATXContextActionIdentifier)initWithContext:(id)a3 subtype:(id)a4 instanceIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXContextActionIdentifier *v12;
  ATXContextActionIdentifier *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXContextActionIdentifier;
  v12 = -[ATXContextActionIdentifier init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_subtype, a4);
    objc_storeStrong((id *)&v13->_instanceId, a5);
  }

  return v13;
}

- (ATXContextActionIdentifier)initWithContext:(id)a3 subType:(id)a4 instanceIdentifierInteger:(unint64_t)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  ATXContextActionIdentifier *v12;

  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithFormat:", CFSTR("%lu"), a5);
  v12 = -[ATXContextActionIdentifier initWithContext:subtype:instanceIdentifier:](self, "initWithContext:subtype:instanceIdentifier:", v10, v9, v11);

  return v12;
}

- (ATXContextActionIdentifier)initWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  ATXContextActionIdentifier *v10;
  NSObject *v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 3)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](v7, "length") && objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
      {
        self = -[ATXContextActionIdentifier initWithContext:subtype:instanceIdentifier:](self, "initWithContext:subtype:instanceIdentifier:", v7, v8, v9);
        v10 = self;
      }
      else
      {
        __atxlog_handle_blending();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[ATXContextActionIdentifier initWithUniqueIdentifier:].cold.1();

        v10 = 0;
      }

    }
    else
    {
      __atxlog_handle_blending();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[ATXContextActionIdentifier initWithUniqueIdentifier:].cold.2();
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ATXContextActionIdentifier)initWithProactiveSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  ATXContextActionIdentifier *v36;
  NSObject *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  NSObject *v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "executableSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "executableType");

    switch(v7)
    {
      case 0:
      case 1:
      case 3:
      case 4:
      case 6:
      case 7:
      case 10:
      case 11:
        __atxlog_handle_blending();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          -[ATXContextActionIdentifier initWithProactiveSuggestion:].cold.1(v5, v8);
        break;
      case 2:
        v11 = (void *)objc_opt_class();
        objc_msgSend(v5, "uiSpecification");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_stringsWithPredictionReasons:", objc_msgSend(v12, "predictionReasons"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v8 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "atxActionExecutableObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "actionType");

        if (v15)
        {
          objc_msgSend(v5, "atxActionExecutableObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "actionType");

          if (v17 == 1)
            v9 = CFSTR("NSUA");
          else
            v9 = 0;
        }
        else
        {
          v9 = CFSTR("Intent");
        }
        goto LABEL_17;
      case 5:
        v18 = (void *)objc_opt_class();
        objc_msgSend(v5, "uiSpecification");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_stringsWithPredictionReasons:", objc_msgSend(v19, "predictionReasons"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v8 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "executableSpecification");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "executableIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v22, "hash");

        v9 = CFSTR("AppClip");
        goto LABEL_18;
      case 8:
        v23 = (void *)objc_opt_class();
        objc_msgSend(v5, "uiSpecification");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "_stringsWithPredictionReasons:", objc_msgSend(v24, "predictionReasons"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v8 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)objc_opt_class();
        objc_msgSend(v5, "executableSpecification");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "executableIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "actionTypeFromSpotlightActionType:", v28);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_17:
        objc_msgSend(v5, "executableSpecification");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "executableIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v35, "hash");

        goto LABEL_18;
      case 9:
        objc_msgSend(v5, "uiSpecification");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "predictionReasons");

        if (v30)
        {
          v31 = (void *)objc_opt_class();
          objc_msgSend(v5, "uiSpecification");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "_stringsWithPredictionReasons:", objc_msgSend(v32, "predictionReasons"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "firstObject");
          v8 = objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)objc_opt_class(), "_actionTypeFromShortcutsActionSuggestion:", v5);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend((id)objc_opt_class(), "_instanceIdentifierFromShortcutsActionSuggestion:", v5);
LABEL_18:
          if (-[NSObject length](v8, "length") && -[__CFString length](v9, "length") && v10)
          {
            self = -[ATXContextActionIdentifier initWithContext:subType:instanceIdentifierInteger:](self, "initWithContext:subType:instanceIdentifierInteger:", v8, v9, v10);

            v36 = self;
            goto LABEL_27;
          }
          __atxlog_handle_blending();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v5, "executableSpecification");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "executableClassString");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "executableSpecification");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "executableIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "uiSpecification");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413570;
            v46 = v40;
            v47 = 2112;
            v48 = v8;
            v49 = 2112;
            v50 = v9;
            v51 = 2048;
            v52 = v10;
            v53 = 2112;
            v54 = v42;
            v55 = 2048;
            v56 = objc_msgSend(v43, "predictionReasons");
            _os_log_fault_impl(&dword_1AA841000, v37, OS_LOG_TYPE_FAULT, "ATXContextActionIdentifier suggestion unhandled: %@: %@, %@, %lu, %@, %llu", buf, 0x3Eu);

          }
          goto LABEL_25;
        }
        __atxlog_handle_blending();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "executableSpecification");
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString executableIdentifier](v9, "executableIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v46 = v39;
          _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, "ATXContextActionIdentifier: App Shortcut skipped: %@", buf, 0xCu);

LABEL_25:
          break;
        }
        break;
      default:
        v8 = 0;
        v9 = 0;
        v10 = 0;
        goto LABEL_18;
    }
  }
  else
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, "ATXContextActionIdentifier suggestion is nil", buf, 2u);
    }
  }
  v36 = 0;
LABEL_27:

  return v36;
}

+ (id)actionTypeFromSpotlightActionType:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(&unk_1E57EC650, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
      if ((objc_msgSend(v3, "hasPrefix:", v9) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(&unk_1E57EC650, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_14;
  }
  else
  {
LABEL_9:

  }
  __atxlog_handle_blending();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    +[ATXContextActionIdentifier actionTypeFromSpotlightActionType:].cold.1();

  v10 = 0;
LABEL_14:

  return v10;
}

+ (id)_actionTypeFromShortcutsActionSuggestion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "executableSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executableIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(&unk_1E57EC678, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
      if ((objc_msgSend(v4, "hasPrefix:", v10) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(&unk_1E57EC678, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_14;
  }
  else
  {
LABEL_9:

  }
  __atxlog_handle_blending();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    +[ATXContextActionIdentifier _actionTypeFromShortcutsActionSuggestion:].cold.1();

  v11 = 0;
LABEL_14:

  return v11;
}

+ (unint64_t)_instanceIdentifierFromShortcutsActionSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executableIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  objc_msgSend(v3, "uiSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "uiSpecification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contextStartDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "hash") - v6 + 32 * v6;

  }
  return v6;
}

+ (id)_stringsWithPredictionReasons:(unint64_t)a3
{
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = (id)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__ATXContextActionIdentifier__stringsWithPredictionReasons___block_invoke;
  v6[3] = &unk_1E57CE710;
  v6[4] = &v7;
  ATXSuggestionPredictionReasonEnumerateReasonCodes(a3, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __60__ATXContextActionIdentifier__stringsWithPredictionReasons___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  stringForATXSuggestionPredictionReasonCode(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

- (BOOL)isEqual:(id)a3
{
  ATXContextActionIdentifier *v4;
  ATXContextActionIdentifier *v5;
  BOOL v6;

  v4 = (ATXContextActionIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXContextActionIdentifier isEqualToATXContextActionIdentifier:](self, "isEqualToATXContextActionIdentifier:", v5);

  return v6;
}

- (BOOL)isEqualToATXContextActionIdentifier:(id)a3
{
  id *v4;
  NSString *context;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *subtype;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  char v15;
  NSString *v16;
  NSString *v17;

  v4 = (id *)a3;
  context = self->_context;
  v6 = (NSString *)v4[1];
  if (context == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = context;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
  subtype = self->_subtype;
  v11 = (NSString *)v4[2];
  if (subtype == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = subtype;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
    {
LABEL_7:
      v15 = 0;
      goto LABEL_13;
    }
  }
  v16 = self->_instanceId;
  v17 = v16;
  if (v16 == v4[3])
    v15 = 1;
  else
    v15 = -[NSString isEqual:](v16, "isEqual:");

LABEL_13:
  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_context, "hash");
  v4 = -[NSString hash](self->_subtype, "hash") - v3 + 32 * v3;
  return -[NSString hash](self->_instanceId, "hash") - v4 + 32 * v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *context;
  id v5;

  context = self->_context;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", context, CFSTR("context"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtype, CFSTR("subtype"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instanceId, CFSTR("instanceId"));

}

- (ATXContextActionIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXContextActionIdentifier *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_blending();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("context"), v4, 1, CFSTR("com.apple.duetexpertd.ATXContextActionIdentifier"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_blending();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("subtype"), v4, 1, CFSTR("com.apple.duetexpertd.ATXContextActionIdentifier"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_blending();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("instanceId"), v4, 1, CFSTR("com.apple.duetexpertd.ATXContextActionIdentifier"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v10 = 0;
      }
      else
      {
        self = -[ATXContextActionIdentifier initWithContext:subtype:instanceIdentifier:](self, "initWithContext:subtype:instanceIdentifier:", v8, v14, v19);
        v10 = self;
      }

    }
  }

  return v10;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)subtype
{
  return self->_subtype;
}

- (NSString)instanceId
{
  return self->_instanceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceId, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithUniqueIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1AA841000, v0, v1, "ATXContextActionIdentifier: expected component missing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithUniqueIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1AA841000, v0, v1, "ATXContextActionIdentifier: unsupported uniqueId format: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithProactiveSuggestion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "executableType");
  objc_msgSend(a1, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executableClassString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218242;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_fault_impl(&dword_1AA841000, a2, OS_LOG_TYPE_FAULT, "ATXContextActionIdentifier unsupported type: %lu, %@", (uint8_t *)&v8, 0x16u);

}

+ (void)actionTypeFromSpotlightActionType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, v0, v1, "ATXContextActionIdentifier: unsupported Spotlight action id: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)_actionTypeFromShortcutsActionSuggestion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, v0, v1, "ATXContextActionIdentifier: unsupported Shortcuts action id: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
