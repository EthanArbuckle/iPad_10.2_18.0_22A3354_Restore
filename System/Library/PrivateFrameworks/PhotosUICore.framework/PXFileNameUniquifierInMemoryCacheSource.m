@implementation PXFileNameUniquifierInMemoryCacheSource

- (PXFileNameUniquifierInMemoryCacheSource)init
{
  PXFileNameUniquifierInMemoryCacheSource *v2;
  uint64_t v3;
  NSMutableSet *knownFilePaths;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXFileNameUniquifierInMemoryCacheSource;
  v2 = -[PXFileNameUniquifierInMemoryCacheSource init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    knownFilePaths = v2->_knownFilePaths;
    v2->_knownFilePaths = (NSMutableSet *)v3;

  }
  return v2;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PXFileNameUniquifierInMemoryCacheSource knownFilePaths](self, "knownFilePaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)rememberUniquifiedFilePath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXFileNameUniquifierInMemoryCacheSource knownFilePaths](self, "knownFilePaths");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXFileNameUniquifierInMemoryCacheSource knownFilePaths](self, "knownFilePaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p known file paths: %@  >"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSMutableSet)knownFilePaths
{
  return self->_knownFilePaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownFilePaths, 0);
}

@end
