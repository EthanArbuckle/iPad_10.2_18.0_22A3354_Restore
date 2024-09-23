@implementation NSDateIntervalFormatter(PhotosUICore)

- (uint64_t)px_dateTemplateForGranularity:()PhotosUICore abbreviated:
{
  return objc_msgSend(a1, "px_dateTemplateForGranularity:abbreviated:onlyCalendarUnit:", a3, a4, 0);
}

- (__CFString)px_dateTemplateForGranularity:()PhotosUICore abbreviated:onlyCalendarUnit:
{
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v12;

  if (a3 == 4)
  {
    v5 = CFSTR("y");
    return v5;
  }
  if (a3 == 8)
  {
    v6 = CFSTR("MMMMy");
    if (a4)
      v6 = CFSTR("MMMy");
    v7 = CFSTR("MMM");
    if (!a4)
      v7 = CFSTR("MMMM");
    if (a5)
      v6 = (__CFString *)v7;
    goto LABEL_16;
  }
  if (a3 != 16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDateIntervalFormatter+PhotosUICore.m"), 49, CFSTR("unsupported granularity %i"), a3);

    abort();
  }
  if ((a5 & 1) == 0)
  {
    v6 = CFSTR("dMMMMy");
    if (a4)
      v6 = CFSTR("dMMMy");
LABEL_16:
    v5 = v6;
    return v5;
  }
  v5 = CFSTR("d");
  return v5;
}

