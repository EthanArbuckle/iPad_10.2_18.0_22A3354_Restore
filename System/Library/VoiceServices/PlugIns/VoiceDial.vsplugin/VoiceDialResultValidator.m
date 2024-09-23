@implementation VoiceDialResultValidator

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  v4.receiver = self;
  v4.super_class = (Class)VoiceDialResultValidator;
  -[VoiceDialResultValidator dealloc](&v4, sel_dealloc);
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

- (id)_nameSource
{
  VoiceDialNameDataSource *nameSource;
  void *v4;
  VoiceDialNameDataSource *v5;
  VoiceDialNameDataSource *v6;

  nameSource = self->_nameSource;
  if (!nameSource)
  {
    VSPreferencesCopySpokenLanguageIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[VoiceDialNameDataSource nameDataSourceForLanguageIdentifier:](VoiceDialNameDataSource, "nameDataSourceForLanguageIdentifier:", v4);
    v5 = (VoiceDialNameDataSource *)objc_claimAutoreleasedReturnValue();
    v6 = self->_nameSource;
    self->_nameSource = v5;

    nameSource = self->_nameSource;
  }
  return nameSource;
}

- (id)validRecognitionResultFromRecognitionResult:(id)a3
{
  id v4;
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  const void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  id v17;
  id v18;
  char v19;

  v4 = a3;
  v19 = 0;
  VoiceDialConfigureSpokenLocalizedLabel(1);
  v17 = 0;
  v18 = 0;
  v16 = 0;
  VoiceDialCopyNameLabelAndTypeFromRecognitionResult(v4, &v18, &v17, &v16, 0);
  v5 = v18;
  v6 = v17;
  v7 = (__CFString *)v16;
  objc_msgSend(v4, "valueOfFirstElementWithClassIdentifier:", CFSTR("command"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = CFSTR("labeltype-phone");

    v7 = v9;
  }
  if (v6)
  {
    if (v5)
    {
      v10 = -[VoiceDialResultValidator _addressBook](self, "_addressBook");
      if (v10)
      {
        v11 = v10;
        -[VoiceDialResultValidator _nameSource](self, "_nameSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        VoiceDialSendNameAndExtendedLabelMatches(v11, v12, 0, 1, v5, v6, v7, (uint64_t (*)(id, __CFString *, const void *, uint64_t, _QWORD, _QWORD, uint64_t))_ResultValidationAddressBookCallback, (uint64_t)&v19);

        if (!v19)
        {
          objc_msgSend(v4, "recognitionResultByReplacingValueForClassIdentifier:withValue:", CFSTR("label"), 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "recognitionResultByReplacingValueForClassIdentifier:withValue:", CFSTR("labeltype-phone"), 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "recognitionResultByReplacingValueForClassIdentifier:withValue:", CFSTR("labeltype-email"), 0);
          v4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }

  return v4;
}

- (id)validRecognitionResultFromRecognitionResult:(id)a3 knownDisambiguationValues:(id)a4
{
  id v6;
  id v7;
  VoiceDialDisambiguationAddressBookContext *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v30;
  void *v31;
  id v32;
  id v34;
  unint64_t v35;
  id v36;
  id v37;
  id v38;
  VoiceDialDisambiguationAddressBookContext *v39;
  id location;

  v6 = a3;
  location = v6;
  v7 = a4;
  v8 = objc_alloc_init(VoiceDialDisambiguationAddressBookContext);
  v39 = v8;
  VoiceDialConfigureSpokenLocalizedLabel(1);
  if (!v7)
    goto LABEL_28;
  objc_msgSend(v7, "objectForKey:", CFSTR("firstname"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = *MEMORY[0x24BE02758];
  }
  else
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("lastname"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = *MEMORY[0x24BE02820];
    else
      v11 = 0xFFFFFFFFLL;
  }
  v35 = objc_msgSend(v10, "count");
  if (!v35)
  {

LABEL_28:
    -[VoiceDialResultValidator validRecognitionResultFromRecognitionResult:](self, "validRecognitionResultFromRecognitionResult:", v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    location = v31;

    v13 = 0;
    v15 = 0;
    v14 = 0;
    goto LABEL_31;
  }
  v12 = -[VoiceDialResultValidator _addressBook](self, "_addressBook");
  v37 = 0;
  v38 = 0;
  v36 = 0;
  VoiceDialCopyNameLabelAndTypeFromRecognitionResult(v6, &v38, &v37, &v36, 0);
  v13 = v38;
  v14 = v37;
  v15 = v36;
  if (v12)
  {
    -[VoiceDialDisambiguationAddressBookContext setPreviousNameProperty:](v8, "setPreviousNameProperty:", v11);
    -[VoiceDialDisambiguationAddressBookContext setMatchedName:](v8, "setMatchedName:", v13);
    -[VoiceDialDisambiguationAddressBookContext setResult:](v8, "setResult:", &location);
    -[VoiceDialDisambiguationAddressBookContext setResultFound:](v8, "setResultFound:", 0);
    -[VoiceDialResultValidator _nameSource](self, "_nameSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[VoiceDialDisambiguationAddressBookContext resultFound](v8, "resultFound"))
    {
      v34 = v7;
      v17 = 1;
      do
      {
        objc_msgSend(v10, "objectAtIndex:", v17 - 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VoiceDialDisambiguationAddressBookContext setPreviousName:](v39, "setPreviousName:", v18);

        -[VoiceDialDisambiguationAddressBookContext setResultFound:](v39, "setResultFound:", 0);
        VoiceDialSendNameAndExtendedLabelMatches(v12, v16, 1, 1, v13, v14, v15, (uint64_t (*)(id, __CFString *, const void *, uint64_t, _QWORD, _QWORD, uint64_t))_ResultDisambiguationAddressBookCallback, (uint64_t)v39);
        if (!-[VoiceDialDisambiguationAddressBookContext resultFound](v39, "resultFound") && v15)
        {
          v19 = location;
          v20 = location;
          objc_msgSend(v20, "recognitionResultByReplacingValueForClassIdentifier:withValue:", CFSTR("labeltype-phone"), 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = location;
          location = v21;

          objc_msgSend(location, "recognitionResultByReplacingValueForClassIdentifier:withValue:", CFSTR("labeltype-email"), 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = location;
          location = v23;

          VoiceDialSendNameAndExtendedLabelMatches(v12, v16, 1, 1, v13, v14, 0, (uint64_t (*)(id, __CFString *, const void *, uint64_t, _QWORD, _QWORD, uint64_t))_ResultDisambiguationAddressBookCallback, (uint64_t)v39);
          if (!-[VoiceDialDisambiguationAddressBookContext resultFound](v39, "resultFound"))
            objc_storeStrong(&location, v19);

        }
        if (!-[VoiceDialDisambiguationAddressBookContext resultFound](v39, "resultFound") && v14)
        {
          v25 = location;
          v26 = location;
          objc_msgSend(v26, "recognitionResultByReplacingValueForClassIdentifier:withValue:", CFSTR("label"), 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = location;
          location = v27;

          VoiceDialSendNameAndExtendedLabelMatches(v12, v16, 1, 1, v13, 0, 0, (uint64_t (*)(id, __CFString *, const void *, uint64_t, _QWORD, _QWORD, uint64_t))_ResultDisambiguationAddressBookCallback, (uint64_t)&v39);
          if (!-[VoiceDialDisambiguationAddressBookContext resultFound](v39, "resultFound"))
            objc_storeStrong(&location, v25);

        }
        if (-[VoiceDialDisambiguationAddressBookContext resultFound](v39, "resultFound"))
          break;
      }
      while (v17++ < v35);
      v8 = v39;
      v7 = v34;
    }
    if (!-[VoiceDialDisambiguationAddressBookContext resultFound](v8, "resultFound"))
    {
      v30 = location;
      location = 0;

    }
  }
  else
  {
    v16 = 0;
  }

  v31 = location;
LABEL_31:
  v32 = v31;

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameSource, 0);
}

@end
