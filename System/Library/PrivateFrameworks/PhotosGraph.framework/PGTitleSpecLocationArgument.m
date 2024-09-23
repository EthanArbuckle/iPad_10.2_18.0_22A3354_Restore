@implementation PGTitleSpecLocationArgument

- (PGTitleSpecLocationArgument)initWithLocationType:(unint64_t)a3 filterLocations:(BOOL)a4
{
  PGTitleSpecLocationArgument *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpecLocationArgument;
  result = -[PGTitleSpecLocationArgument init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_filterLocations = a4;
  }
  return result;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  id v6;
  id v7;
  unint64_t type;
  NSString *v9;
  PGLocationTitleOptions *v10;
  void *v12;
  void *v13;
  void *v14;
  PGLocationTitleOptions *v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  type = self->_type;
  if (type == 512)
  {
    if (-[NSString length](self->_locationName, "length"))
    {
      v9 = self->_locationName;
      goto LABEL_28;
    }
    type = self->_type;
  }
  v10 = (PGLocationTitleOptions *)(type & 0x30);
  if ((type & 0x30) == 0 || (type & 2) == 0)
  {
    objc_msgSend(v7, "locationHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((type & 0x30) == 0)
      goto LABEL_14;
    +[PGLocationTitleOptions onlyPeopleLocationTitleOptions](PGLocationTitleOptions, "onlyPeopleLocationTitleOptions");
    v10 = (PGLocationTitleOptions *)objc_claimAutoreleasedReturnValue();
    -[PGLocationTitleOptions setLineBreakBehavior:](v10, "setLineBreakBehavior:", self->_lineBreakBehavior);
    -[PGLocationTitleOptions setMomentNodes:](v10, "setMomentNodes:", v6);
    -[PGLocationTitleOptions setFilterSignificantLocationsType:](v10, "setFilterSignificantLocationsType:", 1);
    if ((type & 0x20) != 0)
      -[PGLocationTitleOptions setAllowFamilyHome:](v10, "setAllowFamilyHome:", 0);
    objc_msgSend(v7, "serviceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleSpecLocationArgument _generateLocationTitleWithOptions:locationHelper:serviceManager:](self, "_generateLocationTitleWithOptions:locationHelper:serviceManager:", v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
LABEL_14:
      v15 = v10;
      v23 = (type >> 6) & 1;
      v10 = objc_alloc_init(PGLocationTitleOptions);

      -[PGLocationTitleOptions setUseBusinessItems:](v10, "setUseBusinessItems:", (type >> 1) & 1);
      -[PGLocationTitleOptions setMomentNodes:](v10, "setMomentNodes:", v6);
      -[PGLocationTitleOptions setUseCities:](v10, "setUseCities:", type & 1);
      -[PGLocationTitleOptions setShowAllCities:](v10, "setShowAllCities:", (type >> 7) & 1);
      -[PGLocationTitleOptions setUseDistrict:](v10, "setUseDistrict:", v23);
      if ((type & 8) != 0)
      {
        v16 = 4;
      }
      else if ((type & 0xC) != 0)
      {
        v16 = 3;
      }
      else
      {
        v16 = (self->_type >> 8) & 1;
      }
      -[PGLocationTitleOptions setAoiDisplayType:](v10, "setAoiDisplayType:", v16, v23);
      -[PGLocationTitleOptions setPeopleDisplayType:](v10, "setPeopleDisplayType:", 0);
      -[PGLocationTitleOptions setLineBreakBehavior:](v10, "setLineBreakBehavior:", self->_lineBreakBehavior);
      if (self->_filterLocations)
        v20 = 3;
      else
        v20 = 0;
      -[PGLocationTitleOptions setFilterSignificantLocationsType:](v10, "setFilterSignificantLocationsType:", v20);
      objc_msgSend(v7, "serviceManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleSpecLocationArgument _generateLocationTitleWithOptions:locationHelper:serviceManager:](self, "_generateLocationTitleWithOptions:locationHelper:serviceManager:", v10, v12, v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = v14;

    v9 = (NSString *)v18;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "loggingConnection");
    v18 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Cannot allow business item and people home at the same time.", buf, 2u);
    }
    v9 = 0;
  }

LABEL_28:
  return v9;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  id v8;
  unint64_t type;
  NSString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  unint64_t v31;
  id v32;
  void *v33;
  PGTitleSpecLocationArgument *v34;
  id obj;
  void *v36;
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32 = a4;
  v36 = v8;
  v37 = a5;
  type = self->_type;
  if (type != 512)
    goto LABEL_5;
  if (!-[NSString length](self->_locationName, "length"))
  {
    type = self->_type;
LABEL_5:
    v34 = self;
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__7225;
    v48 = __Block_byref_object_dispose__7226;
    v49 = 0;
    objc_msgSend(v8, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "graph");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "locationHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v32;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (!v13)
      goto LABEL_42;
    v14 = *(_QWORD *)v41;
    v31 = (type & 4) >> 2;
    v15 = 1;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "type", v31);
        if ((type & 2) != 0 && v18 == 17)
        {
          objc_msgSend(v37, "serviceManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGTitleSpecLocationArgument _generateBusinessItemTitleWithMomentNodes:locationHelper:serviceManager:](v34, "_generateBusinessItemTitleWithMomentNodes:locationHelper:serviceManager:", v36, v12, v19);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v45[5];
          v45[5] = v20;

          goto LABEL_38;
        }
        if ((type & 4) != 0 && v18 == 8)
        {
          objc_msgSend(v17, "nodeInGraph:", v33);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v19, v12);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v45[5];
          v45[5] = v22;

          goto LABEL_38;
        }
        if ((type & 1) != 0)
        {
          if (v18 == 8 || v18 == 4)
          {
            objc_msgSend(v17, "nodeInGraph:", v33);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v19, v12);
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = (void *)v45[5];
            v45[5] = v25;

            if (objc_msgSend((id)v45[5], "length"))
              v27 = (type & 4) == 0;
            else
              v27 = 1;
            v15 = v27;
          }
          else
          {
LABEL_30:
            if (objc_msgSend(v17, "type") != 7)
              goto LABEL_39;
            +[PGLocationTitleOptions onlyPeopleLocationTitleOptions](PGLocationTitleOptions, "onlyPeopleLocationTitleOptions");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setLineBreakBehavior:", v34->_lineBreakBehavior);
            objc_msgSend(v19, "setMomentNodes:", v36);
            if ((type & 0x30) != 0)
            {
              if ((type & 0x20) != 0)
                objc_msgSend(v19, "setAllowFamilyHome:", 0);
              objc_msgSend(v37, "serviceManager");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v39[0] = MEMORY[0x1E0C809B0];
              v39[1] = 3221225472;
              v39[2] = __97__PGTitleSpecLocationArgument__resolvedStringWithMomentNodes_features_argumentEvaluationContext___block_invoke;
              v39[3] = &unk_1E84289C0;
              v39[4] = &v44;
              +[PGLocationTitleUtility generateLocationTitleWithOptions:locationHelper:serviceManager:result:](PGLocationTitleUtility, "generateLocationTitleWithOptions:locationHelper:serviceManager:result:", v19, v12, v28, v39);

            }
            if (!v45[5] && (type & 1) != 0)
            {
              objc_msgSend(v19, "setPeopleDisplayType:", 0);
              objc_msgSend(v19, "setUseCities:", 1);
              objc_msgSend(v19, "setAoiDisplayType:", v31);
              objc_msgSend(v37, "serviceManager");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v38[0] = MEMORY[0x1E0C809B0];
              v38[1] = 3221225472;
              v38[2] = __97__PGTitleSpecLocationArgument__resolvedStringWithMomentNodes_features_argumentEvaluationContext___block_invoke_2;
              v38[3] = &unk_1E84289C0;
              v38[4] = &v44;
              +[PGLocationTitleUtility generateLocationTitleWithOptions:locationHelper:serviceManager:result:](PGLocationTitleUtility, "generateLocationTitleWithOptions:locationHelper:serviceManager:result:", v19, v12, v29, v38);

            }
          }
LABEL_38:

          goto LABEL_39;
        }
        if ((type & 0x30) != 0)
          goto LABEL_30;
LABEL_39:
        if (((objc_msgSend((id)v45[5], "length") != 0) & v15) != 0)
          goto LABEL_42;
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (!v13)
      {
LABEL_42:

        v10 = (NSString *)(id)v45[5];
        _Block_object_dispose(&v44, 8);

        goto LABEL_43;
      }
    }
  }
  v10 = self->_locationName;
