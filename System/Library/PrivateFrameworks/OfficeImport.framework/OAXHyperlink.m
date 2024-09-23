@implementation OAXHyperlink

+ (id)readHyperlink:(_xmlNode *)a3 state:(id)a4
{
  void *v4;
  id v6;
  OADHyperlink *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;

  v6 = a4;
  v7 = objc_alloc_init(OADHyperlink);
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"tooltip", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADHyperlink setTooltip:](v7, "setTooltip:", v8);

  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"action", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADHyperlink setAction:](v7, "setAction:", v9);

  -[OADHyperlink setDoEndSound:](v7, "setDoEndSound:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"endSnd", 0));
  -[OADHyperlink setIsVisited:](v7, "setIsVisited:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"highlightClick", 0));
  -[OADHyperlink setDoAddToHistory:](v7, "setDoAddToHistory:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"history", 1));
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"invalidUrl", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADHyperlink setInvalidUrl:](v7, "setInvalidUrl:", v10);

  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"tgtFrame", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADHyperlink setTargetFrame:](v7, "setTargetFrame:", v11);

  objc_msgSend(v6, "packagePart");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OCXReadRelationshipForNode:packagePart:", a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "targetLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scheme");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "relativePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "host");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (unint64_t)objc_msgSend(v15, "length") >= 3)
    {
      objc_msgSend(v15, "substringToIndex:", 3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 1;
      v18 = 1;
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("www")) & 1) != 0)
        goto LABEL_13;
      if (!v16)
        goto LABEL_11;
    }
    else
    {
      v17 = 0;
      if (!v16)
        goto LABEL_11;
    }
    if ((unint64_t)objc_msgSend(v16, "length") >= 3)
    {
      objc_msgSend(v16, "substringToIndex:", 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v19, "isEqualToString:", CFSTR("www"));

      if (!v17)
      {
LABEL_14:
        if (!v25 && v18)
        {
          v20 = objc_alloc(MEMORY[0x24BDBCF48]);
          if (v16)
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://%@%@"), v16, v15);
          else
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://%@"), v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v20, "initWithString:", v21);

          -[OADHyperlink setTargetLocation:](v7, "setTargetLocation:", v22);
          goto LABEL_21;
        }
LABEL_18:
        -[OADHyperlink setTargetLocation:](v7, "setTargetLocation:", v14);
LABEL_21:
        -[OADHyperlink setTargetMode:](v7, "setTargetMode:", objc_msgSend(v13, "targetMode"));
        objc_msgSend(v6, "client");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "postprocessHyperlink:relationship:state:", v7, v13, v6);

        goto LABEL_22;
      }
LABEL_13:

      goto LABEL_14;
    }
LABEL_11:
    if ((v17 & 1) == 0)
      goto LABEL_18;
    v18 = 0;
    goto LABEL_13;
  }
LABEL_22:

  return v7;
}

@end
