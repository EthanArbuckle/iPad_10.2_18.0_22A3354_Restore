@implementation PISemanticEnhanceAdjustmentController

- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  unsigned __int8 v19;
  void *v20;
  int v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 | v10)
  {
    objc_msgSend((id)objc_opt_class(), "intensityKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "isEqualToString:", v12);

    if (v13)
    {
      objc_msgSend((id)v9, "doubleValue");
      v15 = v14;
      objc_msgSend((id)v10, "doubleValue");
      v11 = vabdd_f64(v15, v16) < 1.0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "sceneLabelKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v7, "isEqualToString:", v17);

      if (v18)
      {
        v19 = objc_msgSend((id)v9, "isEqualToString:", v10);
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "boundingBoxesKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v7, "isEqualToString:", v20);

        if (v21)
        {
          v19 = objc_msgSend((id)v9, "isEqualToArray:", v10);
        }
        else
        {
          v23.receiver = self;
          v23.super_class = (Class)PISemanticEnhanceAdjustmentController;
          v19 = -[PIAdjustmentController isSettingEqual:forKey:](&v23, sel_isSettingEqual_forKey_, v6, v7);
        }
      }
      v11 = v19;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)setIntensity:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "intensityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)intensity
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  float v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "intensityKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v5 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "floatValue");
    v5 = v6;
  }

  return v5;
}

- (int64_t)scene
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sceneLabelKey");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "platedFoodSceneLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v3 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "sunriseSunsetSceneLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "genericLandscapeSceneLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "isEqualToString:", v9);

      if (v10)
        v6 = 3;
      else
        v6 = 0;
    }
  }

  return v6;
}

- (double)sceneConfidence
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  float v8;
  float v9;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sceneConfidenceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &unk_1E5050FB0;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  objc_msgSend(v7, "floatValue");
  v9 = v8;

  return v9;
}

- (NSArray)boundingBoxes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "boundingBoxesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

- (void)setScene:(int64_t)a3 confidence:(double)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) > 2)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_339);
    v12 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v15 = a3;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Tried to set sceneLabel to unsupported value: %ld", buf, 0xCu);
    }
  }
  else
  {
    v6 = off_1E5015420[a3 - 1];
    -[PIAdjustmentController adjustment](self, "adjustment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "sceneLabelKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "sceneConfidenceKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v10);

  }
}

- (void)setBoundingBoxesFromObservations:(id)a3 orientation:(int64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint8_t buf[32];
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_339);
  v6 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    NUOrientationName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1A6382000, v7, OS_LOG_TYPE_DEFAULT, "Setting bounding boxes based on orientation (%@) and observations: %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NUOrientationInverse();
  v27 = 0u;
  memset(buf, 0, sizeof(buf));
  NUOrientationMakeTransformWithSize();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v20[0] = *(_OWORD *)buf;
        v20[1] = *(_OWORD *)&buf[16];
        v20[2] = v27;
        DictionaryRepresentationFromObservation(v15, v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_msgSend(v9, "copy");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "boundingBoxesKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

}

- (void)setFaceBoundingBoxesFromObservations:(id)a3 orientation:(int64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint8_t buf[32];
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_339);
  v6 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    NUOrientationName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1A6382000, v7, OS_LOG_TYPE_DEFAULT, "Setting face bounding boxes based on orientation (%@) and observations: %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NUOrientationInverse();
  v27 = 0u;
  memset(buf, 0, sizeof(buf));
  NUOrientationMakeTransformWithSize();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v20[0] = *(_OWORD *)buf;
        v20[1] = *(_OWORD *)&buf[16];
        v20[2] = v27;
        DictionaryRepresentationFromObservation(v15, v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_msgSend(v9, "copy");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "faceBoundingBoxesKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

}

+ (id)platedFoodSceneLabel
{
  return CFSTR("platedFood");
}

+ (id)sunriseSunsetSceneLabel
{
  return CFSTR("sunriseSunset");
}

+ (id)genericLandscapeSceneLabel
{
  return CFSTR("genericLandscape");
}

+ (id)intensityKey
{
  return CFSTR("intensity");
}

+ (id)sceneLabelKey
{
  return CFSTR("sceneLabel");
}

+ (id)sceneConfidenceKey
{
  return CFSTR("sceneConfidence");
}

+ (id)faceBoundingBoxesKey
{
  return CFSTR("faceBoundingBoxes");
}

+ (id)boundingBoxesKey
{
  return CFSTR("boundingBoxes");
}

@end
