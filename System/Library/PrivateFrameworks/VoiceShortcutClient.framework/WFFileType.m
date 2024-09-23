@implementation WFFileType

+ (id)typeWithUTType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileTypeCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUTType:", v4);
    if (objc_msgSend(v7, "isDeclared"))
    {
      objc_msgSend(a1, "fileTypeCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v5);

    }
  }
  v9 = v7;

  return v9;
}

+ (id)fileTypeCache
{
  if (fileTypeCache_onceToken != -1)
    dispatch_once(&fileTypeCache_onceToken, &__block_literal_global_15195);
  return (id)fileTypeCache_fileTypeCache;
}

- (BOOL)isDeclared
{
  void *v2;
  char v3;

  -[WFFileType utType](self, "utType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeclared");

  return v3;
}

- (UTType)utType
{
  void *utType;
  int v4;
  NSString *string;
  UTType *v6;
  UTType *v7;

  utType = self->_utType;
  if (!utType)
  {
    utType = self->_string;
    if (utType)
    {
      v4 = objc_msgSend(utType, "hasPrefix:", CFSTR("com.apple"));
      string = self->_string;
      if (v4)
        objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", string, 1);
      else
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", string);
      v6 = (UTType *)objc_claimAutoreleasedReturnValue();
      v7 = self->_utType;
      self->_utType = v6;

      utType = self->_utType;
    }
  }
  return (UTType *)utType;
}

- (WFFileType)initWithUTType:(id)a3 string:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  WFFileType *v9;
  NSString *v10;
  NSString *string;
  WFFileType *v12;
  objc_super v14;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (v7 | v8
    && (v14.receiver = self,
        v14.super_class = (Class)WFFileType,
        v9 = -[WFFileType init](&v14, sel_init),
        (self = v9) != 0))
  {
    objc_storeStrong((id *)&v9->_utType, a3);
    v10 = (NSString *)objc_msgSend((id)v8, "copy");
    string = self->_string;
    self->_string = v10;

    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFFileType)initWithUTType:(id)a3
{
  return -[WFFileType initWithUTType:string:](self, "initWithUTType:string:", a3, 0);
}

uint64_t __27__WFFileType_fileTypeCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)fileTypeCache_fileTypeCache;
  fileTypeCache_fileTypeCache = v0;

  return objc_msgSend((id)fileTypeCache_fileTypeCache, "setName:", CFSTR("WFFileType Cache"));
}

- (WFFileType)initWithString:(id)a3
{
  return -[WFFileType initWithUTType:string:](self, "initWithUTType:string:", 0, a3);
}

