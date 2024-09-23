@implementation WFWorkflowFile

- (WFWorkflowFile)init
{
  void *v3;
  WFWorkflowFile *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[WFWorkflowFile initWithDictionary:name:](self, "initWithDictionary:name:", v3, 0);

  return v4;
}

- (WFWorkflowFile)initWithFileData:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  WFWorkflowFile *v17;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  getWFGeneralLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  getWFGeneralLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v19 = 138412290;
    v20 = CFSTR("data");
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WFWorkflowFileInit", "type=%{signpost.description:attribute}@", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, 0, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    getWFGeneralLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v16, OS_SIGNPOST_INTERVAL_END, v11, "WFWorkflowFileInit", ", (uint8_t *)&v19, 2u);
    }

    self = -[WFWorkflowFile initWithDictionary:name:](self, "initWithDictionary:name:", v14, v8);
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (WFWorkflowFile)initWithDictionary:(id)a3 name:(id)a4
{
  return -[WFWorkflowFile initWithDictionary:name:performMigration:](self, "initWithDictionary:name:performMigration:", a3, a4, 1);
}

- (WFWorkflowFile)initWithDictionary:(id)a3 name:(id)a4 performMigration:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  WFWorkflowFile *v14;
  void *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSMutableDictionary *rootObject;
  uint64_t v20;
  NSString *name;
  uint64_t v22;
  NSDate *creationDate;
  uint64_t v24;
  NSDate *modificationDate;
  NSObject *v26;
  NSObject *v27;
  WFWorkflowFile *v28;
  objc_super v30;
  uint8_t buf[4];
  const __CFString *v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  getWFGeneralLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  getWFGeneralLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138412290;
    v32 = CFSTR("dictionary");
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WFWorkflowFileInit", "type=%{signpost.description:attribute}@", buf, 0xCu);
  }

  v30.receiver = self;
  v30.super_class = (Class)WFWorkflowFile;
  v14 = -[WFWorkflowFile init](&v30, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v16;

    v18 = objc_msgSend(v8, "mutableCopy");
    rootObject = v14->_rootObject;
    v14->_rootObject = (NSMutableDictionary *)v18;

    v20 = objc_msgSend(v9, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v20;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = objc_claimAutoreleasedReturnValue();
    creationDate = v14->_creationDate;
    v14->_creationDate = (NSDate *)v22;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = objc_claimAutoreleasedReturnValue();
    modificationDate = v14->_modificationDate;
    v14->_modificationDate = (NSDate *)v24;

    if (v5)
      -[WFWorkflowFile migrateRootObject](v14, "migrateRootObject");
    getWFGeneralLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v27, OS_SIGNPOST_INTERVAL_END, v11, "WFWorkflowFileInit", ", buf, 2u);
    }

    v28 = v14;
  }

  return v14;
}

- (WFWorkflowFile)initWithDescriptor:(id)a3 error:(id *)a4
{
  return -[WFWorkflowFile initWithDescriptor:performMigration:error:](self, "initWithDescriptor:performMigration:error:", a3, 1, a4);
}

- (WFWorkflowFile)initWithDescriptor:(id)a3 performMigration:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *identifier;
  NSMutableDictionary *v16;
  NSMutableDictionary *rootObject;
  void *v18;
  NSString *v19;
  NSString *name;
  NSDate *v21;
  NSDate *creationDate;
  void *v23;
  void *v24;
  NSDate *v25;
  WFWorkflowFile *v26;
  NSDate *modificationDate;
  void *v28;
  WFWorkflowQuarantine *v29;
  void *v30;
  void *v31;
  WFWorkflowQuarantine *v32;
  WFWorkflowQuarantine *quarantine;
  void *v35;
  objc_super v36;

  v6 = a4;
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowFile.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

  }
  objc_msgSend(v9, "file");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "open");
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v11, 0, 0, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "close");
  if (v12
    && (v36.receiver = self,
        v36.super_class = (Class)WFWorkflowFile,
        (self = -[WFWorkflowFile init](&v36, sel_init)) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v14;

    objc_storeStrong((id *)&self->_file, v10);
    v16 = (NSMutableDictionary *)objc_msgSend(v12, "mutableCopy");
    rootObject = self->_rootObject;
    self->_rootObject = v16;

    objc_msgSend(v9, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (NSString *)objc_msgSend(v18, "copy");
    name = self->_name;
    self->_name = v19;

    objc_msgSend(v10, "creationDate");
    v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
    creationDate = self->_creationDate;
    self->_creationDate = v21;

    objc_msgSend(v10, "modificationDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    modificationDate = self->_modificationDate;
    self->_modificationDate = v25;

    objc_msgSend(v9, "sourceAppIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [WFWorkflowQuarantine alloc];
      objc_msgSend(v9, "sourceAppIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[WFWorkflowQuarantine initWithSourceAppIdentifier:importDate:](v29, "initWithSourceAppIdentifier:importDate:", v30, v31);
      quarantine = self->_quarantine;
      self->_quarantine = v32;

    }
    if (v6)
      -[WFWorkflowFile migrateRootObject](self, "migrateRootObject");
    self = self;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)descriptor
{
  void *v3;
  WFWorkflowFileDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFWorkflowFileDescriptor *v9;

  -[WFWorkflowFile file](self, "file");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [WFWorkflowFileDescriptor alloc];
    -[WFWorkflowFile file](self, "file");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowFile name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowFile quarantine](self, "quarantine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sourceAppIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFWorkflowFileDescriptor initWithFile:name:sourceAppIdentifier:](v4, "initWithFile:name:sourceAppIdentifier:", v5, v6, v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (unint64_t)estimatedSize
{
  void *v2;
  unint64_t v3;

  -[WFWorkflowFile file](self, "file");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileSize");

  return v3;
}

- (id)recordRepresentationWithError:(id *)a3
{
  return -[WFRecord initWithStorage:]([WFWorkflowRecord alloc], "initWithStorage:", self);
}

- (WFWorkflowIcon)icon
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int16 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowIcon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WFWorkflowIconStartColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WFWorkflowIconGlyphNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  WFEnforceClass(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WFWorkflowIconImageData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  WFEnforceClass(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E38]), "initWithBackgroundColorValue:glyphCharacter:customImageData:", v8, v12, v15);
  return (WFWorkflowIcon *)v16;
}

- (void)setIcon:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "backgroundColorValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("WFWorkflowIconStartColor"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v10, "glyphCharacter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("WFWorkflowIconGlyphNumber"));

    objc_msgSend(v10, "customImageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v10, "customImageData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("WFWorkflowIconImageData"));

    }
    v9 = (void *)objc_msgSend(v4, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rootObject, "setObject:forKeyedSubscript:", v9, CFSTR("WFWorkflowIcon"));

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_rootObject, "removeObjectForKey:", CFSTR("WFWorkflowIcon"));
  }

}

