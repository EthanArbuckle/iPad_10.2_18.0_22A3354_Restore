@implementation CRFormUtilities

+ (id)_filterFieldsToNotSurface:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CRFormUtilities__filterFieldsToNotSurface___block_invoke;
  v7[3] = &unk_1E98D9E10;
  v5 = v4;
  v8 = v5;
  +[CRFormPostProcessingManager enumerateDetectedFields:block:](CRFormPostProcessingManager, "enumerateDetectedFields:block:", v3, v7);

  return v5;
}

void __45__CRFormUtilities__filterFieldsToNotSurface___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CRCastAsClass<CRFormFieldOutputRegion>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    CROSLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1D4FB8000, v5, OS_LOG_TYPE_ERROR, "Unexpected type for CRFormFieldProviding item, expected CRFormFieldOutputRegion, got %@", (uint8_t *)&v7, 0xCu);

    }
  }

}

+ (id)detectedFieldRegionsInDocument:(id)a3 excludingFields:(id)a4 updateExcludedFields:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  BOOL v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (qword_1ED0B48F0 != -1)
    dispatch_once(&qword_1ED0B48F0, &__block_literal_global_39);
  CROSLogForCategory(6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "formFieldRegions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v26 = "+[CRFormUtilities detectedFieldRegionsInDocument:excludingFields:updateExcludedFields:]";
    v27 = 2048;
    v28 = objc_msgSend(v11, "count");
    v29 = 2048;
    v30 = objc_msgSend(v9, "count");
    v31 = 1024;
    v32 = v5;
    _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_DEBUG, "%s: #internalFields:%lu #externalFields:%lu updateExcludedFields:%d", buf, 0x26u);

  }
  if (_MergedGlobals_37
    || v9 && objc_msgSend(v9, "count")
    || (objc_msgSend(v8, "formFieldRegions"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "count") == 0,
        v20,
        v21))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5, CFSTR("ShouldUpdateExternalFieldsOption"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formFieldRegions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v15);

    +[CRFormPostProcessingManager postProcessingManagerWithDefaultSequence](CRFormPostProcessingManager, "postProcessingManagerWithDefaultSequence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "process:externalFields:document:options:", v14, v9, v8, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_filterFieldsToNotSurface:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CROSLogForCategory(6);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "+[CRFormUtilities detectedFieldRegionsInDocument:excludingFields:updateExcludedFields:]";
      _os_log_impl(&dword_1D4FB8000, v22, OS_LOG_TYPE_DEFAULT, "%s: Returning cached results as no external field is given.", buf, 0xCu);
    }

    objc_msgSend(v8, "formFieldRegions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_filterFieldsToNotSurface:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void __87__CRFormUtilities_detectedFieldRegionsInDocument_excludingFields_updateExcludedFields___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("com.apple.CoreRecognition.disable_form_cache"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_37 = objc_msgSend(v0, "BOOLValue");

}

+ (id)proposedFieldForPoint:(CGPoint)a3 inDocument:(id)a4 existingFields:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CRNormalizedQuad *v25;
  double v26;
  double v27;
  CRFormTextFieldOutputRegion *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  _QWORD v40[10];
  _QWORD v41[4];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[4];
  uint64_t v49;
  uint8_t v50[4];
  id v51;
  __int16 v52;
  void *v53;
  _BYTE buf[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  __int128 v56;
  uint64_t v57;

  y = a3.y;
  x = a3.x;
  v57 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  CROSLogForCategory(6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "+[CRFormUtilities proposedFieldForPoint:inDocument:existingFields:]";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = x;
    *(_WORD *)&buf[22] = 2048;
    v55 = *(uint64_t (**)(uint64_t, uint64_t))&y;
    LOWORD(v56) = 2048;
    *(_QWORD *)((char *)&v56 + 2) = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_DEBUG, "%s: x:%lf y:%lf #existingFields:%lu", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v55 = __Block_byref_object_copy__22;
  *(_QWORD *)&v56 = __Block_byref_object_dispose__22;
  *((_QWORD *)&v56 + 1) = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0x7FEFFFFFFFFFFFFFLL;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__22;
  v46 = __Block_byref_object_dispose__22;
  v47 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0x7FEFFFFFFFFFFFFFLL;
  objc_msgSend(v8, "formFieldRegions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __67__CRFormUtilities_proposedFieldForPoint_inDocument_existingFields___block_invoke_2;
  v40[3] = &unk_1E98DBD20;
  *(double *)&v40[8] = x;
  *(double *)&v40[9] = y;
  v40[4] = v48;
  v40[5] = buf;
  v40[6] = v41;
  v40[7] = &v42;
  +[CRFormPostProcessingManager enumerateFieldsInFields:filter:block:](CRFormPostProcessingManager, "enumerateFieldsInFields:filter:block:", v11, &__block_literal_global_14_0, v40);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    CROSLogForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "description");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "textContentType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v50 = 138412546;
      v51 = v13;
      v52 = 2112;
      v53 = v14;
      _os_log_impl(&dword_1D4FB8000, v12, OS_LOG_TYPE_DEBUG, "Smart field proposal from a contour or text based detection: %@, content type: %@", v50, 0x16u);

    }
  }
  else
  {
    v15 = (void *)v43[5];
    if (v15)
    {
      objc_msgSend(v15, "boundingQuad");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "denormalizedQuad");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "size");
      v19 = v18;

    }
    else
    {
      v19 = 30.0;
    }
    objc_msgSend(v8, "rectifiedSize");
    v22 = normalizedSizeForSize(150.0, v19, v20, v21);
    v24 = v23;
    v25 = [CRNormalizedQuad alloc];
    objc_msgSend(v8, "rectifiedSize");
    v12 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:](v25, "initWithNormalizedBoundingBox:size:", x, y - v24, v22, v24, v26, v27);
    v28 = -[CRFormTextFieldOutputRegion initWithQuad:labelRegion:subFields:contentType:source:]([CRFormTextFieldOutputRegion alloc], "initWithQuad:labelRegion:subFields:contentType:source:", v12, 0, 0, 0, 1);
    v29 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v28;

    +[CRFormPostProcessingManager postProcessingManagerWithDefaultSequence](CRFormPostProcessingManager, "postProcessingManagerWithDefaultSequence");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "process:externalFields:document:options:", v31, MEMORY[0x1E0C9AA60], v8, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v33;

    CROSLogForCategory(6);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "description");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "textContentType"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v50 = 138412547;
      v51 = v36;
      v52 = 2113;
      v53 = v37;
      _os_log_impl(&dword_1D4FB8000, v35, OS_LOG_TYPE_DEBUG, "Smart field proposal from a back off field at tap location: %@, content type: %{private}@", v50, 0x16u);

    }
  }

  v38 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(buf, 8);

  return v38;
}