LABEL_43:

  return v10;
}

- (id)_generateBusinessItemTitleWithMomentNodes:(id)a3 locationHelper:(id)a4 serviceManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  PGLocationTitleOptions *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(PGLocationTitleOptions);
  -[PGLocationTitleOptions setUseBusinessItems:](v11, "setUseBusinessItems:", 1);
  -[PGLocationTitleOptions setAoiDisplayType:](v11, "setAoiDisplayType:", 0);
  -[PGLocationTitleOptions setUseCities:](v11, "setUseCities:", 0);
  -[PGLocationTitleOptions setPeopleDisplayType:](v11, "setPeopleDisplayType:", 0);
  -[PGLocationTitleOptions setLineBreakBehavior:](v11, "setLineBreakBehavior:", self->_lineBreakBehavior);
  -[PGLocationTitleOptions setMomentNodes:](v11, "setMomentNodes:", v10);

  -[PGTitleSpecLocationArgument _generateLocationTitleWithOptions:locationHelper:serviceManager:](self, "_generateLocationTitleWithOptions:locationHelper:serviceManager:", v11, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_generateLocationTitleWithOptions:(id)a3 locationHelper:(id)a4 serviceManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7225;
  v18 = __Block_byref_object_dispose__7226;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__PGTitleSpecLocationArgument__generateLocationTitleWithOptions_locationHelper_serviceManager___block_invoke;
  v13[3] = &unk_1E84330E0;
  v13[4] = self;
  v13[5] = &v14;
  +[PGLocationTitleUtility generateLocationTitleWithOptions:locationHelper:serviceManager:result:](PGLocationTitleUtility, "generateLocationTitleWithOptions:locationHelper:serviceManager:result:", v8, v9, v10, v13);
  if (objc_msgSend((id)v15[5], "length"))
    v11 = (id)v15[5];
  else
    v11 = 0;
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)filterLocations
{
  return self->_filterLocations;
}

