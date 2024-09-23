@implementation ATXProactiveSuggestionExecutableSpecification

- (int64_t)executableType
{
  return self->_executableType;
}

- (ATXSuggestionExecutableProtocol)executableObject
{
  ATXProactiveSuggestionExecutableSpecification *v2;
  ATXSuggestionExecutableProtocol *executableObject;
  uint64_t v4;
  ATXSuggestionExecutableProtocol *v5;
  ATXSuggestionExecutableProtocol *v6;

  v2 = self;
  objc_sync_enter(v2);
  executableObject = v2->_executableObject;
  if (!executableObject)
  {
    -[ATXProactiveSuggestionExecutableSpecification executableObjectFromData:executableClassString:](v2, "executableObjectFromData:executableClassString:", v2->_executable, v2->_executableClassString);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_executableObject;
    v2->_executableObject = (ATXSuggestionExecutableProtocol *)v4;

    executableObject = v2->_executableObject;
  }
  v6 = executableObject;
  objc_sync_exit(v2);

  return v6;
}

- (id)executableObjectFromData:(id)a3 executableClassString:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;

  v6 = a3;
  v7 = (NSString *)a4;
  -[ATXProactiveSuggestionExecutableSpecification allowedExecutableClasses](self, "allowedExecutableClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if ((v9 & 1) != 0)
  {
    v10 = NSClassFromString(v7);
    if (v10)
    {
      if (-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("NSString")))
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
      }
      else
      {
        v12 = (void *)MEMORY[0x1AF421DC4]();
        v16 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", v10, v6, &v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v16;
        objc_autoreleasePoolPop(v12);
        if (!v10 && v13)
        {
          __atxlog_handle_blending();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[ATXProactiveSuggestionExecutableSpecification executableObjectFromData:executableClassString:].cold.1();

        }
      }
    }
  }
  else
  {
    __atxlog_handle_blending();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXProactiveSuggestionExecutableSpecification initWithExecutable:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (id)allowedExecutableClasses
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1AF421DC4](self, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ATXAction"), CFSTR("NSString"), CFSTR("ATXHeroData"), CFSTR("ATXInfoSuggestion"), CFSTR("_PSSuggestion"), CFSTR("CAXContextualAction"), CFSTR("ATXSpotlightAction"), CFSTR("ATXShortcutsAction"), CFSTR("ATXLinkActionContainer"), 0);
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (id)proto
{
  void *v3;
  unint64_t executableType;
  __CFString *v5;
  __CFString *v6;
  int v7;

  v3 = (void *)objc_opt_new();
  -[ATXPBProactiveSuggestionExecutableSpecification setExecutable:]((uint64_t)v3, self->_executable);
  -[ATXPBProactiveSuggestionExecutableSpecification setExecutableObjectHash:]((uint64_t)v3, self->_executableObjectHash);
  -[ATXPBProactiveSuggestionExecutableSpecification setExecutableClassString:]((uint64_t)v3, self->_executableClassString);
  -[ATXPBProactiveSuggestionExecutableSpecification setExecutableDescription:]((uint64_t)v3, self->_executableDescription);
  -[ATXPBProactiveSuggestionExecutableSpecification setExecutableIdentifier:]((uint64_t)v3, self->_executableIdentifier);
  executableType = self->_executableType;
  if (executableType >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %li)"), self->_executableType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E57CF5A8[executableType];
  }
  v6 = v5;
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v7 = 0;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("App")) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Action")) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Widget")) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Tip")) & 1) != 0)
  {
    v7 = 4;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("AppClip")) & 1) != 0)
  {
    v7 = 5;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Interaction")) & 1) != 0)
  {
    v7 = 6;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("ContextualAction")) & 1) != 0)
  {
    v7 = 7;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("SpotlightAction")) & 1) != 0)
  {
    v7 = 8;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("ShortcutsAction")) & 1) != 0)
  {
    v7 = 9;
  }
  else if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("LinkAction")))
  {
    v7 = 10;
  }
  else
  {
    v7 = 0;
  }

  -[ATXPBProactiveSuggestionExecutableSpecification setExecutableType:]((uint64_t)v3, v7);
  return v3;
}

