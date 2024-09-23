@implementation VOSCommandResolver

+ (unint64_t)currentHost
{
  if (currentHost_onceToken != -1)
    dispatch_once(&currentHost_onceToken, &__block_literal_global_5);
  return currentHost__Host;
}

uint64_t __33__VOSCommandResolver_currentHost__block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = AXDeviceIsPad();
  if ((result & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    result = AXDeviceIsAudioAccessory();
    v1 = 4;
    if (!(_DWORD)result)
      v1 = 0;
  }
  currentHost__Host = v1;
  return result;
}

+ (id)resolverForCurrentHost
{
  VOSCommandResolver *v2;

  v2 = objc_alloc_init(VOSCommandResolver);
  -[VOSCommandResolver setHost:](v2, "setHost:", +[VOSCommandResolver currentHost](VOSCommandResolver, "currentHost"));
  return v2;
}

- (VOSCommandResolver)resolverWithScreenreaderModeVariant:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[VOSCommandResolver copy](self, "copy");
  objc_msgSend(v5, "setScreenreaderMode:", v4);

  return (VOSCommandResolver *)v5;
}

- (BOOL)isDefaultScreenreaderMode
{
  void *v2;
  void *v3;
  BOOL v4;

  -[VOSCommandResolver screenreaderMode](self, "screenreaderMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode Default](VOSScreenreaderMode, "Default");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

- (BOOL)isBSIScreenreaderMode
{
  void *v2;
  void *v3;
  BOOL v4;

  -[VOSCommandResolver screenreaderMode](self, "screenreaderMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode BrailleScreenInput](VOSScreenreaderMode, "BrailleScreenInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

- (BOOL)isHandwritingScreenreaderMode
{
  void *v2;
  void *v3;
  BOOL v4;

  -[VOSCommandResolver screenreaderMode](self, "screenreaderMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode Handwriting](VOSScreenreaderMode, "Handwriting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

- (BOOL)isIPad
{
  return -[VOSCommandResolver host](self, "host") == 1;
}

- (BOOL)isIPhone
{
  return -[VOSCommandResolver host](self, "host") == 0;
}

- (BOOL)isWatch
{
  return -[VOSCommandResolver host](self, "host") == 2;
}

- (BOOL)isAppleTV
{
  return -[VOSCommandResolver host](self, "host") == 3;
}

- (BOOL)isHomePod
{
  return -[VOSCommandResolver host](self, "host") == 4;
}

- (VOSScreenreaderMode)screenreaderMode
{
  VOSScreenreaderMode *screenreaderMode;

  screenreaderMode = self->_screenreaderMode;
  if (screenreaderMode)
    return screenreaderMode;
  +[VOSScreenreaderMode Default](VOSScreenreaderMode, "Default");
  return (VOSScreenreaderMode *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isDefaultKeyboardMode
{
  return -[VOSCommandResolver keyboardMode](self, "keyboardMode") == 0;
}

- (BOOL)isQuickNavKeyboardMode
{
  return -[VOSCommandResolver keyboardMode](self, "keyboardMode") == 1;
}

- (int64_t)pressCount
{
  NSNumber *cachedPressCount;
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  unint64_t v6;
  uint64_t v7;
  NSNumber *v8;
  NSNumber *v9;

  cachedPressCount = self->_cachedPressCount;
  if (!cachedPressCount)
  {
    -[VOSCommandResolver fetchPressCountBlock](self, "fetchPressCountBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[VOSCommandResolver fetchPressCountBlock](self, "fetchPressCountBlock");
      v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6 = ((uint64_t (**)(_QWORD, VOSCommandResolver *))v5)[2](v5, self);

      if (v6 <= 1)
        v7 = 1;
      else
        v7 = v6;
    }
    else
    {
      v7 = 1;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_cachedPressCount;
    self->_cachedPressCount = v8;

    cachedPressCount = self->_cachedPressCount;
  }
  return -[NSNumber integerValue](cachedPressCount, "integerValue");
}

- (unint64_t)context
{
  NSNumber *cachedContext;
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  NSNumber *v6;
  NSNumber *v7;

  cachedContext = self->_cachedContext;
  if (!cachedContext)
  {
    -[VOSCommandResolver fetchContextBlock](self, "fetchContextBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[VOSCommandResolver fetchContextBlock](self, "fetchContextBlock");
      v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4 = (void *)((uint64_t (**)(_QWORD, VOSCommandResolver *))v5)[2](v5, self);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedContext;
    self->_cachedContext = v6;

    cachedContext = self->_cachedContext;
  }
  return -[NSNumber unsignedIntegerValue](cachedContext, "unsignedIntegerValue");
}

- (void)setFetchContextBlock:(id)a3
{
  void *v4;
  id fetchContextBlock;
  NSNumber *cachedContext;

  if (self->_fetchContextBlock != a3)
  {
    _Block_copy(a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    fetchContextBlock = self->_fetchContextBlock;
    self->_fetchContextBlock = v4;

    cachedContext = self->_cachedContext;
    self->_cachedContext = 0;

  }
}

- (void)setFetchPressCountBlock:(id)a3
{
  void *v4;
  id fetchPressCountBlock;
  NSNumber *cachedPressCount;

  if (self->_fetchPressCountBlock != a3)
  {
    _Block_copy(a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    fetchPressCountBlock = self->_fetchPressCountBlock;
    self->_fetchPressCountBlock = v4;

    cachedPressCount = self->_cachedPressCount;
    self->_cachedPressCount = 0;

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VOSCommandResolver host](self, "host");
  -[VOSCommandResolver screenreaderMode](self, "screenreaderMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> Host:%d SCRMode:%@ ApplyRTL:%d BSI:%d pressCount:%d"), v5, self, v6, v7, -[VOSCommandResolver shouldApplyRTL](self, "shouldApplyRTL"), -[VOSCommandResolver bsiTypingMode](self, "bsiTypingMode"), -[VOSCommandResolver pressCount](self, "pressCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VOSCommandResolver *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(VOSCommandResolver);
  -[VOSCommandResolver screenreaderMode](self, "screenreaderMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandResolver setScreenreaderMode:](v4, "setScreenreaderMode:", v5);

  -[VOSCommandResolver setShouldApplyRTL:](v4, "setShouldApplyRTL:", -[VOSCommandResolver shouldApplyRTL](self, "shouldApplyRTL"));
  -[VOSCommandResolver setKeyboardMode:](v4, "setKeyboardMode:", -[VOSCommandResolver keyboardMode](self, "keyboardMode"));
  -[VOSCommandResolver setHost:](v4, "setHost:", -[VOSCommandResolver host](self, "host"));
  -[VOSCommandResolver setBsiTypingMode:](v4, "setBsiTypingMode:", -[VOSCommandResolver bsiTypingMode](self, "bsiTypingMode"));
  -[VOSCommandResolver fetchPressCountBlock](self, "fetchPressCountBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandResolver setFetchPressCountBlock:](v4, "setFetchPressCountBlock:", v6);

  -[VOSCommandResolver fetchContextBlock](self, "fetchContextBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandResolver setFetchContextBlock:](v4, "setFetchContextBlock:", v7);

  -[VOSCommandResolver resolvingEventOccurredBlock](self, "resolvingEventOccurredBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommandResolver setResolvingEventOccurredBlock:](v4, "setResolvingEventOccurredBlock:", v8);

  return v4;
}

- (void)setScreenreaderMode:(id)a3
{
  objc_storeStrong((id *)&self->_screenreaderMode, a3);
}

- (BOOL)shouldApplyRTL
{
  return self->_shouldApplyRTL;
}

- (void)setShouldApplyRTL:(BOOL)a3
{
  self->_shouldApplyRTL = a3;
}

- (unint64_t)keyboardMode
{
  return self->_keyboardMode;
}

- (void)setKeyboardMode:(unint64_t)a3
{
  self->_keyboardMode = a3;
}

- (unint64_t)host
{
  return self->_host;
}

- (void)setHost:(unint64_t)a3
{
  self->_host = a3;
}

- (unint64_t)bsiTypingMode
{
  return self->_bsiTypingMode;
}

- (void)setBsiTypingMode:(unint64_t)a3
{
  self->_bsiTypingMode = a3;
}

- (id)fetchPressCountBlock
{
  return self->_fetchPressCountBlock;
}

- (id)fetchContextBlock
{
  return self->_fetchContextBlock;
}

- (id)resolvingEventOccurredBlock
{
  return self->_resolvingEventOccurredBlock;
}

- (void)setResolvingEventOccurredBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resolvingEventOccurredBlock, 0);
  objc_storeStrong(&self->_fetchContextBlock, 0);
  objc_storeStrong(&self->_fetchPressCountBlock, 0);
  objc_storeStrong((id *)&self->_screenreaderMode, 0);
  objc_storeStrong((id *)&self->_cachedContext, 0);
  objc_storeStrong((id *)&self->_cachedPressCount, 0);
}

@end
