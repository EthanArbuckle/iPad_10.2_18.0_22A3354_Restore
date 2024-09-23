@implementation CNVCard30CardBuilder

+ (id)builderWithPerson:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPerson:", v4);

  return v5;
}

- (CNVCard30CardBuilder)initWithPerson:(id)a3
{
  id v5;
  CNVCard30CardBuilder *v6;
  CNVCard30CardBuilder *v7;
  NSMutableArray *v8;
  NSMutableArray *lines;
  void *v10;
  uint64_t v11;
  NSMutableArray *unknownProperties;
  uint64_t v13;
  CNVCardLineFactory *lineFactory;
  CNVCard30CardBuilder *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNVCard30CardBuilder;
  v6 = -[CNVCard30CardBuilder init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_person, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lines = v7->_lines;
    v7->_lines = v8;

    v7->_groupCount = 0;
    objc_msgSend(v5, "unknownProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");
    unknownProperties = v7->_unknownProperties;
    v7->_unknownProperties = (NSMutableArray *)v11;

    v7->_countOfLinesBeforePhoto = -1;
    +[CNVCardLineFactory version30LineFactory](CNVCardLineFactory, "version30LineFactory");
    v13 = objc_claimAutoreleasedReturnValue();
    lineFactory = v7->_lineFactory;
    v7->_lineFactory = (CNVCardLineFactory *)v13;

    v15 = v7;
  }

  return v7;
}

- (void)buildWithSerializer:(id)a3
{
  id v4;
  NSMutableArray *lines;
  id v6;
  void (**retrofitPhoto)(id, id, _QWORD);
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  lines = self->_lines;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__CNVCard30CardBuilder_buildWithSerializer___block_invoke;
  v9[3] = &unk_1E956FB48;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](lines, "enumerateObjectsUsingBlock:", v9);
  retrofitPhoto = (void (**)(id, id, _QWORD))self->_retrofitPhoto;
  if (retrofitPhoto)
  {
    retrofitPhoto[2](retrofitPhoto, v6, v13[5]);
    v8 = self->_retrofitPhoto;
    self->_retrofitPhoto = 0;

  }
  _Block_object_dispose(&v12, 8);

}

void __44__CNVCard30CardBuilder_buildWithSerializer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "countOfLinesBeforePhoto") == a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "insertionMarker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  objc_msgSend(v9, "serializeWithStrategy:", *(_QWORD *)(a1 + 40));

}

- (void)removeUnknownPropertiesWithTag:(id)a3
{
  NSMutableArray *unknownProperties;
  id v4;

  unknownProperties = self->_unknownProperties;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("propertyName != %@"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](unknownProperties, "filterUsingPredicate:", v4);

}

- (void)addLineWithName:(id)a3 value:(id)a4
{
  id v6;
  NSMutableArray *lines;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    lines = self->_lines;
    -[CNVCardLineFactory stringLineWithName:value:](self->_lineFactory, "stringLineWithName:value:", v9, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray _cn_addNonNilObject:](lines, "_cn_addNonNilObject:", v8);

  }
}

- (void)addBeginningOfCard
{
  NSMutableArray *lines;
  void *v4;

  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("BEGIN"), CFSTR("VCARD"));
  lines = self->_lines;
  -[CNVCardLineFactory versionPlaceholderLine](self->_lineFactory, "versionPlaceholderLine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray _cn_addNonNilObject:](lines, "_cn_addNonNilObject:", v4);

  if (addBeginningOfCard_onceToken != -1)
    dispatch_once(&addBeginningOfCard_onceToken, &__block_literal_global_7);
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("PRODID"), addBeginningOfCard_prodID);
}

void __42__CNVCard30CardBuilder_addBeginningOfCard__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[CNVCardProdIdString stringForCurrentBuild](CNVCardProdIdString, "stringForCurrentBuild");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)addBeginningOfCard_prodID;
  addBeginningOfCard_prodID = v0;

}

- (void)addEndOfCard
{
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("END"), CFSTR("VCARD"));
}

