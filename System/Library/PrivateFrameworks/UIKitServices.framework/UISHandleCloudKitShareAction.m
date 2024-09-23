@implementation UISHandleCloudKitShareAction

+ (id)cloudKitShareActionWithShareMetadata:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithShareMetadata:", v4);

  return v5;
}

- (UISHandleCloudKitShareAction)initWithShareMetadata:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  UISHandleCloudKitShareAction *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISHandleCloudKitShareAction.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shareMetadata"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("CKShareMetadataObjectKey"));
  objc_msgSend(v7, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v8, 1);

  v12.receiver = self;
  v12.super_class = (Class)UISHandleCloudKitShareAction;
  v9 = -[UISHandleCloudKitShareAction initWithInfo:responder:](&v12, sel_initWithInfo_responder_, v6, 0);

  return v9;
}

- (id)data
{
  void *v2;
  void *v3;

  -[UISHandleCloudKitShareAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CKShareMetadata)shareMetadata
{
  CKShareMetadata *cachedMetadata;
  uint64_t v4;
  void *v5;
  id CKShareMetadataClass;
  void *v7;
  CKShareMetadata *v8;
  CKShareMetadata *v9;
  CKShareMetadata *v10;

  cachedMetadata = self->_cachedMetadata;
  if (!cachedMetadata)
  {
    -[UISHandleCloudKitShareAction data](self, "data");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      NSLog(CFSTR("%s: Invalid UISHandleCloudKitShareAction object does not have data: %@"), "-[UISHandleCloudKitShareAction shareMetadata]", self);
      v10 = 0;
      return v10;
    }
    v5 = (void *)v4;
    CKShareMetadataClass = getCKShareMetadataClass();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, 0);
    objc_msgSend(v7, "_enableStrictSecureDecodingMode");
    objc_msgSend(v7, "decodeObjectOfClass:forKey:", CKShareMetadataClass, CFSTR("CKShareMetadataObjectKey"));
    v8 = (CKShareMetadata *)objc_claimAutoreleasedReturnValue();
    v9 = self->_cachedMetadata;
    self->_cachedMetadata = v8;

    objc_msgSend(v7, "finishDecoding");
    cachedMetadata = self->_cachedMetadata;
  }
  v10 = cachedMetadata;
  return v10;
}

- (int64_t)UIActionType
{
  return 23;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("data");
  else
    return 0;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISHandleCloudKitShareAction;
  if (-[UISHandleCloudKitShareAction isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
}

@end
