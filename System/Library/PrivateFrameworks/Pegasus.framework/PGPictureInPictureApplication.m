@implementation PGPictureInPictureApplication

+ (id)pictureInPictureApplicationWithProcessIdentifier:(int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (pictureInPictureApplicationWithProcessIdentifier__onceToken != -1)
    dispatch_once(&pictureInPictureApplicationWithProcessIdentifier__onceToken, &__block_literal_global);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)pictureInPictureApplicationWithProcessIdentifier____pictureInPictureApplications;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if (objc_msgSend(v10, "processIdentifier", (_QWORD)v13) == (_DWORD)v3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v11 = v10;

    if (v11)
      return v11;
  }
  else
  {
LABEL_11:

  }
  v11 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithProcessIdentifier:", v3);
  objc_msgSend((id)pictureInPictureApplicationWithProcessIdentifier____pictureInPictureApplications, "addObject:", v11);
  return v11;
}

void __82__PGPictureInPictureApplication_pictureInPictureApplicationWithProcessIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pictureInPictureApplicationWithProcessIdentifier____pictureInPictureApplications;
  pictureInPictureApplicationWithProcessIdentifier____pictureInPictureApplications = v0;

}

- (PGPictureInPictureApplication)initWithProcessIdentifier:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  PGPictureInPictureApplication *v6;
  PGPictureInPictureApplication *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  objc_super v11;

  v3 = *(_QWORD *)&a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureApplication initWithProcessIdentifier:].cold.1(self);

  v11.receiver = self;
  v11.super_class = (Class)PGPictureInPictureApplication;
  v6 = -[PGPictureInPictureApplication init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_processIdentifier = v3;
    PGBundleIdentifierForProcessIdentifier(v3);
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

  }
  return v7;
}

- (PGPictureInPictureApplication)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ may only be initialized by PGPictureInPictureController."), v6);

  return -[PGPictureInPictureApplication initWithProcessIdentifier:](self, "initWithProcessIdentifier:", 0);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureApplication initWithProcessIdentifier:].cold.1(self);

  v4.receiver = self;
  v4.super_class = (Class)PGPictureInPictureApplication;
  -[PGPictureInPictureApplication dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqualToPGPictureInPictureApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureApplication bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = objc_msgSend(v4, "processIdentifier");
    v8 = v7 == -[PGPictureInPictureApplication processIdentifier](self, "processIdentifier");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PGPictureInPictureApplication *v4;
  BOOL v5;

  v4 = (PGPictureInPictureApplication *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PGPictureInPictureApplication isEqualToPGPictureInPictureApplication:](self, "isEqualToPGPictureInPictureApplication:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PGPictureInPictureApplication bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pid: %ui- bundle: %@"), self->_processIdentifier, self->_bundleIdentifier);
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)initWithProcessIdentifier:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _PGLogMethodProem(a1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v2, v3, "%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
