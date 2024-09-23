@implementation SCMLTextSanitization

- (SCMLTextSanitization)initWithGranularOutput:(BOOL)a3
{
  _BOOL4 v3;
  SCMLTextSanitization *v4;
  SCMLTextSanitization *v5;
  NSString *violationCategory;
  uint64_t v7;
  NSMutableDictionary *signals;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCMLTextSanitization;
  v4 = -[SCMLTextSanitization init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_safe = 1;
    violationCategory = v4->_violationCategory;
    v4->_violationCategory = 0;

    v5->_adapterViolationCategory = 0;
    if (v3)
    {
      v7 = objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
      signals = v5->_signals;
      v5->_signals = (NSMutableDictionary *)v7;
    }
    else
    {
      signals = v5->_signals;
      v5->_signals = 0;
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
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[SCMLImageLabelCoder instance](SCMLImageLabelCoder, "instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_signals;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_signals, "objectForKeyedSubscript:", v9);
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
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = -[SCMLTextSanitization adapterViolationCategory](self, "adapterViolationCategory");
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%u %@"), v13, v14, (_QWORD)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)description
{
  if (-[SCMLTextSanitization safe](self, "safe"))
    return CFSTR("safe");
  else
    return CFSTR("unsafe");
}

- (id)updateSignal:(id)a3 withSafe:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SCMLTextSanitizationSignal *v7;

  v4 = a4;
  v6 = a3;
  if (-[SCMLTextSanitization granularOutput](self, "granularOutput"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_signals, "objectForKeyedSubscript:", v6);
    v7 = (SCMLTextSanitizationSignal *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(SCMLTextSanitizationSignal);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_signals, "setObject:forKeyedSubscript:");
    }
    -[SCMLTextSanitizationSignal setSafe:](v7, "setSafe:", -[SCMLTextSanitizationSignal safe](v7, "safe") & v4);
  }
  else
  {
    v7 = 0;
  }
  -[SCMLTextSanitization setSafe:](self, "setSafe:", -[SCMLTextSanitization safe](self, "safe") & v4);

  return v7;
}

- (id)updateSignal:(id)a3 withSafe:(BOOL)a4 withLabel:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a4;
  v8 = a5;
  -[SCMLTextSanitization updateSignal:withSafe:](self, "updateSignal:withSafe:", a3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SCMLTextSanitization granularOutput](self, "granularOutput"))
    objc_msgSend(v9, "setLabel:", v8);

  return v9;
}

- (id)updateSignal:(id)a3 withSafe:(BOOL)a4 withScore:(float)a5
{
  void *v7;
  id v8;
  double v9;
  void *v10;

  -[SCMLTextSanitization updateSignal:withSafe:](self, "updateSignal:withSafe:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SCMLTextSanitization granularOutput](self, "granularOutput"))
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

- (NSString)violationCategory
{
  return self->_violationCategory;
}

- (void)setViolationCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)adapterViolationCategory
{
  return self->_adapterViolationCategory;
}

- (void)setAdapterViolationCategory:(unsigned int)a3
{
  self->_adapterViolationCategory = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signals, 0);
  objc_storeStrong((id *)&self->_violationCategory, 0);
}

@end