- (NSSet)usedLocationNodes
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUsedLocationNodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)lineBreakBehavior
{
  return self->_lineBreakBehavior;
}

- (void)setLineBreakBehavior:(unint64_t)a3
{
  self->_lineBreakBehavior = a3;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void)setLocationName:(id)a3
{
  objc_storeStrong((id *)&self->_locationName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_usedLocationNodes, 0);
}

void __95__PGTitleSpecLocationArgument__generateLocationTitleWithOptions_locationHelper_serviceManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setUsedLocationNodes:", v7);

}

void __97__PGTitleSpecLocationArgument__resolvedStringWithMomentNodes_features_argumentEvaluationContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __97__PGTitleSpecLocationArgument__resolvedStringWithMomentNodes_features_argumentEvaluationContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)argumentWithLocationType:(unint64_t)a3 filterLocations:(BOOL)a4
{
  return -[PGTitleSpecLocationArgument initWithLocationType:filterLocations:]([PGTitleSpecLocationArgument alloc], "initWithLocationType:filterLocations:", a3, a4);
}

+ (id)argumentWithLocationTypeLocationForLocationName:(id)a3
{
  id v3;
  PGTitleSpecLocationArgument *v4;

  v3 = a3;
  v4 = -[PGTitleSpecLocationArgument initWithLocationType:filterLocations:]([PGTitleSpecLocationArgument alloc], "initWithLocationType:filterLocations:", 512, 0);
  -[PGTitleSpecLocationArgument setLocationName:](v4, "setLocationName:", v3);

  return v4;
}

@end
