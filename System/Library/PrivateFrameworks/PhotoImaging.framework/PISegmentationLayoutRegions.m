@implementation PISegmentationLayoutRegions

- (PISegmentationLayoutRegions)init
{
  return -[PISegmentationLayoutRegions initWithAcceptableRect:preferredRect:faces:pets:](self, "initWithAcceptableRect:preferredRect:faces:pets:", 0, 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (PISegmentationLayoutRegions)initWithAcceptableRect:(CGRect)a3 preferredRect:(CGRect)a4 faces:(id)a5 pets:(id)a6
{
  return -[PISegmentationLayoutRegions initWithAcceptableRect:preferredRect:gazeAreaRect:faces:pets:](self, "initWithAcceptableRect:preferredRect:gazeAreaRect:faces:pets:", a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *MEMORY[0x1E0C9D648], *(_QWORD *)(MEMORY[0x1E0C9D648] + 8), *(_QWORD *)(MEMORY[0x1E0C9D648] + 16), *(_QWORD *)(MEMORY[0x1E0C9D648] + 24));
}

- (_QWORD)initWithAcceptableRect:(double)a3 preferredRect:(double)a4 gazeAreaRect:(double)a5 faces:(double)a6 pets:(double)a7
{
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  objc_super v39;

  v30 = a11;
  v31 = a12;
  v39.receiver = a1;
  v39.super_class = (Class)PISegmentationLayoutRegions;
  v32 = objc_msgSendSuper2(&v39, sel_init);
  v33 = v32;
  *((double *)v32 + 3) = a2;
  *((double *)v32 + 4) = a3;
  *((double *)v32 + 5) = a4;
  *((double *)v32 + 6) = a5;
  *((double *)v32 + 7) = a6;
  *((double *)v32 + 8) = a7;
  *((double *)v32 + 9) = a8;
  *((double *)v32 + 10) = a9;
  if (v30)
  {
    v34 = objc_msgSend(v30, "copy");
    v35 = (void *)v33[1];
    v33[1] = v34;
  }
  else
  {
    v35 = (void *)v32[1];
    v32[1] = MEMORY[0x1E0C9AA60];
  }

  if (v31)
  {
    v36 = objc_msgSend(v31, "copy");
    v37 = (void *)v33[2];
    v33[2] = v36;
  }
  else
  {
    v37 = (void *)v33[2];
    v33[2] = MEMORY[0x1E0C9AA60];
  }

  v33[11] = a17;
  v33[12] = a18;
  v33[13] = a19;
  v33[14] = a20;

  return v33;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[4];

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0CB3B18];
  -[PISegmentationLayoutRegions acceptableCropRect](self, "acceptableCropRect");
  v22[0] = v6;
  v22[1] = v7;
  v22[2] = v8;
  v22[3] = v9;
  objc_msgSend(v5, "valueWithBytes:objCType:", v22, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3B18];
  -[PISegmentationLayoutRegions preferredCropRect](self, "preferredCropRect");
  v21[0] = v12;
  v21[1] = v13;
  v21[2] = v14;
  v21[3] = v15;
  objc_msgSend(v11, "valueWithBytes:objCType:", v21, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISegmentationLayoutRegions faceRegions](self, "faceRegions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISegmentationLayoutRegions petRegions](self, "petRegions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p accept=%@ pref=%@ faces=%@ pets=%@>"), v4, self, v10, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (CGRect)acceptableCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_acceptableCropRect.origin.x;
  y = self->_acceptableCropRect.origin.y;
  width = self->_acceptableCropRect.size.width;
  height = self->_acceptableCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)preferredCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preferredCropRect.origin.x;
  y = self->_preferredCropRect.origin.y;
  width = self->_preferredCropRect.size.width;
  height = self->_preferredCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)gazeAreaRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_gazeAreaRect.origin.x;
  y = self->_gazeAreaRect.origin.y;
  width = self->_gazeAreaRect.size.width;
  height = self->_gazeAreaRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)faceRegions
{
  return self->_faceRegions;
}

- (NSArray)petRegions
{
  return self->_petRegions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_petRegions, 0);
  objc_storeStrong((id *)&self->_faceRegions, 0);
}

+ (id)dictionaryFromRegions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v13;
  void *v14;
  const void **v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_577();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "regions != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_577();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v21;
        v28 = 2114;
        v29 = v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
  objc_msgSend(v4, "acceptableCropRect");
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v31);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("acceptable"));

  objc_msgSend(v4, "preferredCropRect");
  v7 = CGRectCreateDictionaryRepresentation(v32);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("preferred"));

  objc_msgSend(v4, "faceRegions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __53__PISegmentationLayoutRegions_dictionaryFromRegions___block_invoke(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("faces"));

  objc_msgSend(v4, "petRegions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __53__PISegmentationLayoutRegions_dictionaryFromRegions___block_invoke(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("pets"));

  return v5;
}

+ (id)regionsFromDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  const __CFDictionary *v7;
  BOOL v8;
  const __CFDictionary *v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  PISegmentationLayoutRegions *v15;
  PISegmentationLayoutRegions *v16;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  CGRect v31;
  CGRect rect;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_577();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "contents != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(rect.origin.x) = 138543362;
      *(_QWORD *)((char *)&rect.origin.x + 4) = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&rect, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_577();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(rect.origin.x) = 138543618;
        *(_QWORD *)((char *)&rect.origin.x + 4) = v26;
        WORD2(rect.origin.y) = 2114;
        *(_QWORD *)((char *)&rect.origin.y + 6) = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&rect, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(rect.origin.x) = 138543362;
      *(_QWORD *)((char *)&rect.origin.x + 4) = v25;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&rect, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v6 = v5;
  memset(&rect, 0, sizeof(rect));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("acceptable"));
  v7 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = CGRectMakeWithDictionaryRepresentation(v7, &rect);

    if (v8)
    {
      memset(&v31, 0, sizeof(v31));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("preferred"));
      v9 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v10 = CGRectMakeWithDictionaryRepresentation(v9, &v31);

        if (v10)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faces"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if ((__59__PISegmentationLayoutRegions_regionsFromDictionary_error___block_invoke(v11, v12) & 1) != 0)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pets"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if ((__59__PISegmentationLayoutRegions_regionsFromDictionary_error___block_invoke(v13, v14) & 1) != 0)
            {
              v15 = [PISegmentationLayoutRegions alloc];
              v16 = -[PISegmentationLayoutRegions initWithAcceptableRect:preferredRect:faces:pets:](v15, "initWithAcceptableRect:preferredRect:faces:pets:", v12, v14, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected an array of rect values"), v13);
              v16 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected an array of rect values"), v11);
            v16 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_16;
        }
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected a rect value"), v9);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_13;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected a rect value"), v7);
  v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v16;
}

uint64_t __59__PISegmentationLayoutRegions_regionsFromDictionary_error___block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  CGRect v16;
  CGRect rect;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          memset(&rect, 0, sizeof(rect));
          v11 = v10;
          if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {

LABEL_16:
            v14 = 0;
            goto LABEL_18;
          }
          v12 = CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v11, &rect);

          if (!v12)
            goto LABEL_16;
          v16 = rect;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v16, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v14 = 1;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v14 = 1;
    }
LABEL_18:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __53__PISegmentationLayoutRegions_dictionaryFromRegions___block_invoke(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  CFDictionaryRef DictionaryRepresentation;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;
  CGRect v16;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v1, "count"));
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "rectValue", (_QWORD)v10);
          DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v16);
          objc_msgSend(v2, "addObject:", DictionaryRepresentation);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