- (ATXProactiveSuggestionExecutableSpecification)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  NSObject *v13;
  ATXProactiveSuggestionExecutableSpecification *v14;
  __CFString *v15;
  uint64_t v16;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestion initWithProto:].cold.7();

    goto LABEL_8;
  }
  v5 = v4;
  -[ATXPBProactiveSuggestionExecutableSpecification executable]((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXPBProactiveSuggestionExecutableSpecification executableObjectHash]((uint64_t)v5);
  -[ATXPBProactiveSuggestionExecutableSpecification executableClassString]((uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestionExecutableSpecification executableDescription]((uint64_t)v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestionExecutableSpecification executableIdentifier]((uint64_t)v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATXPBProactiveSuggestionExecutableSpecification executableType]((uint64_t)v5);
  if (v11 >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E57CF550[(int)v11];
  }
  v15 = v12;
  if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v16 = 0;
  }
  else if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("App")) & 1) != 0)
  {
    v16 = 1;
  }
  else if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("Action")) & 1) != 0)
  {
    v16 = 2;
  }
  else if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("Widget")) & 1) != 0)
  {
    v16 = 3;
  }
  else if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("Tip")) & 1) != 0)
  {
    v16 = 4;
  }
  else if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("AppClip")) & 1) != 0)
  {
    v16 = 5;
  }
  else if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("Interaction")) & 1) != 0)
  {
    v16 = 6;
  }
  else if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("ContextualAction")) & 1) != 0)
  {
    v16 = 7;
  }
  else if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("SpotlightAction")) & 1) != 0)
  {
    v16 = 8;
  }
  else if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("ShortcutsAction")) & 1) != 0)
  {
    v16 = 9;
  }
  else if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("LinkAction")) & 1) != 0)
  {
    v16 = 10;
  }
  else if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("Max")))
  {
    v16 = 11;
  }
  else
  {
    v16 = 0;
  }

  self = -[ATXProactiveSuggestionExecutableSpecification initWithExecutable:executableObjectHash:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:](self, "initWithExecutable:executableObjectHash:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:", v6, v7, v8, v9, v10, v16);
  v14 = self;
LABEL_36:

  return v14;
}

- (ATXProactiveSuggestionExecutableSpecification)initWithExecutable:(id)a3 executableObjectHash:(unint64_t)a4 expectedExecutableClassString:(id)a5 executableDescription:(id)a6 executableIdentifier:(id)a7 suggestionExecutableType:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ATXProactiveSuggestionExecutableSpecification *v18;
  uint64_t v19;
  NSData *executable;
  uint64_t v21;
  NSString *executableClassString;
  uint64_t v23;
  NSString *executableDescription;
  uint64_t v25;
  NSString *executableIdentifier;
  objc_super v28;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ATXProactiveSuggestionExecutableSpecification;
  v18 = -[ATXProactiveSuggestionExecutableSpecification init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    executable = v18->_executable;
    v18->_executable = (NSData *)v19;

    v18->_executableObjectHash = a4;
    v21 = objc_msgSend(v15, "copy");
    executableClassString = v18->_executableClassString;
    v18->_executableClassString = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    executableDescription = v18->_executableDescription;
    v18->_executableDescription = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    executableIdentifier = v18->_executableIdentifier;
    v18->_executableIdentifier = (NSString *)v25;

    v18->_executableType = a8;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableIdentifier, 0);
  objc_storeStrong((id *)&self->_executableDescription, 0);
  objc_storeStrong((id *)&self->_executableClassString, 0);
  objc_storeStrong((id *)&self->_executable, 0);
  objc_storeStrong((id *)&self->_executableObject, 0);
}

+ (id)stringForExecutableType:(int64_t)a3
{
  if ((unint64_t)a3 < 0xC)
    return off_1E57CF5A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %li)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ATXProactiveSuggestionExecutableSpecification)initWithExecutable:(id)a3 expectedExecutableClassString:(id)a4 executableDescription:(id)a5 executableIdentifier:(id)a6
{
  return -[ATXProactiveSuggestionExecutableSpecification initWithExecutable:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:](self, "initWithExecutable:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:", a3, a4, a5, a6, 0);
}

- (ATXProactiveSuggestionExecutableSpecification)initWithExecutable:(id)a3 expectedExecutableClassString:(id)a4 executableDescription:(id)a5 executableIdentifier:(id)a6 suggestionExecutableType:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  ATXProactiveSuggestionExecutableSpecification *v18;
  NSObject *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[ATXProactiveSuggestionExecutableSpecification allowedExecutableClasses](self, "allowedExecutableClasses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", v13);

  if ((v17 & 1) != 0)
  {
    self = -[ATXProactiveSuggestionExecutableSpecification initWithExecutable:executableObjectHash:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:](self, "initWithExecutable:executableObjectHash:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:", v12, 0, v13, v14, v15, a7);
    v18 = self;
  }
  else
  {
    __atxlog_handle_blending();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXProactiveSuggestionExecutableSpecification initWithExecutable:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:].cold.1();

    v18 = 0;
  }

  return v18;
}

