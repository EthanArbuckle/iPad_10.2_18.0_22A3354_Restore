@implementation PKPaymentWebServiceBackgroundContext

- (PKPaymentWebServiceBackgroundContext)init
{
  PKPaymentWebServiceBackgroundContext *v2;
  PKPaymentWebServiceBackgroundContext *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *backgroundTaskRecordsByTaskIdentifier;
  NSMutableDictionary *v6;
  NSMutableDictionary *backgroundTaskRecordsByRecordName;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentWebServiceBackgroundContext;
  v2 = -[PKPaymentWebServiceBackgroundContext init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    backgroundTaskRecordsByTaskIdentifier = v3->_backgroundTaskRecordsByTaskIdentifier;
    v3->_backgroundTaskRecordsByTaskIdentifier = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    backgroundTaskRecordsByRecordName = v3->_backgroundTaskRecordsByRecordName;
    v3->_backgroundTaskRecordsByRecordName = v6;

  }
  return v3;
}

- (PKPaymentWebServiceBackgroundContext)initWithCoder:(id)a3
{
  id v4;
  PKPaymentWebServiceBackgroundContext *v5;
  PKPaymentWebServiceBackgroundContext *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  v5 = -[PKPaymentWebServiceBackgroundContext init](self, "init");
  v6 = v5;
  if (v5)
  {
    os_unfair_lock_lock(&v5->_lock);
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("backgroundTaskByTaskIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    -[PKPaymentWebServiceBackgroundContext setBackgroundTaskRecordsByTaskIdentifier:](v6, "setBackgroundTaskRecordsByTaskIdentifier:", v13);

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("backgroundTaskRecordsByRecordName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");
    -[PKPaymentWebServiceBackgroundContext setBackgroundTaskRecordsByRecordName:](v6, "setBackgroundTaskRecordsByRecordName:", v20);

    -[PKPaymentWebServiceBackgroundContext backgroundTaskRecordsByRecordName](v6, "backgroundTaskRecordsByRecordName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentWebServiceBackgroundContext setBackgroundTaskRecordsByRecordName:](v6, "setBackgroundTaskRecordsByRecordName:", v22);

    }
    os_unfair_lock_unlock(&v6->_lock);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceBackgroundContext backgroundTaskRecordsByTaskIdentifier](self, "backgroundTaskRecordsByTaskIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("backgroundTaskByTaskIdentifier"));

  -[PKPaymentWebServiceBackgroundContext backgroundTaskRecordsByRecordName](self, "backgroundTaskRecordsByRecordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("backgroundTaskRecordsByRecordName"));

  os_unfair_lock_unlock(p_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)contextWithArchive:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  PKPaymentWebServiceBackgroundContext *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", a3, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_10;
  v13 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v13);
  v5 = v13;
  v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      v10 = objc_opt_class();
      v11 = *MEMORY[0x1E0CB2CD0];
      v12 = 0;
      objc_msgSend(v4, "decodeTopLevelObjectOfClass:forKey:error:", v10, v11, &v12);
      v7 = (PKPaymentWebServiceBackgroundContext *)objc_claimAutoreleasedReturnValue();
      v6 = v12;
      objc_msgSend(v4, "finishDecoding");
      if (!v6)
        goto LABEL_9;
      goto LABEL_6;
    }
    objc_msgSend(v4, "finishDecoding");
  }
  v7 = 0;
LABEL_6:
  PKLogFacilityTypeGetObject(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceContext: error occurred while trying to unarchive Payment Web Service Background context. We should discard the data. %{public}@.", buf, 0xCu);
  }

LABEL_9:
  if (!v7)
LABEL_10:
    v7 = objc_alloc_init(PKPaymentWebServiceBackgroundContext);

  return v7;
}

- (void)archiveAtPath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Archiving PKPaymentWebServiceBackgroundContext", v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeToFile:atomically:", v4, 1);

  PKExcludePathFromBackup((uint64_t)v4);
}

- (void)addBackgroundDownloadRecord:(id)a3 forTaskIdentifier:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = a4;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Adding background download record for task %lu", (uint8_t *)&v11, 0xCu);
  }

  -[PKPaymentWebServiceBackgroundContext backgroundTaskRecordsByTaskIdentifier](self, "backgroundTaskRecordsByTaskIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v7, v10);

  os_unfair_lock_unlock(p_lock);
}

- (void)addBackgroundDownloadRecord:(id)a3 forRecordName:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  p_lock = &self->_lock;
  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  PKLogFacilityTypeGetObject(6uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Adding background download record for recordName %@", (uint8_t *)&v11, 0xCu);
  }

  -[PKPaymentWebServiceBackgroundContext backgroundTaskRecordsByRecordName](self, "backgroundTaskRecordsByRecordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v8, v6);

  os_unfair_lock_unlock(p_lock);
}

- (id)backgroundDownloadRecordForTaskIdentifier:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKPaymentWebServiceBackgroundContext backgroundTaskRecordsByTaskIdentifier](self, "backgroundTaskRecordsByTaskIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)backgroundDownloadRecordForRecordName:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceBackgroundContext backgroundTaskRecordsByRecordName](self, "backgroundTaskRecordsByRecordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)removeBackgroundDownloadRecordForTaskIdentifier:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Removing background download record for task %lu", (uint8_t *)&v9, 0xCu);
  }

  -[PKPaymentWebServiceBackgroundContext backgroundTaskRecordsByTaskIdentifier](self, "backgroundTaskRecordsByTaskIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeBackgroundDownloadRecordForRecordName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Removing background download record for recordName %@", (uint8_t *)&v8, 0xCu);
  }

  -[PKPaymentWebServiceBackgroundContext backgroundTaskRecordsByRecordName](self, "backgroundTaskRecordsByRecordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(p_lock);

}

- (id)remainingTasks
{
  id v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKPaymentWebServiceBackgroundContext backgroundTaskRecordsByTaskIdentifier](self, "backgroundTaskRecordsByTaskIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  -[PKPaymentWebServiceBackgroundContext backgroundTaskRecordsByRecordName](self, "backgroundTaskRecordsByRecordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  os_unfair_lock_unlock(p_lock);
  return v3;
}

- (NSMutableDictionary)backgroundTaskRecordsByTaskIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBackgroundTaskRecordsByTaskIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)backgroundTaskRecordsByRecordName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackgroundTaskRecordsByRecordName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTaskRecordsByRecordName, 0);
  objc_storeStrong((id *)&self->_backgroundTaskRecordsByTaskIdentifier, 0);
}

@end
