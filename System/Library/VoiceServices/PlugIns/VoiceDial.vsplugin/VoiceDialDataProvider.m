@implementation VoiceDialDataProvider

- (VoiceDialDataProvider)init
{
  char *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VoiceDialDataProvider;
  v2 = -[VoiceDialDataProvider init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, (dispatch_qos_class_t)2u, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.mobilephone.VoiceDialDataProvider", v4);
    v6 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v5;

    *((_QWORD *)v2 + 9) = -1;
    *(_OWORD *)(v2 + 56) = xmmword_21DBEEA80;
    if (MGGetBoolAnswer())
      v2[104] |= 4u;
    objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addListenerID:forService:", CFSTR("com.apple.voicedial"), 0);

  }
  return (VoiceDialDataProvider *)v2;
}

- (void)dealloc
{
  void *v3;
  void *addressBook;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFArray *people;
  __CFString *lastDatabaseUUID;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListenerID:forService:", CFSTR("com.apple.voicedial"), 0);

  addressBook = self->_addressBook;
  if (addressBook)
  {
    ABAddressBookUnregisterExternalChangeCallback(addressBook, (ABExternalChangeCallback)_VoiceDialAddressBookChangedCallBack, self);
    CFRelease(self->_addressBook);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  }
  people = self->_people;
  if (people)
    CFRelease(people);
  lastDatabaseUUID = self->_lastDatabaseUUID;
  if (lastDatabaseUUID)
    CFRelease(lastDatabaseUUID);
  v8.receiver = self;
  v8.super_class = (Class)VoiceDialDataProvider;
  -[VoiceDialDataProvider dealloc](&v8, sel_dealloc);
}

- (void)_addressBook
{
  void *result;
  void *v4;
  NSObject *v5;
  CFErrorRef error;

  result = self->_addressBook;
  if (!result)
  {
    error = 0;
    v4 = (void *)ABAddressBookCreateWithOptions(0, &error);
    self->_addressBook = v4;
    if (!v4)
    {
      PHDefaultLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[VoiceDialResultHandler _addressBook].cold.1((uint64_t *)&error, v5);

    }
    if (error)
      CFRelease(error);
    return self->_addressBook;
  }
  return result;
}

- (id)_namesSource
{
  VoiceDialNameDataSource *namesSource;
  void *v4;
  VoiceDialNameDataSource *v5;
  VoiceDialNameDataSource *v6;

  namesSource = self->_namesSource;
  if (!namesSource)
  {
    VSPreferencesCopySpokenLanguageIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[VoiceDialNameDataSource nameDataSourceForLanguageIdentifier:](VoiceDialNameDataSource, "nameDataSourceForLanguageIdentifier:", v4);
    v5 = (VoiceDialNameDataSource *)objc_claimAutoreleasedReturnValue();
    v6 = self->_namesSource;
    self->_namesSource = v5;

    -[VoiceDialNameDataSource setUseCompositeNamesOnly:](self->_namesSource, "setUseCompositeNamesOnly:", -[VoiceDialDataProvider _shouldUseCompositeNamesOnly](self, "_shouldUseCompositeNamesOnly"));
    namesSource = self->_namesSource;
  }
  return namesSource;
}

