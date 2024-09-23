@implementation WBSScribbleQuirksManager

- (WBSScribbleQuirksManager)init
{
  WBSScribbleQuirksManager *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSDictionary *quirksDictionary;
  WBSScribbleQuirksManager *v8;
  WBSScribbleQuirksManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WBSScribbleQuirksManager;
  v2 = -[WBSScribbleQuirksManager init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("ScribbleQuirks"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithPropertyListData:options:", v5, 0);
        v6 = objc_claimAutoreleasedReturnValue();
        quirksDictionary = v2->_quirksDictionary;
        v2->_quirksDictionary = (NSDictionary *)v6;

      }
      v8 = v2;

    }
    else
    {
      v9 = v2;
    }

  }
  return v2;
}

- (id)quirksForHighLevelDomain:(id)a3
{
  id v4;
  WBSScribbleQuirks *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[NSDictionary count](self->_quirksDictionary, "count") && objc_msgSend(v4, "length"))
  {
    v5 = -[WBSScribbleQuirks initWithHighLevelDomain:]([WBSScribbleQuirks alloc], "initWithHighLevelDomain:", v4);
    -[NSDictionary objectForKeyedSubscript:](self->_quirksDictionary, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_numberForKey:", CFSTR("shouldIgnorePointerEventsNone"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSScribbleQuirks setShouldIgnorePointerEventsNone:](v5, "setShouldIgnorePointerEventsNone:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quirksDictionary, 0);
}

@end
