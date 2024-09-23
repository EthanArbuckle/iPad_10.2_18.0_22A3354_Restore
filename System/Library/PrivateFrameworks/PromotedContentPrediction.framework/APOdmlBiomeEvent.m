@implementation APOdmlBiomeEvent

- (APOdmlBiomeEvent)initWithDictionary:(id)a3 andIdentifier:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  APOdmlBiomeEvent *v10;
  uint64_t v11;
  NSMutableDictionary *outerDictionary;
  NSMutableDictionary *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  NSMutableDictionary *v19;
  void *v20;
  const char *v21;
  objc_super v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)APOdmlBiomeEvent;
  v10 = -[APOdmlBiomeEvent init](&v23, sel_init);
  if (v10)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    outerDictionary = v10->_outerDictionary;
    v10->_outerDictionary = (NSMutableDictionary *)v11;

    v13 = v10->_outerDictionary;
    v16 = (void *)objc_msgSend_copy(v6, v14, v15);
    objc_msgSend_setObject_forKey_(v13, v17, (uint64_t)v16, CFSTR("data"));

    if (v7)
    {
      v19 = v10->_outerDictionary;
      v24 = CFSTR("identifier");
      v25[0] = v7;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v25, &v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValuesForKeysWithDictionary_(v19, v21, (uint64_t)v20);

    }
  }

  return v10;
}

- (NSDictionary)dictionary
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outerDictionary(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSUUID)identifier
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outerDictionary(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v5;
}

+ (id)_customClassesForDataDict
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  return (id)MEMORY[0x1E0DE7D20](v2, sel_setWithObject_, v3);
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;
  NSObject *v18;
  id v19;
  const char *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_classesForDataDict(APOdmlTrainingSetBuilder, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__customClassesForDataDict(a1, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromSet_(v8, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E0CB3710], v14, (uint64_t)v13, v5, &v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v31;
  if (v15)
  {
    objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)CFSTR("data"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = objc_alloc((Class)objc_opt_class());
      objc_msgSend_objectForKeyedSubscript_(v15, v20, (uint64_t)CFSTR("identifier"));
      v21 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend_initWithDictionary_andIdentifier_(v19, v22, (uint64_t)v18, v21);
    }
    else
    {
      OdmlLogForCategory(0xCuLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = (uint64_t)v15;
        _os_log_impl(&dword_1B69D6000, v21, OS_LOG_TYPE_ERROR, "No data in deserialized dictionary:\n%@", buf, 0xCu);
      }
      v23 = 0;
    }

  }
  else
  {
    OdmlLogForCategory(0xCuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend_code(v17, v24, v25);
      objc_msgSend_localizedDescription(v17, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v33 = v26;
      v34 = 2112;
      v35 = v29;
      _os_log_impl(&dword_1B69D6000, v18, OS_LOG_TYPE_ERROR, "Error %ld unarchiving event data: %@", buf, 0x16u);

    }
    v23 = 0;
  }

  return v23;
}

- (id)serialize
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend_outerDictionary(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v4, v6, (uint64_t)v5, 1, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;

  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    OdmlLogForCategory(0xCuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend_code(v8, v11, v12);
      objc_msgSend_localizedDescription(v8, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_outerDictionary(self, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v23 = v13;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_1B69D6000, v10, OS_LOG_TYPE_ERROR, "Error %ld encoding event data: %@\nData:\n%@", buf, 0x20u);

    }
  }

  return v7;
}

- (id)json
{
  return 0;
}

- (id)jsonDict
{
  return 0;
}

- (NSMutableDictionary)outerDictionary
{
  return self->_outerDictionary;
}

- (void)setOuterDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_outerDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerDictionary, 0);
}

@end
