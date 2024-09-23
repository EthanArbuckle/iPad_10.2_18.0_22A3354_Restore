@implementation CNVCardWriting

+ (id)stringWithPeople:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id *v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v23 = a5;
    v13 = 0;
    v14 = *(_QWORD *)v27;
    while (2)
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15);
        v18 = (void *)MEMORY[0x1D8252248]();
        v25 = v16;
        objc_msgSend(a1, "stringWithPerson:options:error:", v17, v9, &v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v25;

        if (!v19)
        {

          objc_autoreleasePoolPop(v18);
          v10 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v10, "appendString:", v19);

        objc_autoreleasePoolPop(v18);
        ++v15;
        v16 = v13;
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v12)
        continue;
      break;
    }
LABEL_11:
    a5 = v23;
  }
  else
  {
    v13 = 0;
  }

  v20 = v10;
  v21 = v20;
  if (a5 && !v20)
    *a5 = objc_retainAutorelease(v13);

  return v21;
}

+ (id)stringWithPerson:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "outputVersion") == 1)
  {
    objc_msgSend(v8, "availableEncodings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNVCardLineSerializationStrategy version21StrategyWithStringStorage:encodings:](CNVCardLineSerializationStrategy, "version21StrategyWithStringStorage:encodings:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CNVCardLineSerializationStrategy version30StrategyWithStringStorage:](CNVCardLineSerializationStrategy, "version30StrategyWithStringStorage:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "serializePerson:withSerializer:options:", v7, v11, v8);

  return v9;
}

+ (id)dataWithPeople:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id *v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v23 = a5;
    v13 = 0;
    v14 = *(_QWORD *)v27;
    while (2)
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15);
        v18 = (void *)MEMORY[0x1D8252248]();
        v25 = v16;
        objc_msgSend(a1, "dataWithPerson:options:error:", v17, v9, &v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v25;

        if (!v19)
        {

          objc_autoreleasePoolPop(v18);
          v10 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v10, "appendData:", v19);

        objc_autoreleasePoolPop(v18);
        ++v15;
        v16 = v13;
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v12)
        continue;
      break;
    }
LABEL_11:
    a5 = v23;
  }
  else
  {
    v13 = 0;
  }

  v20 = v10;
  v21 = v20;
  if (a5 && !v20)
    *a5 = objc_retainAutorelease(v13);

  return v21;
}

+ (id)dataWithPerson:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "outputVersion") == 1)
  {
    objc_msgSend(v8, "availableEncodings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNVCardLineSerializationStrategy version21StrategyWithDataStorage:encodings:](CNVCardLineSerializationStrategy, "version21StrategyWithDataStorage:encodings:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CNVCardLineSerializationStrategy version30StrategyWithDataStorage:](CNVCardLineSerializationStrategy, "version30StrategyWithDataStorage:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "serializePerson:withSerializer:options:", v7, v11, v8);

  return v9;
}

+ (id)excludedFieldsForPerson:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "includeNotes") & 1) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("Note"));
  if ((objc_msgSend(v5, "includePhotos") & 1) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("com.apple.image.thumbnail"));
  if ((objc_msgSend(v5, "includeWallpaper") & 1) == 0)
  {
    objc_msgSend(v6, "addObject:", CFSTR("wallpaper"));
    objc_msgSend(v6, "addObject:", CFSTR("watchWallpaperImageData"));
  }
  if ((objc_msgSend(v5, "includeUserSettings") & 1) == 0)
  {
    objc_msgSend(v6, "addObject:", CFSTR("GuardianWhitelisted"));
    objc_msgSend(v6, "addObject:", CFSTR("ActivityAlert"));
    objc_msgSend(v6, "addObject:", CFSTR("imageType"));
    objc_msgSend(v6, "addObject:", CFSTR("imageHash"));
    objc_msgSend(v6, "addObject:", CFSTR("memojiMetadata"));
    objc_msgSend(v6, "addObject:", CFSTR("sharedPhotoDisplayPreference"));
  }
  if ((objc_msgSend(v5, "includePronouns") & 1) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("AddressingGrammar"));
  if ((objc_msgSend(v5, "includeMeCardOnlySharingProperties") & 1) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("ABRelatedNames"));
  if ((objc_msgSend(v5, "includePrivateFields") & 1) == 0
    && +[CNVCardUserDefaults isPrivateVCardFieldsEnabled](CNVCardUserDefaults, "isPrivateVCardFieldsEnabled"))
  {
    objc_msgSend(a1, "excludedMeCardFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

  }
  return v6;
}