- (NSString)string
{
  NSString *string;

  string = self->_string;
  if (string)
    return string;
  -[UTType identifier](self->_utType, "identifier");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  WFFileType *v4;
  void *v5;
  BOOL v6;

  v4 = (WFFileType *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFFileType utType](v4, "utType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WFFileType isEqualToUTType:](self, "isEqualToUTType:", v5);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFFileType utType](self, "utType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFFileType string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqualToType:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "utType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFFileType isEqualToUTType:](self, "isEqualToUTType:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToString:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WFFileType string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (BOOL)isEqualToUTType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[WFFileType utType](self, "utType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (BOOL)conformsToType:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "utType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = -[WFFileType conformsToUTType:](self, "conformsToUTType:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)conformsToString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "typeWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "utType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[WFFileType conformsToUTType:](self, "conformsToUTType:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)conformsToUTType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WFFileType utType](self, "utType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToType:", v4);

  return v6;
}

- (BOOL)conformsToUTTypes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[WFFileType conformsToUTType:](self, "conformsToUTType:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)conformingTypesWithFileExtension:(id)a3
{
  return -[WFFileType conformingTypesWithTagClass:tag:](self, "conformingTypesWithTagClass:tag:", *MEMORY[0x1E0CEC400], a3);
}

- (id)conformingTypesWithMIMEType:(id)a3
{
  return -[WFFileType conformingTypesWithTagClass:tag:](self, "conformingTypesWithTagClass:tag:", *MEMORY[0x1E0CEC408], a3);
}

- (BOOL)isDynamic
{
  void *v2;
  char v3;

  -[WFFileType utType](self, "utType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDynamic");

  return v3;
}

- (BOOL)isCoreType
{
  void *v2;
  char v3;

  -[WFFileType utType](self, "utType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isCoreType");

  return v3;
}

- (NSString)typeDescription
{
  void *v2;
  void *v3;

  -[WFFileType utType](self, "utType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)typesConformedTo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[WFFileType utType](self, "utType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supertypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "typesFromUTTypes:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v5;
}

- (NSString)fileExtension
{
  __CFString *v3;
  void *v4;

  if (-[WFFileType isEqualToUTType:](self, "isEqualToUTType:", *MEMORY[0x1E0CEC630]))
  {
    v3 = CFSTR("txt");
  }
  else
  {
    -[WFFileType utType](self, "utType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredFilenameExtension");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (NSString)MIMEType
{
  void *v2;
  void *v3;

  -[WFFileType utType](self, "utType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredMIMEType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (WFFileType)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  WFFileType *v11;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_string);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_utType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFFileType initWithUTType:string:](self, "initWithUTType:string:", v10, v7);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *string;
  void *v5;
  UTType *utType;
  void *v7;
  id v8;

  v8 = a3;
  string = self->_string;
  if (string)
  {
    NSStringFromSelector(sel_string);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", string, v5);

  }
  utType = self->_utType;
  if (utType)
  {
    NSStringFromSelector(sel_utType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", utType, v7);

  }
}

- (id)conformingTypesWithTagClass:(id)a3 tag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[WFFileType utType](self, "utType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "typesForTagClass:tag:conformingToType:", v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDictionary)typeDeclaration
{
  return self->_typeDeclaration;
}

- (NSString)pboardType
{
  return self->_pboardType;
}

- (NSString)OSType
{
  return self->_OSType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OSType, 0);
  objc_storeStrong((id *)&self->_pboardType, 0);
  objc_storeStrong((id *)&self->_typeDeclaration, 0);
  objc_storeStrong((id *)&self->_utType, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

+ (id)typeWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "fileTypeCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);
    if (objc_msgSend(v6, "isDeclared"))
    {
      objc_msgSend(a1, "fileTypeCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v6, v4);

    }
  }
  v8 = v6;

  return v8;
}

+ (id)typeWithUTType:(id)a3 string:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (!(v7 | v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFFileType.m"), 64, CFSTR("Either a UTType or a string must be provided"));

    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    objc_msgSend(a1, "typeWithString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)a1), "initWithUTType:string:", v7, v8);
  }
  else
  {
    objc_msgSend(a1, "typeWithUTType:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
LABEL_8:
  v11 = (void *)v9;

  return v11;
}

+ (id)typeFromFilename:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(&unk_1E6004168, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(&unk_1E6004168);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@.zip"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v3, "hasSuffix:", v9);

        if ((v10 & 1) != 0)
        {
          objc_msgSend(a1, "typeFromFileExtension:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(&unk_1E6004168, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  objc_msgSend(v3, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "typeFromFileExtension:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v12;
}

+ (id)typeFromFileExtension:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "typeForTagClass:tag:", *MEMORY[0x1E0CEC400], v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)typeFromMIMEType:(id)a3
{
  return (id)objc_msgSend(a1, "typeForTagClass:tag:", *MEMORY[0x1E0CEC408], a3);
}

+ (id)typeFromPasteboardType:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Apple Web Archive pasteboard type")))
  {
    v5 = objc_alloc((Class)a1);
    v6 = objc_msgSend(v5, "initWithUTType:string:", *MEMORY[0x1E0CEC658], CFSTR("Apple Web Archive pasteboard type"));
  }
  else
  {
    objc_msgSend(a1, "typeWithString:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)typesFromUTTypes:(id)a3 excludingType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  if (!a3)
    a3 = (id)MEMORY[0x1E0C9AA60];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__WFFileType_typesFromUTTypes_excludingType___block_invoke;
  v10[3] = &unk_1E5FC7C58;
  v11 = v6;
  v12 = a1;
  v7 = v6;
  objc_msgSend(a3, "if_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)typesFromUTTypes:(id)a3
{
  return (id)objc_msgSend(a1, "typesFromUTTypes:excludingType:", a3, 0);
}

+ (id)typesFromStrings:(id)a3
{
  return (id)objc_msgSend(a3, "if_compactMap:", &__block_literal_global_36_15177);
}

+ (id)typeForTagClass:(id)a3 tag:(id)a4
{
  void *v5;
  void *v6;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithTag:tagClass:conformingToType:", a4, a3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "typeWithUTType:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)typesForTagClass:(id)a3 tag:(id)a4 conformingToType:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0CEC3F8];
  v9 = a5;
  objc_msgSend(v8, "typesWithTag:tagClass:conformingToType:", a4, a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "typesFromUTTypes:excludingType:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

WFFileType *__31__WFFileType_typesFromStrings___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFFileType typeWithString:](WFFileType, "typeWithString:", a2);
}

id __45__WFFileType_typesFromUTTypes_excludingType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "typeWithUTType:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (WFImage)documentIcon
{
  void *v3;
  void *v4;
  id v5;

  objc_getAssociatedObject(self, sel_documentIcon);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[WFImage documentIconImageForFileType:](WFImage, "documentIconImageForFileType:", self);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, sel_documentIcon, v5, (void *)1);
  }

  return (WFImage *)v5;
}

@end
