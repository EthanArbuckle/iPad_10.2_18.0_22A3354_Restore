@implementation WXTextBox

+ (id)readFrom:(_xmlNode *)a3 parent:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;
  CXNamespace *v12;
  _xmlNode *v13;
  WDATextBox *v14;
  WDATextBox *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  WDText *v21;
  void *v22;
  WDText *v23;
  uint64_t v24;
  WDATextBox *v25;
  void *v27;
  NSString *v28;
  id v29;

  v29 = a4;
  v7 = a5;
  objc_msgSend(v7, "wxReadState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "xmlFormat"))
  {
    v9 = [CXNamespace alloc];
    v10 = objc_msgSend((id)WXWord2006Namespace, "uri");
    objc_msgSend(v8, "WXMainNamespace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CXNamespace initWithUri:fallbackNamespace:](v9, "initWithUri:fallbackNamespace:", v10, v11);

  }
  else
  {
    objc_msgSend(v8, "WXMainNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  }
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "txbxContent");
  if (v13)
  {
    v14 = objc_alloc_init(WDATextBox);
    v15 = v14;
    if (v14)
    {
      -[WDATextBox setParent:](v14, "setParent:", v29);
      CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"style", 0);
      v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      OAVReadComposite(v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", CFSTR("mso-next-textbox"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "length"))
      {
        objc_msgSend(v16, "substringFromIndex:", 1);
        v17 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "nextVmlShapeIdToTextBoxMap");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v15, v17);

        v16 = (void *)v17;
      }
      if (OCXFirstChild(v13))
      {
        objc_msgSend(v7, "wxReadState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "currentOfficeArtTextType"))
          v20 = 7;
        else
          v20 = 6;
        v21 = [WDText alloc];
        objc_msgSend(v19, "document");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[WDText initWithDocument:textType:](v21, "initWithDocument:textType:", v22, v20);

        -[WDATextBox setText:](v15, "setText:", v23);
        v24 = objc_msgSend(v19, "isNewSectionRequested");
        objc_msgSend(v19, "setNewSectionRequested:", 0);
        +[WXText readFrom:baseStyle:to:state:](WXText, "readFrom:baseStyle:to:state:", v13, 0, v23, v19);
        objc_msgSend(v19, "setNewSectionRequested:", v24);

      }
      v25 = v15;

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)orientationForTextBodyProperties:(id)a3
{
  if (objc_msgSend(a3, "flowType") == 6)
    return CFSTR("eaVert");
  else
    return CFSTR("horz");
}

@end
