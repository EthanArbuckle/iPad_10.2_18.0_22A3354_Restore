@implementation WBSFormToABBinder

+ (id)allSynonymsForMatch:(id)a3 formAppearsToBeChinese:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v18;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v5, "property");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    lookupSynonyms(0, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v13 = (void *)v10;
    goto LABEL_15;
  }
  if (!v4)
  {
LABEL_10:
    objc_msgSend(v5, "property");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = findEntry<SafariShared::AddressBookAutoCompleteMappingData::SynonymCollectionMap>((uint64_t)&SafariShared::AddressBookAutoCompleteMappingData::synonyms, v14);
    if (v15)
      v16 = v15[1];
    else
      v16 = 0;

    objc_msgSend(v5, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    lookupSynonyms(v16, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v5, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("City")))
  {
    objc_msgSend(v5, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("State"));

    if (v12)
      goto LABEL_7;
    goto LABEL_10;
  }

LABEL_7:
  objc_msgSend(v5, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "hasSuffix:", CFSTR("省")) & 1) != 0
    || objc_msgSend(v8, "hasSuffix:", CFSTR("市")))
  {
    objc_msgSend(v8, "substringWithRange:", 0, objc_msgSend(v8, "length") - objc_msgSend(CFSTR("省"), "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v9);
  }
  else
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("省"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v18);

    objc_msgSend(v8, "stringByAppendingString:", CFSTR("市"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v9);
  }
LABEL_15:

  return v13;
}

+ (id)specifierForLabel:(id)a3
{
  lookupSpecifier((uint64_t)&SafariShared::AddressBookAutoCompleteMappingData::fieldLabelMap, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)specifierForAutocompleteToken:(id)a3
{
  lookupSpecifier((uint64_t)&SafariShared::AddressBookAutoCompleteMappingData::autocompleteTokenMap, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)indexOfBestMatchForString:(id)a3 inArray:(id)a4 startingPosition:(unint64_t *)a5
{
  id v7;
  id v8;
  const __CFCharacterSet *Predefined;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  void *v21;
  unint64_t *v22;
  unint64_t v23;

  v7 = a3;
  v8 = a4;
  v21 = v7;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), &stru_1E4B40D18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "count");
  if (v11)
  {
    v12 = 0;
    v13 = 0;
    v22 = a5;
    v23 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      objc_msgSend(v8, "safari_stringAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), &stru_1E4B40D18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "rangeOfString:options:", v10, 1);
      v17 = v16;
      if (v16
        && (v16 == 0x7FFFFFFFFFFFFFFFLL
         || CFCharacterSetIsCharacterMember(Predefined, objc_msgSend(v15, "characterAtIndex:", v16 - 1)))
        || (v18 = objc_msgSend(v15, "length"), objc_msgSend(v10, "length") + v17 < v18)
        && CFCharacterSetIsCharacterMember(Predefined, objc_msgSend(v15, "characterAtIndex:"))
        || v13 && v18 >= objc_msgSend(v13, "length"))
      {
        v19 = v13;
      }
      else
      {
        v19 = v15;

        if (v22)
          *v22 = v17;
        v23 = v12;
      }

      ++v12;
      v13 = v19;
    }
    while (v11 != v12);
  }
  else
  {
    v19 = 0;
    v23 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v23;
}

+ (__WBSFieldLabelPatternMatcherArray)addressBookFieldLabelPatternMatchers
{
  return (__WBSFieldLabelPatternMatcherArray *)&SafariShared::AddressBookAutoCompleteMappingData::addressBookFieldLabelPatternMatchers;
}

+ (__WBSFieldLabelPatternMatcherArray)emailFieldLabelPatternMatchers
{
  return (__WBSFieldLabelPatternMatcherArray *)&SafariShared::AddressBookAutoCompleteMappingData::emailFieldLabelPatternMatchers;
}

+ (id)specifierForClassification:(id)a3 hints:(id)a4 orderedParts:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v7;
  if (v10)
  {
    v11 = v10;
    if (objc_msgSend(v9, "count") == 1)
    {
      v11 = v10;
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("name")))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (CFSTR("FullNameComposite"))
    {
      v13 = &qword_1E4B2C308;
      while (!objc_msgSend((id)v13[1], "isEqualToString:", v11)
           || v12 && !objc_msgSend(v12, "isEqualToString:", v13[2]))
      {
        v14 = v13[3];
        v13 += 7;
        if (!v14)
          goto LABEL_11;
      }
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89B90]), "initWithProperty:component:label:category:parentProperty:classification:classificationHint:", *(v13 - 4), *(v13 - 3), *(v13 - 2), *(v13 - 1), *v13, v13[1], v13[2]);
    }
    else
    {
LABEL_11:
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
