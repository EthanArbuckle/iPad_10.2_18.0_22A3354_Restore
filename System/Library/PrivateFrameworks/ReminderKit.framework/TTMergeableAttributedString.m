@implementation TTMergeableAttributedString

- (TTMergeableAttributedString)initWithCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  topotext::String *v9;
  uint64_t v10;
  TTMergeableAttributedString *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 10)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    REMCheckedDynamicCast(v6, (uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_DWORD *)(v5 + 48) == 10)
      v10 = *(_QWORD *)(v5 + 40);
    else
      v10 = topotext::String::default_instance(v9);
    objc_msgSend(v8, "replica");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharedTopotextTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TTMergeableString initWithArchive:andReplicaID:andSharedTimestamp:](self, "initWithArchive:andReplicaID:andSharedTimestamp:", v10, v12, v13);

  }
  else
  {
    v11 = -[TTMergeableString init](self, "init");
  }
  objc_msgSend(v4, "document");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTMergeableString setDocument:](v11, "setDocument:", v14);

  return v11;
}

- (TTMergeableAttributedString)initWithCRCoder:(id)a3 string:(const void *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TTMergeableAttributedString *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = objc_opt_class();
  objc_msgSend(v6, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  REMCheckedDynamicCast(v7, (uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "replica");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sharedTopotextTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TTMergeableString initWithArchive:andReplicaID:andSharedTimestamp:](self, "initWithArchive:andReplicaID:andSharedTimestamp:", a4, v10, v11);

  }
  else
  {
    +[REMLog crdt](REMLog, "crdt");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[TTMergeableAttributedString(CRDataType) initWithCRCoder:string:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    v12 = -[TTMergeableString init](self, "init");
  }

  return v12;
}

- (void)encodeWithCRCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  topotext::String *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  -[TTMergeableString document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedTopotextTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTMergeableString timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    +[REMLog crdt](REMLog, "crdt");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[TTMergeableAttributedString(CRDataType) encodeWithCRCoder:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  v8 = objc_msgSend(v4, "currentDocumentObjectForEncoding");
  v9 = v8;
  if (*(_DWORD *)(v8 + 48) == 10)
  {
    v10 = *(topotext::String **)(v8 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v8);
    *(_DWORD *)(v9 + 48) = 10;
    v10 = (topotext::String *)operator new();
    topotext::String::String(v10);
    *(_QWORD *)(v9 + 40) = v10;
  }
  -[TTMergeableAttributedString encodeWithCRCoder:string:](self, "encodeWithCRCoder:string:", v4, v10);

}

- (void)encodeWithCRCoder:(id)a3 string:(void *)a4
{
  -[TTMergeableAttributedString saveToArchive:](self, "saveToArchive:", a4);
}

+ (int64_t)writingDirectionForAttribute:(int)a3
{
  if ((a3 - 1) >= 4)
    return -1;
  else
    return (a3 - 1);
}

+ (int)attributeForWritingDirection:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return a3 + 1;
  else
    return 0;
}

- (TTMergeableAttributedString)initWithArchive:(const void *)a3 andReplicaID:(id)a4 withOrderedSubstrings:(void *)a5 timestamp:(id)a6
{
  TTMergeableAttributedString *v7;
  TTMergeableAttributedString *v8;
  int v9;
  void *v10;
  NSUInteger v11;
  int v12;
  char *v13;
  uint64_t v14;
  void *v15;
  NSRange v16;
  TTMergeableAttributedString *v17;
  void *v18;
  int v19;
  NSObject *v20;
  TTMergeableAttributedString *v21;
  NSObject *v22;
  TTMergeableAttributedString *v23;
  NSUInteger range2;
  objc_super v26;
  NSRange v27;
  NSRange v28;

  v26.receiver = self;
  v26.super_class = (Class)TTMergeableAttributedString;
  v7 = -[TTMergeableString initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:](&v26, sel_initWithArchive_andReplicaID_withOrderedSubstrings_timestamp_, a3, a4, a5, a6);
  v8 = v7;
  if (v7)
  {
    v9 = *((_DWORD *)a3 + 22);
    -[TTMergeableString attributedString](v7, "attributedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    range2 = objc_msgSend(v10, "length");

    v11 = 0;
    if (v9)
    {
      v12 = 0;
      v13 = (char *)a3 + 80;
      while (1)
      {
        v14 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::AttributeRun>::TypeHandler>((uint64_t)v13, v12);
        +[TTMergeableAttributedString attributesForRun:](TTMergeableAttributedString, "attributesForRun:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15 || (*(_BYTE *)(v14 + 32) & 1) == 0)
          break;
        v27.length = *(unsigned int *)(v14 + 48);
        v27.location = v11;
        v28.location = 0;
        v28.length = range2;
        v16 = NSIntersectionRange(v27, v28);
        v17 = v8;
        -[TTMergeableString attributedString](v8, "attributedString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAttributes:range:", v15, v16.location, v16.length);

        v11 += *(unsigned int *)(v14 + 48);
        ++v12;
        v8 = v17;
        if (v9 == v12)
          goto LABEL_7;
      }
      +[REMLog crdt](REMLog, "crdt");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[TTMergeableAttributedString(TTAttributedStringPersistenceAdditions) initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:].cold.2();

      v19 = 1;
    }
    else
    {
LABEL_7:
      v19 = 0;
    }
    if (v11 == range2)
    {
      v21 = v8;
      if (!v19)
        goto LABEL_18;
    }
    else
    {
      +[REMLog crdt](REMLog, "crdt");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[TTMergeableAttributedString(TTAttributedStringPersistenceAdditions) initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:].cold.1();

    }
  }
  v21 = 0;
LABEL_18:
  v23 = v21;

  return v23;
}

+ (id)attributesForRun:(const void *)a3
{
  topotext::AttributeRun *v4;
  topotext::AttributeRun *v5;
  int v6;
  TTFont *v7;
  TTFont *v8;
  uint64_t v9;
  TTFont *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  TTParagraphStyle *v20;
  TTParagraphStyle *v21;
  uint64_t v22;
  TTParagraphStyle *v23;
  float *v24;
  topotext::AttributeRun *v25;
  CGColor *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  topotext::AttributeRun *v32;
  TTREMHashtag *v33;
  uint64_t *v34;
  void *v35;
  topotext::AttributeRun *v37;
  topotext::AttributeRun *v38;
  void *v39;
  CGFloat components;
  double v41;
  double v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = (topotext::AttributeRun *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  v6 = *((_DWORD *)a3 + 8);
  if ((v6 & 4) != 0)
  {
    v7 = [TTFont alloc];
    v8 = v7;
    v9 = *((_QWORD *)a3 + 7);
    if (!v9)
      v9 = *(_QWORD *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v7) + 56);
    v10 = -[TTFont initWithArchive:](v8, "initWithArchive:", v9);
    -[topotext::AttributeRun setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, TTAttributeNameFont);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)a3 + 13));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[topotext::AttributeRun setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, TTAttributeNameFontHints);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x10) != 0 && *((_DWORD *)a3 + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[topotext::AttributeRun setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, TTAttributeNameUnderline);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x20) != 0 && *((_DWORD *)a3 + 17))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[topotext::AttributeRun setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, TTAttributeNameStrikethrough);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)a3 + 20));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[topotext::AttributeRun setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, TTAttributeNameSuperscript);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x80) != 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16 = (uint64_t *)*((_QWORD *)a3 + 9);
    if (*((char *)v16 + 23) < 0)
    {
      v16 = (uint64_t *)*v16;
      v17 = *(_QWORD *)(*((_QWORD *)a3 + 9) + 8);
    }
    else
    {
      v17 = *((unsigned __int8 *)v16 + 23);
    }
    v18 = (void *)objc_msgSend(v15, "initWithBytes:length:encoding:", v16, v17, 4);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[topotext::AttributeRun setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, CFSTR("NSLink"));

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 2) != 0)
  {
    v20 = [TTParagraphStyle alloc];
    v21 = v20;
    v22 = *((_QWORD *)a3 + 5);
    if (!v22)
      v22 = *(_QWORD *)(topotext::AttributeRun::default_instance((topotext::AttributeRun *)v20) + 40);
    v23 = -[TTParagraphStyle initWithArchive:](v21, "initWithArchive:", v22);
    -[topotext::AttributeRun setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, TTAttributeNameParagraphStyle);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x100) != 0)
  {
    v24 = (float *)*((_QWORD *)a3 + 11);
    if (v24)
    {
      components = v24[10];
    }
    else
    {
      v25 = (topotext::AttributeRun *)topotext::AttributeRun::default_instance(v4);
      v24 = (float *)*((_QWORD *)a3 + 11);
      components = *(float *)(*((_QWORD *)v25 + 11) + 40);
      if (!v24)
      {
        v37 = (topotext::AttributeRun *)topotext::AttributeRun::default_instance(v25);
        v24 = (float *)*((_QWORD *)a3 + 11);
        v41 = *(float *)(*((_QWORD *)v37 + 11) + 44);
        if (!v24)
        {
          v38 = (topotext::AttributeRun *)topotext::AttributeRun::default_instance(v37);
          v24 = (float *)*((_QWORD *)a3 + 11);
          v42 = *(float *)(*((_QWORD *)v38 + 11) + 48);
          if (!v24)
            v24 = *(float **)(topotext::AttributeRun::default_instance(v38) + 88);
          goto LABEL_30;
        }
LABEL_29:
        v42 = v24[12];
LABEL_30:
        v43 = v24[13];
        if (TSUDeviceRGBColorSpace(void)::sDeviceRGBDispatchOnce != -1)
          dispatch_once(&TSUDeviceRGBColorSpace(void)::sDeviceRGBDispatchOnce, &__block_literal_global_44);
        v26 = CGColorCreate((CGColorSpaceRef)TSUDeviceRGBColorSpace(void)::sDeviceRGBColorSpace, &components);
        -[topotext::AttributeRun setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v26, TTAttributeNameForegroundColor);
        CGColorRelease(v26);
        v6 = *((_DWORD *)a3 + 8);
        goto LABEL_33;
      }
    }
    v41 = v24[11];
    goto LABEL_29;
  }
