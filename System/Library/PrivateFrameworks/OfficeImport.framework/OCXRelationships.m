@implementation OCXRelationships

- (OCXRelationships)initWithPath:(id)a3
{
  id v4;
  OCXRelationships *v5;
  uint64_t v6;
  NSString *mPath;
  NSMutableArray *v8;
  NSMutableArray *mRelationships;
  NSMutableDictionary *v10;
  NSMutableDictionary *mRelationshipMap;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OCXRelationships;
  v5 = -[OCXRelationships init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mPath = v5->mPath;
    v5->mPath = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mRelationships = v5->mRelationships;
    v5->mRelationships = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mRelationshipMap = v5->mRelationshipMap;
    v5->mRelationshipMap = v10;

  }
  return v5;
}

- (id)path
{
  return self->mPath;
}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->mRelationships, "count") == 0;
}

- (id)addRelationshipForKey:(id)a3 type:(id)a4 target:(id)a5
{
  -[OCXRelationships addRelationshipForKey:type:target:external:](self, "addRelationshipForKey:type:target:external:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)addRelationshipForKey:(id)a3 type:(id)a4 target:(id)a5 external:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  OCXRelationship *v23;
  _BOOL4 v25;
  OCXRelationships *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v25 = a6;
  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26 = self;
  v27 = v9;
  if (v9)
  {
    -[NSMutableDictionary objectForKey:](self->mRelationshipMap, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "idString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = self->mRelationships;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v19, "type");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v20, "isEqualToString:", v10) & 1) != 0)
          {
            objc_msgSend(v19, "target");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", v11);

            if (v22)
            {
              objc_msgSend(v19, "idString");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_19;
            }
          }
          else
          {

          }
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

  }
  ++v26->mNextId;
  v23 = -[OCXRelationship initWithId:type:target:external:]([OCXRelationship alloc], "initWithId:type:target:external:", v26->mNextId, v10, v11, v25);
  -[NSMutableArray addObject:](v26->mRelationships, "addObject:", v23);
  if (v27)
    -[NSMutableDictionary setObject:forKey:](v26->mRelationshipMap, "setObject:forKey:", v23, v27);
  -[OCXRelationship idString](v23, "idString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v14;
}

- (id)idForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->mRelationshipMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)targetForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->mRelationshipMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)writeRelationshipsToFilename:(id)a3 stream:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[NSMutableArray count](self->mRelationships, "count"))
  {
    v8 = +[TCXmlStreamWriter newXmlStreamWriterWithZipEntryName:outputStream:isCompressed:](TCXmlStreamWriter, "newXmlStreamWriterWithZipEntryName:outputStream:isCompressed:", v6, v7, 1);
    objc_msgSend(v8, "setUp");
    objc_msgSend(v8, "startElement:prefix:ns:", CFSTR("Relationships"), 0, "http://schemas.openxmlformats.org/package/2006/relationships");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v9 = self->mRelationships;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "writeToStreamWriter:", v8, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    objc_msgSend(v8, "endElement");
    objc_msgSend(v8, "tearDown");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRelationshipMap, 0);
  objc_storeStrong((id *)&self->mRelationships, 0);
  objc_storeStrong((id *)&self->mPath, 0);
}

@end
