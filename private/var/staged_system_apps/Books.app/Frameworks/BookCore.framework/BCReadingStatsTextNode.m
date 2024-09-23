@implementation BCReadingStatsTextNode

- (void)didTurnIntoFault
{
  BCCFI *cachedCFI;
  objc_super v4;

  cachedCFI = self->_cachedCFI;
  self->_cachedCFI = 0;

  v4.receiver = self;
  v4.super_class = (Class)BCReadingStatsTextNode;
  -[BCReadingStatsTextNode didTurnIntoFault](&v4, "didTurnIntoFault");
}

- (BCCFI)cachedCFI
{
  void *v3;
  BCCFI *cachedCFI;
  BOOL v5;
  void *v6;
  BCCFI *v7;
  id v8;
  BCCFI *v9;
  id v10;
  NSObject *v11;
  BCCFI *v12;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatsTextNode cfi](self, "cfi"));
  cachedCFI = self->_cachedCFI;
  if (cachedCFI)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = objc_autoreleasePoolPush();
    v14 = 0;
    v7 = (BCCFI *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v3, &v14));
    v8 = v14;
    v9 = self->_cachedCFI;
    self->_cachedCFI = v7;

    if (v8)
    {
      v10 = BCReadingStatisticsLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1B763C((uint64_t)v3, (uint64_t)v8, v11);

    }
    objc_autoreleasePoolPop(v6);

    cachedCFI = self->_cachedCFI;
  }
  v12 = cachedCFI;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCFI, 0);
}

@end