LABEL_33:
  if ((v6 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[TTMergeableAttributedString writingDirectionForAttribute:](TTMergeableAttributedString, "writingDirectionForAttribute:", *((unsigned int *)a3 + 21)));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[topotext::AttributeRun setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v28, CFSTR("NSWritingDirection"));

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)a3 + 13));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[topotext::AttributeRun setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v29, TTAttributeNameTimestamp);

    v6 = *((_DWORD *)a3 + 8);
  }
  if ((v6 & 0x1000) == 0)
    goto LABEL_47;
  v30 = *((_QWORD *)a3 + 14);
  if (!v30)
    v30 = *(_QWORD *)(topotext::AttributeRun::default_instance(v4) + 112);
  if ((*(_BYTE *)(v30 + 32) & 1) != 0)
  {
    v33 = objc_alloc_init(TTREMHashtag);
    v34 = *(uint64_t **)(v30 + 40);
    if (*((char *)v34 + 23) < 0)
      v34 = (uint64_t *)*v34;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v34, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTREMHashtag setObjectIdentifier:](v33, "setObjectIdentifier:", v35);

    -[topotext::AttributeRun setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v33, CFSTR("_TTREMHashtag"));
LABEL_47:
    v32 = v5;
    goto LABEL_48;
  }
  +[REMLog crdt](REMLog, "crdt");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    +[TTMergeableAttributedString(TTAttributedStringPersistenceAdditions) attributesForRun:].cold.1();

  v32 = 0;