- (id)px_attributedStringFromDateInterval:()PhotosUICore defaultAttributes:emphasizedAttributes:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void (**v27)(void *, const __CFString *, const __CFString *);
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void (**v39)(void *, void *);
  id v40;
  id v41;
  id v42;
  void (**v43)(void *, id);
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  _QWORD aBlock[4];
  id v87;
  _QWORD v88[4];
  id v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  char v94;

  v8 = a3;
  v65 = a4;
  v66 = a5;
  objc_msgSend(a1, "dateTemplate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(a1, "_px_isChineseYearTemplate"))
    goto LABEL_6;
  objc_msgSend(a1, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:", 4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:", 4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v14, "year");
  if (v17 == objc_msgSend(v16, "year"))
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li至%li"), objc_msgSend(v14, "year"), objc_msgSend(v16, "year"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  if (!v18)
  {
LABEL_6:
    objc_msgSend(a1, "stringFromDateInterval:", v8);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = &stru_1E5149688;
    if (v19)
      v21 = (__CFString *)v19;
    v18 = v21;

  }
  objc_msgSend(a1, "_px_substitutions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");
  v24 = MEMORY[0x1E0C809B0];
  if (v23)
  {
    v91 = 0;
    v92 = &v91;
    v93 = 0x2020000000;
    v94 = 0;
    v25 = MEMORY[0x1E0C809B0];
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke;
    v88[3] = &unk_1E511F470;
    v26 = (id)-[__CFString mutableCopy](v18, "mutableCopy");
    v89 = v26;
    v90 = &v91;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v88);
    if (*((_BYTE *)v92 + 24))
    {
      aBlock[0] = v25;
      aBlock[1] = 3221225472;
      aBlock[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_2;
      aBlock[3] = &unk_1E511F498;
      v87 = v26;
      v27 = (void (**)(void *, const __CFString *, const __CFString *))_Block_copy(aBlock);
      v27[2](v27, CFSTR("  "), CFSTR(" "));
      v27[2](v27, CFSTR("  "), CFSTR(" "));
      v27[2](v27, CFSTR("  "), CFSTR(" "));
      v27[2](v27, CFSTR("  "), CFSTR(" "));

    }
    v28 = (__CFString *)v26;

    _Block_object_dispose(&v91, 8);
    v18 = v28;
    v24 = v25;
  }
  objc_msgSend(a1, "_px_localizedCapitalizedString:", v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MMMMy")) & 1) != 0)
  {
    v62 = v10;
    v63 = v9;
    v61 = v22;
    v30 = v8;
    if (px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__onceToken != -1)
      dispatch_once(&px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__onceToken, &__block_literal_global_65072);
    objc_msgSend((id)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationWordsByLanguages, "objectForKeyedSubscript:", v11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v24;
    v83[1] = 3221225472;
    v83[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_4;
    v83[3] = &unk_1E511F4E0;
    v32 = v24;
    v33 = v29;
    v84 = v33;
    v85 = v31;
    v64 = v31;
    v34 = _Block_copy(v83);
    v59 = v29;
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v33, v66);
    v78[0] = v32;
    v78[1] = 3221225472;
    v78[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_5;
    v78[3] = &unk_1E511F508;
    v36 = v33;
    v79 = v36;
    v82 = v34;
    v37 = v35;
    v80 = v37;
    v38 = v65;
    v81 = v38;
    v58 = v34;
    v39 = (void (**)(void *, void *))_Block_copy(v78);
    v74[0] = v32;
    v74[1] = 3221225472;
    v74[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_6;
    v74[3] = &unk_1E511F558;
    v40 = v36;
    v75 = v40;
    v41 = v37;
    v76 = v41;
    v60 = v11;
    v42 = v38;
    v77 = v42;
    v43 = (void (**)(void *, id))_Block_copy(v74);
    v44 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(a1, "locale");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setLocale:", v45);

    objc_msgSend(v44, "setDateFormat:", CFSTR("y"));
    v8 = v30;
    objc_msgSend(v30, "startDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringFromDate:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2](v39, v47);

    objc_msgSend(v8, "endDate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringFromDate:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2](v39, v49);

    v43[2](v43, v64);
    v72[0] = v32;
    v72[1] = 3221225472;
    v72[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_8;
    v72[3] = &unk_1E511F580;
    v73 = v40;
    v50 = _Block_copy(v72);
    v51 = objc_msgSend(v41, "length");
    v67[0] = v32;
    v67[1] = 3221225472;
    v67[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_9;
    v67[3] = &unk_1E511F5A8;
    v52 = v42;
    v11 = v60;
    v68 = v52;
    v71 = v50;
    v53 = v41;
    v69 = v53;
    v70 = v66;
    v54 = v50;
    objc_msgSend(v53, "enumerateAttributesInRange:options:usingBlock:", 0, v51, 0, v67);
    v55 = v70;
    v56 = v53;

    v29 = v59;
    v10 = v62;
    v9 = v63;
    v22 = v61;
  }
  else
  {
    v56 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v29, v66);
  }

  return v56;
}

- (uint64_t)px_customizesAttributedString
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "_px_isChineseYearTemplate") & 1) != 0)
    return 1;
  objc_msgSend(a1, "_px_substitutions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "count") != 0;

  return v2;
}

- (id)_px_localizedCapitalizedString:()PhotosUICore
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  v4 = a3;
  if (_px_localizedCapitalizedString__onceToken != -1)
    dispatch_once(&_px_localizedCapitalizedString__onceToken, &__block_literal_global_105);
  objc_msgSend(a1, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _px_localizedCapitalizedString__languagesWithCustomCapitalization;
  objc_msgSend(v5, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend((id)v6, "containsObject:", v7);

  if ((v6 & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v4, "mutableCopy");
    if (_px_localizedCapitalizedString__token != -1)
      dispatch_once(&_px_localizedCapitalizedString__token, &__block_literal_global_124);
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v20 = 1;
    v9 = objc_msgSend(v4, "length");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__NSDateIntervalFormatter_PhotosUICore___px_localizedCapitalizedString___block_invoke_3;
    v14[3] = &unk_1E511F610;
    v18 = v19;
    v10 = v8;
    v15 = v10;
    v16 = v5;
    v17 = v4;
    objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 3, v14);
    v11 = v17;
    v12 = v10;

    _Block_object_dispose(v19, 8);
  }
  else
  {
    v12 = v4;
  }

  return v12;
}

- (id)_px_substitutions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  void *v14;
  uint64_t v15;

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __58__NSDateIntervalFormatter_PhotosUICore___px_substitutions__block_invoke;
  v13 = &unk_1E5144EB8;
  v14 = a1;
  v15 = a2;
  if (_px_substitutions_onceToken != -1)
    dispatch_once(&_px_substitutions_onceToken, &v10);
  objc_msgSend(a1, "locale", v10, v11, v12, v13, v14, v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_px_substitutions_substitutionsByLocaleIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)_px_substitutions_substitutionsByLocaleIdentifier;
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("_"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (uint64_t)_px_isChineseYearTemplate
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dateTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("y")))
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("yue")) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("zh"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
