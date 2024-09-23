@implementation CRDataDetectorUtilities

+ (_NSRange)_mappedUrlificationRangeFor:(_NSRange)a3 withMapping:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", location);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v6, "objectAtIndexedSubscript:", length + location - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = v8;
  v12 = v10 - v8 + 1;
  result.length = v12;
  result.location = v11;
  return result;
}

+ (id)_regionsForTranscript:(id)a3 inRange:(_NSRange)a4 mapping:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSRange v19;
  NSRange v20;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend((id)objc_opt_class(), "_mappedUrlificationRangeFor:withMapping:", location, length, v9);
  v12 = v11;
  v19.location = objc_msgSend(v8, "representedRange");
  v20.location = v10;
  v20.length = v12;
  v13 = NSIntersectionRange(v19, v20);
  v14 = (void *)v13.length;
  if (v13.length)
  {
    v15 = objc_msgSend(v8, "representedRange");
    objc_msgSend(v8, "outputRegion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "outputRegionWithContentsOfCharacterRange:", v13.location - v15, v13.length);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "regionsSuitableForDataDetectorOutput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

+ (double)_personNameScoreForString:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CRDataDetectorUtilities__personNameScoreForString_locale___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0B4768 != -1)
    dispatch_once(&qword_1ED0B4768, block);
  v8 = (id)qword_1ED0B4760;
  objc_sync_enter(v8);
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("en-US")))
    objc_msgSend((id)qword_1ED0B4760, "personNameScoreForStringWithGazetteers:locale:useLastNameGazetteer:", v6, v7, 1);
  else
    objc_msgSend((id)qword_1ED0B4760, "personNameScoreForStringWithGazetteers:locale:useLastNameGazetteer:", v6, v7, 0);
  v10 = v9;
  v11 = -1.79769313e308;
  if (v9 <= -1.79769313e308 || (v11 = v9, v9 < 0.0))
  {
    objc_msgSend((id)qword_1ED0B4760, "personNameScoreForStringWithTagger:locale:", v6, v7);
    if (v11 >= v12)
      v10 = v11;
    else
      v10 = v12;
  }
  objc_sync_exit(v8);

  return v10;
}

void __60__CRDataDetectorUtilities__personNameScoreForString_locale___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  CRNamedEntityRecognizer *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("lex-names"), CFSTR("gzt"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLForResource:withExtension:", CFSTR("names"), CFSTR("gzt"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = -[CRNamedEntityRecognizer initWithNameGazetteerURL:lastNameGazetteerURL:]([CRNamedEntityRecognizer alloc], "initWithNameGazetteerURL:lastNameGazetteerURL:", v5, v2);
  v4 = (void *)qword_1ED0B4760;
  qword_1ED0B4760 = (uint64_t)v3;

}

+ (double)_personNameScoreForFullNameString:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_personNameFromFullNameString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "_personNameScoreForString:locale:", v7, v6);
    v9 = v8;
  }
  else
  {
    v9 = -1.0;
  }

  return v9;
}

+ (id)_stringByRemovingNamePrefixes:(id)a3
{
  id v3;
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[3];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = atomic_load((unsigned __int8 *)&qword_1ED0B4780);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_1ED0B4780))
  {
    qword_1ED0B4778 = objc_opt_new();
    __cxa_guard_release(&qword_1ED0B4780);
  }
  if (qword_1ED0B4770 != -1)
    dispatch_once(&qword_1ED0B4770, &__block_literal_global_118);
  v5 = v3;
  v6 = 0;
  v22 = v5;
LABEL_5:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = (id)qword_1ED0B4778;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v8)
  {
    v23 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasSuffix:", CFSTR(".")))
        {
          objc_msgSend(v10, "stringByAppendingString:", CFSTR(" "));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v10, "stringByAppendingString:", CFSTR(". "));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = v11;
          objc_msgSend(v10, "stringByAppendingString:", CFSTR(" "));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v33[1] = v13;
          objc_msgSend(v10, "stringByAppendingString:", CFSTR("."));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33[2] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v15 = v12;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v25;
LABEL_15:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v18);
            if (objc_msgSend(v5, "hasPrefix:", v19))
              break;
            if (v16 == ++v18)
            {
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v16)
                goto LABEL_15;
              goto LABEL_21;
            }
          }
          objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v19, "length"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          ++v6;
          v5 = v20;
          if (v6 != 3)
            goto LABEL_5;
          goto LABEL_27;
        }
