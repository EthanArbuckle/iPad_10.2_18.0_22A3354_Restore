@implementation TRIAppContainer

- (int64_t)fetchStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  int64_t v8;
  NSObject *v9;
  void *v10;
  TRIAppContainer *v12;
  id v13;
  uint8_t buf[4];
  TRIAppContainer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  -[TRIAppContainer _containerURLWithError:](self, "_containerURLWithError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(v13, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("containerError"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && objc_msgSend(v5, "integerValue") == 21)
    {
      v8 = 2;
      goto LABEL_13;
    }
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "localizedFailureReason");
      v12 = (TRIAppContainer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
LABEL_12:

    v8 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "fileExistsAtPath:", v5),
        v6,
        (v7 & 1) == 0))
  {
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "could not determine state of app container %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (id)containerURL
{
  void *v2;
  NSObject *v3;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  -[TRIAppContainer _containerURLWithError:](self, "_containerURLWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    TRILogCategory_ClientFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedFailureReason");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_19B89C000, v3, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }

  return v2;
}

- (id)_containerURLWithError:(id *)a3
{
  int64_t v5;
  void *v6;

  v5 = -[TRIAppContainer type](self, "type");
  switch(v5)
  {
    case 3:
      -[TRIAppContainer _groupContainerDirectoryAsSystemWithError:](self, "_groupContainerDirectoryAsSystemWithError:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[TRIAppContainer _appDataContainerDirectoryAsSystemWithError:](self, "_appDataContainerDirectoryAsSystemWithError:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[TRIAppContainer _appBundleContainerDirectoryAsSystemWithError:](self, "_appBundleContainerDirectoryAsSystemWithError:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (id)containerURLAsOwner
{
  int64_t v3;
  void *v4;

  v3 = -[TRIAppContainer type](self, "type");
  switch(v3)
  {
    case 3:
      -[TRIAppContainer _groupContainerDirectoryAsOwner](self, "_groupContainerDirectoryAsOwner");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[TRIAppContainer _appDataContainerDirectoryAsOwner](self, "_appDataContainerDirectoryAsOwner");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[TRIAppContainer _appBundleContainerDirectoryAsOwner](self, "_appBundleContainerDirectoryAsOwner");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)sanitizedIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;

  if (_MergedGlobals_10 != -1)
    dispatch_once(&_MergedGlobals_10, &__block_literal_global_11);
  -[TRIAppContainer identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:allowLossyConversion:", 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithData:encoding:", v4, 1);
  v6 = objc_msgSend(v5, "rangeOfCharacterFromSet:", qword_1ECED7E28);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v6; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v5, "rangeOfCharacterFromSet:", qword_1ECED7E28))
      objc_msgSend(v5, "replaceCharactersInRange:withString:", i, 1, CFSTR("-"));
  }

  return v5;
}

void __48__TRIAppContainer_TRIPaths__sanitizedIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.-_"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECED7E28;
  qword_1ECED7E28 = v0;

}

- (id)_containerError:(unint64_t)a3 withFormat:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];
  uint64_t v18;

  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, &v18);

  v16[0] = CFSTR("containerError");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v16[1] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Container error"), &stru_1E3C00710, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  v16[2] = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v7, &stru_1E3C00710, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_appContainerDirectoryAsSystemWithContainerClass:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  -[TRIAppContainer sanitizedIdentifier](self, "sanitizedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    if (!a4)
      goto LABEL_11;
    -[TRIAppContainer identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIAppContainer _containerError:withFormat:](self, "_containerError:withFormat:", 1, CFSTR("Failed to look up container with identifier %@ because cannot sanitize identifier"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *a4;
    *a4 = v12;

LABEL_10:
    a4 = 0;
    goto LABEL_11;
  }
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  v8 = container_create_or_lookup_for_current_user();
  if (!v8 || (v9 = v8, v10 = (void *)container_copy_path(), MEMORY[0x1A1AC6964](v9), !v10))
  {
    if (!a4)
      goto LABEL_11;
    -[TRIAppContainer identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIAppContainer _containerError:withFormat:](self, "_containerError:withFormat:", 0, CFSTR("Failed to look up container with identifier %@ due to container manager error: %llu"), v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *a4;
    *a4 = v15;

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v10, 1, 0);
  a4 = (id *)objc_claimAutoreleasedReturnValue();
  free(v10);
LABEL_11:

  return a4;
}

- (id)_appBundleContainerDirectoryAsSystemWithError:(id *)a3
{
  return -[TRIAppContainer _appContainerDirectoryAsSystemWithContainerClass:error:](self, "_appContainerDirectoryAsSystemWithContainerClass:error:", 1, a3);
}

- (id)_appDataContainerDirectoryAsSystemWithError:(id *)a3
{
  return -[TRIAppContainer _appContainerDirectoryAsSystemWithContainerClass:error:](self, "_appContainerDirectoryAsSystemWithContainerClass:error:", 2, a3);
}

- (id)_groupContainerDirectoryAsSystemWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v10;
  _QWORD v11[7];
  uint64_t v12;
  _BYTE buf[24];
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v5 = (void *)container_create_or_lookup_app_group_paths_for_current_user();
  v6 = v5;
  if (v5)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    v15 = __Block_byref_object_dispose__5;
    v16 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__TRIAppContainer_TRIPaths___groupContainerDirectoryAsSystemWithError___block_invoke;
    v11[3] = &unk_1E3BFF768;
    v11[5] = buf;
    v11[6] = a2;
    v11[4] = self;
    xpc_dictionary_apply(v5, v11);
    v7 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    TRILogCategory_ClientFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[TRIAppContainer identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v12;
      _os_log_error_impl(&dword_19B89C000, v8, OS_LOG_TYPE_ERROR, "Failed to look up container with identifier %@ due to container manager error: %llu", buf, 0x16u);

    }
    v7 = 0;
  }

  return v7;
}

