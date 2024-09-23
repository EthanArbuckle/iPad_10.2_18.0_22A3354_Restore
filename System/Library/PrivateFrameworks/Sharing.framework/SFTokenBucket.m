@implementation SFTokenBucket

- (SFTokenBucket)init
{
  SFTokenBucket *v2;
  SEL v3;
  unint64_t v4;
  unint64_t v5;

  v2 = (SFTokenBucket *)NSUnimplemented_();
  return -[SFTokenBucket initWithBucketSize:tokenDurationTicks:](v2, v3, v4, v5);
}

- (SFTokenBucket)initWithBucketSize:(unint64_t)a3 tokenDurationTicks:(unint64_t)a4
{
  SFTokenBucket *v6;
  SFTokenBucket *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFTokenBucket;
  v6 = -[SFTokenBucket init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_bucketSize = a3;
    v6->_tokensAvailable = a3;
    v6->_tokenDurationTicks = a4;
    v6->_lastRefreshTicks = mach_absolute_time();
  }
  return v7;
}

- (SFTokenBucket)initWithBucketSize:(unint64_t)a3 tokenDurationSec:(double)a4
{
  return -[SFTokenBucket initWithBucketSize:tokenDurationTicks:](self, "initWithBucketSize:tokenDurationTicks:", a3, SecondsToUpTicksF());
}

- (SFTokenBucket)initWithBucketSize:(unint64_t)a3 tokensPerSec:(double)a4
{
  return -[SFTokenBucket initWithBucketSize:tokenDurationSec:](self, "initWithBucketSize:tokenDurationSec:", a3, 1.0 / a4);
}

- (BOOL)acquireToken
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t tokensAvailable;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  BOOL v22;
  uint8_t v24[16];

  airdrop_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SFTokenBucket acquireToken].cold.3((uint64_t)self, v3, v4, v5, v6, v7, v8, v9);

  tokensAvailable = self->_tokensAvailable;
  if (tokensAvailable)
    goto LABEL_10;
  v11 = mach_absolute_time();
  v12 = self->_tokensAvailable;
  if ((v11 - self->_lastRefreshTicks) / self->_tokenDurationTicks >= self->_bucketSize - v12)
    v13 = self->_bucketSize - v12;
  else
    v13 = (v11 - self->_lastRefreshTicks) / self->_tokenDurationTicks;
  airdrop_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[SFTokenBucket acquireToken].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);

  self->_tokensAvailable += v13;
  self->_lastRefreshTicks = mach_absolute_time();
  tokensAvailable = self->_tokensAvailable;
  if (tokensAvailable)
  {
LABEL_10:
    self->_tokensAvailable = tokensAvailable - 1;
    airdrop_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[SFTokenBucket acquireToken].cold.1(v21);
    v22 = 1;
  }
  else
  {
    airdrop_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1A2830000, v21, OS_LOG_TYPE_DEFAULT, "No tokens available.", v24, 2u);
    }
    v22 = 0;
  }

  return v22;
}

- (void)acquireToken
{
  OUTLINED_FUNCTION_4(&dword_1A2830000, a2, a3, "Number of available tokens: %ld", a5, a6, a7, a8, 0);
}

@end
