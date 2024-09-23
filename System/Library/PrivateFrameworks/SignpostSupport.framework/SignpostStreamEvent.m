@implementation SignpostStreamEvent

+ (id)serializationTypeNumber
{
  if (serializationTypeNumber_onceToken_307 != -1)
    dispatch_once(&serializationTypeNumber_onceToken_307, &__block_literal_global_309);
  return (id)serializationTypeNumber_serializationTypeNumber_308;
}

void __61__SignpostStreamEvent_Serialization__serializationTypeNumber__block_invoke()
{
  void *v0;

  v0 = (void *)serializationTypeNumber_serializationTypeNumber_308;
  serializationTypeNumber_serializationTypeNumber_308 = (uint64_t)&unk_1E462E8B8;

}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SignpostStreamEvent;
  -[SignpostEvent _dictionaryRepresentationWithIsHumanReadable:shouldRedact:](&v8, sel__dictionaryRepresentationWithIsHumanReadable_shouldRedact_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostStreamEvent _totalFrameCount](self, "_totalFrameCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("FrameCount"));

  return v5;
}

- (SignpostStreamEvent)initWithDictionary:(id)a3
{
  id v4;
  SignpostStreamEvent *v5;
  SignpostStreamEvent *v6;
  objc_super v8;

  v4 = a3;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)SignpostStreamEvent;
  self = -[SignpostEvent initWithDictionary:](&v8, sel_initWithDictionary_, v4);
  if (!self)
    goto LABEL_5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FrameCount"));
  v5 = (SignpostStreamEvent *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[SignpostStreamEvent set_totalFrameCount:](self, "set_totalFrameCount:", -[SignpostStreamEvent unsignedLongLongValue](v5, "unsignedLongLongValue"));

LABEL_5:
    self = self;
    v6 = self;
  }
LABEL_7:

  return v6;
}

- (BOOL)_hasTotalSkyLightCompositeCount
{
  return 1;
}

- (unint64_t)_totalFrameCount
{
  return self->_totalFrameCount;
}

- (void)set_totalFrameCount:(unint64_t)a3
{
  self->_totalFrameCount = a3;
}

- (OS_dispatch_source)timeoutSource
{
  return self->_timeoutSource;
}

- (void)setTimeoutSource:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutSource, a3);
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(unint64_t)a3
{
  self->_serialNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutSource, 0);
}

@end