LABEL_48:

  return v32;
}

+ (void)saveAttributes:(id)a3 toArchive:(void *)a4
{
  id v5;
  void *v6;
  topotext::Font *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  topotext::ParagraphStyle *v27;
  void *v28;
  const CGFloat *Components;
  size_t NumberOfComponents;
  int v31;
  float64x2_t v32;
  float64x2_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  topotext *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  _QWORD *v50;
  float64x2_t v51;
  float64x2_t v52;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameFont);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    *((_DWORD *)a4 + 8) |= 4u;
    v7 = (topotext::Font *)*((_QWORD *)a4 + 7);
    if (!v7)
    {
      v7 = (topotext::Font *)operator new();
      topotext::Font::Font(v7);
      *((_QWORD *)a4 + 7) = v7;
    }
    objc_msgSend(v6, "saveToArchive:", v7);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameFontHints);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameFontHints);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");
    *((_DWORD *)a4 + 8) |= 8u;
    *((_DWORD *)a4 + 13) = v10;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameUnderline);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameUnderline);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");
    *((_DWORD *)a4 + 8) |= 0x10u;
    *((_DWORD *)a4 + 16) = v13;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameStrikethrough);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameStrikethrough);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue");
    *((_DWORD *)a4 + 8) |= 0x20u;
    *((_DWORD *)a4 + 17) = v16;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSLink"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "absoluteString");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_21;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:
        v19 = 0;
