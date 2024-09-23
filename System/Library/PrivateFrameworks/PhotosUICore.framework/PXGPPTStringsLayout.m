@implementation PXGPPTStringsLayout

- (PXGPPTStringsLayout)init
{
  return -[PXGPPTStringsLayout initWithStringCount:localeCodes:](self, "initWithStringCount:localeCodes:", 10, &unk_1E53E9E70);
}

- (PXGPPTStringsLayout)initWithStringCount:(unint64_t)a3 localeCodes:(id)a4
{
  id v6;
  PXGPPTStringsLayout *v7;
  PXGPPTStringsLayout *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  PXGPPTStringsLayout *v29;
  id v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PXGPPTStringsLayout;
  v7 = -[PXGGridLayout init](&v37, sel_init);
  v8 = v7;
  if (v7)
  {
    v29 = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v11, "setDay:", 15);
    objc_msgSend(v11, "setHour:", 5);
    v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v12, "setDateStyle:", 4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v6;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    v30 = v6;
    if (v14)
    {
      v15 = v14;
      v32 = *(_QWORD *)v34;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v34 != v32)
            objc_enumerationMutation(obj);
          objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setLocale:", v17);

          for (i = a3; i; --i)
          {
            objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v11, v9, 0);
            v19 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "stringFromDate:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v20);

            v9 = (void *)v19;
          }
          ++v16;
        }
        while (v16 != v15);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v15);
    }

    -[PXGPPTStringsLayout setStrings:](v29, "setStrings:", v13);
    -[PXGPPTStringsLayout strings](v29, "strings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGItemsLayout setNumberOfItems:](v29, "setNumberOfItems:", objc_msgSend(v21, "count"));

    -[PXGGridLayout setMediaKind:](v29, "setMediaKind:", 3);
    -[PXGLayout setContentSource:](v29, "setContentSource:", v29);
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_msgSend(v23, "setLineBreakMode:", 0);
    objc_msgSend(v23, "setAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0DC1140];
    v38[0] = *MEMORY[0x1E0DC1138];
    v38[1] = v26;
    v39[0] = v24;
    v39[1] = v25;
    v38[2] = *MEMORY[0x1E0DC1178];
    v39[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGPPTStringsLayout setAttributes:](v29, "setAttributes:", v27);

    v8 = v29;
    v6 = v30;
  }

  return v8;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v5;
  void *v6;

  -[PXGPPTStringsLayout strings](self, "strings", *(_QWORD *)&a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (NSArray)strings
{
  return self->_strings;
}

- (void)setStrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1384);
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1392);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_strings, 0);
}

@end
