@implementation PLPersistedPersonFaceMetadata

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PLPersistedPersonFaceMetadata centerX](self, "centerX");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("centerX"));
  -[PLPersistedPersonFaceMetadata centerY](self, "centerY");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("centerY"));
  -[PLPersistedPersonFaceMetadata size](self, "size");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("size"));
  -[PLPersistedPersonFaceMetadata bodyCenterX](self, "bodyCenterX");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("bodyCenterX"));
  -[PLPersistedPersonFaceMetadata bodyCenterY](self, "bodyCenterY");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("bodyCenterY"));
  -[PLPersistedPersonFaceMetadata bodyWidth](self, "bodyWidth");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("bodyWidth"));
  -[PLPersistedPersonFaceMetadata bodyHeight](self, "bodyHeight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("bodyHeight"));
  -[PLPersistedPersonFaceMetadata detectionType](self, "detectionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLPersistedPersonFaceMetadata detectionType](self, "detectionType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeInt:forKey:", objc_msgSend(v5, "intValue"), CFSTR("detectionType"));

  }
  -[PLPersistedPersonFaceMetadata assetUUID](self, "assetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("assetUUID"));

  -[PLPersistedPersonFaceMetadata assetCloudGUID](self, "assetCloudGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("assetCloudGUID"));

  objc_msgSend(v8, "encodeBool:forKey:", -[PLPersistedPersonFaceMetadata isHidden](self, "isHidden"), CFSTR("isHidden"));
  objc_msgSend(v8, "encodeBool:forKey:", -[PLPersistedPersonFaceMetadata isManual](self, "isManual"), CFSTR("isManual"));
  objc_msgSend(v8, "encodeBool:forKey:", -[PLPersistedPersonFaceMetadata isRepresentative](self, "isRepresentative"), CFSTR("isRepresentative"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[PLPersistedPersonFaceMetadata nameSource](self, "nameSource"), CFSTR("nameSource"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[PLPersistedPersonFaceMetadata cloudNameSource](self, "cloudNameSource"), CFSTR("cloudNameSource"));
  objc_msgSend(v8, "encodeBool:forKey:", -[PLPersistedPersonFaceMetadata isClusterRejected](self, "isClusterRejected"), CFSTR("isClusterRejected"));
  objc_msgSend(v8, "encodeInt32:forKey:", -[PLPersistedPersonFaceMetadata faceAlgorithmVersion](self, "faceAlgorithmVersion"), CFSTR("faceAlgorithmVersion"));

}

- (PLPersistedPersonFaceMetadata)initWithCoder:(id)a3
{
  id v4;
  PLPersistedPersonFaceMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLPersistedPersonFaceMetadata;
  v5 = -[PLPersistedPersonFaceMetadata init](&v12, sel_init);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("centerX"));
  -[PLPersistedPersonFaceMetadata setCenterX:](v5, "setCenterX:");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("centerY"));
  -[PLPersistedPersonFaceMetadata setCenterY:](v5, "setCenterY:");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("size"));
  -[PLPersistedPersonFaceMetadata setSize:](v5, "setSize:");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bodyCenterX"));
  -[PLPersistedPersonFaceMetadata setBodyCenterX:](v5, "setBodyCenterX:");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bodyCenterY"));
  -[PLPersistedPersonFaceMetadata setBodyCenterY:](v5, "setBodyCenterY:");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bodyWidth"));
  -[PLPersistedPersonFaceMetadata setBodyWidth:](v5, "setBodyWidth:");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bodyHeight"));
  -[PLPersistedPersonFaceMetadata setBodyHeight:](v5, "setBodyHeight:");
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("detectionType")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("detectionType")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistedPersonFaceMetadata setDetectionType:](v5, "setDetectionType:", v6);

  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedPersonFaceMetadata setAssetUUID:](v5, "setAssetUUID:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetCloudGUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedPersonFaceMetadata setAssetCloudGUID:](v5, "setAssetCloudGUID:", v8);

  -[PLPersistedPersonFaceMetadata setHidden:](v5, "setHidden:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHidden")));
  -[PLPersistedPersonFaceMetadata setManual:](v5, "setManual:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isManual")));
  -[PLPersistedPersonFaceMetadata setRepresentative:](v5, "setRepresentative:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRepresentative")));
  -[PLPersistedPersonFaceMetadata setFaceAlgorithmVersion:](v5, "setFaceAlgorithmVersion:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("faceAlgorithmVersion")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("isNameSourceAuto")))
    v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isNameSourceAuto")) ^ 1;
  else
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("nameSource"));
  -[PLPersistedPersonFaceMetadata setNameSource:](v5, "setNameSource:", v9);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("cloudNameSource")))
    v10 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("cloudNameSource"));
  else
    v10 = -[PLPersistedPersonFaceMetadata nameSource](v5, "nameSource");
  -[PLPersistedPersonFaceMetadata setCloudNameSource:](v5, "setCloudNameSource:", v10);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("isClusterRejected")))
    -[PLPersistedPersonFaceMetadata setClusterRejected:](v5, "setClusterRejected:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isClusterRejected")));

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PLPersistedPersonFaceMetadata;
  -[PLPersistedPersonFaceMetadata description](&v23, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedPersonFaceMetadata assetUUID](self, "assetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedPersonFaceMetadata assetCloudGUID](self, "assetCloudGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedPersonFaceMetadata size](self, "size");
  v7 = v6;
  -[PLPersistedPersonFaceMetadata centerX](self, "centerX");
  v9 = v8;
  -[PLPersistedPersonFaceMetadata centerY](self, "centerY");
  v11 = v10;
  -[PLPersistedPersonFaceMetadata bodyCenterX](self, "bodyCenterX");
  v13 = v12;
  -[PLPersistedPersonFaceMetadata bodyCenterY](self, "bodyCenterY");
  v15 = v14;
  -[PLPersistedPersonFaceMetadata bodyWidth](self, "bodyWidth");
  v17 = v16;
  -[PLPersistedPersonFaceMetadata bodyHeight](self, "bodyHeight");
  v19 = v18;
  -[PLPersistedPersonFaceMetadata detectionType](self, "detectionType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" face on %@ [%@] (face: %6.6f @ %6.6f,%6.6f) (body: %6.6fx%6.6f @ %6.6f,%6.6f) type:%d isKey:%d [manual:%d hidden:%d nameSource:%d]"), v4, v5, v7, v9, v11, v13, v15, v17, v19, objc_msgSend(v20, "intValue"), -[PLPersistedPersonFaceMetadata isRepresentative](self, "isRepresentative"), -[PLPersistedPersonFaceMetadata isManual](self, "isManual"), -[PLPersistedPersonFaceMetadata isHidden](self, "isHidden"), -[PLPersistedPersonFaceMetadata nameSource](self, "nameSource"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (id)_insertDeferredRebuildFaceFromDataInManagedObjectContext:(id)a3 personUUID:(id)a4 isRejected:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (-[PLPersistedPersonFaceMetadata isDeferrable](self, "isDeferrable"))
  {
    +[PLManagedObject insertInManagedObjectContext:](PLDeferredRebuildFace, "insertInManagedObjectContext:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistedPersonFaceMetadata centerX](self, "centerX");
    objc_msgSend(v10, "setCenterX:");
    -[PLPersistedPersonFaceMetadata centerY](self, "centerY");
    objc_msgSend(v10, "setCenterY:");
    -[PLPersistedPersonFaceMetadata size](self, "size");
    objc_msgSend(v10, "setSize:");
    objc_msgSend(v10, "setManual:", -[PLPersistedPersonFaceMetadata isManual](self, "isManual"));
    objc_msgSend(v10, "setHidden:", -[PLPersistedPersonFaceMetadata isHidden](self, "isHidden"));
    objc_msgSend(v10, "setNameSource:", -[PLPersistedPersonFaceMetadata nameSource](self, "nameSource"));
    objc_msgSend(v10, "setCloudNameSource:", -[PLPersistedPersonFaceMetadata cloudNameSource](self, "cloudNameSource"));
    -[PLPersistedPersonFaceMetadata assetUUID](self, "assetUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAssetUUID:", v11);

    -[PLPersistedPersonFaceMetadata assetCloudGUID](self, "assetCloudGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAssetCloudGUID:", v12);

    objc_msgSend(v10, "setRejected:", v5);
    objc_msgSend(v10, "setClusterRejected:", -[PLPersistedPersonFaceMetadata isClusterRejected](self, "isClusterRejected"));
    objc_msgSend(v10, "setPersonUUID:", v9);
    objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUuid:", v13);

    if (-[PLPersistedPersonFaceMetadata faceAlgorithmVersion](self, "faceAlgorithmVersion"))
      v14 = -[PLPersistedPersonFaceMetadata faceAlgorithmVersion](self, "faceAlgorithmVersion");
    else
      v14 = 1;
    objc_msgSend(v10, "setFaceAlgorithmVersion:", v14);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_identifier
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLPersistedPersonFaceMetadata assetCloudGUID](self, "assetCloudGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PLPersistedPersonFaceMetadata assetCloudGUID](self, "assetCloudGUID");
  else
    -[PLPersistedPersonFaceMetadata assetUUID](self, "assetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedPersonFaceMetadata size](self, "size");
  v7 = v6;
  -[PLPersistedPersonFaceMetadata centerX](self, "centerX");
  v9 = v8;
  -[PLPersistedPersonFaceMetadata centerY](self, "centerY");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%f%f%f"), v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)matchingFaceInManagedObejctContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLDetectedFace fetchRequest](PLDetectedFace, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  -[PLPersistedPersonFaceMetadata assetUUID](self, "assetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("assetForFace.uuid"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  objc_msgSend(v4, "executeFetchRequest:error:", v5, 0);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "centerX");
        v16 = v15;
        -[PLPersistedPersonFaceMetadata centerX](self, "centerX");
        if (vabdd_f64(v16, v17) < 0.001)
        {
          objc_msgSend(v14, "centerY");
          v19 = v18;
          -[PLPersistedPersonFaceMetadata centerY](self, "centerY");
          if (vabdd_f64(v19, v20) < 0.001)
          {
            objc_msgSend(v14, "size");
            v22 = v21;
            -[PLPersistedPersonFaceMetadata size](self, "size");
            if (vabdd_f64(v22, v23) < 0.001)
            {
              v24 = v14;
              goto LABEL_13;
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v11)
        continue;
      break;
    }
  }
  v24 = 0;
LABEL_13:

  return v24;
}

- (BOOL)matchesEntityInLibraryBackedByManagedObjectContext:(id)a3 forConfirmedPersonUUID:(id)a4 diff:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char IsEqual;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[PLPersistedPersonFaceMetadata matchingFaceInManagedObejctContext:](self, "matchingFaceInManagedObejctContext:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "personForFace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "personUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    IsEqual = PLObjectIsEqual();

    if ((IsEqual & 1) == 0)
    {
      objc_msgSend(v10, "_pl_setNonNilObject:forKey:", v8, CFSTR("personUUID"));
      objc_msgSend(v9, "personForFace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "personUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_pl_setNonNilObject:forKey:", v16, CFSTR("personUUID"));

    }
    v17 = -[PLPersistedPersonFaceMetadata nameSource](self, "nameSource");
    if (v17 != objc_msgSend(v9, "nameSource"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPersistedPersonFaceMetadata nameSource](self, "nameSource"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("nameSource"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "nameSource"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("nameSource"));

    }
    v20 = -[PLPersistedPersonFaceMetadata cloudNameSource](self, "cloudNameSource");
    if (v20 != objc_msgSend(v9, "cloudNameSource"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPersistedPersonFaceMetadata cloudNameSource](self, "cloudNameSource"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v21, CFSTR("cloudNameSource"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "cloudNameSource"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v22, CFSTR("cloudNameSource"));

    }
    v23 = -[PLPersistedPersonFaceMetadata isManual](self, "isManual");
    if (v23 != objc_msgSend(v9, "manual"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLPersistedPersonFaceMetadata isManual](self, "isManual"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v24, CFSTR("manual"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "manual"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v25, CFSTR("manual"));

    }
    objc_msgSend(v9, "personBeingKeyFace");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v26 != 0) != -[PLPersistedPersonFaceMetadata isRepresentative](self, "isRepresentative"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLPersistedPersonFaceMetadata isRepresentative](self, "isRepresentative"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v27, CFSTR("isKeyFace"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26 != 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v28, CFSTR("isKeyFace"));

    }
    if (a5)
    {
      v31[0] = CFSTR("metadata");
      v31[1] = CFSTR("library");
      v32[0] = v10;
      v32[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v10, "count"))
      v29 = 0;
    else
      v29 = objc_msgSend(v11, "count") == 0;

  }
  else
  {
    v29 = 0;
    if (a5)
      *a5 = 0;
  }

  return v29;
}

- (BOOL)matchesEntityInLibraryBackedByManagedObjectContext:(id)a3 forRejectedPersonUUID:(id)a4 diff:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[PLPersistedPersonFaceMetadata matchingFaceInManagedObejctContext:](self, "matchingFaceInManagedObejctContext:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "rejectedPersons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __111__PLPersistedPersonFaceMetadata_matchesEntityInLibraryBackedByManagedObjectContext_forRejectedPersonUUID_diff___block_invoke;
    v28[3] = &unk_1E366F800;
    v13 = v8;
    v29 = v13;
    objc_msgSend(v11, "objectsPassingTest:", v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v25 = v15;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clusterRejectedPersons");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v12;
      v26[1] = 3221225472;
      v26[2] = __111__PLPersistedPersonFaceMetadata_matchesEntityInLibraryBackedByManagedObjectContext_forRejectedPersonUUID_diff___block_invoke_2;
      v26[3] = &unk_1E366F800;
      v27 = v13;
      objc_msgSend(v18, "objectsPassingTest:", v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "anyObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v20 != 0) != -[PLPersistedPersonFaceMetadata isClusterRejected](self, "isClusterRejected"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLPersistedPersonFaceMetadata isClusterRejected](self, "isClusterRejected"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("isClusterRejected"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20 != 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v22, CFSTR("isClusterRejected"));

      }
      if (a5)
      {
        v30[0] = CFSTR("metadata");
        v30[1] = CFSTR("library");
        v31[0] = v16;
        v31[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v25;
      if (objc_msgSend(v16, "count"))
        v23 = 0;
      else
        v23 = objc_msgSend(v17, "count") == 0;

    }
    else
    {
      v23 = 0;
      if (a5)
        *a5 = 0;
    }

  }
  else
  {
    v23 = 0;
    if (a5)
      *a5 = 0;
  }

  return v23;
}

- (id)jsonDictionary
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[15];
  _QWORD v34[17];

  v34[15] = *MEMORY[0x1E0C80C00];
  v33[0] = CFSTR("assetUUID");
  -[PLPersistedPersonFaceMetadata assetUUID](self, "assetUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = &stru_1E36789C0;
  v34[0] = v4;
  v33[1] = CFSTR("assetCloudGUID");
  -[PLPersistedPersonFaceMetadata assetCloudGUID](self, "assetCloudGUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v5;
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = &stru_1E36789C0;
  v34[1] = v6;
  v33[2] = CFSTR("centerX");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPersistedPersonFaceMetadata centerX](self, "centerX");
  objc_msgSend(v7, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v30;
  v33[3] = CFSTR("centerY");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPersistedPersonFaceMetadata centerY](self, "centerY");
  objc_msgSend(v8, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v29;
  v33[4] = CFSTR("size");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPersistedPersonFaceMetadata size](self, "size");
  objc_msgSend(v9, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v28;
  v33[5] = CFSTR("bodyCenterX");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPersistedPersonFaceMetadata bodyCenterX](self, "bodyCenterX");
  objc_msgSend(v10, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v27;
  v33[6] = CFSTR("bodyCenterY");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPersistedPersonFaceMetadata bodyCenterY](self, "bodyCenterY");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v12;
  v33[7] = CFSTR("bodyWidth");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPersistedPersonFaceMetadata bodyWidth](self, "bodyWidth");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v14;
  v33[8] = CFSTR("bodyHeight");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPersistedPersonFaceMetadata bodyHeight](self, "bodyHeight");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v16;
  v33[9] = CFSTR("detectionType");
  -[PLPersistedPersonFaceMetadata detectionType](self, "detectionType");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = &unk_1E375FCD8;
  if (v17)
    v19 = (void *)v17;
  v34[9] = v19;
  v33[10] = CFSTR("nameSource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPersistedPersonFaceMetadata nameSource](self, "nameSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[10] = v20;
  v33[11] = CFSTR("cloudNameSource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPersistedPersonFaceMetadata cloudNameSource](self, "cloudNameSource"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[11] = v21;
  v33[12] = CFSTR("manual");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLPersistedPersonFaceMetadata isManual](self, "isManual"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[12] = v22;
  v33[13] = CFSTR("isKeyFace");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLPersistedPersonFaceMetadata isRepresentative](self, "isRepresentative"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[13] = v23;
  v33[14] = CFSTR("isClusterRejected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLPersistedPersonFaceMetadata isClusterRejected](self, "isClusterRejected"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[14] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)isDeferrable
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PLPersistedPersonFaceMetadata centerX](self, "centerX");
  if (v3 == 0.0)
    return 0;
  -[PLPersistedPersonFaceMetadata bodyCenterX](self, "bodyCenterX");
  if (v4 != 0.0)
    return 0;
  -[PLPersistedPersonFaceMetadata detectionType](self, "detectionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PLPersistedPersonFaceMetadata detectionType](self, "detectionType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue") == 1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (void)setAssetUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)assetCloudGUID
{
  return self->_assetCloudGUID;
}

- (void)setAssetCloudGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)centerX
{
  return self->_centerX;
}

- (void)setCenterX:(double)a3
{
  self->_centerX = a3;
}

- (double)centerY
{
  return self->_centerY;
}

- (void)setCenterY:(double)a3
{
  self->_centerY = a3;
}

- (double)size
{
  return self->_size;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (double)bodyCenterX
{
  return self->_bodyCenterX;
}

- (void)setBodyCenterX:(double)a3
{
  self->_bodyCenterX = a3;
}

- (double)bodyCenterY
{
  return self->_bodyCenterY;
}

- (void)setBodyCenterY:(double)a3
{
  self->_bodyCenterY = a3;
}

- (double)bodyWidth
{
  return self->_bodyWidth;
}

- (void)setBodyWidth:(double)a3
{
  self->_bodyWidth = a3;
}

- (double)bodyHeight
{
  return self->_bodyHeight;
}

- (void)setBodyHeight:(double)a3
{
  self->_bodyHeight = a3;
}

- (NSNumber)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(id)a3
{
  self->_detectionType = (NSNumber *)a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isManual
{
  return self->_manual;
}

- (void)setManual:(BOOL)a3
{
  self->_manual = a3;
}

- (BOOL)isRepresentative
{
  return self->_representative;
}

- (void)setRepresentative:(BOOL)a3
{
  self->_representative = a3;
}

- (BOOL)isClusterRejected
{
  return self->_clusterRejected;
}

- (void)setClusterRejected:(BOOL)a3
{
  self->_clusterRejected = a3;
}

- (int)nameSource
{
  return self->_nameSource;
}

- (void)setNameSource:(int)a3
{
  self->_nameSource = a3;
}

- (int)cloudNameSource
{
  return self->_cloudNameSource;
}

- (void)setCloudNameSource:(int)a3
{
  self->_cloudNameSource = a3;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (int)faceAlgorithmVersion
{
  return self->_faceAlgorithmVersion;
}

- (void)setFaceAlgorithmVersion:(int)a3
{
  self->_faceAlgorithmVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCloudGUID, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

uint64_t __111__PLPersistedPersonFaceMetadata_matchesEntityInLibraryBackedByManagedObjectContext_forRejectedPersonUUID_diff___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "personUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __111__PLPersistedPersonFaceMetadata_matchesEntityInLibraryBackedByManagedObjectContext_forRejectedPersonUUID_diff___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "personUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_detectedFacePropertiesToFetch
{
  pl_dispatch_once();
  return (id)_detectedFacePropertiesToFetch_pl_once_object_15;
}

+ (id)_detectedFaceRelationshipKeyPathsToPrefetch
{
  pl_dispatch_once();
  return (id)_detectedFaceRelationshipKeyPathsToPrefetch_pl_once_object_16;
}

+ (id)_persistedFaceMetadataWithDetectedFace:(id)a3 isKeyFace:(BOOL)a4 isClusterRejected:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistedPersonMetadata.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("face"));

  }
  objc_msgSend(v9, "associatedAssetForFaceOrTorso:orTemporal:", 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc_init((Class)a1);
    objc_msgSend(v12, "setAssetUUID:", v11);
    objc_msgSend(v10, "cloudAssetGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAssetCloudGUID:", v13);

    objc_msgSend(v9, "centerX");
    objc_msgSend(v12, "setCenterX:");
    objc_msgSend(v9, "centerY");
    objc_msgSend(v12, "setCenterY:");
    objc_msgSend(v9, "size");
    objc_msgSend(v12, "setSize:");
    objc_msgSend(v9, "bodyCenterX");
    objc_msgSend(v12, "setBodyCenterX:");
    objc_msgSend(v9, "bodyCenterY");
    objc_msgSend(v12, "setBodyCenterY:");
    objc_msgSend(v9, "bodyWidth");
    objc_msgSend(v12, "setBodyWidth:");
    objc_msgSend(v9, "bodyHeight");
    objc_msgSend(v12, "setBodyHeight:");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v9, "detectionType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDetectionType:", v14);

    objc_msgSend(v12, "setHidden:", objc_msgSend(v9, "hidden"));
    objc_msgSend(v12, "setManual:", objc_msgSend(v9, "manual"));
    objc_msgSend(v12, "setRepresentative:", v6);
    objc_msgSend(v12, "setNameSource:", objc_msgSend(v9, "nameSource"));
    objc_msgSend(v12, "setCloudNameSource:", objc_msgSend(v9, "cloudNameSource"));
    objc_msgSend(v12, "setClusterRejected:", v5);
    objc_msgSend(v12, "setFaceAlgorithmVersion:", objc_msgSend(v9, "faceAlgorithmVersion"));
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_migrateDetectedFaces:(id)a3 forPersonMetadata:(id)a4 fromVersion:(unint64_t)a5
{
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t n;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[NSObject count](v7, "count"))
  {
    objc_msgSend(v8, "personUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v78 = -[NSObject count](v7, "count");
      v79 = 2112;
      v80 = (uint64_t)v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Migrating %lu faces metadata for person %@", buf, 0x16u);
    }

    if (a5 <= 2)
    {
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = (uint64_t)v9;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Resetting name source on persisted faces during rebuild for person %@", buf, 0xCu);
      }

      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v12 = v7;
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v69 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "setNameSource:", objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "isRepresentative"));
          }
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        }
        while (v14);
      }

    }
    if (a5 <= 7)
    {
      PLMigrationGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = (uint64_t)v9;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Fixing name source on manual faces during rebuild for person %@", buf, 0xCu);
      }

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v18 = v7;
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v22 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v65 != v22)
              objc_enumerationMutation(v18);
            v24 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
            if (objc_msgSend(v24, "isManual"))
            {
              ++v21;
              objc_msgSend(v24, "setNameSource:", 3);
            }
          }
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
        }
        while (v20);
      }
      else
      {
        v21 = 0;
      }

      PLMigrationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v78 = v21;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Fixed %lu manual face name source", buf, 0xCu);
      }

      v60 = 0u;
      v61 = 0u;
      if (objc_msgSend(v8, "verifiedType") == 2)
        v26 = 5;
      else
        v26 = 1;
      v62 = 0uLL;
      v63 = 0uLL;
      v27 = v18;
      v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v61;
        while (2)
        {
          for (k = 0; k != v29; ++k)
          {
            if (*(_QWORD *)v61 != v30)
              objc_enumerationMutation(v27);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "nameSource") == (_DWORD)v26)
            {
              v33 = v27;
              goto LABEL_56;
            }
          }
          v29 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
          if (v29)
            continue;
          break;
        }
      }

      PLMigrationGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v78 = (uint64_t)v9;
        v79 = 2048;
        v80 = v26;
        _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "Person %@ is missing named face during rebuild, will set representative face nameSource to %ld", buf, 0x16u);
      }

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v33 = v27;
      v34 = -[NSObject countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v57;
        while (2)
        {
          for (m = 0; m != v35; ++m)
          {
            if (*(_QWORD *)v57 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * m);
            if (objc_msgSend(v38, "isRepresentative"))
            {
              objc_msgSend(v38, "setNameSource:", v26);
              goto LABEL_56;
            }
          }
          v35 = -[NSObject countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
          if (v35)
            continue;
          break;
        }
      }

      PLMigrationGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v78 = (uint64_t)v8;
        _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Persisted person %@ has zero named faces, no representative face. Unable to choose a face for face crop generation", buf, 0xCu);
      }