LABEL_22:

        goto LABEL_23;
      }
      v18 = v17;
    }
    v19 = objc_retainAutorelease(v18);
    objc_msgSend(v19, "UTF8String");
    *((_DWORD *)a4 + 8) |= 0x80u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a4 + 9) == google::protobuf::internal::empty_string_)
    {
      v20 = (_QWORD *)operator new();
      *v20 = 0;
      v20[1] = 0;
      v20[2] = 0;
      *((_QWORD *)a4 + 9) = v20;
    }
    MEMORY[0x1B5E3DB28]();
    goto LABEL_22;
  }
LABEL_23:
  objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameSuperscript);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameSuperscript);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "integerValue");

    if (v23)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameSuperscript);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "intValue");
      *((_DWORD *)a4 + 8) |= 0x40u;
      *((_DWORD *)a4 + 20) = v25;

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameParagraphStyle);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    *((_DWORD *)a4 + 8) |= 2u;
    v27 = (topotext::ParagraphStyle *)*((_QWORD *)a4 + 5);
    if (!v27)
    {
      v27 = (topotext::ParagraphStyle *)operator new();
      topotext::ParagraphStyle::ParagraphStyle(v27);
      *((_QWORD *)a4 + 5) = v27;
    }
    objc_msgSend(v26, "saveToArchive:", v27);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameForegroundColor);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    Components = CGColorGetComponents((CGColorRef)v28);
    NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)v28);
    v31 = NumberOfComponents;
    if (NumberOfComponents == 4)
    {
      v32 = *(float64x2_t *)Components;
      v33 = *(float64x2_t *)(Components + 2);
      *((_DWORD *)a4 + 8) |= 0x100u;
      v34 = *((_QWORD *)a4 + 11);
      if (!v34)
      {
        v51 = v32;
        v52 = v33;
        v34 = operator new();
        topotext::Color::Color((topotext::Color *)v34);
        *((_QWORD *)a4 + 11) = v34;
        v32 = v51;
        v33 = v52;
      }
      *(_DWORD *)(v34 + 32) |= 1u;
      *((_DWORD *)a4 + 8) |= 0x100u;
      *(_DWORD *)(v34 + 32) |= 2u;
      *((_DWORD *)a4 + 8) |= 0x100u;
      *(_DWORD *)(v34 + 32) |= 4u;
      *((_DWORD *)a4 + 8) |= 0x100u;
      *(_DWORD *)(v34 + 32) |= 8u;
      *(float32x4_t *)(v34 + 40) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v32), v33);
    }
    else
    {
      +[REMLog crdt](REMLog, "crdt");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        +[TTMergeableAttributedString(TTAttributedStringPersistenceAdditions) saveAttributes:toArchive:].cold.2(v31, v35);

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSWritingDirection"), *(_OWORD *)&v51, *(_OWORD *)&v52);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36 && objc_msgSend(v36, "count"))
  {
    objc_msgSend(v37, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "integerValue");

    v40 = (topotext *)+[TTMergeableAttributedString attributeForWritingDirection:](TTMergeableAttributedString, "attributeForWritingDirection:", v39);
    v41 = (int)v40;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v40))
      __assert_rtn("set_writingdirection", "topotext.pb.h", 4117, "::topotext::AttributeRun_WritingDirection_IsValid(value)");
    *((_DWORD *)a4 + 8) |= 0x200u;
    *((_DWORD *)a4 + 21) = v41;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameTimestamp);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", TTAttributeNameTimestamp);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "unsignedLongValue");
    *((_DWORD *)a4 + 8) |= 0x800u;
    *((_QWORD *)a4 + 13) = v44;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_TTREMHashtag"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_TTREMHashtag"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v46, "objectIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        *((_DWORD *)a4 + 8) |= 0x1000u;
        v48 = *((_QWORD *)a4 + 14);
        if (!v48)
        {
          v48 = operator new();
          topotext::HashtagInfo::HashtagInfo((topotext::HashtagInfo *)v48);
          *((_QWORD *)a4 + 14) = v48;
        }
        objc_msgSend(v46, "objectIdentifier");
        v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        -[NSObject UTF8String](v49, "UTF8String");
        *(_DWORD *)(v48 + 32) |= 1u;
        if (!google::protobuf::internal::empty_string_)
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        if (*(_QWORD *)(v48 + 40) == google::protobuf::internal::empty_string_)
        {
          v50 = (_QWORD *)operator new();
          *v50 = 0;
          v50[1] = 0;
          v50[2] = 0;
          *(_QWORD *)(v48 + 40) = v50;
        }
        MEMORY[0x1B5E3DB28]();
      }
      else
      {
        +[REMLog crdt](REMLog, "crdt");
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
          +[TTMergeableAttributedString(TTAttributedStringPersistenceAdditions) saveAttributes:toArchive:].cold.1();
      }

    }
  }

}

