@implementation SPLocalTopic

+ (id)proactiveTopicWithIdentifier:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 detailText:(id)a6
{
  void *v6;
  void *v7;

  topicIdentifierWithIdentifierAndDetail(a3, a4, a5, a6, 3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPLocalTopic localTopicWithTopicIdentifier:](SPLocalTopic, "localTopicWithTopicIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)localTopicWithTopicIdentifier:(id)a3
{
  id v3;
  SPLocalTopic *v4;

  v3 = a3;
  v4 = -[SPLocalTopic initWithTopicIdentifier:]([SPLocalTopic alloc], "initWithTopicIdentifier:", v3);

  return v4;
}

+ (id)localTopicWithContactName:(id)a3 emails:(id)a4 phones:(id)a5 detailText:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  SPLocalTopic *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[SPLocalTopic initWithContactName:emails:phones:detailText:]([SPLocalTopic alloc], "initWithContactName:emails:phones:detailText:", v12, v11, v10, v9);

  return v13;
}

+ (id)localTopicWithContactName:(id)a3 contactIdentifier:(id)a4 detailText:(id)a5
{
  id v7;
  id v8;
  id v9;
  SPLocalTopic *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SPLocalTopic initWithContactName:contactIdentifier:detailText:]([SPLocalTopic alloc], "initWithContactName:contactIdentifier:detailText:", v9, v8, v7);

  return v10;
}

+ (id)localTopicWithContactName:(id)a3 contactIdentifier:(id)a4
{
  id v5;
  id v6;
  SPLocalTopic *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SPLocalTopic initWithContactName:contactIdentifier:detailText:]([SPLocalTopic alloc], "initWithContactName:contactIdentifier:detailText:", v6, v5, 0);

  return v7;
}

+ (id)localTopicWithTitle:(id)a3 type:(int)a4 score:(id)a5 isCached:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v9;
  id v10;
  SPLocalTopic *v11;

  v6 = a6;
  v7 = *(_QWORD *)&a4;
  v9 = a5;
  v10 = a3;
  v11 = -[SPLocalTopic initWithTitle:type:score:isCached:]([SPLocalTopic alloc], "initWithTitle:type:score:isCached:", v10, v7, v9, v6);

  return v11;
}

+ (id)localTopicWithTitle:(id)a3 type:(int)a4 score:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  SPLocalTopic *v9;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = a3;
  v9 = -[SPLocalTopic initWithTitle:type:score:isCached:]([SPLocalTopic alloc], "initWithTitle:type:score:isCached:", v8, v5, v7, 0);

  return v9;
}

+ (id)localTopicWithTitle:(id)a3
{
  id v3;
  SPLocalTopic *v4;

  v3 = a3;
  v4 = -[SPLocalTopic initWithTitle:type:score:isCached:]([SPLocalTopic alloc], "initWithTitle:type:score:isCached:", v3, 16, &unk_1E6005DD0, 0);

  return v4;
}

+ (id)localTopicWithDictionaryResult:(id)a3
{
  id v3;
  SPLocalTopic *v4;

  v3 = a3;
  v4 = -[SPLocalTopic initWithDictionaryResult:]([SPLocalTopic alloc], "initWithDictionaryResult:", v3);

  return v4;
}

- (SPLocalTopic)initWithContactName:(id)a3 emails:(id)a4 phones:(id)a5 detailText:(id)a6
{
  void *v7;
  SPLocalTopic *v8;
  objc_super v10;

  topicIdentifierWithContactInfoAndDetail(a3, a4, a5, a6, 0x26u, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SPLocalTopic;
  v8 = -[SFLocalTopic initWithIdentifier:](&v10, sel_initWithIdentifier_, v7);

  return v8;
}

- (SPLocalTopic)initWithContactName:(id)a3 contactIdentifier:(id)a4 detailText:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  SPLocalTopic *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "length") || v8 && (objc_msgSend(v9, "isEqualToString:", v8) & 1) != 0)
  {
    topicIdentifierWithContactInfoAndDetail(v8, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v10, 0x26u, 0);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    topicIdentifierWithContactIdentifierAndDetail(v8, v9, v10, 32, 0);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  v15.receiver = self;
  v15.super_class = (Class)SPLocalTopic;
  v13 = -[SFLocalTopic initWithIdentifier:](&v15, sel_initWithIdentifier_, v11);

  return v13;
}

- (SPLocalTopic)initWithTitle:(id)a3 type:(int)a4 score:(id)a5 isCached:(BOOL)a6
{
  void *v7;
  SPLocalTopic *v8;
  objc_super v10;

  topicIdentifierWithTitleAndType(a3, *(uint64_t *)&a4, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SPLocalTopic;
  v8 = -[SFLocalTopic initWithIdentifier:](&v10, sel_initWithIdentifier_, v7);

  return v8;
}

- (SPLocalTopic)initWithDictionaryResult:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SPLocalTopic *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x1E0D8C7A8];
  v5 = a3;
  objc_msgSend(v5, "completion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  objc_msgSend(v5, "setSectionBundleIdentifier:", CFSTR("com.apple.searchd.recent.dictionary"));
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)SPLocalTopic;
  v9 = -[SFLocalTopic initWithResult:identifier:](&v11, sel_initWithResult_identifier_, v5, v8);

  return v9;
}

- (SPLocalTopic)initWithTopicIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPLocalTopic;
  return -[SFLocalTopic initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
}

@end