- (void)addNameLines
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CNVCard30CardBuilder addNameComponents](self, "addNameComponents");
  -[CNVCard30CardBuilder addFullName](self, "addFullName");
  -[CNVCardPerson nickname](self->_person, "nickname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("NICKNAME"), v3);

  -[CNVCardPerson maidenName](self->_person, "maidenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-MAIDENNAME"), v4);

  -[CNVCardPerson phoneticFirstName](self->_person, "phoneticFirstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-PHONETIC-FIRST-NAME"), v5);

  -[CNVCardPerson phoneticMiddleName](self->_person, "phoneticMiddleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-PHONETIC-MIDDLE-NAME"), v6);

  -[CNVCardPerson phoneticLastName](self->_person, "phoneticLastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-PHONETIC-LAST-NAME"), v7);

  -[CNVCardPerson pronunciationFirstName](self->_person, "pronunciationFirstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-PRONUNCIATION-FIRST-NAME"), v8);

  -[CNVCardPerson pronunciationLastName](self->_person, "pronunciationLastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-PRONUNCIATION-LAST-NAME"), v9);

  -[CNVCard30CardBuilder addOrganization](self, "addOrganization");
  -[CNVCardPerson phoneticOrganization](self->_person, "phoneticOrganization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-PHONETIC-ORG"), v10);

  -[CNVCardPerson jobTitle](self->_person, "jobTitle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("TITLE"), v11);

}

- (void)addNameComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *lines;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson lastName](self->_person, "lastName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_addObject:orPlaceholder:", v3, &stru_1E95708D8);

  -[CNVCardPerson firstName](self->_person, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_addObject:orPlaceholder:", v4, &stru_1E95708D8);

  -[CNVCardPerson middleName](self->_person, "middleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_addObject:orPlaceholder:", v5, &stru_1E95708D8);

  -[CNVCardPerson title](self->_person, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_addObject:orPlaceholder:", v6, &stru_1E95708D8);

  -[CNVCardPerson suffix](self->_person, "suffix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_addObject:orPlaceholder:", v7, &stru_1E95708D8);

  lines = self->_lines;
  -[CNVCardLineFactory arrayLineWithName:value:](self->_lineFactory, "arrayLineWithName:value:", CFSTR("N"), v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray _cn_addNonNilObject:](lines, "_cn_addNonNilObject:", v9);

}

- (void)addFullName
{
  id v3;

  +[CNVCardNameSerialization compositeNameWithComponents:](CNVCardNameSerialization, "compositeNameWithComponents:", self->_person);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("FN"), v3);

}

- (void)addAddressingGrammar
{
  void *v3;
  id v4;

  +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardLineGenerator, "generatorWithName:groupingCount:", CFSTR("X-ADDRESSING-GRAMMAR"), &self->_groupCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson addressingGrammars](self->_person, "addressingGrammars");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addPropertyLinesForValues:generator:](self, "addPropertyLinesForValues:generator:", v3, v4);

}

- (void)addOrganization
{
  void *v3;
  void *v4;
  NSMutableArray *lines;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson organization](self->_person, "organization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_addObject:orPlaceholder:", v3, &stru_1E95708D8);

  -[CNVCardPerson department](self->_person, "department");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_addObject:orPlaceholder:", v4, &stru_1E95708D8);

  if ((objc_msgSend(v7, "_cn_all:", *MEMORY[0x1E0D13848]) & 1) == 0)
  {
    lines = self->_lines;
    -[CNVCardLineFactory arrayLineWithName:value:](self->_lineFactory, "arrayLineWithName:value:", CFSTR("ORG"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray _cn_addNonNilObject:](lines, "_cn_addNonNilObject:", v6);

  }
}

