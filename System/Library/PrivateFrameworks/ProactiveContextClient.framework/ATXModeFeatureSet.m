@implementation ATXModeFeatureSet

- (ATXModeFeatureSet)init
{
  ATXModeFeatureSet *v2;
  uint64_t v3;
  NSMutableDictionary *features;
  ATXModeFeatureSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXModeFeatureSet;
  v2 = -[ATXModeFeatureSet init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    features = v2->_features;
    v2->_features = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (ATXModeFeatureSet)initWithDictionary:(id)a3
{
  id v4;
  ATXModeFeatureSet *v5;
  uint64_t v6;
  NSMutableDictionary *features;
  ATXModeFeatureSet *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXModeFeatureSet;
  v5 = -[ATXModeFeatureSet init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    features = v5->_features;
    v5->_features = (NSMutableDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)setValue:(BOOL)a3 forBinaryFeatureOfType:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXModeFeatureSet setValue:forFeatureType:](self, "setValue:forFeatureType:", v6, v4);

}

- (void)setValue:(id)a3 forFeatureType:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *features;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = (id)objc_msgSend(a3, "copy");
  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](features, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)setNullForFeatureType:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *features;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](features, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setString:(id)a3 forFeatureType:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *features;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = (id)objc_msgSend(a3, "copy");
  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](features, "setObject:forKeyedSubscript:", v8, v7);

}

- (BOOL)BOOLValueForFeatureType:(int)a3
{
  void *v3;
  char v4;

  -[ATXModeFeatureSet valueForFeatureType:](self, "valueForFeatureType:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)valueForFeatureType:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *features;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;

  v3 = *(_QWORD *)&a3;
  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](features, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = self->_features;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)stringForFeatureType:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *features;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;

  v3 = *(_QWORD *)&a3;
  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](features, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = self->_features;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_enumerateFeaturesUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *features;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  features = self->_features;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ATXModeFeatureSet__enumerateFeaturesUsingBlock___block_invoke;
  v7[3] = &unk_1E942E1D0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](features, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __50__ATXModeFeatureSet__enumerateFeaturesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, objc_msgSend(a2, "intValue"), v7, a4);

}

- (void)mergeWithFeatures:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__ATXModeFeatureSet_mergeWithFeatures___block_invoke;
  v3[3] = &unk_1E942E1F8;
  v3[4] = self;
  objc_msgSend(a3, "_enumerateFeaturesUsingBlock:", v3);
}

void __39__ATXModeFeatureSet_mergeWithFeatures___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setValue:forFeatureType:", v5, a2);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setString:forFeatureType:", v5, a2);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(*(id *)(a1 + 32), "setNullForFeatureType:", a2);
    }
  }

}

- (id)dictionaryRepresentation
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = (id)objc_opt_new();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ATXModeFeatureSet_dictionaryRepresentation__block_invoke;
  v5[3] = &unk_1E942E220;
  v5[4] = &v6;
  -[ATXModeFeatureSet _enumerateFeaturesUsingBlock:](self, "_enumerateFeaturesUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__ATXModeFeatureSet_dictionaryRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  __CFString *v6;
  id v7;

  v7 = (id)objc_msgSend(a3, "copy");
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (a2 >= 0x1D)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E942E240[(int)a2];
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ATXModeFeatureSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_features, CFSTR("fs"));
}

- (ATXModeFeatureSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ATXModeFeatureSet *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("fs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v4, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      __atxlog_handle_modes();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXModeFeatureSet initWithCoder:].cold.1(v4, v13);

      goto LABEL_10;
    }
    v21 = objc_msgSend(v4, "containsValueForKey:", CFSTR("fs"));
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    if (v21)
    {
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("archive contains illegal nil value for key \"%@\"), CFSTR("fs"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v22;
      v18 = -1;
    }
    else
    {
      v25 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key \"%@\" not present"), CFSTR("fs"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v22;
      v18 = -2;
    }
LABEL_9:
    v19 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("com.apple.duetexpertd.modes"), v18, v16);

    objc_msgSend(v4, "failWithError:", v19);
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key \"%@\" maps to unexpected class"), CFSTR("fs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v18 = -3;
    goto LABEL_9;
  }
  self = -[ATXModeFeatureSet initWithDictionary:](self, "initWithDictionary:", v10);
  v11 = self;
LABEL_11:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D2C00000, a2, OS_LOG_TYPE_ERROR, "ATXModeFeatureSet: error initWithCoder: %@", (uint8_t *)&v4, 0xCu);

}

@end
