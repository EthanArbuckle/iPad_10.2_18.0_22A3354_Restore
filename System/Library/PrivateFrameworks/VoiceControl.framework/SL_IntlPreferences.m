@implementation SL_IntlPreferences

+ (id)addLikelySubtagsForLocaleIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getNSLocaleClass_softClass;
  v12 = getNSLocaleClass_softClass;
  if (!getNSLocaleClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getNSLocaleClass_block_invoke;
    v8[3] = &unk_251BAD050;
    v8[4] = &v9;
    __getNSLocaleClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v5, "addLikelySubtagsForLocaleIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
