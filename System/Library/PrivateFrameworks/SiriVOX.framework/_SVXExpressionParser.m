@implementation _SVXExpressionParser

- (_SVXExpressionParser)initWithParsingService:(id)a3 preferences:(id)a4
{
  id v8;
  id v9;
  void *v10;
  _SVXExpressionParser *v11;
  _SVXExpressionParser *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SVXExpressionParser.m"), 14, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parsingService != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SVXExpressionParser.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferences != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)_SVXExpressionParser;
  v11 = -[_SVXExpressionParser init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_parsingService, a3);
    objc_storeStrong((id *)&v12->_preferences, a4);
  }

  return v12;
}

- (SVXExpressionParsingServing)parsingService
{
  return self->_parsingService;
}

- (AFPreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_parsingService, 0);
}

@end
