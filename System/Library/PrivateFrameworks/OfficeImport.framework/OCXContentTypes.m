@implementation OCXContentTypes

- (OCXContentTypes)init
{
  OCXContentTypes *v2;
  NSMutableArray *v3;
  NSMutableArray *mContentTypes;
  NSMutableSet *v5;
  NSMutableSet *mDefaultTypes;
  NSMutableDictionary *v7;
  NSMutableDictionary *mContentTypeObjectMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *mContentTypeCountMap;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OCXContentTypes;
  v2 = -[OCXContentTypes init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mContentTypes = v2->mContentTypes;
    v2->mContentTypes = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mDefaultTypes = v2->mDefaultTypes;
    v2->mDefaultTypes = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mContentTypeObjectMap = v2->mContentTypeObjectMap;
    v2->mContentTypeObjectMap = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mContentTypeCountMap = v2->mContentTypeCountMap;
    v2->mContentTypeCountMap = v9;

    -[OCXContentTypes populateCommonExtensions](v2, "populateCommonExtensions");
  }
  return v2;
}

- (id)addContentTypeForKey:(id)a3 contentType:(id)a4 path:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = self->mContentTypes;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v23;
LABEL_6:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "path", (_QWORD)v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v10);

        if (v19)
          goto LABEL_16;
        if (v15 == ++v17)
        {
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v15)
            goto LABEL_6;
          break;
        }
      }
    }

LABEL_14:
    v14 = -[OCXContentType initWithContentType:path:]([OCXContentType alloc], "initWithContentType:path:", v9, v10);
    -[NSMutableArray addObject:](self->mContentTypes, "addObject:", v14);
    if (v8)
      -[NSMutableDictionary setObject:forKey:](self->mContentTypeObjectMap, "setObject:forKey:", v14, v8);
LABEL_16:
    v10 = v10;

    v13 = v10;
    goto LABEL_17;
  }
  -[NSMutableDictionary objectForKey:](self->mContentTypeObjectMap, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    -[OCXContentTypes uniquePathForPath:](self, "uniquePathForPath:", v10);
    v20 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v20;
    goto LABEL_14;
  }
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v13;
}

- (id)pathForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->mContentTypeObjectMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pathForContentType:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->mContentTypes;
  v6 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "contentType", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          objc_msgSend(v9, "path");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)pathForMainDocument
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[16];

  v19[15] = *MEMORY[0x24BDAC8D0];
  v19[0] = CFSTR("application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml");
  v19[1] = CFSTR("application/vnd.ms-word.document.macroEnabled.main+xml");
  v19[2] = CFSTR("application/vnd.openxmlformats-officedocument.wordprocessingml.template.main+xml");
  v19[3] = CFSTR("application/vnd.ms-word.template.macroEnabledTemplate.main+xml");
  v19[4] = CFSTR("application/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml");
  v19[5] = CFSTR("application/vnd.openxmlformats-officedocument.presentationml.slideshow.main+xml");
  v19[6] = CFSTR("application/vnd.openxmlformats-officedocument.presentationml.template.main+xml");
  v19[7] = CFSTR("application/vnd.ms-powerpoint.presentation.macroEnabled.main+xml");
  v19[8] = CFSTR("application/vnd.ms-powerpoint.slideshow.macroEnabled.main+xml");
  v19[9] = CFSTR("application/vnd.ms-powerpoint.template.macroEnabled.main+xml");
  v19[10] = CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml");
  v19[11] = CFSTR("application/vnd.ms-excel.sheet.macroEnabled.main+xml");
  v19[12] = CFSTR("application/vnd.ms-excel.addin.macroEnabled.main+xml");
  v19[13] = CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.template.main+xml");
  v19[14] = CFSTR("application/vnd.ms-excel.template.macroEnabled.main+xml");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->mContentTypes;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      while (2)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        v7 = 0;
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
        do
        {
          objc_msgSend(v8, "contentType", (_QWORD)v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqual:", v19[v7]);

          if (v10)
          {
            objc_msgSend(v8, "path");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
          ++v7;
        }
        while (v7 != 15);
        if (++v6 != v4)
          continue;
        break;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v11 = 0;
    }
    while (v4);
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  for (i = 14; i != -1; --i)
  return v11;
}

