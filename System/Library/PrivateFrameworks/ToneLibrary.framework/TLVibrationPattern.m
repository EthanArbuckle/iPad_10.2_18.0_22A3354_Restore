@implementation TLVibrationPattern

+ (BOOL)isValidVibrationPatternPropertyListRepresentation:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  float v13;
  void *v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("Atoms"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("Intensity"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (_TLVibrationPatternIsValidNumberWithPossibleExpectedTypeEncodings(v6, "f", v7, v8, v9, v10, v11, v12, "d", 0))
      {
        objc_msgSend(v6, "floatValue");
        v5 = 0;
        if (v13 > 0.00000011921 && v13 < 1.0)
        {
          objc_msgSend(v3, "objectForKey:", CFSTR("VibePattern"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v15 = v14;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            if (v16)
            {
              v23 = v16;
              v24 = 0;
              v25 = *(_QWORD *)v46;
              while (2)
              {
                v26 = 0;
                v44 = v24 ^ v23;
                do
                {
                  if (*(_QWORD *)v46 != v25)
                    objc_enumerationMutation(v15);
                  v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v26);
                  if ((v24 & 1) != 0)
                  {
                    if (!_TLVibrationPatternIsValidNumberWithPossibleExpectedTypeEncodings(v27, "i", v17, v18, v19, v20, v21, v22, "I", (uint64_t)"q"))goto LABEL_25;
                  }
                  else if (!_TLVibrationPatternIsValidNumberWithPossibleExpectedTypeEncodings(v27, "B", v17, v18, v19, v20, v21, v22, "c", 0))
                  {
LABEL_25:
                    v28 = 0;
                    goto LABEL_29;
                  }
                  LOBYTE(v24) = v24 ^ 1;
                  ++v26;
                }
                while (v23 != v26);
                v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
                v24 = v44;
                if (v23)
                  continue;
                break;
              }
              v28 = 1;
            }
            else
            {
              LOBYTE(v24) = 0;
              v28 = 1;
            }
LABEL_29:

            v5 = v28 & (v24 ^ 1);
          }
          else
          {
            objc_msgSend(v3, "objectForKey:", CFSTR("OnDuration"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "objectForKey:", CFSTR("OffDuration"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = _TLVibrationPatternIsValidNumberWithPossibleExpectedTypeEncodings(v29, "f", v31, v32, v33, v34, v35, v36, "d", 0)&& _TLVibrationPatternIsValidNumberWithPossibleExpectedTypeEncodings(v30, "f", v37, v38, v39, v40, v41, v42,
                   "d",
                   0);

          }
        }
      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)simpleVibrationPatternWithVibrationDuration:(double)a3 pauseDuration:(double)a4
{
  id v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (a3 <= 2.22044605e-16 || a4 <= 2.22044605e-16)
  {
    v13 = 0;
  }
  else
  {
    v7 = objc_alloc((Class)a1);
    v16[0] = &unk_1E95381C8;
    v15[0] = CFSTR("Intensity");
    v15[1] = CFSTR("OnDuration");
    *(float *)&v8 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v9;
    v15[2] = CFSTR("OffDuration");
    *(float *)&v10 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v7, "initWithPropertyListRepresentation:", v12);

  }
  return v13;
}

+ (id)complexVibrationPatternWithDurationsForVibrationsAndPauses:(double)a3
{
  double v3;
  id v5;
  int v6;
  void *v7;
  void *v8;
  double *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t *v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];
  uint64_t v19;

  v3 = a3;
  v18[2] = *MEMORY[0x1E0C80C00];
  if (a3 <= 2.22044605e-16)
  {
    v13 = 0;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v5)
    {
      v6 = 0;
      v15 = &v19;
      do
      {
        v6 ^= 1u;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6 & 1, v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v7);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(v3 * 1000.0));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        v9 = (double *)v16;
        v15 = (uint64_t *)(v16 + 8);
        v3 = *v9;
      }
      while (*v9 > 2.22044605e-16);
      v10 = (void *)objc_msgSend(v5, "copy", v15);
      if (v10)
      {
        v11 = objc_alloc((Class)a1);
        v17[0] = CFSTR("Intensity");
        v17[1] = CFSTR("VibePattern");
        v18[0] = &unk_1E95381C8;
        v18[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithPropertyListRepresentation:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

+ (id)noneVibrationPattern
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)a1);
  v6[0] = CFSTR("Intensity");
  v6[1] = CFSTR("VibePattern");
  v7[0] = &unk_1E95381C8;
  v7[1] = &unk_1E9538168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "_initWithPropertyListRepresentation:skipValidation:", v3, 1);

  return v4;
}

- (TLVibrationPattern)init
{
  void *v3;
  TLVibrationPattern *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("Intensity");
  v7[0] = &unk_1E95381C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TLVibrationPattern _initWithPropertyListRepresentation:skipValidation:](self, "_initWithPropertyListRepresentation:skipValidation:", v3, 1);

  return v4;
}