- (void)addEmailAddresses
{
  void *v3;
  id v4;

  +[CNVCardLineGenerator emailGeneratorWithName:groupingCount:](CNVCardLineGenerator, "emailGeneratorWithName:groupingCount:", CFSTR("EMAIL"), &self->_groupCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson emailAddresses](self->_person, "emailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addPropertyLinesForValues:generator:](self, "addPropertyLinesForValues:generator:", v3, v4);

}

- (void)addPhoneNumbers
{
  void *v3;
  id v4;

  +[CNVCardLineGenerator phoneGeneratorWithName:groupingCount:](CNVCardLineGenerator, "phoneGeneratorWithName:groupingCount:", CFSTR("TEL"), &self->_groupCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson phoneNumbers](self->_person, "phoneNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addPropertyLinesForValues:generator:](self, "addPropertyLinesForValues:generator:", v3, v4);

}

- (void)addPostalAddresses
{
  void *v3;
  id v4;

  +[CNVCardLineGenerator streetAddressGeneratorWithName:groupingCount:](CNVCardLineGenerator, "streetAddressGeneratorWithName:groupingCount:", CFSTR("ADR"), &self->_groupCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson postalAddresses](self->_person, "postalAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addPropertyLinesForValues:generator:](self, "addPropertyLinesForValues:generator:", v3, v4);

}

- (void)addSocialProfiles
{
  void *v3;
  id v4;

  +[CNVCardLineGenerator socialProfileGeneratorWithName:groupingCount:](CNVCardLineGenerator, "socialProfileGeneratorWithName:groupingCount:", CFSTR("X-SOCIALPROFILE"), &self->_groupCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson socialProfiles](self->_person, "socialProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addPropertyLinesForValues:generator:](self, "addPropertyLinesForValues:generator:", v3, v4);

}

- (void)addActivityAlerts
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CNVCard30CardBuilder *v8;

  +[CNVCardLineGenerator activityAlertGeneratorWithName:groupingCount:](CNVCardLineGenerator, "activityAlertGeneratorWithName:groupingCount:", CFSTR("X-ACTIVITY-ALERT"), &self->_groupCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson activityAlerts](self->_person, "activityAlerts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CNVCard30CardBuilder_addActivityAlerts__block_invoke;
  v6[3] = &unk_1E956FB70;
  v7 = v3;
  v8 = self;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __41__CNVCard30CardBuilder_addActivityAlerts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v12 = a2;
  v13[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineWithValue:label:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "lines");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_cn_addNonNilObject:", v10);
}

- (void)addNote
{
  id v3;

  -[CNVCardPerson note](self->_person, "note");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("NOTE"), v3);

}

- (void)addURLs
{
  void *v3;
  id v4;

  +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardLineGenerator, "generatorWithName:groupingCount:", CFSTR("URL"), &self->_groupCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson urls](self->_person, "urls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addPropertyLinesForValues:generator:](self, "addPropertyLinesForValues:generator:", v3, v4);

}

- (void)addCalendarURIs
{
  void *v3;
  id v4;

  +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardLineGenerator, "generatorWithName:groupingCount:", CFSTR("CALURI"), &self->_groupCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson calendarURIs](self->_person, "calendarURIs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addPropertyLinesForValues:generator:](self, "addPropertyLinesForValues:generator:", v3, v4);

}

- (void)addBirthday
{
  void *v3;
  void *v4;
  id v5;

  -[CNVCardPerson birthdayComponents](self->_person, "birthdayComponents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CNVCardLineGenerator dateComponentsGeneratorWithName:groupingCount:](CNVCardLineGenerator, "dateComponentsGeneratorWithName:groupingCount:", CFSTR("BDAY"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lineWithValue:label:", v5, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray _cn_addNonNilObject:](self->_lines, "_cn_addNonNilObject:", v4);

  }
}

- (void)addAlternateBirthday
{
  void *v3;
  void *v4;
  id v5;

  -[CNVCardPerson alternateBirthdayComponents](self->_person, "alternateBirthdayComponents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CNVCardLineGenerator alternateDateComponentsGeneratorWithName:groupingcount:](CNVCardLineGenerator, "alternateDateComponentsGeneratorWithName:groupingcount:", CFSTR("X-ALTBDAY"), &self->_groupCount);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lineWithValue:label:", v5, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray _cn_addNonNilObject:](self->_lines, "_cn_addNonNilObject:", v4);

  }
}

- (void)addOtherDates
{
  void *v3;
  id v4;

  +[CNVCardLineGenerator dateComponentsGeneratorWithName:groupingCount:](CNVCardLineGenerator, "dateComponentsGeneratorWithName:groupingCount:", CFSTR("X-ABDATE"), &self->_groupCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson otherDateComponents](self->_person, "otherDateComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addPropertyLinesForValues:generator:](self, "addPropertyLinesForValues:generator:", v3, v4);

}

- (void)addRelatedNames
{
  void *v3;
  id v4;

  +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardLineGenerator, "generatorWithName:groupingCount:", CFSTR("X-ABRELATEDNAMES"), &self->_groupCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardPerson relatedNames](self->_person, "relatedNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addPropertyLinesForValues:generator:](self, "addPropertyLinesForValues:generator:", v3, v4);

}

- (void)addCompanyMarker
{
  if (-[CNVCardPerson isCompany](self->_person, "isCompany"))
    -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-ABShowAs"), CFSTR("COMPANY"));
}

- (void)addNameOrderMarker
{
  int v3;
  const __CFString *v4;

  v3 = -[CNVCardPerson nameOrder](self->_person, "nameOrder");
  if (v3 == 1)
  {
    v4 = CFSTR("FIRST");
  }
  else
  {
    if (v3 != 2)
      return;
    v4 = CFSTR("LAST");
  }
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-ABOrder"), v4);
}

- (void)addCategories
{
  void *v3;
  NSMutableArray *lines;
  void *v5;
  id v6;

  -[CNVCard30CardBuilder removeUnknownPropertiesWithTag:](self, "removeUnknownPropertiesWithTag:", CFSTR("CATEGORIES"));
  -[CNVCardPerson namesOfParentGroups](self->_person, "namesOfParentGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    lines = self->_lines;
    -[CNVCardLineFactory arrayLineWithName:value:itemSeparator:](self->_lineFactory, "arrayLineWithName:value:itemSeparator:", CFSTR("CATEGORIES"), v3, CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray _cn_addNonNilObject:](lines, "_cn_addNonNilObject:", v5);

  }
}

- (void)addUnknownProperties
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *lines;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_unknownProperties;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x1E0C99D50]);
        objc_msgSend(v8, "originalLine", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithBase64EncodedString:options:", v10, 0);

        if (!v11)
        {
          objc_msgSend(v8, "originalLine");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dataUsingEncoding:", 4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        lines = self->_lines;
        +[CNVCardLine lineWithLiteralValue:](CNVCardLine, "lineWithLiteralValue:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray _cn_addNonNilObject:](lines, "_cn_addNonNilObject:", v14);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

- (void)addCardDAVUID
{
  id v3;

  -[CNVCardPerson cardDAVUID](self->_person, "cardDAVUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("UID"), v3);

}

- (void)addUID
{
  id v3;

  -[CNVCardPerson uid](self->_person, "uid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-ABUID"), v3);

}

- (void)addPhonemeData
{
  id v3;

  -[CNVCardPerson phonemeData](self->_person, "phonemeData");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-ADDRESSBOOKSERVER-PHONEME-DATA"), v3);

}

- (void)addPreferredLikenessSource
{
  id v3;

  -[CNVCardPerson preferredLikenessSource](self->_person, "preferredLikenessSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-APPLE-LIKENESS-SOURCE"), v3);

}

- (void)addPreferredApplePersonaIdentifier
{
  id v3;

  -[CNVCardPerson preferredApplePersonaIdentifier](self->_person, "preferredApplePersonaIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-APPLE-LIKENESS-SERVICE-IDENTIFIER"), v3);

}

- (void)addDowntimeWhitelist
{
  __CFString **v3;

  if (-[CNVCardPerson downtimeWhitelistAuthorization](self->_person, "downtimeWhitelistAuthorization") == 1)
  {
    v3 = CNVCardGuardianWhitelistAuthorizationAllowed;
  }
  else
  {
    if (-[CNVCardPerson downtimeWhitelistAuthorization](self->_person, "downtimeWhitelistAuthorization") != 2)
      return;
    v3 = CNVCardGuardianWhitelistAuthorizationDisallowed;
  }
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-APPLE-GUARDIAN-WHITELISTED"), *v3);
}

- (void)addImageType
{
  id v3;

  -[CNVCardPerson imageType](self->_person, "imageType");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-IMAGETYPE"), v3);

}

- (void)addImageHash
{
  void *v3;
  id v4;

  -[CNVCardPerson imageHash](self->_person, "imageHash");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-IMAGEHASH"), v3);

}

- (void)addWallpaper
{
  void *v3;
  id v4;

  -[CNVCardPerson wallpaper](self->_person, "wallpaper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-WALLPAPER"), v3);

}

