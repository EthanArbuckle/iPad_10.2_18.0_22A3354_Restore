@implementation PETEventTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingOutlet, 0);
  objc_storeStrong((id *)&self->_propertySubsets, 0);
  objc_storeStrong((id *)&self->_registeredProperties, 0);
  objc_storeStrong((id *)&self->_featureId, 0);
}

- (void)_trackEvent:(id)a3 withPropertyValues:(id)a4 value:(id)a5 overwrite:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSArray *registeredProperties;
  PETEventTracker *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  PETStringPairs *v25;
  id v26;
  NSArray *obj;
  _BOOL4 v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  NSArray *v40;
  uint64_t v41;

  v28 = a6;
  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v29 = a5;
  v11 = (void *)MEMORY[0x19400723C]();
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), CFSTR("Parameter 'event' must have a valid non-zero length value"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
  if (-[PETEventTracker _validatePropertyValues:](self, "_validatePropertyValues:", v10))
  {
    -[PETEventTracker _stringifiedPropertiesForEvent:propertyValueArray:](self, "_stringifiedPropertiesForEvent:propertyValueArray:", v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PETEventTracker _keyMetadataForEvent:](self, "_keyMetadataForEvent:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v10;
    v15 = v9;
    if (v28)
      -[PETEventTracker _setValue:forEvent:stringifiedProperties:metaData:](self, "_setValue:forEvent:stringifiedProperties:metaData:", v29, v9, v13, v14);
    else
      -[PETEventTracker _logValue:forEvent:stringifiedProperties:metaData:](self, "_logValue:forEvent:stringifiedProperties:metaData:", v29, v9, v13, v14);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = self;
    obj = self->_propertySubsets;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x19400723C]();
          objc_msgSend(v13, "subsetForKeys:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[PETStringPairs initWithKeys:values:]([PETStringPairs alloc], "initWithKeys:values:", &unk_1E2A49D30, &unk_1E2A49D48);
          if (v28)
            -[PETEventTracker _setValue:forEvent:stringifiedProperties:metaData:](v17, "_setValue:forEvent:stringifiedProperties:metaData:", v29, v15, v24, v25);
          else
            -[PETEventTracker _logValue:forEvent:stringifiedProperties:metaData:](v17, "_logValue:forEvent:stringifiedProperties:metaData:", v29, v15, v24, v25);

          objc_autoreleasePoolPop(v23);
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v19);
    }

    v9 = v15;
    v10 = v26;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      registeredProperties = self->_registeredProperties;
      *(_DWORD *)buf = 138412802;
      v36 = v9;
      v37 = 2112;
      v38 = v10;
      v39 = 2112;
      v40 = registeredProperties;
      _os_log_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalid property values passed in for event: %@, values: %@, registeredProperties: %@", buf, 0x20u);
    }
    -[PETLoggingOutlet logErrorForEvent:featureId:reason:](self->_loggingOutlet, "logErrorForEvent:featureId:reason:", v9, self->_featureId, CFSTR("bad_prop"));
  }
  objc_autoreleasePoolPop(v11);

}

- (void)_trackEvent:(id)a3 withPropertyValues:(id)a4 value:(id)a5
{
  -[PETEventTracker _trackEvent:withPropertyValues:value:overwrite:](self, "_trackEvent:withPropertyValues:value:overwrite:", a3, a4, a5, 0);
}

- (PETLoggingOutlet)loggingOutlet
{
  return self->_loggingOutlet;
}

- (NSString)featureId
{
  return self->_featureId;
}

- (id)_keyMetadataForEvent:(id)a3
{
  return 0;
}

- (id)_stringifiedPropertiesForEvent:(id)a3 propertyValueArray:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PETStringPairs *v15;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_registeredProperties, "count"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_registeredProperties, "count"));
  -[PETEventTracker registeredProperties](self, "registeredProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v12);

      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_loggingKeyStringRepresentationForValue:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v14);

      ++v9;
    }
    while (v9 < objc_msgSend(v5, "count"));
  }
  v15 = -[PETStringPairs initWithKeys:values:]([PETStringPairs alloc], "initWithKeys:values:", v6, v7);

  return v15;
}

