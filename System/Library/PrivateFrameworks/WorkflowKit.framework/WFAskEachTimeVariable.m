@implementation WFAskEachTimeVariable

- (WFAskEachTimeVariable)init
{
  return -[WFAskEachTimeVariable initWithPrompt:collectionFilter:](self, "initWithPrompt:collectionFilter:", 0, 0);
}

- (WFAskEachTimeVariable)initWithPrompt:(id)a3
{
  return -[WFAskEachTimeVariable initWithPrompt:collectionFilter:](self, "initWithPrompt:collectionFilter:", a3, 0);
}

- (WFAskEachTimeVariable)initWithCollectionFilter:(id)a3
{
  return -[WFAskEachTimeVariable initWithPrompt:collectionFilter:](self, "initWithPrompt:collectionFilter:", 0, a3);
}

- (WFAskEachTimeVariable)initWithPrompt:(id)a3 collectionFilter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFAskEachTimeVariable *v12;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length"))
  {
    v8 = 0;
    if (v7)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v8 = (void *)objc_msgSend(v6, "copy");
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = (void *)objc_msgSend(v7, "copy");
LABEL_6:
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setValue:forKey:", v8, CFSTR("Prompt"));
  objc_msgSend(v9, "serializableRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("CollectionFilter"));

  v12 = -[WFVariable initWithDictionary:variableProvider:](self, "initWithDictionary:variableProvider:", v10, 0);
  return v12;
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  getWFGeneralLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315138;
    v7 = "-[WFAskEachTimeVariable retrieveContentCollectionWithVariableSource:completionHandler:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_FAULT, "%s Ask Each Time variable unexpectedly asked for content", (uint8_t *)&v6, 0xCu);
  }

  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
}

- (NSString)prompt
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  -[WFVariable dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Prompt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (WFDisambiguationCollectionFilter)collectionFilter
{
  WFDisambiguationCollectionFilter *collectionFilter;
  void *v4;
  void *v5;
  WFDisambiguationCollectionFilter *v6;
  WFDisambiguationCollectionFilter *v7;

  collectionFilter = self->_collectionFilter;
  if (!collectionFilter)
  {
    -[WFVariable dictionary](self, "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("CollectionFilter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = (WFDisambiguationCollectionFilter *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF8]), "initWithSerializedRepresentation:", v5);
        v7 = self->_collectionFilter;
        self->_collectionFilter = v6;

      }
    }

    collectionFilter = self->_collectionFilter;
  }
  return collectionFilter;
}

- (id)icon
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0DC7DB0]);
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithSystemColor:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B68], "clearBackground");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithSymbolName:symbolColor:background:", CFSTR("text.bubble"), v3, v4);

  return v5;
}

- (id)name
{
  return WFLocalizedString(CFSTR("Ask Each Time"));
}

- (BOOL)isAvailable
{
  return 1;
}

- (BOOL)supportsAggrandizements
{
  return 0;
}

- (BOOL)requiresModernVariableSupport
{
  return 0;
}

- (void)setCollectionFilter:(id)a3
{
  objc_storeStrong((id *)&self->_collectionFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionFilter, 0);
}

@end
