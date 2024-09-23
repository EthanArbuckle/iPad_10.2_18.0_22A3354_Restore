@implementation TSUExtendedAttributeCollection

+ (BOOL)removeExtraExtendedAttributesAtPath:(id)a3 forIntent:(unsigned int)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  char v13;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:forRemoval:options:error:", v10, 1, v7, a6);
  v12 = v11;
  if (v11)
    v13 = objc_msgSend(v11, "setAttributeCollectionToPath:intent:options:forRemoval:error:", v10, v8, v7, 1, a6);
  else
    v13 = 0;

  return v13;
}

- (TSUExtendedAttributeCollection)init
{
  return -[TSUExtendedAttributeCollection initWithAttributes:](self, "initWithAttributes:", MEMORY[0x24BDBD1A8]);
}

- (TSUExtendedAttributeCollection)initWithAttributes:(id)a3
{
  id v4;
  TSUExtendedAttributeCollection *v5;
  uint64_t v6;
  NSMutableDictionary *attributes;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  char *v15;
  NSMutableDictionary *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TSUExtendedAttributeCollection;
  v5 = -[TSUExtendedAttributeCollection init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    attributes = v5->_attributes;
    v5->_attributes = (NSMutableDictionary *)v6;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "name");
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v15 = xattr_name_without_flags((const char *)objc_msgSend(v14, "UTF8String"));

          v16 = v5->_attributes;
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v15);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v13, v17);

          free(v15);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
    }

    v4 = v19;
  }

  return v5;
}

- (TSUExtendedAttributeCollection)initWithPath:(id)a3 options:(int)a4 error:(id *)a5
{
  return -[TSUExtendedAttributeCollection initWithPath:forRemoval:options:error:](self, "initWithPath:forRemoval:options:error:", a3, 0, *(_QWORD *)&a4, a5);
}

- (TSUExtendedAttributeCollection)initWithPath:(id)a3 forRemoval:(BOOL)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v7;
  _BOOL8 v8;
  id v10;
  const char *v11;
  const char *v12;
  ssize_t v13;
  size_t v14;
  char *v15;
  char *v16;
  ssize_t v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  void *v21;
  unint64_t v22;
  id v23;
  void *v24;
  size_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  TSUExtendedAttributeCollection *v29;
  TSUExtendedAttributeCollection *v31;
  char *v32;
  void *v33;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v10 = objc_retainAutorelease(a3);
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
  if (!v11)
  {
    if (!a6)
      goto LABEL_27;
    v26 = (void *)MEMORY[0x24BDD1540];
    v27 = 2;
LABEL_23:
    objc_msgSend(v26, "tsu_fileReadPOSIXErrorWithNumber:userInfo:", v27, 0);
    v29 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v12 = v11;
  v13 = listxattr(v11, 0, 0, v7);
  if (v13 == -1)
  {
    if (!a6)
      goto LABEL_27;
    v28 = (void *)MEMORY[0x24BDD1540];
    v27 = *__error();
    v26 = v28;
    goto LABEL_23;
  }
  v14 = v13;
  if (v13 < 1)
  {
    self = -[TSUExtendedAttributeCollection init](self, "init");
    v29 = self;
    goto LABEL_30;
  }
  v15 = (char *)malloc_type_malloc(v13, 0x100004077774924uLL);
  if (!v15)
  {
    if (a6)
    {
      v26 = (void *)MEMORY[0x24BDD1540];
      v27 = 12;
      goto LABEL_23;
    }
LABEL_27:
    v29 = 0;
    goto LABEL_30;
  }
  v16 = v15;
  v17 = listxattr(v12, v15, v14, v7);
  if (v17 == -1)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    free(v16);
    goto LABEL_27;
  }
  v18 = v17;
  v33 = (void *)objc_opt_new();
  if (v18 < 1)
    goto LABEL_29;
  v31 = self;
  v19 = 0x24BDD1000uLL;
  v32 = v16;
  v20 = v16;
  while (1)
  {
    v21 = (void *)objc_msgSend(objc_alloc(*(Class *)(v19 + 1992)), "initWithUTF8String:", v20);
    if ((objc_msgSend(v21, "hasPrefix:", CFSTR("com.apple.security.private.")) & 1) != 0)
    {
      if (TSUDefaultCat_init_token != -1)
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_53);
      goto LABEL_13;
    }
    v22 = v19;
    v23 = -[TSUExtendedAttribute initFromPathFileSystemRepresentation:name:forRemoval:options:error:]([TSUExtendedAttribute alloc], "initFromPathFileSystemRepresentation:name:forRemoval:options:error:", v12, v21, v8, v7, a6);
    if (!v23)
      break;
    v24 = v23;
    objc_msgSend(v33, "addObject:", v23);

    v19 = v22;