- (NSArray)registeredProperties
{
  return self->_registeredProperties;
}

- (BOOL)_validatePropertyValues:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 != -[NSArray count](self->_registeredProperties, "count"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("passed number of properties %tu is not equal to the defined number %tu"), objc_msgSend(v4, "count"), -[NSArray count](self->_registeredProperties, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "raise");
  }
  if (objc_msgSend(v4, "count"))
  {
    v9 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_registeredProperties, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isValidValue:", v11);

      if ((v12 & 1) == 0)
        break;
      ++v9;
    }
    while (objc_msgSend(v4, "count") > v9);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)_checkCardinalityForEvent:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  NSString *featureId;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  unint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_registeredProperties;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      v9 = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v9 *= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "cardinality", (_QWORD)v12);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
      }
      while (v7);

      if (v9 >= 0x65 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        featureId = self->_featureId;
        *(_DWORD *)buf = 138412802;
        v17 = v4;
        v18 = 2112;
        v19 = featureId;
        v20 = 2048;
        v21 = v9;
        _os_log_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "high cardinality event found: %@, featureId: %@, cardinality: %lu. try to reduce the number of dimensions, or reduce the number of possbile values of properties", buf, 0x20u);
      }
    }
    else
    {

    }
  }

}

- (void)_checkKeyLengthForEvent:(id)a3 metaData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  PETStringPairs *v18;
  void *v19;
  NSString *featureId;
  uint64_t v21;
  void *context;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    v23 = v7;
    context = (void *)MEMORY[0x19400723C]();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_registeredProperties, "count"));
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_registeredProperties, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = self->_registeredProperties;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "name", context);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

          objc_msgSend(v15, "longestValueString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v12);
    }

    v18 = -[PETStringPairs initWithKeys:values:]([PETStringPairs alloc], "initWithKeys:values:", v8, v9);
    v7 = v23;
    +[PETLoggingUtils keyStringForEvent:featureId:stringifiedProperties:metaData:](PETLoggingUtils, "keyStringForEvent:featureId:stringifiedProperties:metaData:", v6, self->_featureId, v18, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v19, "length") >= 0x100
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      featureId = self->_featureId;
      v21 = objc_msgSend(v19, "length");
      *(_DWORD *)buf = 138413058;
      v29 = v6;
      v30 = 2112;
      v31 = featureId;
      v32 = 2048;
      v33 = v21;
      v34 = 1024;
      v35 = 255;
      _os_log_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "aggd key length may exceed the limit - event: %@, featureId: %@, longestKeyLength: %lu, keyLengthLimit: %d. try to shorten the event/property names", buf, 0x26u);
    }

    objc_autoreleasePoolPop(context);
  }

}

- (PETEventTracker)initWithFeatureId:(id)a3 registerProperties:(id)a4 propertySubsets:(id)a5
{
  id v8;
  id v9;
  id v10;
  PETEventTracker *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *featureId;
  uint64_t v17;
  NSArray *registeredProperties;
  uint64_t v19;
  NSArray *propertySubsets;
  uint64_t v21;
  PETLoggingOutlet *loggingOutlet;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PETEventTracker;
  v11 = -[PETEventTracker init](&v24, sel_init);
  if (v11)
  {
    if (!+[PETEventStringValidator stringIsValid:](PETEventStringValidator, "stringIsValid:", v8))
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("featureId may only contain [a-zA-Z0-9_] and may not be prefixed with _: %@"), v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "raise");
    }
    v15 = objc_msgSend(v8, "copy");
    featureId = v11->_featureId;
    v11->_featureId = (NSString *)v15;

    v17 = objc_msgSend(v9, "copy");
    registeredProperties = v11->_registeredProperties;
    v11->_registeredProperties = (NSArray *)v17;

    -[PETEventTracker _checkPropertySubsets:](v11, "_checkPropertySubsets:", v10);
    v19 = objc_msgSend(v10, "copy");
    propertySubsets = v11->_propertySubsets;
    v11->_propertySubsets = (NSArray *)v19;

    -[PETEventTracker _defaultLoggingOutlet](v11, "_defaultLoggingOutlet");
    v21 = objc_claimAutoreleasedReturnValue();
    loggingOutlet = v11->_loggingOutlet;
    v11->_loggingOutlet = (PETLoggingOutlet *)v21;

    v11->_testingMode = 0;
  }

  return v11;
}