- (void)saveToArchive:(void *)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TTMergeableAttributedString;
  -[TTMergeableString saveToArchive:](&v6, sel_saveToArchive_);
  -[TTMergeableString attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TTMergeableAttributedString saveAttributesOfString:toArchive:](TTMergeableAttributedString, "saveAttributesOfString:toArchive:", v5, a3);

}

+ (void)saveAttributesOfString:(id)a3 toArchive:(void *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  topotext::AttributeRun *v12;
  uint64_t v13;
  int32x2_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v5, "attributesAtIndex:longestEffectiveRange:inRange:", v7, &v16, 0, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *((_DWORD *)a4 + 23);
      v10 = *((int *)a4 + 22);
      if ((int)v10 >= v9)
      {
        if (v9 == *((_DWORD *)a4 + 24))
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a4 + 20, v9 + 1);
        v12 = google::protobuf::internal::GenericTypeHandler<topotext::AttributeRun>::New();
        v13 = *((_QWORD *)a4 + 10);
        v14 = *(int32x2_t *)((char *)a4 + 88);
        *((int32x2_t *)a4 + 11) = vadd_s32(v14, (int32x2_t)0x100000001);
        *(_QWORD *)(v13 + 8 * v14.i32[0]) = v12;
      }
      else
      {
        v11 = *((_QWORD *)a4 + 10);
        *((_DWORD *)a4 + 22) = v10 + 1;
        v12 = *(topotext::AttributeRun **)(v11 + 8 * v10);
      }
      v15 = TTBoundedCheckedCastNSUIntegerToUInt32(v17);
      *((_DWORD *)v12 + 8) |= 1u;
      *((_DWORD *)v12 + 12) = v15;
      +[TTMergeableAttributedString saveAttributes:toArchive:](TTMergeableAttributedString, "saveAttributes:toArchive:", v8, v12);
      v7 += v17;

    }
    while (v7 < v6);
  }

}

- (id)serialize
{
  id v3;
  _BYTE v5[128];

  topotext::String::String((topotext::String *)v5);
  -[TTMergeableAttributedString saveToArchive:](self, "saveToArchive:", v5);
  v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::String::ByteSize((topotext::String *)v5)));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v5, (void *)objc_msgSend(v3, "mutableBytes"), objc_msgSend(v3, "length"));
  topotext::String::~String((topotext::String *)v5);
  return v3;
}

