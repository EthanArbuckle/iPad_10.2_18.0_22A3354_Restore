@implementation SAMLBaseElement

+ (id)createElement:(id *)a3
{
  if (a3)
  {
    SAMLParserErrorForErrorCode(201);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (SAMLBaseElement)initWithNode:(_xmlNode *)a3 doc:(_xmlDoc *)a4 query:(id)a5 error:(id *)a6
{
  SAMLBaseElement *v6;
  SAMLBaseElement *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SAMLBaseElement;
  v6 = -[XMLWrapperElement initWithNode:doc:query:error:](&v9, sel_initWithNode_doc_query_error_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
    -[SAMLBaseElement setElementProperties](v6, "setElementProperties");
  return v7;
}

@end
