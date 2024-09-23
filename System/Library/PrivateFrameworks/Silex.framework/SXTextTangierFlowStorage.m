@implementation SXTextTangierFlowStorage

- (SXTextTangierFlowStorage)initWithContext:(id)a3 string:(id)a4 stylesheet:(id)a5 kind:(int)a6 flowName:(id)a7
{
  uint64_t v8;
  id v13;
  SXTextTangierFlowStorage *v14;
  SXTextTangierFlowStorage *v15;
  objc_super v17;

  v8 = *(_QWORD *)&a6;
  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SXTextTangierFlowStorage;
  v14 = -[TSWPStorage initWithContext:string:stylesheet:kind:](&v17, sel_initWithContext_string_stylesheet_kind_, a3, a4, a5, v8);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_flowName, a7);

  return v15;
}

- (NSString)flowName
{
  return self->_flowName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowName, 0);
}

@end
