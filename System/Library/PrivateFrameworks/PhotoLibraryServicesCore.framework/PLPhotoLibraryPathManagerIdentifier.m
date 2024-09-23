@implementation PLPhotoLibraryPathManagerIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PLPhotoLibraryPathManagerIdentifier isEqualToPathManagerIdentifier:](self, "isEqualToPathManagerIdentifier:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PLPhotoLibraryPathManagerIdentifier identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToPathManagerIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[PLPhotoLibraryPathManagerIdentifier identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[PLPhotoLibraryPathManagerIdentifier bundleFormat](self, "bundleFormat");
    objc_msgSend(v4, "bundleFormat");
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)bundleFormat
{
  return self->_bundleFormat;
}

- (PLPhotoLibraryPathManagerIdentifier)initWithPathManager:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  PLPhotoLibraryPathManagerIdentifier *v8;
  void *v10;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerIdentifier.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  if (objc_msgSend(v5, "bundleScope"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerIdentifier.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager.bundleScope == PLBundleScopeMain"));

  }
  objc_msgSend(v5, "photoDirectoryWithType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isUBF"))
    v7 = 2;
  else
    v7 = 1;
  v8 = -[PLPhotoLibraryPathManagerIdentifier initWithLibraryID:libraryFormat:](self, "initWithLibraryID:libraryFormat:", v6, v7);

  return v8;
}

- (PLPhotoLibraryPathManagerIdentifier)initWithLibraryID:(id)a3 libraryFormat:(unsigned __int8)a4
{
  id v8;
  PLPhotoLibraryPathManagerIdentifier *v9;
  PLPhotoLibraryPathManagerIdentifier *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerIdentifier.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryID"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PLPhotoLibraryPathManagerIdentifier;
  v9 = -[PLPhotoLibraryPathManagerIdentifier init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_bundleFormat = a4;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PLPhotoLibraryPathManagerIdentifier identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithLibraryID:libraryFormat:", v5, -[PLPhotoLibraryPathManagerIdentifier bundleFormat](self, "bundleFormat"));

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoLibraryPathManagerIdentifier;
  -[PLPhotoLibraryPathManagerIdentifier description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLStringFromPLPhotoLibraryPathManagerLibraryFormatShort(-[PLPhotoLibraryPathManagerIdentifier bundleFormat](self, "bundleFormat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManagerIdentifier identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@] [%@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setBundleFormat:(unsigned __int8)a3
{
  self->_bundleFormat = a3;
}

@end
