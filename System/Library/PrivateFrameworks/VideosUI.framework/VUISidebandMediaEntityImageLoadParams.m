@implementation VUISidebandMediaEntityImageLoadParams

- (VUISidebandMediaEntityImageLoadParams)initWithVideoManagedObject:(id)a3 imageType:(unint64_t)a4
{
  id v6;
  VUISidebandMediaEntityImageLoadParams *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  objc_super v30;

  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)VUISidebandMediaEntityImageLoadParams;
  v7 = -[VUISidebandMediaEntityImageLoadParams init](&v30, sel_init);
  if (v7)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__8;
    v28 = __Block_byref_object_dispose__8;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__8;
    v22 = __Block_byref_object_dispose__8;
    v23 = 0;
    objc_msgSend(v6, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __78__VUISidebandMediaEntityImageLoadParams_initWithVideoManagedObject_imageType___block_invoke;
    v13 = &unk_1E9F9DE20;
    v14 = v6;
    v15 = &v24;
    v16 = &v18;
    v17 = a4;
    objc_msgSend(v8, "performBlockAndWait:", &v10);

    if (v25[5] && objc_msgSend((id)v19[5], "length", v10, v11, v12, v13))
    {
      objc_storeStrong((id *)&v7->_imageInfo, (id)v25[5]);
      objc_storeStrong((id *)&v7->_imageIdentifierInternal, (id)v19[5]);
      v7->_imageTypeInternal = a4;
    }
    else
    {

      v7 = 0;
    }

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

  }
  return v7;
}

void __78__VUISidebandMediaEntityImageLoadParams_initWithVideoManagedObject_imageType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "series");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageInfos");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "imageInfos");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v8, "imageType") == *(_QWORD *)(a1 + 56))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "urlFormat");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "length"))
          {
            v10 = (void *)MEMORY[0x1E0CB3940];
            VUIImageTypeString(*(_QWORD *)(a1 + 56));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@"), v9, v11, (_QWORD)v17);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "tv_filenameSafeString");
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v15 = *(void **)(v14 + 40);
            *(_QWORD *)(v14 + 40) = v13;

          }
          goto LABEL_16;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_16:

}

- (unint64_t)imageType
{
  return self->_imageTypeInternal;
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifierInternal;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VUISidebandMediaEntityImageLoadParams imageIdentifierInternal](self, "imageIdentifierInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VUISidebandMediaEntityImageLoadParams *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (VUISidebandMediaEntityImageLoadParams *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VUISidebandMediaEntityImageLoadParams imageIdentifierInternal](self, "imageIdentifierInternal");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUISidebandMediaEntityImageLoadParams imageIdentifierInternal](v4, "imageIdentifierInternal");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (VUIImageInfoManagedObject)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
  objc_storeStrong((id *)&self->_imageInfo, a3);
}

- (unint64_t)imageTypeInternal
{
  return self->_imageTypeInternal;
}

- (void)setImageTypeInternal:(unint64_t)a3
{
  self->_imageTypeInternal = a3;
}

- (NSString)imageIdentifierInternal
{
  return self->_imageIdentifierInternal;
}

- (void)setImageIdentifierInternal:(id)a3
{
  objc_storeStrong((id *)&self->_imageIdentifierInternal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageIdentifierInternal, 0);
  objc_storeStrong((id *)&self->_imageInfo, 0);
}

@end