+ (id)relativePathForPath:(id)a3 currentPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  unint64_t i;
  void *v21;
  uint64_t v22;
  id v23;
  unint64_t j;
  void *v25;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v6, "length") - 1) != 47
      || (objc_msgSend(v6, "lastPathComponent"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "pathExtension"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "length"),
          v8,
          v7,
          v9))
    {
      objc_msgSend(v6, "stringByDeletingLastPathComponent");
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v10;
    }
    v11 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("/"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    while (objc_msgSend(v13, "count"))
    {
      if (!objc_msgSend(v16, "count"))
        break;
      objc_msgSend(v13, "objectAtIndex:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if ((v19 & 1) == 0)
        break;
      objc_msgSend(v13, "removeObjectAtIndex:", 0);
      objc_msgSend(v16, "removeObjectAtIndex:", 0);
    }
    for (i = 0; i < objc_msgSend(v16, "count"); ++i)
    {
      objc_msgSend(v16, "objectAtIndex:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (!v22)
        break;
      objc_msgSend(v13, "insertObject:atIndex:", CFSTR(".."), 0);
    }
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    for (j = 0; j < objc_msgSend(v13, "count"); ++j)
    {
      if (objc_msgSend(v23, "length"))
        objc_msgSend(v23, "appendString:", CFSTR("/"));
      objc_msgSend(v13, "objectAtIndex:", j);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "appendString:", v25);

    }
  }
  else
  {
    v23 = v5;
  }

  return v23;
}

- (BOOL)containsContentType:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->mContentTypes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "contentType", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsContentType:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->mContentTypeObjectMap, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v6);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isLastEntryContentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[NSMutableArray lastObject](self->mContentTypes, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  return v7;
}

- (void)writeContentTypesToStream:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableSet *mDefaultTypes;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = +[TCXmlStreamWriter newXmlStreamWriterWithZipEntryName:outputStream:isCompressed:](TCXmlStreamWriter, "newXmlStreamWriterWithZipEntryName:outputStream:isCompressed:", CFSTR("[Content_Types].xml"), a3, 1);
  objc_msgSend(v4, "setUp");
  objc_msgSend(v4, "startElement:prefix:ns:", CFSTR("Types"), 0, "http://schemas.openxmlformats.org/package/2006/content-types");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->mContentTypes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isOverride", (_QWORD)v12))
        {
          mDefaultTypes = self->mDefaultTypes;
          objc_msgSend(v9, "contentType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(mDefaultTypes) = -[NSMutableSet containsObject:](mDefaultTypes, "containsObject:", v11);

          if ((mDefaultTypes & 1) != 0)
            continue;
        }
        objc_msgSend(v9, "writeToStreamWriter:", v4);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "endElement");
  objc_msgSend(v4, "tearDown");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContentTypeCountMap, 0);
  objc_storeStrong((id *)&self->mContentTypeObjectMap, 0);
  objc_storeStrong((id *)&self->mDefaultTypes, 0);
  objc_storeStrong((id *)&self->mContentTypes, 0);
}

- (void)populateCommonExtensions
{
  -[OCXContentTypes addContentTypeForContentType:extension:](self, "addContentTypeForContentType:extension:", CFSTR("application/xml"), CFSTR("xml"));
  -[OCXContentTypes addContentTypeForContentType:extension:](self, "addContentTypeForContentType:extension:", CFSTR("application/vnd.openxmlformats-package.relationships+xml"), CFSTR("rels"));
  -[OCXContentTypes addContentTypeForContentType:extension:](self, "addContentTypeForContentType:extension:", CFSTR("image/jpg"), CFSTR("jpeg"));
  -[OCXContentTypes addContentTypeForContentType:extension:](self, "addContentTypeForContentType:extension:", CFSTR("image/png"), CFSTR("png"));
  -[OCXContentTypes addContentTypeForContentType:extension:](self, "addContentTypeForContentType:extension:", CFSTR("image/bmp"), CFSTR("bmp"));
  -[OCXContentTypes addContentTypeForContentType:extension:](self, "addContentTypeForContentType:extension:", CFSTR("image/gif"), CFSTR("gif"));
  -[OCXContentTypes addContentTypeForContentType:extension:](self, "addContentTypeForContentType:extension:", CFSTR("image/tif"), CFSTR("tif"));
  -[OCXContentTypes addContentTypeForContentType:extension:](self, "addContentTypeForContentType:extension:", CFSTR("application/pdf"), CFSTR("pdf"));
  -[OCXContentTypes addContentTypeForContentType:extension:](self, "addContentTypeForContentType:extension:", CFSTR("application/movie"), CFSTR("mov"));
  -[OCXContentTypes addContentTypeForContentType:extension:](self, "addContentTypeForContentType:extension:", CFSTR("application/vnd.openxmlformats-officedocument.vmlDrawing"), CFSTR("vml"));
  -[OCXContentTypes addContentTypeForContentType:extension:](self, "addContentTypeForContentType:extension:", CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"), CFSTR("xlsx"));
}

- (void)addContentTypeForContentType:(id)a3 extension:(id)a4
{
  id v6;
  OCXContentType *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[OCXContentType initWithContentType:extension:]([OCXContentType alloc], "initWithContentType:extension:", v8, v6);
  -[NSMutableArray addObject:](self->mContentTypes, "addObject:", v7);
  -[NSMutableSet addObject:](self->mDefaultTypes, "addObject:", v8);

}

- (id)uniquePathForPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->mContentTypeCountMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "unsignedIntegerValue") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathExtension:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKey:](self->mContentTypeCountMap, "setObject:forKey:", v6, v4);
  return v12;
}

@end
