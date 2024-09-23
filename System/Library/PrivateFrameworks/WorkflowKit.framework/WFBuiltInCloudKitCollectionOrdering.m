@implementation WFBuiltInCloudKitCollectionOrdering

+ (id)recordType
{
  return CFSTR("BuiltInCollectionOrdering");
}

+ (id)recordBasename
{
  return CFSTR("WFBuiltInCollectionOrdering");
}

+ (BOOL)isOrderingRecordID:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("WFBuiltInCollectionOrdering"));

  return v4;
}

+ (id)recordIDWithZoneID:(id)a3 collectionIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFBuiltInCloudKitCollectionOrdering.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zoneID"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFBuiltInCloudKitCollectionOrdering.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("WFBuiltInCollectionOrdering"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v10, v7);

  return v11;
}

@end