- (id)_defaultLoggingOutlet
{
  return +[PET2LoggingOutlet sharedInstance](PET2LoggingOutlet, "sharedInstance");
}

- (void)_checkPropertySubsets:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  void *context;
  uint64_t v29;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = a3;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v41;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(obj);
        v29 = v3;
        v4 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v3);
        context = (void *)MEMORY[0x19400723C]();
        v5 = objc_msgSend(v4, "count");
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
        v7 = objc_msgSend(v6, "count");

        if (v5 != v7)
        {
          v8 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate elements found in property subset array: %@"), v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), v9, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "raise");
        }
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v30 = v4;
        v11 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v37;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v37 != v13)
                objc_enumerationMutation(v30);
              v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v14);
              v32 = 0u;
              v33 = 0u;
              v34 = 0u;
              v35 = 0u;
              v16 = self->_registeredProperties;
              v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v33;
LABEL_15:
                v20 = 0;
                while (1)
                {
                  if (*(_QWORD *)v33 != v19)
                    objc_enumerationMutation(v16);
                  objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v20), "name");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v15, "isEqualToString:", v21);

                  if ((v22 & 1) != 0)
                    break;
                  if (v18 == ++v20)
                  {
                    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                    if (v18)
                      goto LABEL_15;
                    goto LABEL_21;
                  }
                }
              }
              else
              {
LABEL_21:

                v23 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid property name found in subset array: %@"), v15);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), v24, 0);
                v16 = (NSArray *)objc_claimAutoreleasedReturnValue();

                -[NSArray raise](v16, "raise");
              }

              ++v14;
            }
            while (v14 != v12);
            v12 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          }
          while (v12);
        }

        objc_autoreleasePoolPop(context);
        v3 = v29 + 1;
      }
      while (v29 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v27);
  }

}

- (void)_logValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6
{
  uint8_t v6[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Subclasses must implement logValueforEvent", v6, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Subclasses must implement logValueforEvent"));
}

- (void)_setValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6
{
  uint8_t v6[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Subclasses must implement setValueforEvent", v6, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Subclasses must implement setValueforEvent"));
}

- (void)_setLoggingOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_loggingOutlet, a3);
}

- (void)enableTestingMode
{
  PETTestLoggingOutlet *v3;
  PETLoggingOutlet *loggingOutlet;

  self->_testingMode = 1;
  v3 = objc_alloc_init(PETTestLoggingOutlet);
  loggingOutlet = self->_loggingOutlet;
  self->_loggingOutlet = (PETLoggingOutlet *)v3;

}

- (void)_checkInTestingMode
{
  id v2;

  if (!self->_testingMode)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), CFSTR("Testing mode is not enabled. Call enableTestingMode() first"), 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "raise");

  }
}

- (id)getKeyValueDict
{
  -[PETEventTracker _checkInTestingMode](self, "_checkInTestingMode");
  return (id)-[PETLoggingOutlet keyValues](self->_loggingOutlet, "keyValues");
}

- (id)getValueForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PETEventTracker _checkInTestingMode](self, "_checkInTestingMode");
  -[PETLoggingOutlet getValueForKey:](self->_loggingOutlet, "getValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)disableTestingMode
{
  PETLoggingOutlet *v3;
  PETLoggingOutlet *loggingOutlet;

  self->_testingMode = 0;
  -[PETEventTracker _defaultLoggingOutlet](self, "_defaultLoggingOutlet");
  v3 = (PETLoggingOutlet *)objc_claimAutoreleasedReturnValue();
  loggingOutlet = self->_loggingOutlet;
  self->_loggingOutlet = v3;

}

- (NSArray)propertySubsets
{
  return self->_propertySubsets;
}

- (BOOL)testingMode
{
  return self->_testingMode;
}

@end
