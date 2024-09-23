@implementation ATXMotion

- (ATXMotion)initWithMotionType:(int64_t)a3 stationary:(BOOL)a4 canPredictClipsGivenRecentMotion:(BOOL)a5
{
  ATXMotion *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXMotion;
  result = -[ATXMotion init](&v9, sel_init);
  if (result)
  {
    result->_motiontype = a3;
    result->_stationary = a4;
    result->_canPredictClipsGivenRecentMotion = a5;
  }
  return result;
}

- (id)initFromCMMotionActivity:(id)a3
{
  return -[ATXMotion initFromCMMotionActivity:canPredictClipsGivenRecentMotion:](self, "initFromCMMotionActivity:canPredictClipsGivenRecentMotion:", a3, 1);
}

- (id)initFromCMMotionActivity:(id)a3 canPredictClipsGivenRecentMotion:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int64_t v7;
  uint64_t v8;
  ATXMotion *v9;

  v4 = a4;
  v6 = a3;
  v7 = +[ATXMotion _getMotionTypeFromCMMotionActivity:](ATXMotion, "_getMotionTypeFromCMMotionActivity:", v6);
  if (v6)
    v8 = objc_msgSend(v6, "stationary");
  else
    v8 = 1;
  v9 = -[ATXMotion initWithMotionType:stationary:canPredictClipsGivenRecentMotion:](self, "initWithMotionType:stationary:canPredictClipsGivenRecentMotion:", v7, v8, v4);

  return v9;
}

+ (id)_getMotionStringFromCMMotionActivity:(id)a3
{
  int64_t v3;

  if (a3)
    v3 = +[ATXMotion _getMotionTypeFromCMMotionActivity:](ATXMotion, "_getMotionTypeFromCMMotionActivity:");
  else
    v3 = 4;
  +[ATXMotion getMotionStringFromMotionType:](ATXMotion, "getMotionStringFromMotionType:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)_getMotionTypeFromCMMotionActivity:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "walking") & 1) != 0)
    {
      v5 = 0;
    }
    else if ((objc_msgSend(v4, "running") & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "cycling") & 1) != 0)
    {
      v5 = 2;
    }
    else if (objc_msgSend(v4, "automotive"))
    {
      v5 = 3;
    }
    else
    {
      v5 = 4;
    }
  }
  else
  {
    v5 = 4;
  }

  return v5;
}

+ (id)getMotionStringFromMotionType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("unknown");
  else
    return off_1E942F070[a3];
}

- (id)getMotionString
{
  return +[ATXMotion getMotionStringFromMotionType:](ATXMotion, "getMotionStringFromMotionType:", self->_motiontype);
}

- (id)print
{
  id v3;
  void *v4;
  void *v5;

  if (self->_stationary)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[ATXMotion getMotionString](self, "getMotionString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@|stationary"), v4);

  }
  else
  {
    -[ATXMotion getMotionString](self, "getMotionString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)summarizeActivityStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ATXMotion *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    +[ATXMotion findMostCommonAndRecent:identityFunc:](ATXMotion, "findMostCommonAndRecent:identityFunc:", v5, &__block_literal_global_63);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXMotion findMostCommonAndRecent:identityFunc:](ATXMotion, "findMostCommonAndRecent:identityFunc:", v6, &__block_literal_global_64_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = [ATXMotion alloc];
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[ATXMotion initFromCMMotionActivity:canPredictClipsGivenRecentMotion:](v8, "initFromCMMotionActivity:canPredictClipsGivenRecentMotion:", v9, objc_msgSend(a1, "canPredictClipsForActivityStream:", v5));

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __37__ATXMotion_summarizeActivityStream___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[ATXMotion _getMotionTypeFromCMMotionActivity:](ATXMotion, "_getMotionTypeFromCMMotionActivity:", a2));
}

uint64_t __37__ATXMotion_summarizeActivityStream___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "stationary"));
}

+ (BOOL)canPredictClipsForActivityStream:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_6;
  __atxlog_handle_hero();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __46__ATXMotion_canPredictClipsForActivityStream___block_invoke;
    v22[3] = &__block_descriptor_40_e26__16__0__CMMotionActivity_8l;
    v22[4] = a1;
    objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "Current motion activities: %@", buf, 0xCu);

  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v4, "count") - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[ATXMotion _getMotionTypeFromCMMotionActivity:](ATXMotion, "_getMotionTypeFromCMMotionActivity:", v7);

  if (v8 == 3)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
LABEL_6:
    v10 = objc_msgSend(v4, "count");
    v11 = objc_msgSend(v4, "count");
    if (v10 >= 2)
      v12 = v11 - 2;
    else
      v12 = 0;
    if (v10 >= 2)
      v13 = 2;
    else
      v13 = v11;
    objc_msgSend(v4, "subarrayWithRange:", v12, v13);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v15 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v14);
          if ((+[ATXMotion _getMotionTypeFromCMMotionActivity:](ATXMotion, "_getMotionTypeFromCMMotionActivity:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18) & 0xFFFFFFFFFFFFFFFBLL) == 0)
          {
            LOBYTE(v9) = 1;
            goto LABEL_22;
          }
        }
        v9 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_22:

  }
  return v9;
}

uint64_t __46__ATXMotion_canPredictClipsForActivityStream___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  v3 = (void *)objc_opt_class();
  v4 = objc_msgSend((id)objc_opt_class(), "_getMotionTypeFromCMMotionActivity:", v2);

  return objc_msgSend(v3, "getMotionStringFromMotionType:", v4);
}

+ (id)findMostCommonAndRecent:(id)a3 identityFunc:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  id v18;
  void (**v19)(id, _QWORD);
  id v20;
  void *v21;
  void *v22;
  id obj;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(obj);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue") + 1;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v14);

        if (v16 >= v11)
        {
          v18 = v14;

          v10 = v18;
          v11 = v16;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __50__ATXMotion_findMostCommonAndRecent_identityFunc___block_invoke;
  v25[3] = &unk_1E942F050;
  v26 = v10;
  v27 = v6;
  v19 = v6;
  v20 = v10;
  objc_msgSend(obj, "indexesOfObjectsPassingTest:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "objectsAtIndexes:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

BOOL __50__ATXMotion_findMostCommonAndRecent_identityFunc___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v1 == v2;

  return v3;
}

- (int64_t)motiontype
{
  return self->_motiontype;
}

- (BOOL)stationary
{
  return self->_stationary;
}

- (BOOL)canPredictClipsGivenRecentMotion
{
  return self->_canPredictClipsGivenRecentMotion;
}

@end