- (void)addWatchWallpaperImageData
{
  void *v3;
  id v4;

  -[CNVCardPerson watchWallpaperImageData](self->_person, "watchWallpaperImageData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-WATCH-WALLPAPER-IMAGE-DATA"), v3);

}

- (void)addSharedPhotoDisplayPreference
{
  unsigned int v3;

  v3 = -[CNVCardPerson sharedPhotoDisplayPreference](self->_person, "sharedPhotoDisplayPreference") - 1;
  if (v3 <= 2)
    -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-SHARED-PHOTO-DISPLAY-PREF"), off_1E956FC70[v3]);
}

- (void)addImageBackgroundColorsData
{
  void *v3;
  id v4;

  -[CNVCardPerson imageBackgroundColorsData](self->_person, "imageBackgroundColorsData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("X-IMAGE-BACKGROUND-COLORS-DATA"), v3);

}

- (void)addSensitiveContentConfiguration
{
  void *v3;
  id v4;

  -[CNVCardPerson sensitiveContentConfiguration](self->_person, "sensitiveContentConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLineWithName:value:](self, "addLineWithName:value:", CFSTR("VND-63-SENSITIVE-CONTENT-CONFIG"), v3);

}

- (void)addInstantMessagingInfo
{
  id v3;

  -[CNVCardPerson instantMessagingAddresses](self->_person, "instantMessagingAddresses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addLegacyInstantMessagingHandles:forService:vCardProperty:](self, "addLegacyInstantMessagingHandles:forService:vCardProperty:", v3, CFSTR("AIMInstant"), CFSTR("X-AIM"));
  -[CNVCard30CardBuilder addLegacyInstantMessagingHandles:forService:vCardProperty:](self, "addLegacyInstantMessagingHandles:forService:vCardProperty:", v3, CFSTR("JabberInstant"), CFSTR("X-JABBER"));
  -[CNVCard30CardBuilder addLegacyInstantMessagingHandles:forService:vCardProperty:](self, "addLegacyInstantMessagingHandles:forService:vCardProperty:", v3, CFSTR("MSNInstant"), CFSTR("X-MSN"));
  -[CNVCard30CardBuilder addLegacyInstantMessagingHandles:forService:vCardProperty:](self, "addLegacyInstantMessagingHandles:forService:vCardProperty:", v3, CFSTR("YahooInstant"), CFSTR("X-YAHOO"));
  -[CNVCard30CardBuilder addLegacyInstantMessagingHandles:forService:vCardProperty:](self, "addLegacyInstantMessagingHandles:forService:vCardProperty:", v3, CFSTR("ICQInstant"), CFSTR("X-ICQ"));
  -[CNVCard30CardBuilder addInstantMessagingHandles:](self, "addInstantMessagingHandles:", v3);

}

- (void)addInstantMessagingHandles:(id)a3
{
  int64_t *p_groupCount;
  id v5;
  id v6;

  p_groupCount = &self->_groupCount;
  v5 = a3;
  +[CNVCardLineGenerator instantMessagingGeneratorWithName:groupingCount:](CNVCardLineGenerator, "instantMessagingGeneratorWithName:groupingCount:", CFSTR("IMPP"), p_groupCount);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCard30CardBuilder addPropertyLinesForValues:generator:](self, "addPropertyLinesForValues:generator:", v5, v6);

}

- (void)addLegacyInstantMessagingHandles:(id)a3 forService:(id)a4 vCardProperty:(id)a5
{
  int64_t *p_groupCount;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  p_groupCount = &self->_groupCount;
  v9 = a4;
  v10 = a3;
  +[CNVCardLineGenerator legacyInstantMessagingGeneratorWithName:groupingCount:](CNVCardLineGenerator, "legacyInstantMessagingGeneratorWithName:groupingCount:", a5, p_groupCount);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(uint64_t, void *))sFilterIMPPsForService + 2))((uint64_t)sFilterIMPPsForService, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_cn_filter:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVCard30CardBuilder addPropertyLinesForValues:generator:](self, "addPropertyLinesForValues:generator:", v12, v13);
}

