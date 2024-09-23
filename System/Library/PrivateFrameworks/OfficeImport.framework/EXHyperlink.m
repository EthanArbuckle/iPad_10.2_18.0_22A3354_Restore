@implementation EXHyperlink

+ (id)edHyperlinkFromXmlHyperlinkElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  void *v30;
  void *v32;
  char v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v5 = a4;
  if (a3)
  {
    +[EDHyperlink hyperlink](EDHyperlink, "hyperlink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentPart");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "OCXReadRelationshipForNode:packagePart:", a3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v6, "setType:", 3);
      goto LABEL_11;
    }
    objc_msgSend(v8, "targetLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      a3 = 0;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v9, "absoluteURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDString edStringWithString:](EDString, "edStringWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPath:", v13);

    objc_msgSend(v6, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "hasPrefix:", CFSTR("mailto:")) & 1) == 0)
    {
      objc_msgSend(v6, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "hasPrefix:", CFSTR("http://")) & 1) == 0)
      {
        objc_msgSend(v6, "path");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "string");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "hasPrefix:", CFSTR("https://"));

        if ((v33 & 1) == 0)
        {
          v18 = 1;
          goto LABEL_9;
        }
LABEL_8:
        v18 = 0;
LABEL_9:
        objc_msgSend(v6, "setType:", v18);

LABEL_11:
        v38 = 0;
        v19 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"ref", &v38);
        v20 = v38;
        if (v19)
        {
          +[EXReference edReferenceFromXmlReference:](EXReference, "edReferenceFromXmlReference:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setReference:", v21);

        }
        v37 = v20;
        v22 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"location", &v37);
        v23 = v37;

        if (v22)
        {
          +[EDString edStringWithString:](EDString, "edStringWithString:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setTextMark:", v24);

        }
        v36 = v23;
        v25 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"tooltip", &v36);
        v26 = v36;

        if (v25)
        {
          +[EDString edStringWithString:](EDString, "edStringWithString:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setToolTip:", v27);

        }
        v35 = v26;
        v28 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"display", &v35);
        v29 = v35;

        if (v28)
        {
          +[EDString edStringWithString:](EDString, "edStringWithString:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setDescriptionText:", v30);

        }
        a3 = v6;

        goto LABEL_21;
      }

    }
    goto LABEL_8;
  }
LABEL_22:

  return a3;
}

@end
