@implementation _SFPBPhotosLibraryImage

- (_SFPBPhotosLibraryImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBPhotosLibraryImage *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _SFPBPerson *v15;
  void *v16;
  void *v17;
  _SFPBPhotosLibraryImage *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBPhotosLibraryImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "photoIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "photoIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPhotosLibraryImage setPhotoIdentifier:](v5, "setPhotoIdentifier:", v7);

    }
    if (objc_msgSend(v4, "hasIsSyndicated"))
      -[_SFPBPhotosLibraryImage setIsSyndicated:](v5, "setIsSyndicated:", objc_msgSend(v4, "isSyndicated"));
    objc_msgSend(v4, "peopleInPhoto");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v9 = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "peopleInPhoto", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = -[_SFPBPerson initWithFacade:]([_SFPBPerson alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    -[_SFPBPhotosLibraryImage setPeopleInPhotos:](v5, "setPeopleInPhotos:", v9);
    objc_msgSend(v4, "applicationBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPhotosLibraryImage setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (void)setPhotoIdentifier:(id)a3
{
  NSString *v4;
  NSString *photoIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  photoIdentifier = self->_photoIdentifier;
  self->_photoIdentifier = v4;

}

- (void)setIsSyndicated:(BOOL)a3
{
  self->_isSyndicated = a3;
}

- (void)setPeopleInPhoto:(id)a3
{
  NSArray *v4;
  NSArray *peopleInPhotos;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  peopleInPhotos = self->_peopleInPhotos;
  self->_peopleInPhotos = v4;

}

- (void)clearPeopleInPhoto
{
  -[NSArray removeAllObjects](self->_peopleInPhotos, "removeAllObjects");
}

- (void)addPeopleInPhoto:(id)a3
{
  id v4;
  NSArray *peopleInPhotos;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  peopleInPhotos = self->_peopleInPhotos;
  v8 = v4;
  if (!peopleInPhotos)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_peopleInPhotos;
    self->_peopleInPhotos = v6;

    v4 = v8;
    peopleInPhotos = self->_peopleInPhotos;
  }
  -[NSArray addObject:](peopleInPhotos, "addObject:", v4);

}

- (unint64_t)peopleInPhotoCount
{
  return -[NSArray count](self->_peopleInPhotos, "count");
}

- (id)peopleInPhotoAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_peopleInPhotos, "objectAtIndexedSubscript:", a3);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *applicationBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPhotosLibraryImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  if (-[_SFPBPhotosLibraryImage isSyndicated](self, "isSyndicated"))
    PBDataWriterWriteBOOLField();
  -[_SFPBPhotosLibraryImage peopleInPhotos](self, "peopleInPhotos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[_SFPBPhotosLibraryImage applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int isSyndicated;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[_SFPBPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_17;
  -[_SFPBPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_18;
  }
  else
  {

  }
  isSyndicated = self->_isSyndicated;
  if (isSyndicated != objc_msgSend(v4, "isSyndicated"))
    goto LABEL_18;
  -[_SFPBPhotosLibraryImage peopleInPhotos](self, "peopleInPhotos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peopleInPhotos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_17;
  -[_SFPBPhotosLibraryImage peopleInPhotos](self, "peopleInPhotos");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_SFPBPhotosLibraryImage peopleInPhotos](self, "peopleInPhotos");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "peopleInPhotos");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[_SFPBPhotosLibraryImage applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[_SFPBPhotosLibraryImage applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

LABEL_21:
    v23 = 1;
    goto LABEL_19;
  }
  v19 = (void *)v18;
  -[_SFPBPhotosLibraryImage applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if ((v22 & 1) != 0)
    goto LABEL_21;
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_photoIdentifier, "hash");
  if (self->_isSyndicated)
    v4 = 2654435761;
  else
    v4 = 0;
  v5 = v4 ^ v3 ^ -[NSArray hash](self->_peopleInPhotos, "hash");
  return v5 ^ -[NSString hash](self->_applicationBundleIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applicationBundleIdentifier)
  {
    -[_SFPBPhotosLibraryImage applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("applicationBundleIdentifier"));

  }
  if (self->_isSyndicated)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPhotosLibraryImage isSyndicated](self, "isSyndicated"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isSyndicated"));

  }
  if (-[NSArray count](self->_peopleInPhotos, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = self->_peopleInPhotos;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("peopleInPhoto"));
  }
  if (self->_photoIdentifier)
  {
    -[_SFPBPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("photoIdentifier"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPhotosLibraryImage dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBPhotosLibraryImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPhotosLibraryImage *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBPhotosLibraryImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPhotosLibraryImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPhotosLibraryImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  _SFPBPerson *v16;
  void *v17;
  void *v18;
  _SFPBPhotosLibraryImage *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_SFPBPhotosLibraryImage;
  v5 = -[_SFPBPhotosLibraryImage init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("photoIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBPhotosLibraryImage setPhotoIdentifier:](v5, "setPhotoIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSyndicated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosLibraryImage setIsSyndicated:](v5, "setIsSyndicated:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peopleInPhoto"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v8;
      v22 = v6;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[_SFPBPerson initWithDictionary:]([_SFPBPerson alloc], "initWithDictionary:", v15);
              -[_SFPBPhotosLibraryImage addPeopleInPhoto:](v5, "addPeopleInPhoto:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v12);
      }

      v8 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationBundleIdentifier"), v21, v22, (_QWORD)v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      -[_SFPBPhotosLibraryImage setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v18);

    }
    v19 = v5;

  }
  return v5;
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

- (BOOL)isSyndicated
{
  return self->_isSyndicated;
}

- (NSArray)peopleInPhotos
{
  return self->_peopleInPhotos;
}

- (void)setPeopleInPhotos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_peopleInPhotos, 0);
  objc_storeStrong((id *)&self->_photoIdentifier, 0);
}

@end
