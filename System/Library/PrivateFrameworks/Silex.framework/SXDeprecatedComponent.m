@implementation SXDeprecatedComponent

+ (id)deprecatedComponentWithType:(uint64_t)a3 withReplacementClassificationClass:
{
  id v4;
  void *v5;

  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithType:withReplacementClassification:", v4, a3);

  return v5;
}

- (SXDeprecatedComponent)initWithType:(id)a3 withReplacementClassification:(Class)a4
{
  id v7;
  SXDeprecatedComponent *v8;
  SXDeprecatedComponent *v9;
  SXComponentClassification *v10;
  SXComponentClassification *replacementClassification;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXDeprecatedComponent;
  v8 = -[SXDeprecatedComponent init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_typeString, a3);
    v10 = (SXComponentClassification *)objc_alloc_init(a4);
    replacementClassification = v9->_replacementClassification;
    v9->_replacementClassification = v10;

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementClassification, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
}

@end