- (void)getLabels:(id *)a3 andWeightedLabels:(id *)a4 ForABProperty:(int)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD block[8];
  _QWORD v51[5];
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy_;
  v63 = __Block_byref_object_dispose_;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  v58 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy_;
  v51[4] = __Block_byref_object_dispose_;
  v52 = 0;
  if (!a3)
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v11 = 0;
    v6 = 0;
    goto LABEL_72;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v7 = -[VoiceDialDataProvider _addressBook](self, "_addressBook");
  -[VoiceDialDataProvider serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__VoiceDialDataProvider_getLabels_andWeightedLabels_ForABProperty___block_invoke;
  block[3] = &unk_24E19F170;
  block[4] = v51;
  block[5] = &v53;
  block[6] = &v59;
  block[7] = v7;
  dispatch_sync(v8, block);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = (id)v60[5];
  v10 = 0;
  v11 = 0;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
  if (!v12)
    goto LABEL_19;
  v13 = *(_QWORD *)v47;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v47 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      v16 = (void *)v54[5];
      if (v16)
      {
        objc_msgSend(v16, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
        v17 = objc_claimAutoreleasedReturnValue();

        if (v17)
          goto LABEL_15;
      }
      else
      {

      }
      v18 = v15;
      if (v18)
      {
        v17 = (uint64_t)v18;
        if (!v11)
          v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        objc_msgSend(v11, "addObject:", v17);
LABEL_15:
        objc_msgSend(v6, "addObject:", v17);
        v10 = (void *)v17;
        continue;
      }
      v10 = 0;
    }
    v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
  }
  while (v12);
LABEL_19:

  v19 = (void *)v54[5];
  if (!v19)
  {

    v20 = (id)*MEMORY[0x24BE028A0];
    goto LABEL_24;
  }
  v20 = (id)*MEMORY[0x24BE028A0];
  objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE028A0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
LABEL_28:
    objc_msgSend(v6, "addObject:", v21);
  }
  else
  {
LABEL_24:
    v20 = v20;
    if (v20)
    {
      if (!v11)
        v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v11, "addObject:", v20);
      v21 = v20;
      goto LABEL_28;
    }
    v21 = 0;
  }
  v26 = (void *)v54[5];
  if (!v26)
  {

    v27 = (void *)*MEMORY[0x24BE028B0];
    goto LABEL_34;
  }
  v27 = (void *)*MEMORY[0x24BE028B0];
  objc_msgSend(v26, "objectForKey:", *MEMORY[0x24BE028B0]);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
LABEL_38:
    objc_msgSend(v6, "addObject:", v28);
  }
  else
  {
LABEL_34:
    v28 = v27;
    if (v28)
    {
      if (!v11)
        v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v11, "addObject:", v28);
      goto LABEL_38;
    }
  }
  v29 = (void *)v54[5];
  if (!v29)
  {

    v30 = (void *)*MEMORY[0x24BE02690];
    goto LABEL_43;
  }
  v30 = (void *)*MEMORY[0x24BE02690];
  objc_msgSend(v29, "objectForKey:", *MEMORY[0x24BE02690]);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
LABEL_47:
    objc_msgSend(v6, "addObject:", v31);
  }
  else
  {
LABEL_43:
    v31 = v30;
    if (v31)
    {
      if (!v11)
        v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v11, "addObject:", v31);
      goto LABEL_47;
    }
  }
  v32 = (void *)v54[5];
  if (!v32)
  {

    v33 = (void *)*MEMORY[0x24BE02940];
    goto LABEL_52;
  }
  v33 = (void *)*MEMORY[0x24BE02940];
  objc_msgSend(v32, "objectForKey:", *MEMORY[0x24BE02940]);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
LABEL_56:
    objc_msgSend(v6, "addObject:", v25);
  }
  else
  {
LABEL_52:
    v25 = v33;
    if (v25)
    {
      if (!v11)
        v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v11, "addObject:", v25);
      goto LABEL_56;
    }
  }
  objc_msgSend(v11, "removeObject:", v20);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)VSRecognitionModelCopyLanguageResourceURL();

  if (v22 && (v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v22)) != 0)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v23 = v35;
    v24 = 0;
    v36 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v65, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v43 != v37)
            objc_enumerationMutation(v23);
          objc_msgSend(v23, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
          v39 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)v39;
          if (v39)
            objc_msgSend(v6, "addObjectsFromArray:", v39);
        }
        v36 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v65, 16);
      }
      while (v36);
    }

  }
  else
  {
    v23 = 0;
    v24 = 0;
  }
  objc_msgSend(v6, "allObjects");
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v11 = objc_retainAutorelease(v11);
    *a4 = v11;
  }
LABEL_72:
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

}