+ (id)excludedMeCardFields
{
  return +[CNVCardUserDefaults vCardPrivateFields](CNVCardUserDefaults, "vCardPrivateFields");
}

+ (id)scopeForPerson:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  CNVCardFilteredPersonScope *v8;

  v6 = a4;
  objc_msgSend(a1, "excludedFieldsForPerson:options:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v6, "includePrivateBundleIdentifiers");

  v8 = -[CNVCardFilteredPersonScope initWithExcludedFields:options:]([CNVCardFilteredPersonScope alloc], "initWithExcludedFields:options:", v7, a1);
  return v8;
}

+ (void)serializePerson:(id)a3 withSerializer:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "scopeForPerson:options:", v10, v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[CNVCardFilteredPerson filteredPersonWithPerson:scope:](CNVCardFilteredPerson, "filteredPersonWithPerson:scope:", v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNVCard30CardBuilder builderWithPerson:](CNVCard30CardBuilder, "builderWithPerson:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "makevCardWithBuilder:serializer:options:", v12, v9, v8);

}

+ (void)makevCardWithBuilder:(id)a3 serializer:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a5;
  v8 = a4;
  objc_msgSend(v10, "addBeginningOfCard");
  objc_msgSend(v10, "addNameLines");
  objc_msgSend(v10, "addEmailAddresses");
  objc_msgSend(v10, "addPhoneNumbers");
  objc_msgSend(v10, "addAddressingGrammar");
  objc_msgSend(v10, "addPostalAddresses");
  objc_msgSend(v10, "addSocialProfiles");
  objc_msgSend(v10, "addActivityAlerts");
  objc_msgSend(v10, "addNote");
  objc_msgSend(v10, "addURLs");
  objc_msgSend(v10, "addCalendarURIs");
  objc_msgSend(v10, "addBirthday");
  objc_msgSend(v10, "addAlternateBirthday");
  objc_msgSend(v10, "addInstantMessagingInfo");
  objc_msgSend(v10, "addPhotoWithOptions:", v7);
  objc_msgSend(v10, "addWallpaper");
  objc_msgSend(v10, "addWatchWallpaperImageData");
  objc_msgSend(v10, "addImageBackgroundColorsData");
  objc_msgSend(v10, "addSensitiveContentConfiguration");
  objc_msgSend(v10, "addOtherDates");
  objc_msgSend(v10, "addRelatedNames");
  objc_msgSend(v10, "addNameOrderMarker");
  objc_msgSend(v10, "addCompanyMarker");
  objc_msgSend(v10, "addSharedPhotoDisplayPreference");
  objc_msgSend(v7, "treatAsUnknownProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v9, "containsObject:", CFSTR("CATEGORIES"));
  if ((v7 & 1) == 0)
    objc_msgSend(v10, "addCategories");
  objc_msgSend(v10, "addCardDAVUID");
  objc_msgSend(v10, "addUID");
  objc_msgSend(v10, "addPhonemeData");
  objc_msgSend(v10, "addDowntimeWhitelist");
  objc_msgSend(v10, "addPreferredLikenessSource");
  objc_msgSend(v10, "addPreferredApplePersonaIdentifier");
  objc_msgSend(v10, "addUnknownProperties");
  objc_msgSend(v10, "addEndOfCard");
  objc_msgSend(v10, "buildWithSerializer:", v8);

}

@end