BOOL __67__CRFormUtilities_proposedFieldForPoint_inDocument_existingFields___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "fieldSource") == 1
    || objc_msgSend(v2, "fieldSource") == 2
    || objc_msgSend(v2, "fieldSource") == 3;

  return v3;
}

void __67__CRFormUtilities_proposedFieldForPoint_inDocument_existingFields___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v21, "fieldSource") == 2 || objc_msgSend(v21, "fieldSource") == 3;
    v7 = objc_msgSend(v21, "fieldSource");
    if (v6)
    {
      objc_msgSend(v21, "boundingQuad");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortestDistanceFromNormalizedPoint:", *(double *)(a1 + 64), *(double *)(a1 + 72));
      v10 = v9;

      objc_msgSend(v21, "boundingQuad");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "normalizationSize");
      v13 = v12;
      objc_msgSend(v21, "boundingQuad");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "normalizationSize");
      v16 = v10 / fmin(v13, v15);

      if (v16 <= fmin(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0.01))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v16;
        if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0.0)
          *a3 = 1;
      }
    }
    else if (v7 == 1 && objc_msgSend(v21, "fieldType") == 1)
    {
      objc_msgSend(v21, "boundingQuad");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shortestDistanceFromNormalizedPoint:", *(double *)(a1 + 64), *(double *)(a1 + 72));
      v19 = v18;

      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (v19 < *(double *)(v20 + 24))
      {
        *(double *)(v20 + 24) = v19;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
      }
    }
  }

}

+ (BOOL)stringEndsWithColon:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  if (qword_1ED0B4900 != -1)
    dispatch_once(&qword_1ED0B4900, &__block_literal_global_20_2);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByFoldingWithOptions:locale:", 256, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasSuffix:", qword_1ED0B48F8);

  return v7;
}

void __39__CRFormUtilities_stringEndsWithColon___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(CFSTR(":"), "stringByFoldingWithOptions:locale:", 256, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B48F8;
  qword_1ED0B48F8 = v0;

}

+ (BOOL)isRegion:(id)a3 verticallyAlignedWithRegionBelow:(id)a4 maxRelativeDistance:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v7 = a4;
  objc_msgSend(a3, "boundingQuad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingQuad");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topRight");
  v11 = v10;
  objc_msgSend(v9, "topRight");
  v13 = v12;
  objc_msgSend(v8, "topLeft");
  v15 = v14;
  objc_msgSend(v9, "topLeft");
  v17 = v16;
  objc_msgSend(v9, "size");
  if (fmax(fmin(v11, v13) - fmax(v15, v17), 0.0) / v18 > 0.5
    && (objc_msgSend(v9, "topLeft"), v20 = v19, objc_msgSend(v8, "bottomLeft"), v20 >= v21 + -2.22044605e-16))
  {
    objc_msgSend(v9, "topLeft");
    v24 = v23;
    objc_msgSend(v8, "bottomLeft");
    v26 = v25;
    objc_msgSend(v8, "size");
    v28 = v27;
    objc_msgSend(v9, "size");
    v22 = v24 - v26 <= (v28 + v29) * 0.5 * a5;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)debugDescriptionForField:(id)a3
{
  id v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  __CFString *v30;

  v3 = a3;
  if (objc_msgSend(v3, "fieldType") == 1)
  {
    +[CRFormContentTypeUtilities shortStringFromContentType:](CRFormContentTypeUtilities, "shortStringFromContentType:", objc_msgSend(v3, "textContentType"));
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suggestedLineHeight");
    v6 = v5;
    v7 = objc_msgSend(v3, "maxCharacterCount");
  }
  else
  {
    v7 = 0;
    v4 = &stru_1E98DC948;
    v6 = 0;
  }
  v30 = (__CFString *)v4;
  CRCastAsClass<CRFormFieldOutputRegion>(v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v8;
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, "indexInGlobalOrder");
    objc_msgSend(v9, "labelRegion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");
    v14 = v7;

  }
  else
  {
    v14 = v7;
    v13 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "boundingQuad");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topLeft");
  v18 = v17;
  objc_msgSend(v3, "boundingQuad");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topLeft");
  v21 = v20;
  objc_msgSend(v3, "boundingQuad");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "size");
  v24 = v23;
  objc_msgSend(v3, "boundingQuad");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "size");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("x:%5.3f y:%5.3f w:%5.3f h:%5.3f type:%lu source:%lu contentType:%@ labelLength:%lu globalOrder:%ld lineHeight:%5.3f charCount:%lu."), v18, v21, v24, v26, objc_msgSend(v3, "fieldType"), objc_msgSend(v3, "fieldSource"), v30, v13, v10, v6, v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

@end