uint64_t __71__TRIAppContainer_TRIPaths___groupContainerDirectoryAsSystemWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  const char *string_ptr;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v15;
  uint8_t v16[16];

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIAppContainer+TRIPaths.m"), 198, CFSTR("groupId is not valid UTF-8"));

  }
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if (v8)
  {
    string_ptr = xpc_string_get_string_ptr(v5);
    if (string_ptr)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", string_ptr, 1, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    else
    {
      TRILogCategory_ClientFramework();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_19B89C000, v13, OS_LOG_TYPE_ERROR, "groupId path could not be coerced to string", v16, 2u);
      }

    }
  }

  return v8 ^ 1u;
}

- (id)_appBundleContainerDirectoryAsOwner
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_appDataContainerDirectoryAsOwner
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_groupContainerDirectoryAsOwner
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIAppContainer sanitizedIdentifier](self, "sanitizedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (TRIAppContainer)initWithIdentifier:(id)a3 type:(int64_t)a4
{
  id v8;
  TRIAppContainer *v9;
  TRIAppContainer *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)TRIAppContainer;
  v9 = -[TRIAppContainer init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_type = a4;
  }

  return v10;
}

+ (TRIAppContainer)containerWithIdentifier:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:type:", v6, a4);

  return (TRIAppContainer *)v7;
}

- (id)copyWithReplacementIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:type:", v4, self->_type);

  return v5;
}

- (id)copyWithReplacementType:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:type:", self->_identifier, a3);
}

- (BOOL)isEqualToContainer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *identifier;
  void *v10;
  int v11;
  int64_t type;
  BOOL v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = self->_identifier != 0;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8
    || (identifier = self->_identifier) != 0
    && (objc_msgSend(v5, "identifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[NSString isEqual:](identifier, "isEqual:", v10),
        v10,
        !v11))
  {
LABEL_6:
    v13 = 0;
  }
  else
  {
    type = self->_type;
    v13 = type == objc_msgSend(v5, "type");
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TRIAppContainer *v4;
  TRIAppContainer *v5;
  BOOL v6;

  v4 = (TRIAppContainer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIAppContainer isEqualToContainer:](self, "isEqualToContainer:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return self->_type - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIAppContainer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  TRIAppContainer *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_10:
      v7 = 0;
      goto LABEL_11;
    }
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("Retrieved nil serialized value for nonnull TRIAppContainer.identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = 2;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIAppContainer key \"identifier\" (expected %@, decoded %@)"), v9, v12, 0);
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIAppContainerOCNTErrorDomain"), 3, v16);
    objc_msgSend(v4, "failWithError:", v17);

    goto LABEL_9;
  }
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
  if (!v6)
  {
    objc_msgSend(v4, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      goto LABEL_10;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("type")) & 1) != 0)
      goto LABEL_4;
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("Missing serialized value for TRIAppContainer.type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = 1;
LABEL_7:
    v12 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("TRIAppContainerOCNTErrorDomain"), v11, v9);
    objc_msgSend(v4, "failWithError:", v12);
LABEL_9:

    goto LABEL_10;
  }
LABEL_4:
  self = -[TRIAppContainer initWithIdentifier:type:](self, "initWithIdentifier:type:", v5, v6);
  v7 = self;
LABEL_11:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *identifier;
  id v6;

  v4 = a3;
  identifier = self->_identifier;
  v6 = v4;
  if (identifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", identifier, CFSTR("identifier"));
    v4 = v6;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_type, CFSTR("type"));

}

- (id)description
{
  id v3;
  NSString *identifier;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  identifier = self->_identifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIAppContainer | identifier:%@ type:%@>"), identifier, v5);

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
