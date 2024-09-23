@implementation EXProtection

+ (id)edProtectionFromXmlElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  CXNamespace *v6;
  uint64_t v7;
  void *v8;
  BOOL v10;
  BOOL v11;

  v5 = a4;
  v11 = 0;
  v10 = 1;
  if (a3)
  {
    CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"hidden", &v11);
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v7 = OCXFindChild(a3, v6, "Locked");

    if (v7)
      v10 = 0;
    else
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"locked", &v10);
  }
  +[EDProtection protectionWithHidden:locked:](EDProtection, "protectionWithHidden:locked:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