void __67__VoiceDialDataProvider_getLabels_andWeightedLabels_ForABProperty___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  MEMORY[0x22079BD98]();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[4] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
  if (v5)
    v6 = (void *)ABAddressBookCopyLocalizedStringsForLanguageArray();
  else
    v6 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v6);
  if (v5)

  v7 = a1[7];
  if (v7)
    v8 = (void *)ABAddressBookCopyAllLabelsForProperty();
  else
    v8 = 0;
  v9 = v8;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v8);
  if (v7)

}

- (id)_phoneLabels
{
  NSArray *phoneLabels;
  NSArray *v4;
  NSSet *v5;
  NSArray *v6;
  NSArray *v7;
  NSSet *weightedPhoneLabels;
  id v10;
  id v11;

  phoneLabels = self->_phoneLabels;
  if (!phoneLabels)
  {
    v10 = 0;
    v11 = 0;
    -[VoiceDialDataProvider getLabels:andWeightedLabels:ForABProperty:](self, "getLabels:andWeightedLabels:ForABProperty:", &v11, &v10, *MEMORY[0x24BE028C0]);
    v4 = (NSArray *)v11;
    v5 = (NSSet *)v10;
    v6 = self->_phoneLabels;
    self->_phoneLabels = v4;
    v7 = v4;

    weightedPhoneLabels = self->_weightedPhoneLabels;
    self->_weightedPhoneLabels = v5;

    phoneLabels = self->_phoneLabels;
  }
  return phoneLabels;
}

- (id)_facetimeLabels
{
  NSArray *facetimeLabels;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  id v14;
  id v15;
  id v16;
  id v17;

  facetimeLabels = self->_facetimeLabels;
  if (facetimeLabels)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v16 = 0;
    v17 = 0;
    -[VoiceDialDataProvider getLabels:andWeightedLabels:ForABProperty:](self, "getLabels:andWeightedLabels:ForABProperty:", &v17, &v16, *MEMORY[0x24BE028C0]);
    v6 = v17;
    v8 = v16;
    v14 = 0;
    v15 = 0;
    -[VoiceDialDataProvider getLabels:andWeightedLabels:ForABProperty:](self, "getLabels:andWeightedLabels:ForABProperty:", &v15, &v14, *MEMORY[0x24BE02718]);
    v7 = v15;
    v9 = v14;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v6);
    objc_msgSend(v4, "addObjectsFromArray:", v7);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithSet:", v8);
    objc_msgSend(v5, "unionSet:", v9);
    objc_msgSend(v4, "allObjects");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_facetimeLabels;
    self->_facetimeLabels = v10;

    objc_storeStrong((id *)&self->_weightedFacetimeLabels, v5);
    facetimeLabels = self->_facetimeLabels;
  }
  v12 = facetimeLabels;

  return v12;
}