LABEL_21:

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      if (v8)
        continue;
      break;
    }
  }

  v20 = v5;
LABEL_27:

  return v20;
}

void __57__CRDataDetectorUtilities__stringByRemovingNamePrefixes___block_invoke()
{
  void *v0;
  id v1;

  getNamePrefixes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("prefixes"));
  v1 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_122);
  objc_msgSend((id)qword_1ED0B4778, "sortUsingComparator:", &__block_literal_global_124);

}

uint64_t __57__CRDataDetectorUtilities__stringByRemovingNamePrefixes___block_invoke_2()
{
  return objc_msgSend((id)qword_1ED0B4778, "addObjectsFromArray:");
}

uint64_t __57__CRDataDetectorUtilities__stringByRemovingNamePrefixes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "length");
  if (v6 <= objc_msgSend(v5, "length"))
  {
    v8 = objc_msgSend(v4, "length");
    v7 = v8 != objc_msgSend(v5, "length");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

+ (id)_personNameFromFullNameString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1ED0B4790 != -1)
    dispatch_once(&qword_1ED0B4790, &__block_literal_global_129);
  if ((unint64_t)objc_msgSend(v4, "length") <= 0x23)
  {
    objc_msgSend(a1, "_stringByRemovingNamePrefixes:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByFoldingWithOptions:locale:", 128, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") && (v8 = objc_msgSend(v7, "length"), v8 == objc_msgSend(v6, "length")))
    {
      objc_msgSend((id)qword_1ED0B4788, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "range")
        || (objc_msgSend(v9, "range"), v10 < objc_msgSend(v6, "length"))
        || objc_msgSend(v9, "numberOfRanges") != 8
        || objc_msgSend(v9, "rangeAtIndex:", 1) == 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(v9, "rangeAtIndex:", 3) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v5 = 0;
      }
      else
      {
        v12 = objc_msgSend(v9, "rangeAtIndex:", 1);
        objc_msgSend(v6, "substringWithRange:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v14;
        v15 = objc_msgSend(v9, "rangeAtIndex:", 3);
        objc_msgSend(v6, "substringWithRange:", v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" "));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v5 = 0;
    }

    v4 = v6;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __57__CRDataDetectorUtilities__personNameFromFullNameString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("([A-Z][A-Za-zïß-]+) +([A-Z]\\.? +|[A-Z][A-Za-zïß]+ +){0,2}([A-Z][A-Za-zïß-]+)( +(Jr|Jr.|Sr|Sr.|I|II|III|Júnior|Neto|Filho)){0,1}(,? ?([A-Z][A-Za-z.]{1,5}|[a-z][A-Z]{1,4})){0,5}"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4788;
  qword_1ED0B4788 = v0;

}

+ (id)_personNameLineInRegion:(id)a3
{
  objc_msgSend(a1, "_personNameLineInRegion:defaultLocale:", a3, CFSTR("en-US"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_personNameLineInRegion:(id)a3 defaultLocale:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  _BOOL4 v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  id v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id obj;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[2];
  _BYTE v81[128];
  _QWORD v82[3];

  v82[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v69 = a4;
  v73 = v5;
  if (objc_msgSend(v5, "type") == 8)
  {
    v82[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "contentsWithTypes:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  v8 = 0;
  if (!v7)
  {
    v72 = 0;
    goto LABEL_41;
  }
  v72 = 0;
  v74 = *(_QWORD *)v77;
  v9 = 0.0;
  do
  {
    v75 = v7;
    for (i = 0; i != v75; ++i)
    {
      if (*(_QWORD *)v77 != v74)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
      objc_msgSend(v11, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length") == 0;

      if (!v13)
      {
        objc_msgSend(v73, "recognizedLocale");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          objc_msgSend(v73, "children");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "recognizedLocale");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          v21 = v69;
          if (v19)
            v21 = (void *)v19;
          v16 = v21;

        }
        v22 = (void *)objc_opt_class();
        objc_msgSend(v11, "text");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_personNameScoreForFullNameString:locale:", v23, v16);
        v25 = v24;

        if (v25 > v9)
        {
LABEL_16:
          v26 = v72;
          v72 = v11;
          v9 = v25;
          goto LABEL_23;
        }
        v27 = v70;
        if (!v8)
          goto LABEL_24;
        objc_msgSend(v8, "text");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsSeparatedByString:", CFSTR(" "));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "count") != 1)
        {

LABEL_23:
          goto LABEL_24;
        }
        objc_msgSend(v11, "text");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "componentsSeparatedByString:", CFSTR(" "));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v68, "count") != 1)
        {
          v38 = 0;
          goto LABEL_35;
        }
        objc_msgSend(v8, "boundingQuad");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "topLeft");
        v30 = v29;
        objc_msgSend(v11, "boundingQuad");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "topLeft");
        v32 = v30 - v31;
        if (v30 - v31 >= 0.0)
        {
          objc_msgSend(v8, "boundingQuad");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "topLeft");
          v40 = v39;
          objc_msgSend(v11, "boundingQuad");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "topLeft");
          v36 = v40 - v41;
        }
        else
        {
          objc_msgSend(v8, "boundingQuad");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "topLeft");
          v34 = v33;
          objc_msgSend(v11, "boundingQuad");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "topLeft");
          v36 = -(v34 - v35);
        }
        v70 = v27;
        objc_msgSend(v11, "boundingQuad");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "size");
        if (v36 / v43 >= 1.0)
        {

          v38 = 0;
          v51 = v70;
          v52 = v64;
          if (v32 >= 0.0)
            goto LABEL_34;
        }
        else
        {
          objc_msgSend(v11, "boundingQuad", v36 / v43);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "topLeft");
          v45 = v44;
          objc_msgSend(v8, "boundingQuad");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "bottomLeft");
          v48 = v47;
          objc_msgSend(v11, "boundingQuad");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "size");
          v38 = (v45 - v48) / v50 < 0.5;

          v51 = v70;
          v52 = v64;
          if (v32 >= 0.0)
          {
LABEL_34:

LABEL_35:
            if (v38)
            {
              v53 = (void *)objc_opt_class();
              objc_msgSend(v8, "text");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v80[0] = v54;
              objc_msgSend(v11, "text");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v80[1] = v55;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "componentsJoinedByString:", CFSTR(" "));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "_personNameScoreForFullNameString:locale:", v57, v16);
              v25 = v58;

              if (v25 > v9)
                goto LABEL_16;
            }
