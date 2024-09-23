@implementation SXImageRecordValueTransformer

- (SXImageRecordValueTransformer)initWithDOMObjectProvider:(id)a3
{
  id v5;
  SXImageRecordValueTransformer *v6;
  SXImageRecordValueTransformer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXImageRecordValueTransformer;
  v6 = -[SXImageRecordValueTransformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_DOMObjectProvider, a3);

  return v7;
}

- (id)transformValueForRecord:(id)a3 descriptor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("imageIdentifier"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_8;
    }
    v10 = v9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  -[SXImageRecordValueTransformer DOMObjectProvider](self, "DOMObjectProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageResourceForIdentifier:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
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
