@implementation PXPhotoLibraryLocalDefaults

- (PXPhotoLibraryLocalDefaults)initWithPhotoLibrary:(id)a3
{
  id v4;
  PXPhotoLibraryLocalDefaults *v5;
  uint64_t v6;
  PHPhotoLibraryAppPrivateData *appPrivateData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotoLibraryLocalDefaults;
  v5 = -[PXPhotoLibraryLocalDefaults init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "appPrivateData");
    v6 = objc_claimAutoreleasedReturnValue();
    appPrivateData = v5->_appPrivateData;
    v5->_appPrivateData = (PHPhotoLibraryAppPrivateData *)v6;

  }
  return v5;
}

- (void)_notifyObserversDidChangeValueForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PXPhotoLibraryLocalDefaults__notifyObserversDidChangeValueForKey___block_invoke;
  v6[3] = &unk_1E5126518;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXPhotoLibraryLocalDefaults enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v6);

}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  PHPhotoLibraryAppPrivateData *appPrivateData;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXPhotoLibraryLocalDefaults willChangeValueForKey:](self, "willChangeValueForKey:", v7);
  appPrivateData = self->_appPrivateData;
  v12 = 0;
  v9 = -[PHPhotoLibraryAppPrivateData setValue:forKey:error:](appPrivateData, "setValue:forKey:error:", v6, v7, &v12);
  v10 = v12;
  if ((v9 & 1) == 0)
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "PXPhotoLibraryLocalDefaults - setting value %@ on key %{public}@ failed. Error: %@", buf, 0x20u);
    }

  }
  -[PXPhotoLibraryLocalDefaults didChangeValueForKey:](self, "didChangeValueForKey:", v7);
  -[PXPhotoLibraryLocalDefaults _notifyObserversDidChangeValueForKey:](self, "_notifyObserversDidChangeValueForKey:", v7);

}

- (id)valueForKey:(id)a3
{
  return (id)-[PHPhotoLibraryAppPrivateData valueForKey:](self->_appPrivateData, "valueForKey:", a3);
}

- (id)dictionaryWithValuesForKeys:(id)a3
{
  return (id)-[PHPhotoLibraryAppPrivateData dictionaryWithValuesForKeys:](self->_appPrivateData, "dictionaryWithValuesForKeys:", a3);
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoLibraryLocalDefaults setValue:forKey:](self, "setValue:forKey:", v8, v7);

}

- (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[PXPhotoLibraryLocalDefaults numberForKey:](self, "numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoLibraryLocalDefaults setValue:forKey:](self, "setValue:forKey:", v8, v7);

}

- (double)doubleForKey:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PXPhotoLibraryLocalDefaults numberForKey:](self, "numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)dataForKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PHPhotoLibraryAppPrivateData valueForKey:](self->_appPrivateData, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)dateForKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PHPhotoLibraryAppPrivateData valueForKey:](self->_appPrivateData, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)arrayForKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PHPhotoLibraryAppPrivateData valueForKey:](self->_appPrivateData, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)stringForKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PHPhotoLibraryAppPrivateData valueForKey:](self->_appPrivateData, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)numberForKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PHPhotoLibraryAppPrivateData valueForKey:](self->_appPrivateData, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  PHPhotoLibraryAppPrivateData *appPrivateData;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  appPrivateData = self->_appPrivateData;
  v12 = 0;
  v9 = -[PHPhotoLibraryAppPrivateData setValue:forKey:error:](appPrivateData, "setValue:forKey:error:", v6, v7, &v12);
  v10 = v12;
  if ((v9 & 1) == 0)
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "PXPhotoLibraryLocalDefaults - setting dictionary %@ on defaultName %{public}@ failed. Error: %@", buf, 0x20u);
    }

  }
  -[PXPhotoLibraryLocalDefaults _notifyObserversDidChangeValueForKey:](self, "_notifyObserversDidChangeValueForKey:", v7);

}

- (id)dictionaryForKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PHPhotoLibraryAppPrivateData valueForKey:](self->_appPrivateData, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setIdentifiers:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoLibraryLocalDefaults setValue:forKey:](self, "setValue:forKey:", v7, v6);

}

- (id)identifiersForKey:(id)a3
{
  void *v3;
  void *v4;

  -[PXPhotoLibraryLocalDefaults arrayForKey:](self, "arrayForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)addIdentifier:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[PXPhotoLibraryLocalDefaults identifiersForKey:](self, "identifiersForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "setByAddingObject:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotoLibraryLocalDefaults setIdentifiers:forKey:](self, "setIdentifiers:forKey:", v12, v6);
}

- (void)removeIdentifier:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PXPhotoLibraryLocalDefaults identifiersForKey:](self, "identifiersForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObject:", v7);
  -[PXPhotoLibraryLocalDefaults setIdentifiers:forKey:](self, "setIdentifiers:forKey:", v9, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPrivateData, 0);
}

uint64_t __68__PXPhotoLibraryLocalDefaults__notifyObserversDidChangeValueForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "photoLibraryLocalDefaults:didChangeValueForKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
