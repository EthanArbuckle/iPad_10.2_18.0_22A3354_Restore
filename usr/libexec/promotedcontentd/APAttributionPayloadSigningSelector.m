@implementation APAttributionPayloadSigningSelector

+ (id)selectorWithAttributionConfig
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v16;
  void *v17;

  v3 = APLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Loading attribution config", (uint8_t *)&v16, 2u);
  }

  v5 = +[APConfigurationMediator configurationForClass:](APConfigurationMediator, "configurationForClass:", objc_opt_class(APAttributionConfig));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signingPercentageFPDI")), v8, v8))
  {
    v9 = APLogForCategory(4);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "signingPercentageFPDI"));
      v16 = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Using attribution config loaded value %@", (uint8_t *)&v16, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "signingPercentageFPDI"));
    v13 = (uint64_t)objc_msgSend(v12, "unsignedIntValue");

  }
  else
  {
    v13 = 10000;
  }
  v14 = objc_msgSend(objc_alloc((Class)a1), "initWithSigningPercentageFPDIValue:", v13);

  return v14;
}

- (APAttributionPayloadSigningSelector)initWithSigningPercentageFPDIValue:(unsigned int)a3
{
  APAttributionPayloadSigningSelector *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APAttributionPayloadSigningSelector;
  result = -[APAttributionPayloadSigningSelector init](&v5, "init");
  if (result)
    result->_signingPercentageFPDI = a3;
  return result;
}

- (int64_t)selectRandomSigningService
{
  uint32_t v3;
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  unsigned int v11;
  int64_t v12;
  int v14;
  __CFString *v15;
  __int16 v16;
  unsigned int v17;

  v3 = arc4random_uniform(0x2710u);
  v4 = APLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v14 = 67109120;
    LODWORD(v15) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Signging service selector random number chosen (%u)", (uint8_t *)&v14, 8u);
  }

  v6 = -[APAttributionPayloadSigningSelector signingPercentageFPDI](self, "signingPercentageFPDI");
  v7 = APLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = CFSTR("FPDI service");
    if (v3 > v6)
      v9 = CFSTR("Mescal service");
    v10 = v9;
    v11 = -[APAttributionPayloadSigningSelector signingPercentageFPDI](self, "signingPercentageFPDI");
    v14 = 138412546;
    v15 = v10;
    v16 = 1024;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Selected [(%@)] for signing threshold (%d)", (uint8_t *)&v14, 0x12u);

  }
  if (v3 <= v6)
    v12 = 1;
  else
    v12 = 2;

  return v12;
}

- (unsigned)signingPercentageFPDI
{
  return self->_signingPercentageFPDI;
}

- (void)setSigningPercentageFPDI:(unsigned int)a3
{
  self->_signingPercentageFPDI = a3;
}

@end
