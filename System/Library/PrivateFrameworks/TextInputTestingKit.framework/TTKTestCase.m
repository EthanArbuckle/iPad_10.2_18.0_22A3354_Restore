@implementation TTKTestCase

- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4 intendedText:(id)a5
{
  id v9;
  id v10;
  id v11;
  TTKTestCase *v12;
  TTKTestCase *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TTKTestCase;
  v12 = -[TTKTestCase init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_metadata, a3);
    objc_storeStrong((id *)&v13->_records, a4);
    objc_storeStrong((id *)&v13->_intendedText, a5);
  }

  return v13;
}

- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4
{
  return -[TTKTestCase initWithMetadata:records:intendedText:](self, "initWithMetadata:records:intendedText:", a3, a4, 0);
}

- (TTKTestCase)initWithDictionary:(id)a3
{
  id v4;
  TTKTestCase *v5;
  uint64_t v6;
  NSDictionary *metadata;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  TTKTestCaseRecord *v15;
  TTKTestCaseRecord *v16;
  uint64_t v17;
  NSMutableDictionary *annotations;
  uint64_t v19;
  NSString *intendedText;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TTKTestCase;
  v5 = -[TTKTestCase init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("metadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("records"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
          v15 = [TTKTestCaseRecord alloc];
          v16 = -[TTKTestCaseRecord initWithDictionary:](v15, "initWithDictionary:", v14, (_QWORD)v22);
          objc_msgSend(v9, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v11);
    }

    objc_storeStrong((id *)&v5->_records, v9);
    objc_msgSend(v4, "objectForKey:", CFSTR("annotations"));
    v17 = objc_claimAutoreleasedReturnValue();
    annotations = v5->_annotations;
    v5->_annotations = (NSMutableDictionary *)v17;

    objc_msgSend(v4, "objectForKey:", CFSTR("intended_text"));
    v19 = objc_claimAutoreleasedReturnValue();
    intendedText = v5->_intendedText;
    v5->_intendedText = (NSString *)v19;

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
  void *v9;
  NSMutableDictionary *annotations;
  NSString *intendedText;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_records;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "toJsonDictionary", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("records"));
  annotations = self->_annotations;
  if (annotations)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", annotations, CFSTR("annotations"));
  intendedText = self->_intendedText;
  if (intendedText)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", intendedText, CFSTR("intended_text"));

  return v3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSArray)records
{
  return self->_records;
}

- (NSMutableDictionary)annotations
{
  return self->_annotations;
}

- (NSString)intendedText
{
  return self->_intendedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedText, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

+ (id)convertToIsolatedWordMode:(id)a3
{
  id v3;
  TTKTestCase *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;
  TTKTestCaseRecord *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  TTKTestCaseRecord *v41;
  TTKTestCase *v42;
  void *v44;
  id obj;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v44 = v3;
  objc_msgSend(v3, "intendedText");
  v4 = (TTKTestCase *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v3, "records");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v5;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v6)
    {
      v7 = 0;
      v51 = *(_QWORD *)v60;
      while (2)
      {
        v49 = v6;
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v60 != v51)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v3, "intendedText");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v7;
          objc_msgSend(v10, "substringFromIndex:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "primaryIntendedText");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v53, "length"))
            goto LABEL_31;
          objc_msgSend(v12, "lowercaseString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "lowercaseString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "rangeOfString:", v14);
          v17 = v16;

          if (v15 >= 1)
          {
            v18 = 0;
            while (1)
            {
              objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v18));

              if ((v20 & 1) == 0
                && objc_msgSend(v12, "characterAtIndex:", v18) != 46
                && objc_msgSend(v12, "characterAtIndex:", v18) != 42)
              {
                break;
              }
              if (v15 == ++v18)
                goto LABEL_14;
            }
LABEL_31:
            v4 = 0;
            goto LABEL_32;
          }
LABEL_14:
          objc_msgSend(v44, "intendedText");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "substringWithRange:", 0, v11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v46, "addObject:", v22);
          v23 = v15 + v17;
          while (1)
          {
            objc_msgSend(v44, "intendedText");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = v11 + v23;
            if (objc_msgSend(v24, "length") <= (unint64_t)(v11 + v23))
              break;
            v25 = objc_msgSend(v12, "characterAtIndex:", v23) == 32;

            ++v23;
            if (!v25)
            {
              v7 = v11 + v23 - 1;
              goto LABEL_19;
            }
          }

LABEL_19:
          v3 = v44;
          v5 = v47;
        }
        v6 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "records");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v26)
    {
      v27 = 0;
      v50 = *(_QWORD *)v56;
      do
      {
        v28 = 0;
        v48 = v27;
        v52 = v26;
        do
        {
          if (*(_QWORD *)v56 != v50)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v28);
          objc_msgSend(v29, "touchData");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30 == 0;

          if (!v31)
          {
            v32 = [TTKTestCaseRecord alloc];
            objc_msgSend(v29, "primaryIntendedText");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "additionalIntendedTexts");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "touchDataCollection");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "recordID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "layoutName");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "inputText");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "transliteration");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectAtIndex:", v48 + v28);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "annotations");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = -[TTKTestCaseRecord initWithIntendedText:additionalIntendedTexts:touchDataCollection:recordID:layoutName:inputText:transliteration:context:annotations:](v32, "initWithIntendedText:additionalIntendedTexts:touchDataCollection:recordID:layoutName:inputText:transliteration:context:annotations:", v54, v33, v34, v35, v36, v37, v38, v39, v40);
            objc_msgSend(v47, "addObject:", v41);

          }
          ++v28;
        }
        while (v52 != v28);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        v27 = v48 + v28;
      }
      while (v26);
    }

    v42 = [TTKTestCase alloc];
    objc_msgSend(v44, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "intendedText");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[TTKTestCase initWithMetadata:records:intendedText:](v42, "initWithMetadata:records:intendedText:", v12, v47);
LABEL_32:

    v3 = v44;
  }

  return v4;
}

@end