LABEL_24:
            v37 = v11;

            v8 = v37;
            continue;
          }
        }
        v51 = v62;
        v52 = v63;
        goto LABEL_34;
      }
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  }
  while (v7);
LABEL_41:

  v59 = v72;
  return v59;
}

+ (id)computeDataDetectorRegionsForText:(id)a3 locale:(id)a4 transcriptComponents:(id)a5 ddQOS:(int)a6
{
  uint64_t v6;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  id i;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  id v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v6 = *(_QWORD *)&a6;
  v74 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v45 = a4;
  v41 = a5;
  v39 = v9;
  if (objc_msgSend(v9, "length"))
  {
    CROSLogForCategory(7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v67 = "+[CRDataDetectorUtilities computeDataDetectorRegionsForText:locale:transcriptComponents:ddQOS:]";
      v68 = 2048;
      v69 = objc_msgSend(v9, "length");
      v70 = 2112;
      v71 = v45;
      v72 = 2048;
      v73 = objc_msgSend(v41, "count");
      _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_DEBUG, "%s: Computing data detector regions (text-length:%lu locale:%@ #components:%lu)", buf, 0x2Au);
    }

    v61 = 0;
    objc_msgSend(v9, "_crDDFriendlyTextWithIndexMapping:", &v61);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v61;
    objc_msgSend(MEMORY[0x1E0D1CE78], "_crConfigForLocale:", v45);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setQos:", v6);
    objc_msgSend(MEMORY[0x1E0D1CE70], "scanString:range:configuration:", v37, 0, objc_msgSend(v37, "length"), v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (id)objc_opt_new();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v36;
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v44)
    {
      v42 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != (id)v44; i = (char *)i + 1)
        {
          if (*(_QWORD *)v58 != v42)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v12, "category") == 3)
          {
            v56 = 0;
            objc_msgSend(v12, "getStreet:city:state:zip:country:", &v56, 0, 0, 0, 0);
            if (!v56)
              continue;
          }
          v13 = (void *)objc_opt_new();
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v14 = v41;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v53 != v16)
                  objc_enumerationMutation(v14);
                v18 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
                v19 = (void *)objc_opt_class();
                v20 = objc_msgSend(v12, "urlificationRange");
                objc_msgSend(v19, "_regionsForTranscript:inRange:mapping:", v18, v20, v21, v11);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                  objc_msgSend(v13, "addObjectsFromArray:", v22);

              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
            }
            while (v15);
          }

          +[CRDataDetectorsOutputRegion outputRegionWithDDResult:children:locale:](CRDataDetectorsOutputRegion, "outputRegionWithDDResult:children:locale:", v12, v13, v45);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "dataType") && objc_msgSend(v23, "dataType") != 10)
            objc_msgSend(v43, "addObject:", v23);

        }
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v44);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v47 = v41;
    v24 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v49;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v49 != v25)
            objc_enumerationMutation(v47);
          v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
          v28 = (void *)objc_opt_class();
          objc_msgSend(v27, "outputRegion");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "_personNameLineInRegion:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(v30, "text");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromText:personName:jobTitle:department:company:", v31, v31, 0, 0, 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              v62 = v30;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              +[CRDataDetectorsOutputRegion outputRegionWithDataType:ddResult:children:locale:](CRDataDetectorsOutputRegion, "outputRegionWithDataType:ddResult:children:locale:", 10, v32, v33, v45);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v43, "addObject:", v34);
            }

          }
        }
        v24 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
      }
      while (v24);
    }

  }
  else
  {
    v43 = 0;
  }

  return v43;
}