- (void)saveDeltaSinceTimestamp:(id)a3 toArchive:(void *)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TTMergeableAttributedString;
  -[TTMergeableString i_saveDeltasSinceTimestamp:toArchive:](&v6, sel_i_saveDeltasSinceTimestamp_toArchive_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TTMergeableAttributedString saveAttributesOfString:toArchive:](TTMergeableAttributedString, "saveAttributesOfString:toArchive:", v5, a4);

}

+ (id)allowlistedAttributesForModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TTMergeableAttributedString_allowlistedAttributesForModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l_0;
  block[4] = a1;
  if (+[TTMergeableAttributedString allowlistedAttributesForModel]::once != -1)
    dispatch_once(&+[TTMergeableAttributedString allowlistedAttributesForModel]::once, block);
  return (id)+[TTMergeableAttributedString allowlistedAttributesForModel]::attributeAllowList;
}

void __60__TTMergeableAttributedString_allowlistedAttributesForModel__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allowlistedTypingAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("NSAttachment");
  v5[1] = CFSTR("_TTREMHashtag");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)+[TTMergeableAttributedString allowlistedAttributesForModel]::attributeAllowList;
  +[TTMergeableAttributedString allowlistedAttributesForModel]::attributeAllowList = v3;

}

+ (id)allowlistedAttributesForStyle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TTMergeableAttributedString_allowlistedAttributesForStyle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l_0;
  block[4] = a1;
  if (+[TTMergeableAttributedString allowlistedAttributesForStyle]::once != -1)
    dispatch_once(&+[TTMergeableAttributedString allowlistedAttributesForStyle]::once, block);
  return (id)+[TTMergeableAttributedString allowlistedAttributesForStyle]::attributeAllowList;
}

void __60__TTMergeableAttributedString_allowlistedAttributesForStyle__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allowlistedTypingAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D1CC00];
  v6[0] = CFSTR("NSAttachment");
  v6[1] = v2;
  v6[2] = kDDFoundExistingLinkAttributeName;
  v6[3] = kUITextInputDictationResultMetadataAttributeName;
  v6[4] = TTPresentationAttributeNameApproxMaxItemNumber;
  v6[5] = CFSTR("NSTextAlternatives");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)+[TTMergeableAttributedString allowlistedAttributesForStyle]::attributeAllowList;
  +[TTMergeableAttributedString allowlistedAttributesForStyle]::attributeAllowList = v4;

}

+ (id)allowlistedTypingAttributes
{
  if (+[TTMergeableAttributedString allowlistedTypingAttributes]::once != -1)
    dispatch_once(&+[TTMergeableAttributedString allowlistedTypingAttributes]::once, &__block_literal_global_47);
  return (id)+[TTMergeableAttributedString allowlistedTypingAttributes]::typingAllowList;
}

