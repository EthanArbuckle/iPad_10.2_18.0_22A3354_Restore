@implementation TTKTestCaseRecord

- (TTKTestCaseRecord)initWithIntendedText:(id)a3 additionalIntendedTexts:(id)a4 touchDataCollection:(id)a5 recordID:(id)a6 layoutName:(id)a7 inputText:(id)a8 transliteration:(id)a9 context:(id)a10 annotations:(id)a11
{
  id v18;
  void *v19;
  id v20;
  TTKTestCaseRecord *v21;
  TTKTestCaseRecord *v22;
  uint64_t v23;
  NSArray *additionalIntendedTexts;
  uint64_t v25;
  NSMutableDictionary *internalAnnotations;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v18 = a4;
  v33 = a5;
  v32 = a6;
  v31 = a7;
  v30 = a8;
  v29 = a9;
  v28 = a10;
  v19 = v18;
  v20 = a11;
  v35.receiver = self;
  v35.super_class = (Class)TTKTestCaseRecord;
  v21 = -[TTKTestCaseRecord init](&v35, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_primaryIntendedText, a3);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v19);
    v23 = objc_claimAutoreleasedReturnValue();
    additionalIntendedTexts = v22->_additionalIntendedTexts;
    v22->_additionalIntendedTexts = (NSArray *)v23;

    objc_storeStrong((id *)&v22->_inputText, a8);
    objc_storeStrong((id *)&v22->_transliteration, a9);
    objc_storeStrong((id *)&v22->_context, a10);
    objc_storeStrong((id *)&v22->_touchDataCollection, a5);
    objc_storeStrong((id *)&v22->_recordID, a6);
    objc_storeStrong((id *)&v22->_layoutName, a7);
    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v20);
      v25 = objc_claimAutoreleasedReturnValue();
      internalAnnotations = v22->_internalAnnotations;
      v22->_internalAnnotations = (NSMutableDictionary *)v25;

    }
  }

  return v22;
}

- (TTKTestCaseRecord)initWithDictionary:(id)a3
{
  id v4;
  TTKTestCaseRecord *v5;
  uint64_t v6;
  NSString *layoutName;
  uint64_t v8;
  NSString *primaryIntendedText;
  uint64_t v10;
  uint64_t v11;
  NSArray *additionalIntendedTexts;
  uint64_t v13;
  NSString *inputText;
  uint64_t v15;
  NSString *transliteration;
  uint64_t v17;
  NSString *recordID;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *internalAnnotations;
  uint64_t v22;
  NSString *context;
  void *v24;
  NSArray *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  TIContinuousPath *v31;
  NSArray *touchDataCollection;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TTKTestCaseRecord;
  v5 = -[TTKTestCaseRecord init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("layout_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    layoutName = v5->_layoutName;
    v5->_layoutName = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("intended_text"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryIntendedText = v5->_primaryIntendedText;
    v5->_primaryIntendedText = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("alternate_intended_texts"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      additionalIntendedTexts = v5->_additionalIntendedTexts;
      v5->_additionalIntendedTexts = (NSArray *)v11;

    }
    v34 = (void *)v10;
    objc_msgSend(v4, "objectForKey:", CFSTR("input_text"));
    v13 = objc_claimAutoreleasedReturnValue();
    inputText = v5->_inputText;
    v5->_inputText = (NSString *)v13;

    objc_msgSend(v4, "objectForKey:", CFSTR("transliteration"));
    v15 = objc_claimAutoreleasedReturnValue();
    transliteration = v5->_transliteration;
    v5->_transliteration = (NSString *)v15;

    objc_msgSend(v4, "objectForKey:", CFSTR("record_id"));
    v17 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v17;

    objc_msgSend(v4, "objectForKey:", CFSTR("annotations"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      internalAnnotations = v5->_internalAnnotations;
      v5->_internalAnnotations = (NSMutableDictionary *)v20;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("context"));
    v22 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSString *)v22;

    objc_msgSend(v4, "objectForKey:", CFSTR("touch_events"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v26);
          v31 = -[TIContinuousPath initWithJsonDictionary:]([TIContinuousPath alloc], "initWithJsonDictionary:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v30));
          -[NSArray addObject:](v25, "addObject:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v28);
    }

    touchDataCollection = v5->_touchDataCollection;
    v5->_touchDataCollection = v25;

  }
  return v5;
}

- (id)toJsonDictionary
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *additionalIntendedTexts;
  NSString *inputText;
  NSString *transliteration;
  NSString *context;
  NSMutableDictionary *internalAnnotations;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_layoutName, CFSTR("layout_name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_primaryIntendedText, CFSTR("intended_text"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_recordID, CFSTR("record_id"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_touchDataCollection;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "toJsonDictionary", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("touch_events"));
  additionalIntendedTexts = self->_additionalIntendedTexts;
  if (additionalIntendedTexts)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", additionalIntendedTexts, CFSTR("additional_intended_texts"));
  inputText = self->_inputText;
  if (inputText)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", inputText, CFSTR("input_text"));
  transliteration = self->_transliteration;
  if (transliteration)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", transliteration, CFSTR("transliteration"));
  context = self->_context;
  if (context)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", context, CFSTR("context"));
  internalAnnotations = self->_internalAnnotations;
  if (internalAnnotations)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", internalAnnotations, CFSTR("annotations"));

  return v3;
}

- (void)setAnnotation:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *internalAnnotations;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  internalAnnotations = self->_internalAnnotations;
  if (!internalAnnotations)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_internalAnnotations;
    self->_internalAnnotations = v8;

    internalAnnotations = self->_internalAnnotations;
  }
  -[NSMutableDictionary setValue:forKey:](internalAnnotations, "setValue:forKey:", v10, v6);

}

- (NSMutableDictionary)annotations
{
  return self->_internalAnnotations;
}

- (TIContinuousPath)touchData
{
  void *v3;

  v3 = -[NSArray count](self->_touchDataCollection, "count");
  if (v3)
  {
    -[NSArray objectAtIndex:](self->_touchDataCollection, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (TIContinuousPath *)v3;
}

- (NSArray)intendedText
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_primaryIntendedText);
}

- (NSString)primaryIntendedText
{
  return self->_primaryIntendedText;
}

- (NSArray)additionalIntendedTexts
{
  return self->_additionalIntendedTexts;
}

- (NSString)inputText
{
  return self->_inputText;
}

- (NSString)transliteration
{
  return self->_transliteration;
}

- (NSArray)touchDataCollection
{
  return self->_touchDataCollection;
}

- (NSString)layoutName
{
  return self->_layoutName;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_layoutName, 0);
  objc_storeStrong((id *)&self->_touchDataCollection, 0);
  objc_storeStrong((id *)&self->_transliteration, 0);
  objc_storeStrong((id *)&self->_inputText, 0);
  objc_storeStrong((id *)&self->_additionalIntendedTexts, 0);
  objc_storeStrong((id *)&self->_primaryIntendedText, 0);
  objc_storeStrong((id *)&self->_internalAnnotations, 0);
}

@end