+ (unint64_t)_groupTypeFromChildren:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 0xC)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = 0;
      v7 = *(_QWORD *)v13;
      v8 = 1;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "dataType", (_QWORD)v12) == 10)
          {
            if ((unint64_t)objc_msgSend(v4, "count") > 1)
              goto LABEL_24;
          }
          else if (objc_msgSend(v10, "dataType") == 5)
          {
            if (objc_msgSend(v4, "count"))
            {
              v8 = 2;
LABEL_24:

              goto LABEL_25;
            }
          }
          else if (objc_msgSend(v10, "dataType") == 3
                 || objc_msgSend(v10, "dataType") == 4
                 || objc_msgSend(v10, "dataType") == 2)
          {
            v6 = 1;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          continue;
        break;
      }

      if ((v6 & 1) != 0 && (unint64_t)objc_msgSend(v4, "count") > 1)
      {
        v8 = 1;
        goto LABEL_25;
      }
    }
    else
    {

    }
  }
  v8 = 0;
LABEL_25:

  return v8;
}

+ (unint64_t)_dataCountOfType:(unint64_t)a3 inRegions:(id)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a4;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "dataType", (_QWORD)v11) == a3)
          ++v6;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v6;
}

+ (BOOL)_shouldGroupAllEntitiesFor:(id)a3 lines:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = (unint64_t)objc_msgSend(v7, "count") >= 3
    && (unint64_t)objc_msgSend(v7, "count") <= 0xF
    && objc_msgSend(a1, "_dataCountOfType:inRegions:", 10, v6) == 1
    && (unint64_t)(objc_msgSend(a1, "_dataCountOfType:inRegions:", 3, v6) - 1) < 3;

  return v8;
}

