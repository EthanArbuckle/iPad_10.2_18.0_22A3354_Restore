@implementation RTCloudManagedObject

- (NSUUID)identifier
{
  void *v3;

  -[RTCloudManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("identifier"));
  -[RTCloudManagedObject primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTCloudManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("identifier"));
  return (NSUUID *)v3;
}

+ (id)entityNamesEligibleForDeletionByOtherDevices
{
  return &unk_1E932CB20;
}

+ (id)notTombstonedPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("flags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K & %lu) != %lu"), CFSTR("flags"), 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v8[0] = v2;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[RTCloudManagedObject identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[RTCloudManagedObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("identifier"));
    -[RTCloudManagedObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("identifier"));
    -[RTCloudManagedObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("identifier"));
    objc_msgSend(v7, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTCloudManagedObject setCkRecordID:](self, "setCkRecordID:", v6);

  }
}

+ (id)tombstonedPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("flags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K & %lu) == %lu"), CFSTR("flags"), 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v8[0] = v2;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)awakeFromInsert
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)RTCloudManagedObject;
  -[RTCloudManagedObject awakeFromInsert](&v11, sel_awakeFromInsert);
  -[RTCloudManagedObject managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTCloudManagedObject awakeFromInsert]";
      v14 = 1024;
      v15 = 94;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Managed object contexts inserting subclasses of RTCloudManagedObject cannot have an undo manager. (in %s:%d)", buf, 0x12u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[RTCloudManagedObject managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transactionAuthor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("NSCloudKitMirroringDelegate"));

    if ((v8 & 1) == 0)
    {
      -[RTCloudManagedObject managedObjectContext](self, "managedObjectContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTCloudManagedObject setDevice:](self, "setDevice:", v10);

    }
  }
}

- (void)willChangeValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  RTCloudManagedObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  void *v39;
  char isKindOfClass;
  void *v41;
  objc_super v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  RTCloudManagedObject *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)RTCloudManagedObject;
  -[RTCloudManagedObject willChangeValueForKey:](&v42, sel_willChangeValueForKey_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[RTCloudManagedObject managedObjectContext](self, "managedObjectContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transactionAuthor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "hasPrefix:", CFSTR("NSCloudKitMirroringDelegate")))
      {

LABEL_5:
        goto LABEL_27;
      }
      -[RTCloudManagedObject managedObjectContext](self, "managedObjectContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "transactionAuthor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("RTPersistenceStoreImporter"));

      if ((v9 & 1) == 0
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("flags")) & 1) == 0
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("expirationDate")) & 1) == 0)
      {
        -[RTCloudManagedObject device](self, "device");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          -[RTCloudManagedObject device](self, "device");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTCloudManagedObject managedObjectContext](self, "managedObjectContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "currentDevice");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v14, "isEqual:", v17);

          if ((v18 & 1) == 0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v44 = v4;
              v45 = 2112;
              v46 = self;
              _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Attempting to modify property, %@, on a cloud managed object, %@", buf, 0x16u);
            }

            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              -[RTCloudManagedObject device](self, "device");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "UUIDString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTCloudManagedObject managedObjectContext](self, "managedObjectContext");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "currentDevice");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "UUIDString");
              v27 = (RTCloudManagedObject *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v44 = v23;
              v45 = 2112;
              v46 = v27;
              _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "object device, %@, current device, %@.", buf, 0x16u);

            }
            v41 = (void *)MEMORY[0x1E0C99DA0];
            v28 = *MEMORY[0x1E0C99768];
            v29 = (void *)MEMORY[0x1E0CB3940];
            -[RTCloudManagedObject device](self, "device");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
              v32 = CFSTR("YES");
            else
              v32 = CFSTR("NO");
            -[RTCloudManagedObject managedObjectContext](self, "managedObjectContext");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "currentDevice");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
              v36 = CFSTR("YES");
            else
              v36 = CFSTR("NO");
            objc_msgSend(v29, "stringWithFormat:", CFSTR("Attempting to modify property on a cloud managed object, device id nonnull, %@, managed object id nonnull, %@"), v32, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "exceptionWithName:reason:userInfo:", v28, v37, 0);
            v38 = (id)objc_claimAutoreleasedReturnValue();

            objc_exception_throw(v38);
          }
        }
        else
        {

        }
        -[RTCloudManagedObject managedObjectContext](self, "managedObjectContext");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[RTCloudManagedObject managedObjectContext](self, "managedObjectContext");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v5, "allowTombstones") & 1) == 0 && (-[RTCloudManagedObject flags](self, "flags") & 1) != 0)
            +[RTException dontOpenDeadInside](RTException, "dontOpenDeadInside");
          goto LABEL_5;
        }
      }
    }
  }
LABEL_27:

}

@end
