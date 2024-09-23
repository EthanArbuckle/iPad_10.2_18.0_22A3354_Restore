@implementation SBFFileCacheMemoryStore

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_fileWrappers, CFSTR("fileWrappers"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)fileCache:(id)a3 storeFileWrapper:(id)a4
{
  id v7;
  void *v8;
  NSMutableDictionary *fileWrappers;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFFileCache.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileWrapper"), v13);

  }
  objc_msgSend(v7, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "preferredFilename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  fileWrappers = self->_fileWrappers;
  if (!fileWrappers)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = self->_fileWrappers;
    self->_fileWrappers = v10;

    fileWrappers = self->_fileWrappers;
  }
  -[NSMutableDictionary setObject:forKey:](fileWrappers, "setObject:forKey:", v7, v8);

}

- (id)fileCache:(id)a3 loadFileWrapperNamed:(id)a4
{
  return (id)-[NSMutableDictionary objectForKey:](self->_fileWrappers, "objectForKey:", a4);
}

- (void)fileCache:(id)a3 removeFileWrapperNamed:(id)a4
{
  -[NSMutableDictionary removeObjectForKey:](self->_fileWrappers, "removeObjectForKey:", a4);
}

- (void)removeAllFileWrappersForFileCache:(id)a3
{
  -[NSMutableDictionary removeAllObjects](self->_fileWrappers, "removeAllObjects", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileWrappers, 0);
}

@end
