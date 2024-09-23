@implementation PXPeopleNamePickerItem

- (PXPeopleNamePickerItem)initWithPerson:(id)a3 searchPrefix:(id)a4
{
  id v7;
  id v8;
  PXPeopleNamePickerItem *v9;
  PXPeopleNamePickerItem *v10;
  CNContact *contact;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSAttributedString *v22;
  NSAttributedString *title;
  uint64_t v24;
  NSNumber *highlightRangeLocation;
  NSAttributedString *subtitle;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PXPeopleNamePickerItem;
  v9 = -[PXPeopleNamePickerItem init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    contact = v10->_contact;
    v10->_contact = 0;

    objc_msgSend(v7, "name");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = &stru_1E5149688;
    if (v12)
      v14 = (__CFString *)v12;
    v15 = v14;

    v16 = objc_alloc(MEMORY[0x1E0CB3498]);
    +[PXPeopleNamePickerItem _defaultAttributes](PXPeopleNamePickerItem, "_defaultAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithString:attributes:", v15, v17);

    v19 = -[__CFString px_rangeOfSubstringIgnoringCaseAndDiacritics:](v15, "px_rangeOfSubstringIgnoringCaseAndDiacritics:", v8);
    v21 = v20;

    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = v18;
    }
    else
    {
      +[PXPeopleNamePickerItem _titleForAttributedString:range:](PXPeopleNamePickerItem, "_titleForAttributedString:range:", v18, v19, v21);
      v22 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    }
    title = v10->_title;
    v10->_title = v22;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v19);
    v24 = objc_claimAutoreleasedReturnValue();
    highlightRangeLocation = v10->_highlightRangeLocation;
    v10->_highlightRangeLocation = (NSNumber *)v24;

    subtitle = v10->_subtitle;
    v10->_subtitle = 0;

  }
  return v10;
}

- (PXPeopleNamePickerItem)initWithContact:(id)a3 searchPrefix:(id)a4
{
  id v7;
  id v8;
  PXPeopleNamePickerItem *v9;
  PXPeopleNamePickerItem *v10;
  PHPerson *person;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  int64x2_t v26;
  int64x2_t v27;
  int64x2_t v28;
  int16x8_t v29;
  uint64_t v30;
  NSNumber *highlightRangeLocation;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  NSAttributedString *subtitle;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSAttributedString *v43;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  unsigned __int32 v54;
  BOOL v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  objc_super v68;

  v7 = a3;
  v8 = a4;
  v68.receiver = self;
  v68.super_class = (Class)PXPeopleNamePickerItem;
  v9 = -[PXPeopleNamePickerItem init](&v68, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    person = v10->_person;
    v10->_person = 0;

    +[PXPeopleNamePickerItem _defaultAttributes](PXPeopleNamePickerItem, "_defaultAttributes");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "givenName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v13, "px_rangeOfPrefixIgnoringCaseAndDiacritics:", v8);

    objc_msgSend(v7, "familyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v14, "px_rangeOfPrefixIgnoringCaseAndDiacritics:", v8);

    objc_msgSend(v7, "middleName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v15, "px_rangeOfPrefixIgnoringCaseAndDiacritics:", v8);

    objc_msgSend(v7, "namePrefix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "px_rangeOfPrefixIgnoringCaseAndDiacritics:", v8);

    objc_msgSend(v7, "nameSuffix");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "px_rangeOfPrefixIgnoringCaseAndDiacritics:", v8);

    v20 = v19 != 0x7FFFFFFFFFFFFFFFLL;
    v45 = (void *)v12;
    objc_msgSend(MEMORY[0x1E0C97218], "attributedStringFromContact:style:defaultAttributes:", v7, 0, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__113490;
    v66 = __Block_byref_object_dispose__113491;
    v67 = (id)objc_msgSend(v21, "copy");
    v56 = 0;
    v57 = &v56;
    v58 = 0x3010000000;
    v60 = 0;
    v61 = 0;
    v59 = &unk_1A7E74EE7;
    v23 = *MEMORY[0x1E0C96838];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __55__PXPeopleNamePickerItem_initWithContact_searchPrefix___block_invoke;
    v49[3] = &unk_1E5127F40;
    v24 = v21;
    v50 = v24;
    v25 = v8;
    v26.i64[0] = v46;
    v26.i64[1] = v17;
    v51 = v25;
    v52 = &v56;
    v27.i64[0] = v48;
    v27.i64[1] = v47;
    v28 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v53 = &v62;
    v29 = (int16x8_t)vuzp1q_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_s64(v27, v28)), (int32x4_t)vmvnq_s8((int8x16_t)vceqq_s64(v26, v28)));
    *(int8x8_t *)v29.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v29), (int8x8_t)0x1000100010001);
    v54 = vmovn_s16(v29).u32[0];
    v55 = v20;
    objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v22, 0, v49);
    objc_storeStrong((id *)&v10->_title, (id)v63[5]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v57[4]);
    v30 = objc_claimAutoreleasedReturnValue();
    highlightRangeLocation = v10->_highlightRangeLocation;
    v10->_highlightRangeLocation = (NSNumber *)v30;

    objc_msgSend(v7, "emailAddresses");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "count"))
    {
      objc_msgSend(v32, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v33, "value");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "initWithString:attributes:", v35, v45);
      subtitle = v10->_subtitle;
      v10->_subtitle = (NSAttributedString *)v36;

    }
    if (!-[NSAttributedString length](v10->_subtitle, "length"))
    {
      objc_msgSend(v7, "phoneNumbers");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "value");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringValue");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "length"))
      {
        v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v41, v45);
        v43 = v10->_subtitle;
        v10->_subtitle = (NSAttributedString *)v42;

      }
    }

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v62, 8);

  }
  return v10;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXPeopleNamePickerItem person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXPeopleNamePickerItem contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (PXPeopleNamePickerItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerItem.m"), 136, CFSTR("%s is not available as initializer"), "-[PXPeopleNamePickerItem init]");

  abort();
}

- (PHPerson)person
{
  return self->_person;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (NSNumber)highlightRangeLocation
{
  return self->_highlightRangeLocation;
}

- (NSAttributedString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_highlightRangeLocation, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

void __55__PXPeopleNamePickerItem_initWithContact_searchPrefix___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "px_rangeOfSubstringIgnoringCaseAndDiacritics:", *(_QWORD *)(a1 + 40));
  v6 = v5;

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_QWORD *)(v7 + 32) = 0;
    *(_QWORD *)(v7 + 40) = 0;
  }
  else
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_QWORD *)(v8 + 32) = v4;
    *(_QWORD *)(v8 + 40) = v6;
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C966D0]) && *(_BYTE *)(a1 + 64)
      || objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C966C0]) && *(_BYTE *)(a1 + 65)
      || objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C96780]) && *(_BYTE *)(a1 + 66)
      || objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C96790]) && *(_BYTE *)(a1 + 67)
      || objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C96798]) && *(_BYTE *)(a1 + 68))
    {
      +[PXPeopleNamePickerItem _titleForAttributedString:range:](PXPeopleNamePickerItem, "_titleForAttributedString:range:", *(_QWORD *)(a1 + 32), v4, v6);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }

}

+ (id)_defaultAttributes
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_titleForAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  length = a4.length;
  location = a4.location;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttribute:value:range:", v7, v8, location, length);

  v9 = (void *)objc_msgSend(v6, "copy");
  return v9;
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleNamePickerItem.m"), 140, CFSTR("%s is not available as initializer"), "+[PXPeopleNamePickerItem new]");

  abort();
}

@end
