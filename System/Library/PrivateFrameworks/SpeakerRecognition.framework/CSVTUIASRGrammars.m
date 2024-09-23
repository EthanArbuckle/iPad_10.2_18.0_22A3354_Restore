@implementation CSVTUIASRGrammars

- (CSVTUIASRGrammars)init
{
  CSVTUIASRGrammars *v2;
  CSVTUIASRGrammars *v3;
  uint64_t v4;
  NSDictionary *grammar;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSVTUIASRGrammars;
  v2 = -[CSVTUIASRGrammars init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSVTUIASRGrammars createGrammars](v2, "createGrammars");
    v4 = objc_claimAutoreleasedReturnValue();
    grammar = v3->_grammar;
    v3->_grammar = (NSDictionary *)v4;

  }
  return v3;
}

- (id)createGrammars
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("regex.json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileExistsAtPath:", v6))
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v11;

    if (v9)
      NSLog(CFSTR("Cannot parse to JSON"));

    v2 = (id)v8;
  }
  else
  {
    NSLog(CFSTR("Cannot find the file"));
  }

  return v2;
}

- (id)getTrailingPatternsForUtt:(int64_t)a3 Locale:(id)a4
{
  void *v5;

  v5 = 0;
  if (a4 && self->_grammar)
  {
    -[CSVTUIASRGrammars _getTrailingPatternsWithGrammars:withLocale:](self, "_getTrailingPatternsWithGrammars:withLocale:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_getTrailingPatternsWithGrammars:(id)a3 withLocale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("trailing_garbage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "objectForKey:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("trailing_garbage"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)getLeadingPatternsForUtt:(int64_t)a3 Locale:(id)a4
{
  void *v5;

  v5 = 0;
  if (a4 && self->_grammar)
  {
    -[CSVTUIASRGrammars _getLeadingPatternsWithGrammars:withLocale:](self, "_getLeadingPatternsWithGrammars:withLocale:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_getLeadingPatternsWithGrammars:(id)a3 withLocale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("leading_garbage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "objectForKey:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("leading_garbage"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)getRegexPatternsForUtt:(int64_t)a3 Locale:(id)a4
{
  void *v6;
  NSDictionary *grammar;

  v6 = 0;
  if (a4)
  {
    grammar = self->_grammar;
    if (grammar)
    {
      -[CSVTUIASRGrammars _getRegexPatternsWithGrammars:withUtt:withLocale:](self, "_getRegexPatternsWithGrammars:withUtt:withLocale:", grammar, a3, a4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6;
}

- (id)_getRegexPatternsWithGrammars:(id)a3 withUtt:(int64_t)a4 withLocale:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend(v7, "objectForKey:", v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "objectForKey:", CFSTR("regex")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    objc_msgSend(v7, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("regex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && objc_msgSend(v13, "count") >= a4)
    {
      objc_msgSend(v13, "objectAtIndex:", a4 - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)getLMEforLocale:(id)a3
{
  void *v4;
  NSDictionary *grammar;

  v4 = 0;
  if (a3)
  {
    grammar = self->_grammar;
    if (grammar)
    {
      -[CSVTUIASRGrammars _getLMEWithGrammar:withLocale:](self, "_getLMEWithGrammar:withLocale:", grammar, a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (id)_getLMEWithGrammar:(id)a3 withLocale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("lme"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "objectForKey:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("lme"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grammar, 0);
}

+ (id)sharedGrammars
{
  if (sharedGrammars_onceToken != -1)
    dispatch_once(&sharedGrammars_onceToken, &__block_literal_global_7670);
  return (id)sharedGrammars_sharedGammars;
}

void __35__CSVTUIASRGrammars_sharedGrammars__block_invoke()
{
  CSVTUIASRGrammars *v0;
  void *v1;

  v0 = objc_alloc_init(CSVTUIASRGrammars);
  v1 = (void *)sharedGrammars_sharedGammars;
  sharedGrammars_sharedGammars = (uint64_t)v0;

}

@end