- (int64_t)_totalPeople
{
  int64_t result;
  void *v4;
  NSObject *v5;
  _QWORD v6[6];

  result = self->_totalPeople;
  if (result == -1)
  {
    v4 = -[VoiceDialDataProvider _addressBook](self, "_addressBook");
    -[VoiceDialDataProvider serialQueue](self, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__VoiceDialDataProvider__totalPeople__block_invoke;
    v6[3] = &unk_24E19F198;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(v5, v6);

    return self->_totalPeople;
  }
  return result;
}

const void *__37__VoiceDialDataProvider__totalPeople__block_invoke(uint64_t a1)
{
  const void *result;

  result = *(const void **)(a1 + 40);
  if (result)
  {
    result = (const void *)ABAddressBookGetPersonCount(result);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = result;
  }
  return result;
}

- (void)_voiceDialRecordAtIndex:(int64_t)a3
{
  int64_t v5;
  uint64_t v6;
  void *v7;
  __CFArray *people;
  int64_t location;
  NSObject *v10;
  int64_t v11;
  int64_t *p_length;
  int64_t v13;
  NSObject *v14;
  __CFArray *v15;
  CFIndex Count;
  int64_t v18;
  _QWORD v19[6];
  _QWORD block[5];

  v5 = -[VoiceDialDataProvider _totalPeople](self, "_totalPeople");
  v6 = v5 - a3;
  if (v5 <= a3)
    return 0;
  v7 = -[VoiceDialDataProvider _addressBook](self, "_addressBook");
  people = self->_people;
  if (people)
  {
    location = self->_peopleRange.location;
    if (location == -1 || location <= a3 && self->_peopleRange.length + location > a3)
      return (void *)CFArrayGetValueAtIndex(people, a3 - self->_peopleRange.location);
    CFRelease(people);
    self->_people = 0;
    if (!v7)
    {
      v18 = 50;
      if (v6 < 50)
        v18 = v6;
      self->_peopleRange.length = v18;
      p_length = &self->_peopleRange.length;
      self->_peopleRange.location = a3;
      goto LABEL_21;
    }
    -[VoiceDialDataProvider serialQueue](self, "serialQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__VoiceDialDataProvider__voiceDialRecordAtIndex___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v7;
    dispatch_sync(v10, block);

    people = self->_people;
    if (people)
      return (void *)CFArrayGetValueAtIndex(people, a3 - self->_peopleRange.location);
    v11 = 50;
    if (v6 < 50)
      v11 = v6;
    self->_peopleRange.length = v11;
    p_length = &self->_peopleRange.length;
    self->_peopleRange.location = a3;
  }
  else
  {
    v13 = 50;
    if (v6 < 50)
      v13 = v6;
    self->_peopleRange.length = v13;
    p_length = &self->_peopleRange.length;
    self->_peopleRange.location = a3;
    if (!v7)
      goto LABEL_21;
  }
  -[VoiceDialDataProvider serialQueue](self, "serialQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __49__VoiceDialDataProvider__voiceDialRecordAtIndex___block_invoke_2;
  v19[3] = &unk_24E19F198;
  v19[4] = self;
  v19[5] = v7;
  dispatch_sync(v14, v19);

  v15 = self->_people;
  if (!v15)
  {
LABEL_21:
    *p_length = 0;
LABEL_22:
    self->_people = 0;
    return 0;
  }
  Count = CFArrayGetCount(v15);
  self->_peopleRange.length = Count;
  people = self->_people;
  if (!Count)
  {
    if (people)
      CFRelease(people);
    goto LABEL_22;
  }
  if (people)
    return (void *)CFArrayGetValueAtIndex(people, a3 - self->_peopleRange.location);
  return 0;
}

void __49__VoiceDialDataProvider__voiceDialRecordAtIndex___block_invoke()
{
  JUMPOUT(0x22079BB4CLL);
}

uint64_t __49__VoiceDialDataProvider__voiceDialRecordAtIndex___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = ABCopyArrayOfPeopleAtOffset();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = result;
  return result;
}

- (int64_t)valueCountForClassWithIdentifier:(id)a3 inModelWithIdentifier:(id)a4
{
  int64_t v5;
  void *v6;
  int64_t v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("label"), a4))
  {
    if ((*(_BYTE *)&self->_voiceDialProviderFlags & 4) != 0)
      -[VoiceDialDataProvider _facetimeLabels](self, "_facetimeLabels");
    else
      -[VoiceDialDataProvider _phoneLabels](self, "_phoneLabels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
  }
  else
  {
    v5 = -[VoiceDialDataProvider _totalPeople](self, "_totalPeople");
    -[VoiceDialDataProvider _namesSource](self, "_namesSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "personNameCount") * v5;
  }

  return v7;
}

- (BOOL)getValue:(id *)a3 weight:(int64_t *)a4 atIndex:(int64_t)a5 forClassWithIdentifier:(id)a6 inModelWithIdentifier:(id)a7
{
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  int64_t v18;
  id v20;

  if (!objc_msgSend(a6, "isEqualToString:", CFSTR("label")))
  {
    -[VoiceDialDataProvider _namesSource](self, "_namesSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "personNameCount");
    v13 = -[VoiceDialDataProvider _voiceDialRecordAtIndex:](self, "_voiceDialRecordAtIndex:", a5 / v12);
    if (v13)
    {
      v20 = 0;
      objc_msgSend(v11, "getName:phoneticName:atIndex:forPerson:", &v20, 0, a5 % v12, v13);
      v14 = v20;
    }
    else
    {
      v14 = 0;
    }
    v15 = 0;
    v17 = 0;
    v18 = 0;
    if (!a3)
      goto LABEL_21;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_voiceDialProviderFlags & 4) != 0)
    -[VoiceDialDataProvider _facetimeLabels](self, "_facetimeLabels");
  else
    -[VoiceDialDataProvider _phoneLabels](self, "_phoneLabels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 48;
  if ((*(_BYTE *)&self->_voiceDialProviderFlags & 4) == 0)
    v16 = 40;
  v17 = *(id *)((char *)&self->super.isa + v16);
  if (v15 && objc_msgSend(v15, "count") > (unint64_t)a5)
  {
    objc_msgSend(v15, "objectAtIndex:", a5);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (objc_msgSend(v17, "containsObject:", v14))
      v18 = -15;
    else
      v18 = 0;
    if (!a3)
      goto LABEL_21;
    goto LABEL_20;
  }
  v14 = 0;
  v18 = 0;
  v11 = 0;
  if (a3)
LABEL_20:
    *a3 = objc_retainAutorelease(v14);
LABEL_21:
  if (a4)
    *a4 = v18;

  return v14 != 0;
}

- (id)phoneticValueAtIndex:(int64_t)a3 forClassWithIdentifier:(id)a4 inModelWithIdentifier:(id)a5
{
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v12;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("name")))
  {
    -[VoiceDialDataProvider _namesSource](self, "_namesSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "personNameCount");
    v9 = -[VoiceDialDataProvider _voiceDialRecordAtIndex:](self, "_voiceDialRecordAtIndex:", a3 / v8);
    if (v9)
    {
      v12 = 0;
      objc_msgSend(v7, "getName:phoneticName:atIndex:forPerson:", 0, &v12, a3 % v8, v9);
      v10 = v12;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
    v7 = 0;
  }

  return v10;
}

- (BOOL)_shouldUseCompositeNamesOnly
{
  unsigned int voiceDialProviderFlags;
  int v4;

  voiceDialProviderFlags = self->_voiceDialProviderFlags;
  if ((voiceDialProviderFlags & 1) == 0)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicedial"));
    if (CFPreferencesGetAppBooleanValue(CFSTR("CompositeNameOnly"), CFSTR("com.apple.voicedial"), 0))
      v4 = 3;
    else
      v4 = 1;
    voiceDialProviderFlags = v4 | *(_BYTE *)&self->_voiceDialProviderFlags & 0xFC;
    *(_BYTE *)&self->_voiceDialProviderFlags = voiceDialProviderFlags;
  }
  return (voiceDialProviderFlags >> 1) & 1;
}

- (id)cacheValidityIdentifier
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v3 = -[VoiceDialDataProvider _addressBook](self, "_addressBook");
  -[VoiceDialDataProvider serialQueue](self, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__VoiceDialDataProvider_cacheValidityIdentifier__block_invoke;
  block[3] = &unk_24E19F1E0;
  block[4] = self;
  block[5] = &v8;
  block[6] = v3;
  dispatch_sync(v4, block);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __48__VoiceDialDataProvider_cacheValidityIdentifier__block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t SequenceNumber;
  uint64_t CompositeNameFormatForRecord;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (*(_QWORD *)(a1 + 48))
  {
    v2 = (const void *)ABAddressBookCopyUniqueIdentifier();
    SequenceNumber = ABAddressBookGetSequenceNumber();
    CompositeNameFormatForRecord = ABPersonGetCompositeNameFormatForRecord(0);
    if (v2)
    {
      v5 = CompositeNameFormatForRecord;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", SequenceNumber);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", v5);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", objc_msgSend(*(id *)(a1 + 32), "_shouldUseCompositeNamesOnly"));
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v2, CFSTR("dbid"), v11, CFSTR("seq"), v6, CFSTR("name-order"), v7, CFSTR("comp-only"), 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      CFRelease(v2);
    }
  }
}

- (BOOL)_sequenceNumberIsValid:(int)a3
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  BOOL v5;

  if (!-[VoiceDialDataProvider _addressBook](self, "_addressBook"))
    return 1;
  v3 = (const __CFDictionary *)ABAddressBookCopyChangesSinceSequenceNumber();
  if (!v3)
    return 1;
  v4 = v3;
  if (CFDictionaryGetValue(v3, (const void *)*MEMORY[0x24BE02618])
    || MGGetBoolAnswer() && CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE02620]))
  {
    v5 = 0;
  }
  else if (MGGetBoolAnswer())
  {
    v5 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE02610]) == 0;
  }
  else
  {
    v5 = 1;
  }
  CFRelease(v4);
  return v5;
}

