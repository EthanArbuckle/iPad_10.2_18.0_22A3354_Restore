@implementation WBSForYouDataSourceWeightManager

- (WBSForYouDataSourceWeightManager)initWithKeyValueStore:(id)a3
{
  id v5;
  WBSForYouDataSourceWeightManager *v6;
  WBSForYouDataSourceWeightManager *v7;
  WBSForYouDataSourceWeightManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSForYouDataSourceWeightManager;
  v6 = -[WBSForYouDataSourceWeightManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = v7;
  }

  return v7;
}

- (void)downvoteSource:(unint64_t)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  if (a3 - 1 > 6)
    v4 = CFSTR("bookmarks");
  else
    v4 = off_1E5443860[a3 - 1];
  -[WBSDictionaryKeyValueStore dictionaryForKey:](self->_store, "dictionaryForKey:", CFSTR("ForYouDataSourceWeights"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "mutableCopy");

  v6 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v6;
  objc_msgSend(v6, "safari_numberForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v9, v4);

  -[WBSDictionaryKeyValueStore setObject:forKey:](self->_store, "setObject:forKey:", v11, CFSTR("ForYouDataSourceWeights"));
}

- (double)weightForSource:(unint64_t)a3
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;

  if (a3 - 1 > 6)
    v3 = CFSTR("bookmarks");
  else
    v3 = off_1E5443860[a3 - 1];
  -[WBSDictionaryKeyValueStore dictionaryForKey:](self->_store, "dictionaryForKey:", CFSTR("ForYouDataSourceWeights"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "safari_numberForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    v8 = exp((double)-v7 * 1.61803);
  }
  else
  {
    v8 = 1.0;
  }

  return v8;
}

- (void)clear
{
  -[WBSDictionaryKeyValueStore setObject:forKey:](self->_store, "setObject:forKey:", 0, CFSTR("ForYouDataSourceWeights"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
