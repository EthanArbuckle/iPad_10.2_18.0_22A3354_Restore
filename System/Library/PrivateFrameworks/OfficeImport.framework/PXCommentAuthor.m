@implementation PXCommentAuthor

+ (void)readCommentAuthors:(id)a3 presentation:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  _xmlDoc *v9;
  xmlNodePtr v10;
  _xmlNode *v11;
  CXNamespace *v12;
  _xmlNode *Child;
  PDCommentAuthor *v14;
  _xmlAttr *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CXNamespace *v22;
  id v23;

  v23 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (_xmlDoc *)objc_msgSend(v23, "xmlDocument");
  if (!v9)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v10 = OCXGetRootElement(v9);
  v11 = v10;
  if (!v10 || !xmlStrEqual(v10->name, (const xmlChar *)"cmAuthorLst"))
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v8, "PXPresentationMLNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(v11, v12, "cmAuthor");

  while (Child)
  {
    v14 = objc_alloc_init(PDCommentAuthor);
    v15 = CXRequiredUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
    v16 = objc_msgSend(v7, "commentAuthorCount");
    objc_msgSend(v8, "commentAuthorIdToIndexMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v18, v19);

    -[PDCommentAuthor setId:](v14, "setId:", v16);
    CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDCommentAuthor setName:](v14, "setName:", v20);
    CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"initials");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDCommentAuthor setInitials:](v14, "setInitials:", v21);
    -[PDCommentAuthor setLastCommentIndex:](v14, "setLastCommentIndex:", CXRequiredUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"lastIdx") - 1);
    -[PDCommentAuthor setColorIndex:](v14, "setColorIndex:", CXRequiredUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"clrIdx"));
    objc_msgSend(v7, "addCommentAuthor:", v14);

    objc_msgSend(v8, "PXPresentationMLNamespace");
    v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v22, (xmlChar *)"cmAuthor");

  }
}

@end