- (void)addPhotoWithOptions:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "includePhotos")
    && (!objc_msgSend(v4, "usePhotoReferencesIfAvailable")
     || !-[CNVCard30CardBuilder addPhotoReferences](self, "addPhotoReferences")))
  {
    -[CNVCard30CardBuilder preparePhotoLineWithOptions:](self, "preparePhotoLineWithOptions:", v4);
  }

}

- (BOOL)addPhotoReferences
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CNVCardPerson imageReferences](self->_person, "imageReferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");
    v6 = v5 != 0;
    if (v5)
    {
      -[CNVCardLineFactory stringLineWithName:value:](self->_lineFactory, "stringLineWithName:value:", CFSTR("PHOTO"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addParameterWithName:value:", CFSTR("VALUE"), CFSTR("uri"));
      -[CNVCardPerson memojiMetadata](self->_person, "memojiMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addParameterWithName:value:", CFSTR("VND-63-MEMOJI-DETAILS"), v9);

      -[CNVCardPerson largeImageCropRects](self->_person, "largeImageCropRects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVCard30CardBuilder _addAttributesForCropRects:imageHash:toLine:](self, "_addAttributesForCropRects:imageHash:toLine:", v10, 0, v7);
      -[CNVCard30CardBuilder addImageType](self, "addImageType");
      -[CNVCard30CardBuilder addImageHash](self, "addImageHash");
      -[NSMutableArray _cn_addNonNilObject:](self->_lines, "_cn_addNonNilObject:", v7);
      self->_photoHandled = 1;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)preparePhotoLineWithOptions:(id)a3
{
  id v4;
  CNVCardPerson *v5;
  CNVCardLineFactory *v6;
  CNVCard30CardBuilder *v7;
  CNVCard30CardBuilder *v8;
  CNVCardLineFactory *v9;
  CNVCardPerson *v10;
  id v11;
  uint64_t v12;
  id retrofitPhoto;
  _QWORD v14[4];
  id v15;
  CNVCardPerson *v16;
  CNVCardLineFactory *v17;
  CNVCard30CardBuilder *v18;

  v4 = a3;
  v5 = self->_person;
  v6 = self->_lineFactory;
  v7 = self;
  v7->_countOfLinesBeforePhoto = -[NSMutableArray count](v7->_lines, "count");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__CNVCard30CardBuilder_preparePhotoLineWithOptions___block_invoke;
  v14[3] = &unk_1E956FBE0;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  v18 = v7;
  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v12 = objc_msgSend(v14, "copy");
  retrofitPhoto = v8->_retrofitPhoto;
  v8->_retrofitPhoto = (id)v12;

}

void __52__CNVCard30CardBuilder_preparePhotoLineWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  CNVCard30PHOTOHelper *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a2;
  v5 = a3;
  v6 = +[CNVCard30CardBuilder estimatedBytesAvailableForPhotoWithOptions:serializer:](CNVCard30CardBuilder, "estimatedBytesAvailableForPhotoWithOptions:serializer:", *(_QWORD *)(a1 + 32), v27);
  if (v6)
  {
    v7 = -[CNVCard30PHOTOHelper initWithPerson:options:maximumDataLength:]([CNVCard30PHOTOHelper alloc], "initWithPerson:options:maximumDataLength:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v6);
    -[CNVCard30PHOTOHelper bestEffortImage](v7, "bestEffortImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D13818];
    objc_msgSend(v8, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v8, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_cn_md5Hash");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *(void **)(a1 + 48);
      objc_msgSend(v8, "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dataLineWithName:value:", CFSTR("PHOTO"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = *(void **)(a1 + 56);
      objc_msgSend(v8, "cropRects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_addAttributesForCropRects:imageHash:toLine:", v17, v12, v15);

      objc_msgSend(*(id *)(a1 + 40), "memojiMetadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "base64EncodedStringWithOptions:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addParameterWithName:value:", CFSTR("VND-63-MEMOJI-DETAILS"), v19);

      objc_msgSend(v27, "insertLine:atMarker:", v15, v5);
      v20 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "imageType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringLineWithName:value:", CFSTR("X-IMAGETYPE"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "insertLine:atMarker:", v22, v5);

      objc_msgSend(*(id *)(a1 + 40), "imageType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = *(void **)(a1 + 48);
        objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringLineWithName:value:", CFSTR("X-IMAGEHASH"), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "insertLine:atMarker:", v26, v5);

      }
    }

  }
}

+ (unint64_t)estimatedBytesAvailableForPhotoWithOptions:(id)a3 serializer:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "maximumEncodingLength"))
  {
    v7 = objc_msgSend(v6, "estimatedDataLength") + 129;
    if (v7 <= objc_msgSend(v5, "maximumEncodingLength"))
      v8 = objc_msgSend(MEMORY[0x1E0C99D50], "_cn_maxDataLengthFittingInBase64EncodingLength:", objc_msgSend(v5, "maximumEncodingLength") - v7);
    else
      v8 = 0;
  }
  else
  {
    v8 = -1;
  }
  if (objc_msgSend(v5, "maximumImageEncodingLength"))
  {
    v9 = objc_msgSend(MEMORY[0x1E0C99D50], "_cn_maxDataLengthFittingInBase64EncodingLength:", objc_msgSend(v5, "maximumImageEncodingLength"));
    v10 = objc_msgSend(v5, "maximumEncodingLength");
    if (v8 >= v9)
      v11 = v9;
    else
      v11 = v8;
    if (v10)
      v8 = v11;
    else
      v8 = v9;
  }

  return v8;
}

- (void)_addAttributesForCropRects:(id)a3 imageHash:(id)a4 toLine:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CNVCard30CardBuilder *v13;
  id v14;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v10, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__CNVCard30CardBuilder__addAttributesForCropRects_imageHash_toLine___block_invoke;
    v11[3] = &unk_1E956FC08;
    v12 = v8;
    v13 = self;
    v14 = v9;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
}

void __68__CNVCard30CardBuilder__addAttributesForCropRects_imageHash_toLine___block_invoke(id *a1, void *a2, void *a3)
{
  double x;
  double y;
  double width;
  double height;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSRect v22;
  NSRect v23;

  v21 = a2;
  objc_msgSend(a3, "rectValue");
  v23 = NSIntegralRect(v22);
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  v9 = NSEqualRects(*MEMORY[0x1E0CB3438], v23);
  v10 = v21;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld&%ld&%ld&%ld"), (uint64_t)x, (uint64_t)y, (uint64_t)width, (uint64_t)height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0D13848];
    if (((*(uint64_t (**)(_QWORD, void *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v11) & 1) == 0)
    {
      v13 = a1[4];
      if (!a1[4])
      {
        objc_msgSend(a1[5], "person");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "largeImageHashOfType:", v21);
        v15 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v15;
      }
      objc_msgSend(v13, "_cn_encodeVCardBase64DataWithInitialLength:", 20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 1);
      if (((*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v17) & 1) == 0)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        +[CNVCardParameterEncoder encodeParameterValue:](CNVCardParameterEncoder, "encodeParameterValue:", v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@&%@&%@"), v19, v11, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[6], "addParameterWithName:value:", CFSTR("X-ABCROP-RECTANGLE"), v20);
      }

    }
    v10 = v21;
  }

}

- (void)addPropertyLinesForValues:(id)a3 generator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__CNVCard30CardBuilder_addPropertyLinesForValues_generator___block_invoke;
  v11[3] = &unk_1E956FC30;
  v12 = v6;
  v10 = v6;
  objc_msgSend(a3, "_cn_map:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_filter:", &__block_literal_global_155);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPrimaryValueMarkerToLine:", v9);

  -[NSMutableArray addObjectsFromArray:](self->_lines, "addObjectsFromArray:", v8);
}

id __60__CNVCard30CardBuilder_addPropertyLinesForValues_generator___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "lineWithValue:label:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

_QWORD *__60__CNVCard30CardBuilder_addPropertyLinesForValues_generator___block_invoke_2()
{
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*MEMORY[0x1E0D13830] + 16))(MEMORY[0x1E0D13830]);
}

- (CNVCardPerson)person
{
  return self->_person;
}

- (NSMutableArray)lines
{
  return self->_lines;
}

- (int64_t)groupCount
{
  return self->_groupCount;
}

- (void)setGroupCount:(int64_t)a3
{
  self->_groupCount = a3;
}

- (unint64_t)countOfLinesBeforePhoto
{
  return self->_countOfLinesBeforePhoto;
}

- (void)setCountOfLinesBeforePhoto:(unint64_t)a3
{
  self->_countOfLinesBeforePhoto = a3;
}

- (id)retrofitPhoto
{
  return self->_retrofitPhoto;
}

- (BOOL)photoHandled
{
  return self->_photoHandled;
}

- (void)setPhotoHandled:(BOOL)a3
{
  self->_photoHandled = a3;
}

- (NSMutableArray)unknownProperties
{
  return self->_unknownProperties;
}

- (CNVCardLineFactory)lineFactory
{
  return self->_lineFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineFactory, 0);
  objc_storeStrong((id *)&self->_unknownProperties, 0);
  objc_storeStrong(&self->_retrofitPhoto, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end
