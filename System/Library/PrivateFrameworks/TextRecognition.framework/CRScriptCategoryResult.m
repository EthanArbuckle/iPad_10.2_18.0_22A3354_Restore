@implementation CRScriptCategoryResult

- (CRScriptCategoryResult)initWithScriptCategory:(id)a3 probability:(float)a4
{
  id v7;
  CRScriptCategoryResult *v8;
  CRScriptCategoryResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRScriptCategoryResult;
  v8 = -[CRScriptCategoryResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scriptCategory, a3);
    v9->_probability = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRScriptCategoryResult *v4;
  void *v5;
  CRScriptCategoryResult *v6;

  v4 = [CRScriptCategoryResult alloc];
  -[CRScriptCategoryResult scriptCategory](self, "scriptCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRScriptCategoryResult probability](self, "probability");
  v6 = -[CRScriptCategoryResult initWithScriptCategory:probability:](v4, "initWithScriptCategory:probability:", v5);

  return v6;
}

- (BOOL)valid
{
  float v3;
  float v4;
  void *v5;
  float v6;
  BOOL v7;

  -[CRScriptCategoryResult probability](self, "probability");
  v4 = v3;
  -[CRScriptCategoryResult scriptCategory](self, "scriptCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "confidenceThreshold");
  v7 = v4 >= v6;

  return v7;
}

- (CRScriptCategory)scriptCategory
{
  return (CRScriptCategory *)objc_getProperty(self, a2, 16, 1);
}

- (float)probability
{
  return self->_probability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptCategory, 0);
}

@end
