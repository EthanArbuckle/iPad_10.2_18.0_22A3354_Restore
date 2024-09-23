@implementation VITextLookupQuery

- (VITextLookupQuery)initWithQueryTerm:(id)a3 domain:(id)a4 textContext:(id)a5 imageContext:(id)a6 annotation:(id)a7 queryContext:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  VITextContext *v20;
  VITextContext *v21;
  VITextLookupQuery *v22;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = [VITextContext alloc];
  v21 = -[VITextContext initWithSurroundingText:normalizedBoundingBoxes:](v20, "initWithSurroundingText:normalizedBoundingBoxes:", v17, MEMORY[0x1E0C9AA60]);

  v22 = -[VITextLookupQuery initWithQueryTerm:hintDomain:textContext:imageContext:annotation:queryContext:](self, "initWithQueryTerm:hintDomain:textContext:imageContext:annotation:queryContext:", v19, v18, v21, v16, v15, v14);
  return v22;
}

- (VITextLookupQuery)initWithQueryTerm:(id)a3 hintDomain:(id)a4 textContext:(id)a5 imageContext:(id)a6 annotation:(id)a7 queryContext:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  VITextLookupQuery *v20;
  uint64_t v21;
  NSString *queryTerm;
  uint64_t v23;
  VITextContext *textContext;
  uint64_t v25;
  NSString *hintDomain;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)VITextLookupQuery;
  v20 = -[VITextLookupQuery init](&v28, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    queryTerm = v20->_queryTerm;
    v20->_queryTerm = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    textContext = v20->_textContext;
    v20->_textContext = (VITextContext *)v23;

    v25 = objc_msgSend(v15, "copy");
    hintDomain = v20->_hintDomain;
    v20->_hintDomain = (NSString *)v25;

    objc_storeStrong((id *)&v20->_imageContext, a6);
    objc_storeStrong((id *)&v20->_annotation, a7);
    objc_storeStrong((id *)&v20->_queryContext, a8);
  }

  return v20;
}

- (NSString)queryTerm
{
  return self->_queryTerm;
}

- (VITextContext)textContext
{
  return self->_textContext;
}

- (NSString)hintDomain
{
  return self->_hintDomain;
}

- (VIImageContent)imageContext
{
  return self->_imageContext;
}

- (VIAnnotation)annotation
{
  return self->_annotation;
}

- (VIQueryContext)queryContext
{
  return self->_queryContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_imageContext, 0);
  objc_storeStrong((id *)&self->_hintDomain, 0);
  objc_storeStrong((id *)&self->_textContext, 0);
  objc_storeStrong((id *)&self->_queryTerm, 0);
}

@end