- (NSArray)workflowTypes
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowTypes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (void)setWorkflowTypes:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_rootObject, "setValue:forKey:", a3, CFSTR("WFWorkflowTypes"));
}

- (NSArray)quickActionSurfacesForSharing
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFQuickActionSurfaces"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (void)setQuickActionSurfacesForSharing:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_rootObject, "setValue:forKey:", a3, CFSTR("WFQuickActionSurfaces"));
}

- (NSArray)inputClasses
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowInputContentItemClasses"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (void)setInputClasses:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_rootObject, "setValue:forKey:", a3, CFSTR("WFWorkflowInputContentItemClasses"));
}

- (NSDictionary)noInputBehavior
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowNoInputBehavior"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setNoInputBehavior:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_rootObject, "setValue:forKey:", a3, CFSTR("WFWorkflowNoInputBehavior"));
}

- (NSArray)outputClasses
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowOutputContentItemClasses"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (void)setOutputClasses:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_rootObject, "setValue:forKey:", a3, CFSTR("WFWorkflowOutputContentItemClasses"));
}

- (BOOL)hasShortcutInputVariables
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowHasShortcutInputVariables"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setHasShortcutInputVariables:(BOOL)a3
{
  NSMutableDictionary *rootObject;
  id v4;

  rootObject = self->_rootObject;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](rootObject, "setValue:forKey:", v4, CFSTR("WFWorkflowHasShortcutInputVariables"));

}

- (BOOL)hasOutputFallback
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowHasOutputFallback"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setHasOutputFallback:(BOOL)a3
{
  NSMutableDictionary *rootObject;
  id v4;

  rootObject = self->_rootObject;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](rootObject, "setValue:forKey:", v4, CFSTR("WFWorkflowHasOutputFallback"));

}

- (BOOL)disabledOnLockScreen
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowIsDisabledOnLockScreen"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setDisabledOnLockScreen:(BOOL)a3
{
  NSMutableDictionary *rootObject;
  id v4;

  rootObject = self->_rootObject;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](rootObject, "setValue:forKey:", v4, CFSTR("WFWorkflowIsDisabledOnLockScreen"));

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_rootObject, "removeObjectForKey:", CFSTR("WFWorkflowIsDisabledOnLockScreen"));
  }
}

- (NSArray)actions
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowActions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (void)setActions:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_rootObject, "setValue:forKey:", a3, CFSTR("WFWorkflowActions"));
}

- (NSArray)importQuestions
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowImportQuestions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (void)setImportQuestions:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_rootObject, "setValue:forKey:", a3, CFSTR("WFWorkflowImportQuestions"));
}

- (NSString)lastMigratedClientVersion
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowClientVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFConvertToBundleString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLastMigratedClientVersion:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_rootObject, "setValue:forKey:", a3, CFSTR("WFWorkflowClientVersion"));
}

