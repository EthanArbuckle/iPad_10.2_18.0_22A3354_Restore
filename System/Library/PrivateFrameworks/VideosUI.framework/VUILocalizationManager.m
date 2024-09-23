@implementation VUILocalizationManager

- (void)updateWithJSDictionary:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[VUILocalizationManager setOverideLocDict:](self, "setOverideLocDict:", v4);

}

- (void)setOverideLocDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

- (id)localizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[VUILocalizationManager overideLocDict](self, "overideLocDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v4, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSDictionary)overideLocDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

void __40__VUILocalizationManager_sharedInstance__block_invoke()
{
  VUILocalizationManager *v0;
  void *v1;

  v0 = objc_alloc_init(VUILocalizationManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (id)localizedStringForKey:(id)a3 fromTable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[VUILocalizationManager overideLocDict](self, "overideLocDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", v6, 0, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)localizedStringForKey:(id)a3 withCounts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") >= 0xB)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99858];
    v38 = CFSTR("collection");
    v39[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, CFSTR("Maximum of 10 arguments allowed"), v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v22);
  }
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", &unk_1EA0BB7F0);
  v37 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:", v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v35, "intValue");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v34, "intValue");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v32, "intValue");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v29, "intValue");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v27, "intValue");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  v15 = objc_msgSend(v14, "intValue");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v31, CFSTR("%d %d %d %d %d %d %d %d %d %d"), 0, v30, v28, v26, v24, v23, v9, v11, v13, v15, objc_msgSend(v16, "intValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overideLocDict, 0);
}

@end
