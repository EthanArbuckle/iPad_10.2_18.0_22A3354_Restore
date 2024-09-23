@implementation VKAnalyticsProcessor

- (void)processAndSendEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(v4, "eventKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "coreAnalyticsDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[VKAnalyticsProcessor isPublicAPI](self, "isPublicAPI");
      objc_msgSend(v4, "eventKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __44__VKAnalyticsProcessor_processAndSendEvent___block_invoke;
      v9[3] = &unk_1E9465750;
      v10 = v6;
      v11 = v7;
      -[VKAnalyticsProcessor sendCoreAnalyticsEvent:block:](self, "sendCoreAnalyticsEvent:block:", v8, v9);

    }
  }

}

id __44__VKAnalyticsProcessor_processAndSendEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("publicAPI"));

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

- (void)processAndSendSession:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v4 = a3;
  v5 = -[VKAnalyticsProcessor isPublicAPI](self, "isPublicAPI");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__VKAnalyticsProcessor_processAndSendSession___block_invoke;
  v7[3] = &unk_1E9465750;
  v8 = v4;
  v9 = v5;
  v6 = v4;
  -[VKAnalyticsProcessor sendCoreAnalyticsEvent:block:](self, "sendCoreAnalyticsEvent:block:", CFSTR("InteractionSessionEnded"), v7);

}

id __46__VKAnalyticsProcessor_processAndSendSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "coreAnalyticsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("publicAPI"));

  v5 = v3;
  return v5;
}

- (void)sendCoreAnalyticsEvent:(id)a3 block:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.VisionKit.%@"), a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

- (BOOL)isPublicAPI
{
  return self->_isPublicAPI;
}

- (void)setIsPublicAPI:(BOOL)a3
{
  self->_isPublicAPI = a3;
}

- (VKAnalyticsSessionAccumulator)sessionAccumulator
{
  return self->_sessionAccumulator;
}

- (void)setSessionAccumulator:(id)a3
{
  objc_storeStrong((id *)&self->_sessionAccumulator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionAccumulator, 0);
}

@end