- (BOOL)isCacheValidityIdentifierValid:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  char v9;
  _QWORD block[4];
  id v12;
  VoiceDialDataProvider *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  _QWORD v26[3];
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v4 = a3;
  v5 = v4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  v22 = 0;
  if (v4)
  {
    v6 = objc_msgSend(v4, "objectForKey:", CFSTR("dbid"));
    if (v6)
    {
      v7 = -[VoiceDialDataProvider _addressBook](self, "_addressBook");
      -[VoiceDialDataProvider serialQueue](self, "serialQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __56__VoiceDialDataProvider_isCacheValidityIdentifierValid___block_invoke;
      block[3] = &unk_24E19F208;
      v19 = v7;
      v20 = v6;
      v14 = v25;
      v15 = v23;
      v12 = v5;
      v13 = self;
      v16 = v26;
      v17 = v21;
      v18 = &v28;
      dispatch_sync(v8, block);

    }
  }
  v9 = *((_BYTE *)v29 + 24);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  return v9;
}

void __56__VoiceDialDataProvider_isCacheValidityIdentifierValid___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;

  v2 = *(_QWORD *)(a1 + 88);
  if (v2)
    v2 = ABAddressBookCopyUniqueIdentifier();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
  v3 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v3)
  {
    if (CFStringCompare(v3, *(CFStringRef *)(a1 + 96), 0) == kCFCompareEqualTo)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("seq"));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (v7)
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v7, "intValue");
        v8 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        if (v8 == ABAddressBookGetSequenceNumber()
          || objc_msgSend(*(id *)(a1 + 40), "_sequenceNumberIsValid:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("name-order"));
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v11 = *(void **)(v10 + 40);
          *(_QWORD *)(v10 + 40) = v9;

          v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          if (v12)
          {
            v13 = objc_msgSend(v12, "unsignedIntValue");
            if (v13 == ABPersonGetCompositeNameFormatForRecord(0))
            {
              v14 = objc_msgSend(*(id *)(a1 + 40), "_shouldUseCompositeNamesOnly");
              objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("comp-only"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v14 ^ objc_msgSend(v15, "BOOLValue") ^ 1;

            }
          }
        }
      }
    }
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }
}

