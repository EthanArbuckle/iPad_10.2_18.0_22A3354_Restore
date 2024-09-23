@implementation PRComplicationSuggestionSet

- (PRComplicationSuggestionSet)initWithDescriptors:(id)a3 localizedTitle:(id)a4
{
  id v7;
  id v8;
  PRComplicationSuggestionSet *v9;
  PRComplicationSuggestionSet *v10;
  uint64_t v11;
  NSString *localizedTitle;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRComplicationSuggestionSet;
  v9 = -[PRComplicationSuggestionSet init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptors, a3);
    v11 = objc_msgSend(v8, "copy");
    localizedTitle = v10->_localizedTitle;
    v10->_localizedTitle = (NSString *)v11;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  BOOL v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationSuggestionSet descriptors](self, "descriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __39__PRComplicationSuggestionSet_isEqual___block_invoke;
  v18[3] = &unk_1E2184160;
  v8 = v4;
  v19 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v18);

  -[PRComplicationSuggestionSet localizedTitle](self, "localizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __39__PRComplicationSuggestionSet_isEqual___block_invoke_2;
  v16[3] = &unk_1E2184160;
  v11 = v8;
  v17 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v16);

  if (objc_msgSend(v5, "isEqual"))
  {
    v15.receiver = self;
    v15.super_class = (Class)PRComplicationSuggestionSet;
    v13 = -[PRComplicationSuggestionSet isEqual:](&v15, sel_isEqual_, v11);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __39__PRComplicationSuggestionSet_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "descriptors");
}

uint64_t __39__PRComplicationSuggestionSet_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PRComplicationSuggestionSet descriptors](self, "descriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PRComplicationSuggestionSet localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
}

@end
