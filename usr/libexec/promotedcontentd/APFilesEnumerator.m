@implementation APFilesEnumerator

- (APFilesEnumerator)initWithObjectsIterator:(id)a3 fileManager:(id)a4 extension:(id)a5
{
  id v8;
  id v9;
  id v10;
  APFilesEnumerator *v11;
  NSString *v12;
  NSString *extension;
  id v14;
  id objectsIterator;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[APFilesEnumerator init](self, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v10, "copy");
    extension = v11->_extension;
    v11->_extension = v12;

    v14 = objc_msgSend(v8, "copy");
    objectsIterator = v11->_objectsIterator;
    v11->_objectsIterator = v14;

    objc_storeStrong((id *)&v11->_fileManager, a4);
  }

  return v11;
}

- (id)nextObject
{
  uint64_t (**v3)(void);
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  uint64_t (**v13)(void);
  uint64_t v14;
  uint64_t v15;
  id *v16;
  APFileSystemItemInfo *v17;
  void *v18;

  v3 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[APFilesEnumerator objectsIterator](self, "objectsIterator"));
  v4 = v3[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (v5)
  {
    do
    {
      v6 = objc_claimAutoreleasedReturnValue(-[APFilesEnumerator extension](self, "extension"));
      if (!v6
        || (v7 = (void *)v6,
            v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathExtension")),
            v9 = (void *)objc_claimAutoreleasedReturnValue(-[APFilesEnumerator extension](self, "extension")),
            v10 = objc_msgSend(v8, "isEqualToString:", v9),
            v9,
            v8,
            v7,
            (v10 & 1) != 0))
      {
        v11 = sub_100166864((uint64_t)APFileNameConverter, v5, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        if (objc_msgSend(v12, "length"))
        {
          v17 = [APFileSystemItemInfo alloc];
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[APFilesEnumerator fileManager](self, "fileManager"));
          v16 = sub_100166B2C((id *)&v17->super.isa, v12, v5, v18);

          return v16;
        }

      }
      v13 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[APFilesEnumerator objectsIterator](self, "objectsIterator"));
      v14 = v13[2]();
      v15 = objc_claimAutoreleasedReturnValue(v14);

      v5 = (void *)v15;
    }
    while (v15);
  }
  v16 = 0;
  return v16;
}

- (id)objectsIterator
{
  return self->_objectsIterator;
}

- (NSString)extension
{
  return self->_extension;
}

- (APStorageManager)fileManager
{
  return self->_fileManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong(&self->_objectsIterator, 0);
}

@end