LABEL_13:
    v25 = strlen(v20);
    v20 += v25 + 1;
    v18 -= v25 + 1;

    if (v18 <= 0)
    {
      self = v31;
      v16 = v32;
      goto LABEL_29;
    }
  }

  self = 0;
  v16 = v32;
LABEL_29:
  free(v16);
  self = -[TSUExtendedAttributeCollection initWithAttributes:](self, "initWithAttributes:", v33);

  v29 = self;
LABEL_30:

  return v29;
}

void __72__TSUExtendedAttributeCollection_initWithPath_forRemoval_options_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (BOOL)setAttributeCollectionToPath:(id)a3 intent:(unsigned int)a4 options:(int)a5 error:(id *)a6
{
  return -[TSUExtendedAttributeCollection setAttributeCollectionToPath:intent:options:forRemoval:error:](self, "setAttributeCollectionToPath:intent:options:forRemoval:error:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, a6);
}

- (BOOL)setAttributeCollectionToPath:(id)a3 intent:(unsigned int)a4 options:(int)a5 forRemoval:(BOOL)a6 error:(id *)a7
{
  id v12;
  uint64_t v13;
  NSMutableDictionary *attributes;
  int v15;
  BOOL v16;
  _QWORD v18[7];
  unsigned int v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v12 = objc_retainAutorelease(a3);
  v13 = objc_msgSend(v12, "fileSystemRepresentation");
  if (v13)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 1;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__15;
    v26 = __Block_byref_object_dispose__15;
    v27 = 0;
    attributes = self->_attributes;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __95__TSUExtendedAttributeCollection_setAttributeCollectionToPath_intent_options_forRemoval_error___block_invoke;
    v18[3] = &unk_24F39C550;
    v21 = a6;
    v18[5] = &v28;
    v18[6] = v13;
    v19 = a4;
    v20 = a5;
    v18[4] = &v22;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](attributes, "enumerateKeysAndObjectsUsingBlock:", v18);
    v15 = *((unsigned __int8 *)v29 + 24);
    if (a7 && !*((_BYTE *)v29 + 24))
    {
      *a7 = objc_retainAutorelease((id)v23[5]);
      v15 = *((unsigned __int8 *)v29 + 24);
    }
    v16 = v15 != 0;
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  else if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0);
    v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __95__TSUExtendedAttributeCollection_setAttributeCollectionToPath_intent_options_forRemoval_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  id obj;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = *(unsigned __int8 *)(a1 + 64);
  v10 = objc_msgSend(v8, "shouldPreserveForIntent:", *(unsigned int *)(a1 + 56));
  if (v9)
  {
    if ((v10 & 1) == 0)
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(unsigned int *)(a1 + 60);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      obj = *(id *)(v13 + 40);
      v14 = objc_msgSend(v8, "setAttributeToPathFileSystemRepresentation:options:error:", v11, v12, &obj);
      objc_storeStrong((id *)(v13 + 40), obj);
      if ((v14 & 1) == 0)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else if (v10)
  {
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(unsigned int *)(a1 + 60);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v20 = *(id *)(v17 + 40);
    v18 = objc_msgSend(v8, "setAttributeToPathFileSystemRepresentation:options:error:", v15, v16, &v20);
    objc_storeStrong((id *)(v17 + 40), v20);
    if ((v18 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 0;
    }
  }

}

- (id)allAttributes
{
  return (id)-[NSMutableDictionary allValues](self->_attributes, "allValues");
}

- (id)extendedAttributeForName:(id)a3
{
  const char *v4;
  char *v5;
  NSMutableDictionary *attributes;
  void *v7;
  void *v8;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (v4)
  {
    v5 = xattr_name_without_flags(v4);
    attributes = self->_attributes;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v5);
    -[NSMutableDictionary objectForKeyedSubscript:](attributes, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    free(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)setExtendedAttributeValue:(id)a3 forName:(id)a4
{
  id v6;
  const char *v7;
  char *v8;
  TSUExtendedAttribute *v9;
  NSMutableDictionary *attributes;
  void *v11;
  id v12;

  v12 = a3;
  v6 = objc_retainAutorelease(a4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  if (v7)
  {
    v8 = xattr_name_without_flags(v7);
    v9 = -[TSUExtendedAttribute initWithName:value:]([TSUExtendedAttribute alloc], "initWithName:value:", v6, v12);
    attributes = self->_attributes;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](attributes, "setObject:forKeyedSubscript:", v9, v11);

    free(v8);
  }

}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_attributes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  NSMutableDictionary *attributes;
  char v8;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    attributes = self->_attributes;
    if ((unint64_t)attributes | v6[1])
      v8 = -[NSMutableDictionary isEqual:](attributes, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSUExtendedAttributeCollection allAttributes](self, "allAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p attributes='%@'>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
