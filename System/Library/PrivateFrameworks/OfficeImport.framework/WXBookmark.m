@implementation WXBookmark

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  CXNamespace *v9;
  _xmlAttr *v10;
  void *v11;
  CXNamespace *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  v8 = v7;
  if (a3 && a3->name)
  {
    objc_msgSend(v7, "WXMainNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v10 = CXRequiredLongAttribute(a3, v9, (xmlChar *)"id");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3->name);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hasSuffix:", CFSTR("Start")))
    {
      objc_msgSend(v8, "WXMainNamespace");
      v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      CXRequiredStringAttribute(a3, v12, (xmlChar *)"name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setBookmarkType:", 0);
      objc_msgSend(v14, "setName:", v13);
      if (v13)
        objc_msgSend(v8, "addBookmarkId:name:", v10, v13);
    }
    else
    {
      if (!objc_msgSend(v11, "hasSuffix:", CFSTR("End")))
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v14, "setBookmarkType:", 1);
      objc_msgSend(v8, "bookmarkName:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setName:", v13);
    }

    goto LABEL_9;
  }
LABEL_10:

}

@end
