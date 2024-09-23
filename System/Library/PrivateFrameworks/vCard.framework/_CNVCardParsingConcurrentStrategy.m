@implementation _CNVCardParsingConcurrentStrategy

- (id)parseData:(id)a3 options:(id)a4 resultFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _CNVCardParsingConcurrentStrategy *v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[CNVCardRangeFinder allRangesInData:](CNVCardRangeFinder, "allRangesInData:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "left");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_cn_balancedSlicesWithMaximumCount:", 128);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_cn_map:", &__block_literal_global_13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v14, "count") <= 1)
  {
    -[_CNVCardParsingConcurrentStrategy seriallyParsedData:options:resultFactory:](self, "seriallyParsedData:options:resultFactory:", v8, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __69___CNVCardParsingConcurrentStrategy_parseData_options_resultFactory___block_invoke;
    v21 = &unk_1E956FE58;
    v22 = v8;
    v23 = self;
    v24 = v9;
    v25 = v10;
    objc_msgSend(v14, "_cn_concurrentMap:", &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_cn_flatten", v18, v19, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)seriallyParsedData:(id)a3 options:(id)a4 resultFactory:(id)a5
{
  id v7;
  id v8;
  id v9;
  _CNVCardParsingSerialStrategy *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_CNVCardParsingSerialStrategy);
  -[_CNVCardParsingSerialStrategy parseData:options:resultFactory:](v10, "parseData:options:resultFactory:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