- (void)beginReportingChanges
{
  void *v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = -[VoiceDialDataProvider _addressBook](self, "_addressBook");
  -[VoiceDialDataProvider serialQueue](self, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__VoiceDialDataProvider_beginReportingChanges__block_invoke;
  v5[3] = &unk_24E19F198;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);

}

void __46__VoiceDialDataProvider_beginReportingChanges__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (*(_QWORD *)(a1 + 40))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) = ABAddressBookGetSequenceNumber();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = ABAddressBookCopyUniqueIdentifier();
    ABAddressBookRegisterExternalChangeCallback(*(ABAddressBookRef *)(a1 + 40), (ABExternalChangeCallback)_VoiceDialAddressBookChangedCallBack, *(void **)(a1 + 32));
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_VoiceDialAddressBookPrefsChangedCallBack, CFSTR("com.apple.AddressBook.PreferenceChanged"), 0, CFNotificationSuspensionBehaviorDrop);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_VoiceDialPreferencesChangedCallBack, CFSTR("com.apple.voicedial.prefschanged"), 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)stopReportingChanges
{
  CFNotificationCenterRef DarwinNotifyCenter;
  void *v4;
  NSObject *v5;
  _QWORD block[7];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v4 = -[VoiceDialDataProvider _addressBook](self, "_addressBook");
  -[VoiceDialDataProvider serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__VoiceDialDataProvider_stopReportingChanges__block_invoke;
  block[3] = &unk_24E19F230;
  block[4] = self;
  block[5] = v4;
  block[6] = DarwinNotifyCenter;
  dispatch_async(v5, block);

}

void __45__VoiceDialDataProvider_stopReportingChanges__block_invoke(uint64_t a1)
{
  const void *v2;
  _QWORD *v3;
  const void *v4;

  v2 = *(const void **)(a1 + 40);
  if (v2)
    ABAddressBookUnregisterExternalChangeCallback(v2, (ABExternalChangeCallback)_VoiceDialAddressBookChangedCallBack, *(void **)(a1 + 32));
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (const void *)v3[12];
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
    v3 = *(_QWORD **)(a1 + 32);
  }
  CFNotificationCenterRemoveObserver(*(CFNotificationCenterRef *)(a1 + 48), v3, CFSTR("com.apple.AddressBook.PreferenceChanged"), 0);
  CFNotificationCenterRemoveObserver(*(CFNotificationCenterRef *)(a1 + 48), *(const void **)(a1 + 32), CFSTR("com.apple.voicedial.prefschanged"), 0);
}

