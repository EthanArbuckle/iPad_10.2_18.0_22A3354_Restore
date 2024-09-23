@implementation CMFrameUtils

+ (id)copyFramesetPageForDocument:(id)a3 navPage:(id)a4 firstPage:(id)a5
{
  return (id)objc_msgSend(a1, "copyFramesetPageForDocument:navPage:firstPage:isOnTop:", a3, a4, a5, 1);
}

+ (id)copyFramesetPageForDocument:(id)a3 navPage:(id)a4 firstPage:(id)a5 isOnTop:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  OIXMLElement *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  OIXMLElement *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  OIXMLElement *v29;

  v6 = a6;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "pageSizeForDevice");
  v12 = v11;
  v13 = +[CMXmlUtils copyXhtmlDocument](CMXmlUtils, "copyXhtmlDocument");
  objc_msgSend(v9, "documentTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[CMXmlUtils copyHeadElementWithTitle:deviceWidth:](CMXmlUtils, "copyHeadElementWithTitle:deviceWidth:", v14, (int)v12);

  objc_msgSend(v13, "rootElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addChild:", v15);

  v17 = (void *)objc_msgSend(a1, "copyFramesetElement:isOnTop:", 18, v6);
  objc_msgSend(v13, "rootElement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addChild:", v17);

  v19 = -[OIXMLElement initWithType:stringValue:]([OIXMLElement alloc], "initWithType:stringValue:", 4, 0);
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("src"), v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v19, "addAttribute:", v20);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("name"), CFSTR("content"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v19, "addAttribute:", v21);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("marginwidth"), CFSTR("0"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v19, "addAttribute:", v22);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("marginheight"), CFSTR("0"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v19, "addAttribute:", v23);

  v24 = -[OIXMLElement initWithType:stringValue:]([OIXMLElement alloc], "initWithType:stringValue:", 4, 0);
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("src"), v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v24, "addAttribute:", v25);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("name"), CFSTR("content"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v24, "addAttribute:", v26);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("marginwidth"), CFSTR("0"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v24, "addAttribute:", v27);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("marginheight"), CFSTR("0"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v24, "addAttribute:", v28);

  if (v6)
  {
    objc_msgSend(v17, "addChild:", v24);
    v29 = v19;
  }
  else
  {
    objc_msgSend(v17, "addChild:", v19);
    v29 = v24;
  }
  objc_msgSend(v17, "addChild:", v29);

  return v13;
}

+ (id)copyFramesetElement:(int)a3 isOnTop:(BOOL)a4
{
  const __CFString *v4;
  void *v5;
  OIXMLElement *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = CFSTR("*,%d");
  if (a4)
    v4 = CFSTR("%d,*");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v4, *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[OIXMLElement initWithType:stringValue:]([OIXMLElement alloc], "initWithType:stringValue:", 5, 0);
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("rows"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v6, "addAttribute:", v7);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("width"), CFSTR("0"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v6, "addAttribute:", v8);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("frameborder"), CFSTR("no"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v6, "addAttribute:", v9);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("framespacing"), CFSTR("0"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v6, "addAttribute:", v10);

  return v6;
}

@end