- (NSString)minimumClientVersion
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", CFSTR("WFWorkflowMinimumClientVersionString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = CFSTR("WFWorkflowMinimumClientVersionString");
  else
    v4 = CFSTR("WFWorkflowMinimumClientVersion");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootObject, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFConvertToBundleString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setMinimumClientVersion:(id)a3
{
  NSMutableDictionary *rootObject;
  id v5;
  NSMutableDictionary *v6;
  void *v7;
  uint64_t v8;
  id v9;

  rootObject = self->_rootObject;
  v5 = a3;
  -[NSMutableDictionary setValue:forKey:](rootObject, "setValue:forKey:", v5, CFSTR("WFWorkflowMinimumClientVersionString"));
  v6 = self->_rootObject;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](v6, "setValue:forKey:", v9, CFSTR("WFWorkflowMinimumClientVersion"));

}

- (id)writeToDiskWithFormat:(unint64_t)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;

  -[WFWorkflowFile file](self, "file");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", CFSTR("com.apple.shortcuts.workflow-file"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D13F78];
    -[WFWorkflowFile name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "proposedFilenameForFile:ofType:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D140A0], "proposedTemporaryFileURLForFilename:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createFileAtPath:contents:attributes:", v14, 0, 0);

    objc_msgSend(MEMORY[0x1E0D13F78], "fileWithURL:options:ofType:", v12, 1, v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_5;
  }
  objc_msgSend(v7, "fileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WFWorkflowFile writeToFileURL:format:error:](self, "writeToFileURL:format:error:", v15, a3, a4);

  if (v16)
  {
    objc_storeStrong((id *)&self->_file, v7);
    v7 = v7;
    v17 = v7;
  }
  else
  {
LABEL_5:
    v17 = 0;
  }

  return v17;
}

- (id)writeToDiskWithError:(id *)a3
{
  return -[WFWorkflowFile writeToDiskWithFormat:error:](self, "writeToDiskWithFormat:error:", 200, a3);
}

- (BOOL)writeToFileURL:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamWithURL:append:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[WFWorkflowFile writeToOutputStream:format:error:](self, "writeToOutputStream:format:error:", v8, a4, a5);

  return (char)a5;
}

- (id)fileDataWithFormat:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[WFWorkflowFile file](self, "file");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFWorkflowFile file](self, "file");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mappedData");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToMemory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[WFWorkflowFile writeToOutputStream:format:error:](self, "writeToOutputStream:format:error:", v8, a3, a4))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x1E0C99868]);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

- (id)fileDataWithError:(id *)a3
{
  return -[WFWorkflowFile fileDataWithFormat:error:](self, "fileDataWithFormat:error:", 200, a3);
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  id v11;

  v5 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToMemory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = -[WFWorkflowFile writeToOutputStream:format:error:](self, "writeToOutputStream:format:error:", v6, 200, &v11);
  v8 = v11;
  if (v7)
  {
    objc_msgSend(v6, "propertyForKey:", *MEMORY[0x1E0C99868]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v9, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v5)[2](v5, 0, v8);
  }

  return 0;
}

- (BOOL)writeToOutputStream:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v19;
  id v20;

  v8 = a3;
  objc_msgSend(v8, "open");
  v9 = (void *)MEMORY[0x1E0CB38B0];
  -[WFWorkflowFile rootObject](self, "rootObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v11 = objc_msgSend(v9, "writePropertyList:toStream:format:options:error:", v10, v8, a4, 0, &v20);
  v12 = v20;
  v13 = v11 > 0;

  if (a4 == 100 && v11 <= 0)
  {
    v14 = (void *)MEMORY[0x1E0CB38B0];
    -[WFWorkflowFile rootObject](self, "rootObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v16 = objc_msgSend(v14, "writePropertyList:toStream:format:options:error:", v15, v8, 200, 0, &v19);
    v17 = v19;

    v13 = v16 != 0;
    v12 = v17;
  }
  objc_msgSend(v8, "close");
  if (a5 && v12)
    *a5 = objc_retainAutorelease(v12);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "rootObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowFile rootObject](self, "rootObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToDictionary:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)migrateRootObject
{
  dispatch_semaphore_t v3;
  NSMutableDictionary *rootObject;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = dispatch_semaphore_create(0);
  rootObject = self->_rootObject;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__WFWorkflowFile_migrateRootObject__block_invoke;
  v9[3] = &unk_1E7AEE980;
  v11 = &v12;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  +[WFWorkflowMigrator migrateWorkflowIfNeeded:completion:](WFWorkflowMigrator, "migrateWorkflowIfNeeded:completion:", rootObject, v9);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowFile setLastMigratedClientVersion:](self, "setLastMigratedClientVersion:", v7);
  LOBYTE(self) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

- (NSDictionary)rootObject
{
  return &self->_rootObject->super;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (WFWorkflowQuarantine)quarantine
{
  return self->_quarantine;
}

- (void)setQuarantine:(id)a3
{
  objc_storeStrong((id *)&self->_quarantine, a3);
}

- (WFFileRepresentation)file
{
  return self->_file;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_quarantine, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rootObject, 0);
}

intptr_t __35__WFWorkflowFile_migrateRootObject__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v4 = objc_msgSend(a3, "mutableCopy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v4;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.shortcuts.workflow-file");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

@end