- (void)_handleAddressBookChanged
{
  void *v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = -[VoiceDialDataProvider _addressBook](self, "_addressBook");
  -[VoiceDialDataProvider serialQueue](self, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__VoiceDialDataProvider__handleAddressBookChanged__block_invoke;
  v5[3] = &unk_24E19F198;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);

}

void __50__VoiceDialDataProvider__handleAddressBookChanged__block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  BOOL v8;
  const void *v9;
  _DWORD *v10;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    v3 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 88);
    ABAddressBookRevert(v2);
    v4 = (const __CFString *)ABAddressBookCopyUniqueIdentifier();
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(const __CFString **)(v6 + 96);
    if (v4 != v7)
    {
      if (v4)
        v8 = v7 == 0;
      else
        v8 = 1;
      if (v8)
        goto LABEL_9;
      if (CFStringCompare(v4, v7, 0))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(const __CFString **)(v6 + 96);
LABEL_9:
        if (v7)
        {
          CFRelease(v7);
          v6 = *(_QWORD *)(a1 + 32);
        }
        *(_QWORD *)(v6 + 96) = v5;
        v9 = *(const void **)(*(_QWORD *)(a1 + 32) + 96);
        if (v9)
          CFRetain(v9);
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) = ABAddressBookGetSequenceNumber();
LABEL_14:
        VSRecognitionModelDataProviderChanged();
LABEL_17:
        if (v5)
          CFRelease(v5);
        return;
      }
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) = ABAddressBookGetSequenceNumber();
    v10 = *(_DWORD **)(a1 + 32);
    if (v10[22] == (_DWORD)v3 || (objc_msgSend(v10, "_sequenceNumberIsValid:", v3) & 1) != 0)
      goto LABEL_17;
    goto LABEL_14;
  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_namesSource, 0);
  objc_storeStrong((id *)&self->_weightedFacetimeLabels, 0);
  objc_storeStrong((id *)&self->_weightedPhoneLabels, 0);
  objc_storeStrong((id *)&self->_facetimeLabels, 0);
  objc_storeStrong((id *)&self->_phoneLabels, 0);
}

@end
