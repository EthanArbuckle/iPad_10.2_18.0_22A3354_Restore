@implementation SCMLImageSanitization

- (SCMLImageSanitization)initWithGranularOutput:(BOOL)a3
{
  _BOOL4 v3;
  SCMLImageSanitization *v4;
  SCMLImageSanitization *v5;
  uint64_t v6;
  NSMutableDictionary *signals;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCMLImageSanitization;
  v4 = -[SCMLImageSanitization init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_safe = 1;
    if (v3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
      signals = v5->_signals;
      v5->_signals = (NSMutableDictionary *)v6;
    }
    else
    {
      signals = v4->_signals;
      v4->_signals = 0;
    }

    v5->_granularOutput = v3;
  }
  return v5;
}

- (id)unsafeReason
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[SCMLImageLabelCoder instance](SCMLImageLabelCoder, "instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_signals;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_signals, "objectForKeyedSubscript:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "safe") & 1) == 0)
        {
          objc_msgSend(v3, "decodeFromP1:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)description
{
  if (-[SCMLImageSanitization safe](self, "safe"))
    return CFSTR("safe");
  else
    return CFSTR("unsafe");
}

- (id)updateSignal:(id)a3 withSafe:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SCMLImageSanitizationSignal *v7;

  v4 = a4;
  v6 = a3;
  if (-[SCMLImageSanitization granularOutput](self, "granularOutput"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_signals, "objectForKeyedSubscript:", v6);
    v7 = (SCMLImageSanitizationSignal *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(SCMLImageSanitizationSignal);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_signals, "setObject:forKeyedSubscript:");
    }
    -[SCMLImageSanitizationSignal setSafe:](v7, "setSafe:", -[SCMLImageSanitizationSignal safe](v7, "safe") & v4);
  }
  else
  {
    v7 = 0;
  }
  -[SCMLImageSanitization setSafe:](self, "setSafe:", -[SCMLImageSanitization safe](self, "safe") & v4);

  return v7;
}

- (id)updateSignal:(id)a3 withSafe:(BOOL)a4 withScore:(float)a5
{
  void *v7;
  id v8;
  double v9;
  void *v10;

  -[SCMLImageSanitization updateSignal:withSafe:](self, "updateSignal:withSafe:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SCMLImageSanitization granularOutput](self, "granularOutput"))
  {
    v8 = objc_alloc(MEMORY[0x24BDD16E0]);
    *(float *)&v9 = a5;
    v10 = (void *)objc_msgSend(v8, "initWithFloat:", v9);
    objc_msgSend(v7, "setScore:", v10);

  }
  return v7;
}

- (BOOL)safe
{
  return self->_safe;
}

- (void)setSafe:(BOOL)a3
{
  self->_safe = a3;
}

- (BOOL)granularOutput
{
  return self->_granularOutput;
}

- (void)setGranularOutput:(BOOL)a3
{
  self->_granularOutput = a3;
}

- (NSMutableDictionary)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signals, 0);
}

@end