void __58__TTMergeableAttributedString_allowlistedTypingAttributes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[11];

  v4[10] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = TTAttributeNameFont;
  v4[1] = TTAttributeNameFontHints;
  v4[2] = TTAttributeNameUnderline;
  v4[3] = TTAttributeNameStrikethrough;
  v4[4] = TTAttributeNameForegroundColor;
  v4[5] = TTAttributeNameParagraphStyle;
  v4[6] = CFSTR("NSLink");
  v4[7] = TTAttributeNameSuperscript;
  v4[8] = CFSTR("NSWritingDirection");
  v4[9] = TTAttributeNameTimestamp;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[TTMergeableAttributedString allowlistedTypingAttributes]::typingAllowList;
  +[TTMergeableAttributedString allowlistedTypingAttributes]::typingAllowList = v2;

}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  -[TTMergeableAttributedString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", a4, 0, a3);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  objc_super v14;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (-[TTMergeableString length](self, "length"))
  {
    -[TTMergeableString attributedString](self, "attributedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = location - 1;
    if (!location)
      v10 = 0;
    if (length)
      v11 = location;
    else
      v11 = v10;
    objc_msgSend(v8, "attributesAtIndex:effectiveRange:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v12);
  v14.receiver = self;
  v14.super_class = (Class)TTMergeableAttributedString;
  -[TTMergeableString replaceCharactersInRange:withAttributedString:](&v14, sel_replaceCharactersInRange_withAttributedString_, location, length, v13);

}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v6;
  void *v7;

  -[TTMergeableString attributedString](self, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesAtIndex:effectiveRange:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *__p;
  _QWORD *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[5];
  id v34;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = v7;
  if (length)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __51__TTMergeableAttributedString_setAttributes_range___block_invoke;
    v33[3] = &unk_1E67FAC90;
    v33[4] = self;
    v10 = v9;
    v34 = v10;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v33);
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D1CC00]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", kDDFoundExistingLinkAttributeName);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

      }
      else
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NSLink"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v10, "removeObjectForKey:", CFSTR("NSLink"));
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", TTAttributeNameParagraphStyle);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v28 = v10;
      v16 = objc_opt_class();
      objc_msgSend(v8, "objectForKeyedSubscript:", TTAttributeNameParagraphStyle);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      REMDynamicCast(v16, (uint64_t)v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[TTParagraphStyle defaultParagraphStyle](TTParagraphStyle, "defaultParagraphStyle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToModelComparable:", v19);

      v10 = v28;
      if (v20)
        objc_msgSend(v28, "removeObjectForKey:", TTAttributeNameParagraphStyle);
    }
    v13 = v10;

    v32 = 0;
    v21 = -[TTMergeableAttributedString attributesEqual:toRange:modelEqual:](self, "attributesEqual:toRange:modelEqual:", v13, location, length, &v32);
    if (v32)
    {
      if (!v21)
      {
        -[TTMergeableString attributedString](self, "attributedString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setAttributes:range:", v13, location, length);

        -[TTMergeableString delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "edited:range:changeInLength:", 1, location, length, 0);

      }
    }
    else
    {
      -[TTMergeableString delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "beginEditing");

      -[TTMergeableString beginEditing](self, "beginEditing");
      __p = 0;
      v30 = 0;
      v31 = 0;
      -[TTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &__p, location, length);
      v25 = __p;
      v26 = v30;
      while (v25 != v26)
        -[TTMergeableAttributedString setAttributes:substring:](self, "setAttributes:substring:", v13, *v25++);
      -[TTMergeableString endEditing](self, "endEditing");
      -[TTMergeableString delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "endEditing");

      if (__p)
      {
        v30 = __p;
        operator delete(__p);
      }
    }

  }
  else
  {
    v13 = v7;
  }

}

void __51__TTMergeableAttributedString_setAttributes_range___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "allowlistedAttributesForModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v8);

  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v8);

}

- (BOOL)attributesEqual:(id)a3 toRange:(_NSRange)a4 modelEqual:(BOOL *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  BOOL v15;
  _QWORD v16[2];

  length = a4.length;
  location = a4.location;
  v9 = a3;
  -[TTMergeableString attributedString](self, "attributedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributesAtIndex:effectiveRange:", location, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (v16[1] + v16[0] >= location + length)
  {
    v13 = -[TTMergeableAttributedString attributesEqual:to:modelEqual:](self, "attributesEqual:to:modelEqual:", v9, v11, &v15);
    v12 = v15;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  *a5 = v12;

  return v13;
}

- (BOOL)attributesEqual:(id)a3 to:(id)a4 modelEqual:(BOOL *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  _BOOL4 v23;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  *a5 = 1;
  v26 = v7;
  v9 = objc_msgSend(v7, "count");
  if (v9 == objc_msgSend(v8, "count"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v7, "keyEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v28;
      v13 = 1;
      obj = v10;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v15, obj);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
          {
            *a5 = 0;
LABEL_22:

            LOBYTE(v13) = 0;
            v10 = obj;
            goto LABEL_23;
          }
          objc_msgSend(v26, "objectForKeyedSubscript:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqual:", v16);
          if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EF0FE5C8))
          {
            v21 = objc_msgSend(v16, "conformsToProtocol:", &unk_1EF0FE5C8);
            v22 = v20;
            if (v21)
              v22 = objc_msgSend(v19, "isEqualToModelComparable:", v16);
          }
          else
          {
            v22 = v20;
          }
          if (*a5)
            v23 = v22;
          else
            v23 = 0;
          *a5 = v23;

          v13 &= v20;
          if (!(v13 | v23))
            goto LABEL_22;

        }
        v10 = obj;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      LOBYTE(v13) = 1;
    }
