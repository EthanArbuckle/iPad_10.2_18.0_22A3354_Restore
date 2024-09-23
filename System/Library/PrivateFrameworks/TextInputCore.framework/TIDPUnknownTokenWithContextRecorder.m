@implementation TIDPUnknownTokenWithContextRecorder

- (id)recordingKey
{
  void *v2;
  void *v3;

  -[TIDPRecorder recordingKeyLocaleSubstring](self, "recordingKeyLocaleSubstring");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.TextInput.UnknownTokenWithContext."), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)records
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alignedEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alignedEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", &__block_literal_global_1784);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__TIDPUnknownTokenWithContextRecorder_records__block_invoke_2;
  v15[3] = &unk_1EA0FF320;
  v16 = v9;
  v17 = v5;
  v18 = v3;
  v10 = v3;
  v11 = v5;
  v12 = v9;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v15);
  v13 = (void *)objc_msgSend(v10, "copy");

  return v13;
}

uint64_t __46__TIDPUnknownTokenWithContextRecorder_records__block_invoke_2(id *a1, unint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a1[4];
  if (a2)
  {
    objc_msgSend(a1[5], "objectAtIndexedSubscript:", a2 - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalWord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acceptedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  else
  {
    objc_msgSend(a1[4], "addObject:", CFSTR("<s>"));
  }
  v8 = a1[4];
  objc_msgSend(a1[5], "objectAtIndexedSubscript:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "originalWord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "acceptedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v11);

  v12 = objc_msgSend(a1[5], "count") - 1;
  v13 = a1[4];
  if (v12 <= a2)
  {
    objc_msgSend(a1[4], "addObject:", CFSTR("</s>"));
  }
  else
  {
    objc_msgSend(a1[5], "objectAtIndexedSubscript:", a2 + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "originalWord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "acceptedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);

  }
  if (objc_msgSend(a1[4], "count"))
  {
    v17 = 0;
    do
    {
      objc_msgSend(a1[4], "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ++v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[TIDPWordRecord word:atPosition:](TIDPWordRecord, "word:atPosition:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[6], "addObject:", v20);
    }
    while (v17 < objc_msgSend(a1[4], "count"));
  }
  return objc_msgSend(a1[4], "removeAllObjects");
}

uint64_t __46__TIDPUnknownTokenWithContextRecorder_records__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "originalWord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromStaticLexicon") ^ 1;

  return v3;
}

@end
