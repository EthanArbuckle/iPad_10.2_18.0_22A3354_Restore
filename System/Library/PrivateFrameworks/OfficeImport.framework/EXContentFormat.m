@implementation EXContentFormat

+ (id)edContentFormatFromXmlContentFormatElement:(_xmlNode *)a3
{
  id v4;
  void *v5;
  void *v6;
  id v8;
  unint64_t v9;

  if (!a3)
    return 0;
  v9 = 0;
  if (!CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"numFmtId", &v9))
    return 0;
  v8 = 0;
  CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"formatCode", &v8);
  v4 = v8;
  +[EDString edStringWithString:](EDString, "edStringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDContentFormat contentFormatWithFormatString:formatId:](EDContentFormat, "contentFormatWithFormatString:formatId:", v5, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
