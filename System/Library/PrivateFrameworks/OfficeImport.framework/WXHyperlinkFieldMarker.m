@implementation WXHyperlinkFieldMarker

+ (void)readFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;

  v9 = a5;
  v10 = a6;
  objc_msgSend(v10, "packagePart");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OCXReadRelationshipForNode:packagePart:", a3, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "WXMainNamespace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  CXOptionalStringAttribute(a3, v13, (xmlChar *)"anchor", &v31);
  v14 = (unint64_t)v31;

  if (v12 | v14)
  {
    if (v12)
    {
      objc_msgSend((id)v12, "targetLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "scheme");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lowercaseString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v18;
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("http")) & 1) != 0
          || (objc_msgSend(v18, "isEqualToString:", CFSTR("https")) & 1) != 0
          || (objc_msgSend(v18, "isEqualToString:", CFSTR("ftp")) & 1) != 0
          || (objc_msgSend(v18, "isEqualToString:", CFSTR("mailto")) & 1) != 0
          || (objc_msgSend(v16, "isFileURL") & 1) != 0
          || (objc_msgSend(v16, "absoluteString"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v19, "rangeOfString:", CFSTR("///")),
              v21 = v20,
              v19,
              v21))
        {
          if (v14)
            v22 = (id)v14;
          objc_msgSend(v16, "absoluteString");
          v23 = 0;
          v24 = (void *)v14;
          v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v16, "fragment");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = 0;
          if (v29)
          {
            objc_msgSend(v16, "fragment");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 1;
          }
          else
          {
            objc_msgSend(v30, "isEqualToString:", CFSTR("javascript"));
            v23 = 0;
            v24 = 0;
          }
        }

      }
      else
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
      }

    }
    else if (v14)
    {
      v25 = (id)v14;
      v24 = 0;
      v23 = 1;
    }
    else
    {
      v23 = 0;
      v24 = 0;
      v25 = 0;
    }
    objc_msgSend(v9, "addHyperlinkFieldMarker:", 19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setInternalLink:", v23);
    objc_msgSend(v26, "setLink:", v25);
    objc_msgSend(v26, "setFragment:", v24);
    v27 = (id)objc_msgSend(v9, "addFieldMarker:", 20);
    +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", a3, a4, v9, 0, v10);
    v28 = (id)objc_msgSend(v9, "addHyperlinkFieldMarker:", 21);

  }
  else
  {
    +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", a3, a4, v9, 0, v10);
  }

}

@end
