@implementation PXComment

+ (void)readComments:(id)a3 slide:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  _xmlDoc *v9;
  xmlNodePtr v10;
  _xmlNode *v11;
  _xmlNode *Child;
  PDComment *v13;
  _xmlAttr *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  _xmlNode *v24;
  int v25;
  _xmlNode *v26;
  _xmlNode *v27;
  _xmlNode *v28;
  void *v29;
  _xmlNode *v30;
  _xmlNode *v31;
  _xmlNode *v32;
  _xmlAttr *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v39 = a3;
  v44 = a4;
  v7 = a5;
  objc_msgSend(v7, "PXPresentationMLNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = (_xmlDoc *)objc_msgSend(v39, "xmlDocument");
  if (!v9)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v10 = OCXGetRootElement(v9);
  v11 = v10;
  if (!v10 || !xmlStrEqual(v10->name, (const xmlChar *)"cmLst"))
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage, v39);
  Child = (_xmlNode *)OCXFindChild(v11, v8, "cm");
  v43 = v7;
  while (Child)
  {
    v13 = objc_alloc_init(PDComment);
    v14 = CXRequiredUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"authorId");
    objc_msgSend(v7, "commentAuthorIdToIndexMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PDComment setAuthorId:](v13, "setAuthorId:", objc_msgSend(v17, "unsignedIntValue"));
    -[PDComment setIndex:](v13, "setIndex:", CXRequiredUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx") - 1);
    CXDefaultStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"dt", 0);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      CXDateForISO8601WithString(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDComment setDate:](v13, "setDate:", v20);

    }
    v21 = OCXFindChild(Child, v8, "text");
    if (v21)
    {
      v22 = *(_QWORD *)(v21 + 24);
      if (v22 && *(_QWORD *)(v22 + 80))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "tc_stringWithXmlString:");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = &stru_24F3BFFF8;
      }
    }
    else
    {
      v23 = &stru_24F3BFFF8;
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    }
    -[PDComment setText:](v13, "setText:", v23, v39);
    v24 = (_xmlNode *)OCXFindChild(Child, v8, "pos");
    if (!v24)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    v25 = CXDefaultLongAttribute(v24, (CXNamespace *)CXNoNamespace, (xmlChar *)"x", 0, 12);
    -[PDComment setPosition:](v13, "setPosition:", (double)v25 * 0.125, (double)(int)CXDefaultLongAttribute(v24, (CXNamespace *)CXNoNamespace, (xmlChar *)"y", 0, 12) * 0.125);
    v26 = (_xmlNode *)OCXFindChild(Child, v8, "extLst");
    if (v26)
    {
      v27 = (_xmlNode *)OCXFindChild(v26, v8, "ext");
      v28 = v27;
      if (v27)
      {
        CXRequiredStringAttribute(v27, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(CFSTR("{C676402C-5697-4E1C-873F-D02D1690AC5C}"), "isEqualToString:", v29))
        {
          v30 = (_xmlNode *)OCXFindChild(v28, (CXNamespace *)PXPowerPoint2012Namespace, "threadingInfo");
          if (v30)
          {
            v31 = (_xmlNode *)OCXFindChild(v30, (CXNamespace *)PXPowerPoint2012Namespace, "parentCm");
            v32 = v31;
            if (v31)
            {
              v33 = CXRequiredUnsignedLongAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"authorId");
              v34 = objc_opt_class();
              objc_msgSend(v43, "commentAuthorIdToIndexMap");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v33);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectForKey:", v41);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              TSUDynamicCast(v34, (uint64_t)v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v36, "unsignedIntegerValue");

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", CXRequiredUnsignedLongAttribute(v32, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx") - 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "commentForAuthorId:authorIdx:", v40, objc_msgSend(v37, "unsignedIntegerValue"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38)
                -[PDComment setParent:](v13, "setParent:", v38);

            }
          }
        }

        v7 = v43;
      }
    }
    objc_msgSend(v44, "addComment:", v13);

    Child = OCXFindNextChild(Child, v8, (xmlChar *)"cm");
  }

}

@end
