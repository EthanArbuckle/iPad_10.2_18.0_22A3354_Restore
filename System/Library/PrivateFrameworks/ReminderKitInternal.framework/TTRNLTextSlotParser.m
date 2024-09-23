@implementation TTRNLTextSlotParser

- (TTRNLTextSlotParser)initWithLocale:(id)a3 now:(id)a4
{
  id v7;
  id v8;
  TTRNLTextSlotParser *v9;
  void *v10;
  uint64_t v11;
  TTRNLTextSlotParser *v12;
  uint64_t v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TTRNLTextSlotParser;
  v9 = -[TTRNLTextSlotParser init](&v15, sel_init);
  if (!v9)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D513B0]);
  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D51320]);
  v14 = 0;
  v11 = NLTextSlotParserCreate();
  if (v11)
  {
    objc_storeStrong((id *)&v9->_locale, a3);
    v9->_parser = (void *)v11;

LABEL_6:
    v12 = v9;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[TTRNLTextSlotParser initWithLocale:now:].cold.1(&v14, (uint64_t)v7);

  v12 = 0;
LABEL_10:

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_parser);
  v3.receiver = self;
  v3.super_class = (Class)TTRNLTextSlotParser;
  -[TTRNLTextSlotParser dealloc](&v3, sel_dealloc);
}

- (id)parseString:(id)a3 referenceTimeZone:(id)a4
{
  id v6;
  id v7;
  const void *StructuredEvent;
  TTRNLTextStructuredEvent *v9;

  v6 = a4;
  v7 = a3;
  -[TTRNLTextSlotParser parser](self, "parser");
  StructuredEvent = (const void *)NLTextSlotParserCreateStructuredEvent();

  if (StructuredEvent)
  {
    v9 = -[TTRNLTextStructuredEvent initWithStructuredEvent:]([TTRNLTextStructuredEvent alloc], "initWithStructuredEvent:", StructuredEvent);
    CFRelease(StructuredEvent);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void)parser
{
  return self->_parser;
}

- (void)setParser:(void *)a3
{
  self->_parser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)initWithLocale:(uint64_t *)a1 now:(uint64_t)a2 .cold.1(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412546;
  v4 = v2;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A442D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot create NLTextSlotParser {error: %@, locale: %@}", (uint8_t *)&v3, 0x16u);
}

@end
