@implementation ODXPointPropertySet

+ (void)readNode:(_xmlNode *)a3 toSet:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initFromXmlNode:ns:attributeName:", a3, 0, "loTypeId");
  objc_msgSend(v5, "setLayoutTypeId:", v6);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initFromXmlNode:ns:attributeName:", a3, 0, "presName");
  objc_msgSend(v5, "setPresentationName:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initFromXmlNode:ns:attributeName:", a3, 0, "presStyleLbl");
  objc_msgSend(v5, "setPresentationStyleLabel:", v8);
  v12 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"presStyleIdx", &v12))
    objc_msgSend(v5, "setPresentationStyleIndex:", v12);
  v11 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"presStyleCnt", &v11))
    objc_msgSend(v5, "setPresentationStyleCount:", v11);
  +[ODXData readModelIdentifierFromNode:attributeName:](ODXData, "readModelIdentifierFromNode:attributeName:", a3, "presAssocID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentationAssociatedId:", v9);

  v10 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"custFlipVert", &v10))
    objc_msgSend(v5, "setCustomVerticalFlip:", v10);

}

@end