- (ATXProactiveSuggestionExecutableSpecification)initWithExecutableObject:(id)a3 executableDescription:(id)a4 executableIdentifier:(id)a5 suggestionExecutableType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  ATXProactiveSuggestionExecutableSpecification *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  objc_opt_isKindOfClass();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionExecutableSpecification allowedExecutableClasses](self, "allowedExecutableClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v14);

  if (v16)
  {
    -[ATXProactiveSuggestionExecutableSpecification executableDataFromExecutableObject:executableClassStringFromObject:](self, "executableDataFromExecutableObject:executableClassStringFromObject:", v10, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ATXProactiveSuggestionExecutableSpecification initWithExecutable:executableObjectHash:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:](self, "initWithExecutable:executableObjectHash:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:", v17, objc_msgSend(v10, "hash"), v14, v11, v12, a6);

    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)executableDataFromExecutableObject:(id)a3 executableClassStringFromObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("NSString")))
  {
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1AF421DC4]();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    objc_autoreleasePoolPop(v8);
    if (!v7)
    {
      __atxlog_handle_blending();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXProactiveSuggestionExecutableSpecification executableDataFromExecutableObject:executableClassStringFromObject:].cold.1();

    }
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Executable class: %@   Executable description: %@   Executable identifier: %@   Executable type: %ld   "), self->_executableClassString, self->_executableDescription, self->_executableIdentifier, self->_executableType);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXProactiveSuggestionExecutableSpecification *v4;
  void *v5;
  unint64_t executableObjectHash;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  ATXProactiveSuggestionExecutableSpecification *v11;

  v4 = +[ATXProactiveSuggestionExecutableSpecification allocWithZone:](ATXProactiveSuggestionExecutableSpecification, "allocWithZone:", a3);
  v5 = (void *)-[NSData copy](self->_executable, "copy");
  executableObjectHash = self->_executableObjectHash;
  v7 = (void *)-[NSString copy](self->_executableClassString, "copy");
  v8 = (void *)-[NSString copy](self->_executableDescription, "copy");
  v9 = (void *)-[NSString copy](self->_executableIdentifier, "copy");
  v10 = -[ATXProactiveSuggestionExecutableSpecification initWithExecutable:executableObjectHash:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:](v4, "initWithExecutable:executableObjectHash:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:", v5, executableObjectHash, v7, v8, v9, self->_executableType);

  v11 = self;
  objc_sync_enter(v11);
  objc_storeStrong(v10 + 1, v11->_executableObject);
  objc_sync_exit(v11);

  return v10;
}