LABEL_23:

  }
  else
  {
    LOBYTE(v13) = 0;
    *a5 = 0;
  }

  return v13;
}

- (void)setAttributes:(id)a3 substring:(void *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  TTMergeableStringUndoAttributeCommand *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  TTMergeableStringUndoAttributeCommand *v27;
  void *__p;
  void *v29;
  _QWORD *v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  _QWORD v34[4];
  TTMergeableStringUndoAttributeCommand *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;

  v6 = a3;
  if (a4 && !*((_BYTE *)a4 + 44))
  {
    v39 = 0;
    v7 = -[TTMergeableAttributedString attributesEqual:toRange:modelEqual:](self, "attributesEqual:toRange:modelEqual:", v6, *((unsigned int *)a4 + 10), *((unsigned int *)a4 + 4), &v39);
    if (!v39)
    {
      -[TTMergeableString delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[TTMergeableString delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "wantsUndoCommands");

        if (v13)
        {
          v14 = objc_alloc_init(TTMergeableStringUndoAttributeCommand);
          if (*((_BYTE *)a4 + 44))
            v15 = 0;
          else
            v15 = *((unsigned int *)a4 + 4);
          v25 = *((unsigned int *)a4 + 10);
          -[TTMergeableString attributedString](self, "attributedString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __55__TTMergeableAttributedString_setAttributes_substring___block_invoke;
          v34[3] = &unk_1E67FACB8;
          v36 = a4;
          v37 = v25;
          v38 = v15;
          v27 = v14;
          v35 = v27;
          objc_msgSend(v26, "enumerateAttributesInRange:options:usingBlock:", v25, v15, 0, v34);

          -[TTMergeableUndoString addUndoCommand:](self, "addUndoCommand:", v27);
        }
      }
    }
    if (!v7)
    {
      -[TTMergeableString attributedString](self, "attributedString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*((_BYTE *)a4 + 44))
        v10 = 0;
      else
        v10 = *((unsigned int *)a4 + 4);
      objc_msgSend(v8, "setAttributes:range:", v6, *((unsigned int *)a4 + 10), v10);

    }
    if (!v39)
    {
      +[TTMergeableString unserialisedReplicaID](TTMergeableString, "unserialisedReplicaID");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)*((_QWORD *)a4 + 3);
      *((_QWORD *)a4 + 3) = v16;

      -[TTMergeableString delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v31 = 0;
        v32 = 0;
        v33 = 0;
        v19 = operator new(8uLL);
        __p = v19;
        *v19 = a4;
        v29 = v19 + 1;
        v30 = v19 + 1;
        -[TTMergeableString getCharacterRanges:forSubstrings:](self, "getCharacterRanges:forSubstrings:", &v31, &__p);
        v20 = (uint64_t *)v31;
        v21 = v32;
        while (v20 != v21)
        {
          v22 = *v20;
          v23 = v20[1];
          -[TTMergeableString delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "edited:range:changeInLength:", 1, v22, v23, 0);

          v20 += 2;
        }
        if (__p)
        {
          v29 = __p;
          operator delete(__p);
        }
        if (v31)
        {
          v32 = (uint64_t *)v31;
          operator delete(v31);
        }
      }
      -[TTMergeableString setHasLocalChanges:](self, "setHasLocalChanges:", 1);
    }
  }

}

void __55__TTMergeableAttributedString_setAttributes_substring___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  int v11;
  uint64_t *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  int v17;
  id v18;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 40);
  LODWORD(a3) = TTBoundedCheckedCastNSUIntegerToUInt32(a3 - *(_QWORD *)(a1 + 48));
  v9 = TTBoundedCheckedCastNSUIntegerToUInt32(a4);
  v10 = *(id *)v8;
  v11 = *(_DWORD *)(v8 + 8);
  v12 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "attributeRanges");
  v13 = v10;
  v15 = v13;
  v16 = v11 + a3;
  v17 = v9;
  v14 = v7;
  v18 = v14;
  std::vector<std::pair<TopoIDRange,NSDictionary * {__strong}>>::push_back[abi:ne180100](v12, (uint64_t *)&v15);

}

@end
