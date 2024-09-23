@implementation CRLPdfTagInfo

- (CRLPdfTagInfo)initWithTagType:(int)a3 tagProperties:(id)a4
{
  id v7;
  CRLPdfTagInfo *v8;
  CRLPdfTagInfo *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLPdfTagInfo;
  v8 = -[CRLPdfTagInfo init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_tagType = a3;
    objc_storeStrong((id *)&v8->_tagProperties, a4);
  }

  return v9;
}

+ (id)tagPropertiesWithActualText:(id)a3 alternativeText:(id)a4 titleText:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_new(NSMutableDictionary);
  v11 = v10;
  if (v7)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, kCGPDFTagPropertyActualText);
  if (v8)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v8, kCGPDFTagPropertyAlternativeText);
  if (v9)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, kCGPDFTagPropertyTitleText);

  return v11;
}

- (int)tagType
{
  return self->_tagType;
}

- (NSDictionary)tagProperties
{
  return self->_tagProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagProperties, 0);
}

@end
