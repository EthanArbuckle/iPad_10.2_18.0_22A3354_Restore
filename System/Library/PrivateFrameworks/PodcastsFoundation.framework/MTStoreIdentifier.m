@implementation MTStoreIdentifier

+ (BOOL)isEmpty:(int64_t)a3
{
  return !a3 || a3 == 1000000000000;
}

+ (id)validatedIdNumberFromStoreId:(int64_t)a3
{
  void *v4;

  if (objc_msgSend(a1, "isNotEmpty:"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)isNotEmpty:(int64_t)a3
{
  return objc_msgSend(a1, "isEmpty:", a3) ^ 1;
}

- (MTStoreIdentifier)initWithFeedUrl:(id)a3
{
  return -[MTStoreIdentifier initWithFeedUrl:storeIdentifier:](self, "initWithFeedUrl:storeIdentifier:", a3, 0);
}

- (MTStoreIdentifier)initWithFeedUrl:(id)a3 storeIdentifier:(id)a4
{
  id v6;
  id v7;
  MTStoreIdentifier *v8;
  MTStoreIdentifier *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTStoreIdentifier;
  v8 = -[MTStoreIdentifier init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MTStoreIdentifier setFeedUrl:](v8, "setFeedUrl:", v6);
    -[MTStoreIdentifier setStoreIdentifier:](v9, "setStoreIdentifier:", v7);
  }

  return v9;
}

+ (id)identifierWithFeedUrl:(id)a3
{
  id v3;
  MTStoreIdentifier *v4;

  v3 = a3;
  v4 = -[MTStoreIdentifier initWithFeedUrl:]([MTStoreIdentifier alloc], "initWithFeedUrl:", v3);

  return v4;
}

+ (id)identifierWithFeedUrl:(id)a3 storeIdentifier:(id)a4
{
  id v5;
  id v6;
  MTStoreIdentifier *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MTStoreIdentifier initWithFeedUrl:storeIdentifier:]([MTStoreIdentifier alloc], "initWithFeedUrl:storeIdentifier:", v6, v5);

  return v7;
}

+ (int64_t)adamIdFromSerpentId:(int64_t)a3
{
  uint64_t v3;

  v3 = 1000000000000;
  if (a3 <= 1000000000000)
    v3 = 0;
  return a3 - v3;
}

+ (id)adamIdNumberFromStoreId:(int64_t)a3
{
  void *v4;

  if (objc_msgSend(a1, "isNotEmpty:"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (int64_t)serpentIdFromAdamId:(int64_t)a3
{
  uint64_t v3;

  v3 = 1000000000000;
  if (a3 >= 1000000000000)
    v3 = 0;
  return v3 + a3;
}

+ (BOOL)isEmptyNumber:(id)a3
{
  return objc_msgSend(a1, "isEmpty:", objc_msgSend(a3, "longLongValue"));
}

+ (BOOL)isNotEmptyNumber:(id)a3
{
  return objc_msgSend(a1, "isEmptyNumber:", a3) ^ 1;
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_storeIdentifier, a3);
}

- (NSString)feedUrl
{
  return self->_feedUrl;
}

- (void)setFeedUrl:(id)a3
{
  objc_storeStrong((id *)&self->_feedUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

@end
