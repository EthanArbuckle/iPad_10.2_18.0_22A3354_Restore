@implementation NSLinguisticTagger(RKPrivate)

- (BOOL)containsAsianCharacters
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  objc_msgSend(a1, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[⺀-鿿]"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  return v8;
}

- (__CFString)languageOfRange:()RKPrivate withAdditionalContext:withPreferredLanguages:
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  id v52;
  id v53;
  _QWORD v54[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[5];
  id v62;
  _QWORD *v63;
  _QWORD v64[4];
  _QWORD v65[4];
  id v66;
  _QWORD block[5];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  v10 = a5;
  v53 = a6;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__5;
  v72 = __Block_byref_object_dispose__5;
  v73 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke;
  block[3] = &unk_24C6AF080;
  block[4] = &v68;
  if (languageOfRange_withAdditionalContext_withPreferredLanguages__onceDataDetectorToken != -1)
    dispatch_once(&languageOfRange_withAdditionalContext_withPreferredLanguages__onceDataDetectorToken, block);
  if (!languageOfRange_withAdditionalContext_withPreferredLanguages__dataDetector)
    goto LABEL_8;
  if (v69[5])
    goto LABEL_8;
  objc_msgSend(a1, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  v13 = (void *)languageOfRange_withAdditionalContext_withPreferredLanguages__dataDetector;
  objc_msgSend(a1, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "rangeOfFirstMatchInString:options:range:", v14, 0, 0, v12);
  v17 = v16;

  if (v15 || v12 != v17)
  {
LABEL_8:
    +[RKUtilities getDeviceModel](RKUtilities, "getDeviceModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[RKUtilities isDeviceSupportedForLSTMBasedLanguageIdentification:](RKUtilities, "isDeviceSupportedForLSTMBasedLanguageIdentification:", v19))
    {
      v20 = 15;
    }
    else
    {
      v20 = 25;
    }
    objc_msgSend(a1, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (v22 > 0x18)
      goto LABEL_15;
    objc_msgSend(a1, "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR(" "), "stringByAppendingString:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setString:", v25);
    if ((objc_msgSend(a1, "containsAsianCharacters") & 1) != 0)
    {
      objc_msgSend(a1, "string");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");

      if (v27 >= 5)
      {
LABEL_14:

LABEL_15:
        objc_msgSend(a1, "tagsInRange:scheme:options:tokenRanges:", a3, a4, *MEMORY[0x24BDD0F58], 6, 0);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithArray:", v28);
        objc_msgSend(v29, "allObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = MEMORY[0x24BDAC760];
        v65[1] = 3221225472;
        v65[2] = __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_2;
        v65[3] = &unk_24C6AFDF0;
        v31 = v29;
        v66 = v31;
        objc_msgSend(v30, "sortedArrayUsingComparator:", v65);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v32, "mutableCopy");

        if ((unint64_t)objc_msgSend(v33, "count") >= 2)
          objc_msgSend(v33, "removeObject:", &stru_24C6B9E08);
        if ((unint64_t)objc_msgSend(v33, "count") >= 2)
          objc_msgSend(v33, "removeObject:", CFSTR("und"));
        v51 = (void *)v28;
        v52 = v10;
        if (objc_msgSend(v33, "count")
          && (objc_msgSend(v33, "objectAtIndexedSubscript:", 0),
              v34 = (void *)objc_claimAutoreleasedReturnValue(),
              v35 = objc_msgSend(v34, "isEqualToString:", &stru_24C6B9E08),
              v34,
              (v35 & 1) == 0))
        {
          objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = 0;
        }
        v38 = v19;
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = 0;
        v64[1] = v64;
        v64[2] = 0x2020000000;
        v64[3] = 0;
        objc_msgSend(a1, "string");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "length");
        v42 = *MEMORY[0x24BDD0F68];
        v61[0] = MEMORY[0x24BDAC760];
        v61[1] = 3221225472;
        v61[2] = __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_3;
        v61[3] = &unk_24C6AFE18;
        v61[4] = a1;
        v43 = v39;
        v62 = v43;
        v63 = v64;
        objc_msgSend(a1, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v41, v42, 4, v61);

        objc_msgSend(v43, "removeObjectForKey:", CFSTR("und"));
        v55 = 0;
        v56 = &v55;
        v57 = 0x3032000000;
        v58 = __Block_byref_object_copy__5;
        v59 = __Block_byref_object_dispose__5;
        v60 = 0;
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_4;
        v54[3] = &unk_24C6AFE40;
        v54[4] = v64;
        v54[5] = &v55;
        objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v54);
        v44 = (void *)v56[5];
        if (v44)
        {
          v45 = v44;

          v25 = v45;
        }
        objc_msgSend(a1, "string");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[RKUtilities removeEmoji:](RKUtilities, "removeEmoji:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        +[RKUtilities stripPunctuations:](RKUtilities, "stripPunctuations:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        +[RKUtilities removeMultipleWhitespaces:](RKUtilities, "removeMultipleWhitespaces:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v53, "indexOfObject:", v25) == 0x7FFFFFFFFFFFFFFFLL
          || ((objc_msgSend(v25, "isEqualToString:", CFSTR("zh-Hans")) & 1) != 0
           || (objc_msgSend(v25, "isEqualToString:", CFSTR("zh-Hant")) & 1) != 0
           || objc_msgSend(v25, "isEqualToString:", CFSTR("ja")))
          && (unint64_t)objc_msgSend(v49, "length") < 5)
        {
          v18 = CFSTR("und");
        }
        else
        {
          v18 = v25;
        }

        _Block_object_dispose(&v55, 8);
        _Block_object_dispose(v64, 8);

        v10 = v52;
        v19 = v38;
        goto LABEL_35;
      }
    }
    else
    {
      objc_msgSend(a1, "string");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "length");

      if (v37 >= v20)
        goto LABEL_14;
    }
    v18 = CFSTR("und");
LABEL_35:

    goto LABEL_36;
  }
  v18 = CFSTR("und");
LABEL_36:
  _Block_object_dispose(&v68, 8);

  return v18;
}

@end
