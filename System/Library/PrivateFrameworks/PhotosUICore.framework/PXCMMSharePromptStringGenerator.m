@implementation PXCMMSharePromptStringGenerator

+ (id)sharePromptStringWithAttributes:(id)a3 boldFont:(id)a4 lines:(int64_t)a5 width:(double)a6 names:(id)a7 containsUnverifiedPersons:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v33;
  void *v34;
  void *v36;
  void *v37;
  int64_t v38;
  id v39;
  BOOL v40;
  __int128 v41;
  uint8_t buf[16];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a7;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMSharePromptStringGenerator.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributes"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMSharePromptStringGenerator.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("boldFont"));

LABEL_3:
  if (a6 <= 0.0)
  {
    PXAssertGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "The width of view is zero, view is probably not created yet. Please debug this.", buf, 2u);
    }

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E5149688);
  }
  else
  {
    v40 = a8;
    v38 = a5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v39 = v17;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v44 != v23)
            objc_enumerationMutation(v19);
          v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (objc_msgSend(v25, "length"))
            objc_msgSend(v18, "addObject:", v25);
          else
            v22 = 1;
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v21);
    }
    else
    {
      v22 = 0;
    }

    v28 = objc_msgSend(v18, "count");
    if (v28 < 0)
      goto LABEL_26;
    v29 = v28;
    v30 = (v40 | v22) & 1;
    while (1)
    {
      v41 = xmmword_1A7C0C330;
      *(_OWORD *)buf = xmmword_1A7C0C330;
      objc_msgSend(a1, "_stringWithComponentsCount:components:containsOtherPeople:outBoldRange1:outBoldRange2:", v29, v18, v30, buf, &v41);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_attributedStringWithString:attributes:boldFont:boldRange1:boldRange2:", v31, v15, v16, *(_QWORD *)buf, *(_QWORD *)&buf[8], v41);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(MEMORY[0x1E0DC3990], "px_isTruncatedForAttributedString:forWidth:lines:", v27, v38, a6))break;

      if (v29-- <= 0)
        goto LABEL_26;
    }

    if (!v27)
    {
LABEL_26:
      v33 = objc_alloc(MEMORY[0x1E0CB3498]);
      PXLocalizedStringFromTable(CFSTR("PXShareWithFriends_QuestionMark"), CFSTR("PhotosUICore"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v33, "initWithString:", v34);

    }
    v17 = v39;
  }

  return v27;
}

+ (id)_attributedStringWithString:(id)a3 attributes:(id)a4 boldFont:(id)a5 boldRange1:(_NSRange)a6 boldRange2:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSUInteger v22;
  void *v23;
  NSUInteger v24;
  void *v25;
  NSUInteger v26;
  void *v27;
  NSUInteger v28;
  uint64_t v29;
  _QWORD v30[2];

  length = a6.length;
  location = a6.location;
  v30[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = length;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMSharePromptStringGenerator.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributes"));

    length = v24;
    if (v15)
      goto LABEL_4;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = length;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMSharePromptStringGenerator.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("boldFont"));

    length = v26;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = length;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMSharePromptStringGenerator.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  length = v22;
  if (!v14)
    goto LABEL_14;
LABEL_3:
  if (!v15)
    goto LABEL_15;
LABEL_4:
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v13, v14);
  v17 = (void *)v16;
  if (location == 0x7FFFFFFFFFFFFFFFLL && a7.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = (void *)v16;
  }
  else
  {
    v28 = length;
    v29 = *MEMORY[0x1E0DC1138];
    v30[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "mutableCopy");
    v18 = v20;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v20, "setAttributes:range:", v19, location, v28);
    if (a7.location != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v18, "setAttributes:range:", v19, a7.location, a7.length);

  }
  return v18;
}

+ (id)_stringWithComponentsCount:(unint64_t)a3 components:(id)a4 containsOtherPeople:(BOOL)a5 outBoldRange1:(_NSRange *)a6 outBoldRange2:(_NSRange *)a7
{
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v26;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v13 = a4;
  v14 = objc_msgSend(v13, "count");
  if (v14 < a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMSharePromptStringGenerator.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count <= totalCount"));

  }
  PXLocalizedStringFromTable(CFSTR("PXShareWithFriends_QuestionMark"), CFSTR("PhotosUICore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 1 || a5 || v14 != a3)
    {
      objc_msgSend(v13, "subarrayWithRange:", 0, a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "addObject:", v18);
    }
    else
    {
      objc_msgSend(v13, "subarrayWithRange:", 0, a3 - 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "addObject:", v18);
      objc_msgSend(v13, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v19);

    }
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__24612;
    v32 = __Block_byref_object_dispose__24613;
    v33 = 0;
    if (v14 != a3 || a5)
    {
      PXLocalizedStringFromTable(CFSTR("PXCMMSuggestionBannerSharePrompt_Others"), CFSTR("PhotosUICore"));
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 == 1)
        v21 = CFSTR("PXCMMSuggestionBannerSharePrompt_OneName");
      else
        v21 = CFSTR("PXCMMSuggestionBannerSharePrompt_TwoNames");
      PXLocalizedStringFromTable(v21, CFSTR("PhotosUICore"));
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v29[5];
    v29[5] = v22;

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __121__PXCMMSharePromptStringGenerator__stringWithComponentsCount_components_containsOtherPeople_outBoldRange1_outBoldRange2___block_invoke;
    v27[3] = &unk_1E511A178;
    v27[4] = &v28;
    v27[5] = a6;
    v27[6] = a7;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v27);
    v24 = (id)v29[5];

    _Block_object_dispose(&v28, 8);
    v15 = v24;
  }

  return v15;
}

void __121__PXCMMSharePromptStringGenerator__stringWithComponentsCount_components_containsOtherPeople_outBoldRange1_outBoldRange2___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "rangeOfString:", CFSTR("__PERSON_NAME__"));
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = v8;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "stringByReplacingCharactersInRange:withString:", v8, v9, v7);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1[4] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    if (a3 == 1)
    {
      v21 = (uint64_t *)a1[6];
      if (!v21)
        goto LABEL_13;
    }
    else
    {
      if (a3)
        goto LABEL_13;
      v21 = (uint64_t *)a1[5];
      if (!v21)
        goto LABEL_13;
    }
    v22 = objc_msgSend(v7, "length");
    *v21 = v17;
    v21[1] = v22;
    goto LABEL_13;
  }
  v10 = (_OWORD *)a1[5];
  if (v10)
    *v10 = xmmword_1A7C0C330;
  v11 = (_OWORD *)a1[6];
  if (v11)
    *v11 = xmmword_1A7C0C330;
  PLSharingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
    v23 = 138412290;
    v24 = v13;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Failed to locate marker string in localized string: \"%@\", (uint8_t *)&v23, 0xCu);
  }

  PXLocalizedStringFromTable(CFSTR("PXShareWithFriends_QuestionMark"), CFSTR("PhotosUICore"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1[4] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  *a4 = 1;
LABEL_13:

}

@end