LABEL_56:

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v7 = v27;
      v40 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v53;
        do
        {
          for (n = 0; n != v41; ++n)
          {
            if (*(_QWORD *)v53 != v42)
              objc_enumerationMutation(v7);
            v44 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * n);
            if (objc_msgSend(v44, "nameSource", (_QWORD)v52) == 5
              || objc_msgSend(v44, "nameSource") == 1
              || objc_msgSend(v44, "nameSource") == 3
              || objc_msgSend(v44, "isManual"))
            {
              objc_msgSend(v39, "addObject:", v44);
            }
          }
          v41 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
        }
        while (v41);
      }

      v45 = -[NSObject count](v7, "count");
      v46 = objc_msgSend(v39, "count");
      v47 = v45 - v46;
      if (v45 != v46)
      {
        v48 = v46;
        PLMigrationGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v78 = v47;
          v79 = 2048;
          v80 = v48;
          _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_DEFAULT, "Removing %ld non-user named faces from facesMetadata, %ld user named faces remaining", buf, 0x16u);
        }

        v50 = v39;
        v7 = v50;
      }

    }
  }

  return v7;
}

+ (id)_persistedFacesWithUnarchiver:(id)a3 key:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)enumerateMatchedAssetsWithMetadata:(id)a3 inContext:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, void *);
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, void *))a5;
  objc_msgSend(v7, "_pl_map:", &__block_literal_global_82);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v8;
  +[PLManagedAsset assetsWithUUIDs:options:inManagedObjectContext:](PLManagedAsset, "assetsWithUUIDs:options:inManagedObjectContext:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_pl_indexBy:", &__block_literal_global_85_66157);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "assetUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          v9[2](v9, v17, v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

}