- (unint64_t)hash
{
  unint64_t executableObjectHash;
  NSUInteger v4;
  NSUInteger v5;

  executableObjectHash = self->_executableObjectHash;
  v4 = -[NSString hash](self->_executableClassString, "hash") - executableObjectHash + 32 * executableObjectHash;
  v5 = -[NSString hash](self->_executableIdentifier, "hash");
  return self->_executableType - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionExecutableSpecification *v4;
  id *v5;
  NSData *executable;
  NSData *v7;
  NSData *v8;
  NSData *v9;
  char v10;
  BOOL v11;
  unint64_t executableObjectHash;
  NSString *executableClassString;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  char v17;
  NSString *executableDescription;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  char v22;
  NSString *executableIdentifier;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  char v27;
  int64_t executableType;

  v4 = (ATXProactiveSuggestionExecutableSpecification *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      executable = self->_executable;
      v7 = (NSData *)v5[2];
      if (executable == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = executable;
        v10 = -[NSData isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_20;
      }
      executableObjectHash = self->_executableObjectHash;
      if (executableObjectHash == objc_msgSend(v5, "executableObjectHash"))
      {
        executableClassString = self->_executableClassString;
        v14 = (NSString *)v5[4];
        if (executableClassString == v14)
        {

        }
        else
        {
          v15 = v14;
          v16 = executableClassString;
          v17 = -[NSString isEqual:](v16, "isEqual:", v15);

          if ((v17 & 1) == 0)
            goto LABEL_20;
        }
        executableDescription = self->_executableDescription;
        v19 = (NSString *)v5[5];
        if (executableDescription == v19)
        {

        }
        else
        {
          v20 = v19;
          v21 = executableDescription;
          v22 = -[NSString isEqual:](v21, "isEqual:", v20);

          if ((v22 & 1) == 0)
            goto LABEL_20;
        }
        executableIdentifier = self->_executableIdentifier;
        v24 = (NSString *)v5[6];
        if (executableIdentifier == v24)
        {

        }
        else
        {
          v25 = v24;
          v26 = executableIdentifier;
          v27 = -[NSString isEqual:](v26, "isEqual:", v25);

          if ((v27 & 1) == 0)
            goto LABEL_20;
        }
        executableType = self->_executableType;
        v11 = executableType == objc_msgSend(v5, "executableType");
        goto LABEL_21;
      }
LABEL_20:
      v11 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v11 = 0;
  }
LABEL_22:

  return v11;
}

- (BOOL)fuzzyIsEqualToExecutableSpecification:(id)a3
{
  ATXProactiveSuggestionExecutableSpecification *v4;
  unint64_t executableObjectHash;
  NSString *executableClassString;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  BOOL v11;
  NSString *executableIdentifier;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  char v16;
  int64_t executableType;

  v4 = (ATXProactiveSuggestionExecutableSpecification *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    executableObjectHash = self->_executableObjectHash;
    if (executableObjectHash != -[ATXProactiveSuggestionExecutableSpecification executableObjectHash](v4, "executableObjectHash"))goto LABEL_11;
    executableClassString = self->_executableClassString;
    v7 = v4->_executableClassString;
    if (executableClassString == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = executableClassString;
      v10 = -[NSString isEqual:](v9, "isEqual:", v8);

      if ((v10 & 1) == 0)
        goto LABEL_11;
    }
    executableIdentifier = self->_executableIdentifier;
    v13 = v4->_executableIdentifier;
    if (executableIdentifier == v13)
    {

    }
    else
    {
      v14 = v13;
      v15 = executableIdentifier;
      v16 = -[NSString isEqual:](v15, "isEqual:", v14);

      if ((v16 & 1) == 0)
      {
LABEL_11:
        v11 = 0;
        goto LABEL_12;
      }
    }
    executableType = self->_executableType;
    v11 = executableType == -[ATXProactiveSuggestionExecutableSpecification executableType](v4, "executableType");
    goto LABEL_12;
  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (id)jsonRawData
{
  int64_t executableType;
  void *v4;
  unint64_t executableObjectHash;
  NSString *executableClassString;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  executableType = self->_executableType;
  v11[0] = self->_executableIdentifier;
  v10[0] = CFSTR("executableIdentifier");
  v10[1] = CFSTR("executableType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", executableType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  executableObjectHash = self->_executableObjectHash;
  executableClassString = self->_executableClassString;
  v11[1] = v4;
  v11[2] = executableClassString;
  v10[2] = CFSTR("executableClassString");
  v10[3] = CFSTR("executableDescription");
  v11[3] = self->_executableDescription;
  v10[4] = CFSTR("executableObjectHash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", executableObjectHash);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestionExecutableSpecification proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXProactiveSuggestionExecutableSpecification)initWithProtoData:(id)a3
{
  id v4;
  ATXPBProactiveSuggestionExecutableSpecification *v5;
  ATXProactiveSuggestionExecutableSpecification *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBProactiveSuggestionExecutableSpecification initWithData:]([ATXPBProactiveSuggestionExecutableSpecification alloc], "initWithData:", v4);

    self = -[ATXProactiveSuggestionExecutableSpecification initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSUInteger:(unint64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXProactiveSuggestionExecutableSpecification encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXProactiveSuggestionExecutableSpecification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXProactiveSuggestionExecutableSpecification *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXProactiveSuggestionExecutableSpecification initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (NSData)executable
{
  return self->_executable;
}

- (unint64_t)executableObjectHash
{
  return self->_executableObjectHash;
}

- (NSString)executableClassString
{
  return self->_executableClassString;
}

- (NSString)executableDescription
{
  return self->_executableDescription;
}

- (NSString)executableIdentifier
{
  return self->_executableIdentifier;
}

- (void)initWithExecutable:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "Executable object in ATXProactiveSuggestion's executableSpec was of unsupported type. Type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)executableDataFromExecutableObject:executableClassStringFromObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "Unable to archive executable object from ATXProactiveSuggestion. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)executableObjectFromData:executableClassString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "Unable to unarchive executable object from ATXProactiveSuggestion. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
