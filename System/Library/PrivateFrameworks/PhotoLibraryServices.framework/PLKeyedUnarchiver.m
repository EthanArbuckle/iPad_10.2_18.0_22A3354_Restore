@implementation PLKeyedUnarchiver

+ (id)secureUnarchivedObjectWithData:(id)a3 ofClass:(Class)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "setWithObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secureUnarchivedObjectWithData:ofClasses:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)secureUnarchivedObjectWithData:(id)a3 ofClasses:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3710];
  v7 = a3;
  v13 = 0;
  v8 = (void *)objc_msgSend([v6 alloc], "initForReadingFromData:error:", v7, &v13);

  v9 = v13;
  if (!v8)
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Data was corrupt; forcing -[NSKeyedUnarchiver initForReadingFromData:error:] to return nil, error: %@",
        buf,
        0xCu);
    }

  }
  objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v5, *MEMORY[0x1E0CB2CD0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