- (TLVibrationPattern)initWithPropertyListRepresentation:(id)a3
{
  return (TLVibrationPattern *)-[TLVibrationPattern _initWithPropertyListRepresentation:skipValidation:](self, "_initWithPropertyListRepresentation:skipValidation:", a3, 0);
}

- (id)_initWithPropertyListRepresentation:(id)a3 skipValidation:(BOOL)a4
{
  id v6;
  TLVibrationPattern *v7;
  uint64_t v8;
  void *propertyListRepresentation;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TLVibrationPattern;
  v7 = -[TLVibrationPattern init](&v11, sel_init);
  if (v7)
  {
    if (a4
      || objc_msgSend((id)objc_opt_class(), "isValidVibrationPatternPropertyListRepresentation:", v6))
    {
      v8 = objc_msgSend(v6, "copy");
      propertyListRepresentation = v7->_propertyListRepresentation;
      v7->_propertyListRepresentation = (NSDictionary *)v8;
    }
    else
    {
      propertyListRepresentation = v7;
      v7 = 0;
    }

  }
  return v7;
}

- (id)propertyListRepresentation
{
  NSDictionary *v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = self->_propertyListRepresentation;
  v4 = self->_complexPatternDescription;
  if (v4)
  {
    v5 = (void *)-[NSDictionary mutableCopy](v3, "mutableCopy");
    v6 = (void *)-[NSMutableArray copy](v4, "copy");
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("VibePattern"));

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (NSDictionary *)v7;
  }

  return v3;
}

- (id)_artificiallyRepeatingPropertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;

  -[TLVibrationPattern propertyListRepresentation](self, "propertyListRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Atoms"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("Looped"));
    v6 = objc_msgSend(v5, "copy");
LABEL_13:

    v3 = (void *)v6;
    goto LABEL_14;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("VibePattern"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TLVibrationPattern _computedDuration](self, "_computedDuration");
    v8 = 180.0 / v7;
    v9 = v7 > 0.0;
    v10 = 18.0;
    if (v9)
      v10 = v8;
    v11 = llround(floor(v10));
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    do
    {
      objc_msgSend(v13, "addObjectsFromArray:", v5);
      --v12;
    }
    while (v12);
    v14 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("VibePattern"));
    v6 = objc_msgSend(v14, "copy");

    v3 = v13;
    goto LABEL_13;
  }
LABEL_14:

  return v3;
}

- (double)_computedDuration
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  float v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[TLVibrationPattern propertyListRepresentation](self, "propertyListRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Atoms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("It is pretty much impossible to compute the duration of a modern vibration pattern that uses atoms. This is invalid."));
    v4 = 0.0;
  }
  else
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("VibePattern"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v20;
        v4 = 0.0;
        do
        {
          v11 = 0;
          v12 = v9;
          do
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v6);
            if ((v12 & 1) != 0)
              v4 = v4 + (double)(int)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "intValue") / 1000.0;
            v12 ^= 1u;
            ++v11;
          }
          while (v8 != v11);
          v9 ^= v8;
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v8);
      }
      else
      {
        v4 = 0.0;
      }
    }
    else
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("OnDuration"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14 + 0.0;

      objc_msgSend(v2, "objectForKey:", CFSTR("OffDuration"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v4 = v15 + v17;

    }
  }

  return v4;
}

- (void)appendVibrationComponentWithDuration:(double)a3 isPause:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableArray **p_complexPatternDescription;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSDictionary *v12;
  NSDictionary *propertyListRepresentation;
  void *v14;
  void *v15;
  NSMutableArray *obj;
  NSMutableArray *obja;
  NSMutableArray *objb;

  v4 = a4;
  p_complexPatternDescription = &self->_complexPatternDescription;
  v8 = self->_complexPatternDescription;
  if (!v8)
  {
    v9 = (void *)-[NSDictionary mutableCopy](self->_propertyListRepresentation, "mutableCopy");
    objc_msgSend(v9, "objectForKey:", CFSTR("VibePattern"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (NSMutableArray *)objc_msgSend(v10, "mutableCopy");

    v11 = obj;
    if (!obj)
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    obja = v11;
    objc_storeStrong((id *)p_complexPatternDescription, v11);
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("VibePattern"));
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("OnDuration"));
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("OffDuration"));
    v12 = (NSDictionary *)objc_msgSend(v9, "copy");
    propertyListRepresentation = self->_propertyListRepresentation;
    self->_propertyListRepresentation = v12;

    v8 = obja;
  }
  if (a3 > 2.22044605e-16)
  {
    objb = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](objb, "addObject:", v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(a3 * 1000.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](objb, "addObject:", v15);

    v8 = objb;
  }

}

- (id)contextObject
{
  return self->_contextObject;
}

- (void)setContextObject:(id)a3
{
  objc_storeStrong(&self->_contextObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contextObject, 0);
  objc_storeStrong((id *)&self->_complexPatternDescription, 0);
  objc_storeStrong((id *)&self->_propertyListRepresentation, 0);
}

@end
