@implementation PFXMPMetadataBuilder

+ (id)xmpCreateDateFormatter
{
  if (xmpCreateDateFormatter_onceToken != -1)
    dispatch_once(&xmpCreateDateFormatter_onceToken, &__block_literal_global_198);
  return (id)xmpCreateDateFormatter_xmpCreateDateFormatter;
}

uint64_t __46__PFXMPMetadataBuilder_xmpCreateDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)xmpCreateDateFormatter_xmpCreateDateFormatter;
  xmpCreateDateFormatter_xmpCreateDateFormatter = (uint64_t)v0;

  return objc_msgSend((id)xmpCreateDateFormatter_xmpCreateDateFormatter, "setFormatOptions:", 1907);
}

- (id)xmpData
{
  CGImageMetadata *Mutable;
  void *v4;
  uint64_t v5;
  const __CFString **v6;
  void *v7;
  void *v8;
  void *v9;
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
  uint64_t v24;
  CFDataRef XMPData;
  NSObject *v26;
  void *v28;
  __int128 buf;
  void (*v30)(uint64_t, const __CFString *, void *);
  void *v31;
  CGImageMetadata *v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  Mutable = CGImageMetadataCreateMutable();
  -[PFMetadataBuilder title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = (const __CFString **)MEMORY[0x1E0CBCED8];
  if (v5)
    PIImageMedataSetValueMatchingImageProperty(Mutable, (const __CFString *)*MEMORY[0x1E0CBCED8], (const __CFString *)*MEMORY[0x1E0CBCF18], v4);
  -[PFMetadataBuilder caption](self, "caption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    PIImageMedataSetValueMatchingImageProperty(Mutable, *v6, (const __CFString *)*MEMORY[0x1E0CBCEB8], v7);
  -[PFMetadataBuilder accessibilityDescription](self, "accessibilityDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    PIImageMedataSetValueMatchingImageProperty(Mutable, *v6, (const __CFString *)*MEMORY[0x1E0CBCEF0], v8);
  -[PFMetadataBuilder combinedKeywordsAndPeople](self, "combinedKeywordsAndPeople");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    PIImageMedataSetValueMatchingImageProperty(Mutable, *v6, (const __CFString *)*MEMORY[0x1E0CBCF10], v9);
  -[PFMetadataBuilder creationDate](self, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "xmpCreateDateFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFMetadataBuilder creationTimeZone](self, "creationTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeZone:", v12);

    objc_msgSend(v11, "stringFromDate:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PIImageMedataSetValueMatchingImageProperty(Mutable, (const __CFString *)*MEMORY[0x1E0CBCB50], (const __CFString *)*MEMORY[0x1E0CBCB40], v13);

  }
  -[PFMetadataBuilder location](self, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    +[PFSharingUtilities gpsDictionaryForLocation:](PFSharingUtilities, "gpsDictionaryForLocation:", v14);
    v28 = v9;
    v15 = v8;
    v16 = v7;
    v17 = v4;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    objc_msgSend((id)objc_opt_class(), "xmpCreateDateFormatter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTimeZone:", v21);

    objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CBCD20]);
    objc_msgSend(v14, "timestamp");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromDate:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CBCDE8]);

    v4 = v17;
    v7 = v16;
    v8 = v15;
    v9 = v28;
    v24 = *MEMORY[0x1E0CBCD68];
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v30 = __PIUpdateMetadataValuesFromDicationary_block_invoke;
    v31 = &__block_descriptor_48_e15_v32__0_8_16_B24l;
    v32 = Mutable;
    v33 = v24;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", &buf);

  }
  XMPData = CGImageMetadataCreateXMPData(Mutable, 0);
  if (!XMPData)
  {
    PFMetadataBuilderLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = Mutable;
      _os_log_error_impl(&dword_1A16EE000, v26, OS_LOG_TYPE_ERROR, "[XMP metadata builder] Failed create data from XMP metadata %@", (uint8_t *)&buf, 0xCu);
    }

  }
  CFRelease(Mutable);

  return XMPData;
}

@end
