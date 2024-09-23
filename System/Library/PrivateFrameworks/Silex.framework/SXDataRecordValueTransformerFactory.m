@implementation SXDataRecordValueTransformerFactory

- (SXDataRecordValueTransformerFactory)initWithDOMObjectProvider:(id)a3
{
  id v5;
  SXDataRecordValueTransformerFactory *v6;
  SXDataRecordValueTransformerFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXDataRecordValueTransformerFactory;
  v6 = -[SXDataRecordValueTransformerFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_DOMObjectProvider, a3);

  return v7;
}

- (id)recordValueTransformerForDataDescriptor:(id)a3
{
  __objc2_class *v4;
  SXImageRecordValueTransformer *v5;
  SXImageRecordValueTransformer *v6;
  void *v7;

  switch(objc_msgSend(a3, "dataType"))
  {
    case 1:
    case 2:
      v4 = SXStringRecordValueTransformer;
      goto LABEL_8;
    case 3:
      v4 = SXNumberRecordValueTransformer;
      goto LABEL_8;
    case 4:
      v4 = SXIntegerRecordValueTransformer;
      goto LABEL_8;
    case 5:
      v4 = SXFloatRecordValueTransformer;
LABEL_8:
      v5 = (SXImageRecordValueTransformer *)objc_alloc_init(v4);
      break;
    case 6:
      v6 = [SXImageRecordValueTransformer alloc];
      -[SXDataRecordValueTransformerFactory DOMObjectProvider](self, "DOMObjectProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[SXImageRecordValueTransformer initWithDOMObjectProvider:](v6, "initWithDOMObjectProvider:", v7);

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end
