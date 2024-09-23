@implementation SVXRadarRateLimiter

- (BOOL)isRateLimited
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = -[SVXRadarRateLimiter _getRandom](self, "_getRandom");
  v3 = *MEMORY[0x24BE08FB0];
  v4 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v7 = 136315394;
      v8 = "-[SVXRadarRateLimiter isRateLimited]";
      v9 = 1024;
      v10 = v2;
      v5 = "%s User not sampled for this time, randint=%d";
LABEL_6:
      _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v7, 0x12u);
    }
  }
  else if (v4)
  {
    v7 = 136315394;
    v8 = "-[SVXRadarRateLimiter isRateLimited]";
    v9 = 1024;
    v10 = 0;
    v5 = "%s User sampled for this time, randint=%d";
    goto LABEL_6;
  }
  return v2 != 0;
}

- (int)_getRandom
{
  return arc4random_uniform(0x14u);
}

@end