+ (id)computeGroupRegionsWithDataDetectorRegions:(id)a3 inRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  CRGroupRegion *v8;
  void *v9;
  CRGroupRegion *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CRDataDetectorsGroupOutputRegion *v29;
  id v31;
  CRTextFeatureOrderV2 *v32;
  void *v33;
  id v34;
  id obj;
  id obja;
  uint64_t v37;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v31 = a4;
  v34 = (id)objc_opt_new();
  v32 = -[CRTextFeatureOrderV2 initWithAngleThresholdForRotatedCrops:]([CRTextFeatureOrderV2 alloc], "initWithAngleThresholdForRotatedCrops:", 0.0);
  objc_msgSend(v31, "contentsWithTypes:", 8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeatureOrderV2 orderAndGroupRegions:coarseDelegate:fineDelegate:coarseOnly:](v32, "orderAndGroupRegions:coarseDelegate:fineDelegate:coarseOnly:");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(obj, "count") >= 2
    && objc_msgSend(a1, "_shouldGroupAllEntitiesFor:lines:", v39, v33))
  {
    objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "boundingQuad");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "baselineAngle");
    +[CRBlockOutputRegion blockWithLines:confidence:quad:baselineAngle:](CRBlockOutputRegion, "blockWithLines:confidence:quad:baselineAngle:", v33, 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [CRGroupRegion alloc];
    objc_msgSend(v7, "boundingQuad");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CRGroupRegion initWithBoundingQuad:layoutDirection:subregions:](v8, "initWithBoundingQuad:layoutDirection:subregions:", v9, objc_msgSend(v7, "layoutDirection"), v33);
    v59[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    obj = (id)v11;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obja = obj;
  v40 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v40)
  {
    v37 = *(_QWORD *)v53;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v53 != v37)
          objc_enumerationMutation(obja);
        v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v41);
        v42 = (void *)objc_opt_new();
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v43 = v39;
        v13 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v49;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v49 != v14)
                objc_enumerationMutation(v43);
              v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v15);
              objc_msgSend(v12, "boundingQuad", v31);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "denormalizedQuad");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "boundingQuad");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "denormalizedQuad");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v18, "entirelyContainsQuad:", v20);

              if (v21)
                objc_msgSend(v42, "addObject:", v16);
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          }
          while (v13);
        }

        v22 = objc_msgSend((id)objc_opt_class(), "_groupTypeFromChildren:", v42);
        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22 == 2)
          {
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            objc_msgSend(v12, "subregions");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
            if (v25)
            {
              v26 = *(_QWORD *)v45;
              do
              {
                v27 = 0;
                do
                {
                  if (*(_QWORD *)v45 != v26)
                    objc_enumerationMutation(v24);
                  v28 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v27);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v23, "addObject:", v28);
                  ++v27;
                }
                while (v25 != v27);
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
              }
              while (v25);
            }

          }
          v29 = -[CRDataDetectorsGroupOutputRegion initWithDDRegions:children:groupType:]([CRDataDetectorsGroupOutputRegion alloc], "initWithDDRegions:children:groupType:", v42, v23, v22);
          if (v29)
            objc_msgSend(v34, "addObject:", v29);

        }
        ++v41;
      }
      while (v41 != v40);
      v40 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v40);
  }

  return v34;
}

+ (void)debugDataDetectorForRegion:(id)a3 withImage:(id)a4 ddQOS:(int)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CRTextFeatureOrderV2 *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v5 = *(_QWORD *)&a5;
  v20 = a3;
  v7 = a4;
  if (qword_1ED0B47A0 != -1)
    dispatch_once(&qword_1ED0B47A0, &__block_literal_global_140);
  objc_msgSend(v20, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "recognizedLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transcriptComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRDataDetectorUtilities computeDataDetectorRegionsForText:locale:transcriptComponents:ddQOS:](CRDataDetectorUtilities, "computeDataDetectorRegionsForText:locale:transcriptComponents:ddQOS:", v8, v9, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageByOverlayingRegions:strings:lineWidth:red:green:blue:alpha:", v11, 0, 4.0, 0.0, 0.2, 0.8, 0.8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[CRTextFeatureOrderV2 initWithAngleThresholdForRotatedCrops:]([CRTextFeatureOrderV2 alloc], "initWithAngleThresholdForRotatedCrops:", 0.0);
  objc_msgSend(v20, "contentsWithTypes:", 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeatureOrderV2 orderAndGroupRegions:](v13, "orderAndGroupRegions:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageByOverlayingRegions:strings:lineWidth:red:green:blue:alpha:", v15, 0, 4.0, 0.2, 0.8, 0.0, 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRDataDetectorUtilities computeGroupRegionsWithDataDetectorRegions:inRegion:](CRDataDetectorUtilities, "computeGroupRegionsWithDataDetectorRegions:inRegion:", v11, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageByOverlayingRegions:strings:lineWidth:red:green:blue:alpha:", v17, 0, 8.0, 1.0, 0.0, 0.0, 0.8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/dd_debug_%lu.png"), qword_1ED0B4798, objc_msgSend(v18, "hash"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "writeToFile:", v19);

}

void __70__CRDataDetectorUtilities_debugDataDetectorForRegion_withImage_ddQOS___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  NSHomeDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("CRDDDebug"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4798;
  qword_1ED0B4798 = v0;

}

@end
