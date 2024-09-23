@implementation WFFileLocation

- (WFFileLocation)initWithURL:(id)a3
{
  id v5;
  WFFileLocation *v6;
  void *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFileLocation.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v10.receiver = self;
  v10.super_class = (Class)WFFileLocation;
  v6 = -[WFFileLocation init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "subpathFromURL:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFFileLocation initWithRelativeSubpath:](v6, "initWithRelativeSubpath:", v7);

  }
  return v6;
}

- (WFFileLocation)initWithRelativeSubpath:(id)a3
{
  id v5;
  WFFileLocation *v6;
  NSObject *v7;
  WFFileLocation *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFileLocation;
  v6 = -[WFFileLocation init](&v10, sel_init);
  if (!v6)
    goto LABEL_6;
  getWFFilesLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFFileLocation initWithRelativeSubpath:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Relative subpath %@", buf, 0x16u);
  }

  objc_storeStrong((id *)&v6->_relativeSubpath, a3);
  if (v6->_relativeSubpath)
    v8 = v6;
  else
LABEL_6:
    v8 = 0;

  return v8;
}

- (BOOL)shouldShowUsersDuringDisplay:(id)a3
{
  return 0;
}

- (BOOL)isSupportedOnCurrentPlatform
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFFileLocation isSupportedOnCurrentPlatform] must be overridden"));
  return 1;
}

- (id)resolveLocationWithError:(id *)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFFileLocation resolveLocationWithError] must be overridden"));
  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFileLocation relativeSubpath](self, "relativeSubpath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, relativeSubpath: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (WFFileLocation)initWithCoder:(id)a3
{
  id v4;
  WFFileLocation *v5;
  uint64_t v6;
  NSString *relativeSubpath;
  WFFileLocation *v8;

  v4 = a3;
  v5 = -[WFFileLocation init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relativeSubpath"));
    v6 = objc_claimAutoreleasedReturnValue();
    relativeSubpath = v5->_relativeSubpath;
    v5->_relativeSubpath = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFFileLocation relativeSubpath](self, "relativeSubpath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("relativeSubpath"));

}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  WFFileLocationClassByType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("WFFileLocationType"));
  -[WFFileLocation relativeSubpath](self, "relativeSubpath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("relativeSubpath"));

  return v3;
}

- (NSString)relativeSubpath
{
  return self->_relativeSubpath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeSubpath, 0);
}

+ (id)locationWithURL:(id)a3
{
  id v5;
  char v6;
  id v7;
  void (**v8)(_QWORD);
  objc_class *v9;
  void *v10;
  void *v12;
  _QWORD aBlock[4];
  id v14;
  char v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFFileLocation.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v6 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__WFFileLocation_locationWithURL___block_invoke;
  aBlock[3] = &unk_1E7AF7348;
  v15 = v6;
  v7 = v5;
  v14 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v9 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedClassForURL:", v7);
  if (v9)
    v10 = (void *)objc_msgSend([v9 alloc], "initWithURL:", v7);
  else
    v10 = 0;
  v8[2](v8);

  return v10;
}

+ (id)subpathFromURL:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFFileLocation subpathFromURL] must be overridden"));
  return 0;
}

+ (Class)supportedClassForURL:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "supportedClassForURL:", v3, (_QWORD)v14);
        if (v9)
        {
          v11 = (void *)v9;
          getWFFilesLogObject();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v19 = "+[WFFileLocation supportedClassForURL:]";
            v20 = 2112;
            v21 = v11;
            v22 = 2112;
            v23 = v3;
            _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEBUG, "%s Found supported class: %@ for URL: %@", buf, 0x20u);
          }

          v10 = v11;
          goto LABEL_13;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return (Class)v10;
}

+ (BOOL)canRepresentURL:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)locationWithSerializedRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("WFFileLocationType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WFFileLocationClassByType();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "objectForKey:", v4);

    objc_msgSend(v6, "locationWithSerializedRepresentation:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __34__WFFileLocation_locationWithURL___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "stopAccessingSecurityScopedResource");
  return result;
}

@end