uint64_t __88__PLPersistedPersonFaceMetadata_enumerateMatchedAssetsWithMetadata_inContext_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __88__PLPersistedPersonFaceMetadata_enumerateMatchedAssetsWithMetadata_inContext_withBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetUUID");
}

void __76__PLPersistedPersonFaceMetadata__detectedFaceRelationshipKeyPathsToPrefetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("assetForFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)_detectedFaceRelationshipKeyPathsToPrefetch_pl_once_object_16;
  _detectedFaceRelationshipKeyPathsToPrefetch_pl_once_object_16 = v1;

}

void __63__PLPersistedPersonFaceMetadata__detectedFacePropertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[14];

  v3[13] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("centerX");
  v3[1] = CFSTR("centerY");
  v3[2] = CFSTR("size");
  v3[3] = CFSTR("bodyCenterX");
  v3[4] = CFSTR("bodyCenterY");
  v3[5] = CFSTR("bodyWidth");
  v3[6] = CFSTR("bodyHeight");
  v3[7] = CFSTR("detectionType");
  v3[8] = CFSTR("manual");
  v3[9] = CFSTR("hidden");
  v3[10] = CFSTR("nameSource");
  v3[11] = CFSTR("cloudNameSource");
  v3[12] = CFSTR("faceAlgorithmVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 13);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)_detectedFacePropertiesToFetch_pl_once_object_15;
  _detectedFacePropertiesToFetch_pl_once_object_15 = v1;

}

@end
