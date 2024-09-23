@implementation REHTMLElement

- (REHTMLElement)init
{
  REHTMLElement *v2;
  REHTMLElement *v3;
  NSData *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REHTMLElement;
  v2 = -[REHTMLElement init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    data = v2->_data;
    v2->_data = 0;

  }
  return v3;
}

+ (id)elementWithHTMLData:(id)a3
{
  id v3;
  REHTMLDataElement *v4;

  v3 = a3;
  v4 = -[REHTMLDataElement initWithData:]([REHTMLDataElement alloc], "initWithData:", v3);

  return v4;
}

+ (id)elementWithHTMLString:(id)a3
{
  id v3;
  REHTMLConstantElement *v4;

  v3 = a3;
  v4 = -[REHTMLConstantElement initWithContent:]([REHTMLConstantElement alloc], "initWithContent:", v3);

  return v4;
}

+ (id)htmlElementWithTag:(id)a3 content:(id)a4
{
  id v5;
  id v6;
  REHTMLTagElement *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[REHTMLTagElement initWithTag:content:]([REHTMLTagElement alloc], "initWithTag:content:", v6, v5);

  return v7;
}

+ (id)link:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  if (a4)
    v5 = a4;
  else
    v5 = a3;
  v6 = a3;
  objc_msgSend(a1, "htmlElementWithTag:content:", CFSTR("a"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "elementByAddingAtttibute:value:", CFSTR("href"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)div
{
  return (id)objc_msgSend(a1, "htmlElementWithTag:content:", CFSTR("div"), &stru_24CF92178);
}

+ (id)script:(id)a3
{
  return (id)objc_msgSend(a1, "htmlElementWithTag:content:", CFSTR("script"), a3);
}

+ (id)nav
{
  return (id)objc_msgSend(a1, "htmlElementWithTag:content:", CFSTR("nav"), &stru_24CF92178);
}

+ (id)h1:(id)a3
{
  return (id)objc_msgSend(a1, "htmlElementWithTag:content:", CFSTR("h1"), a3);
}

+ (id)h2:(id)a3
{
  return (id)objc_msgSend(a1, "htmlElementWithTag:content:", CFSTR("h2"), a3);
}

+ (id)h3:(id)a3
{
  return (id)objc_msgSend(a1, "htmlElementWithTag:content:", CFSTR("h3"), a3);
}

+ (id)h4:(id)a3
{
  return (id)objc_msgSend(a1, "htmlElementWithTag:content:", CFSTR("h4"), a3);
}

+ (id)h5:(id)a3
{
  return (id)objc_msgSend(a1, "htmlElementWithTag:content:", CFSTR("h5"), a3);
}

+ (id)h6:(id)a3
{
  return (id)objc_msgSend(a1, "htmlElementWithTag:content:", CFSTR("h6"), a3);
}

- (id)_prefixContentString
{
  return &stru_24CF92178;
}

- (id)_contentString
{
  return &stru_24CF92178;
}

- (id)_suffixContentString
{
  return &stru_24CF92178;
}

+ (unint64_t)_defaultStringEncoding
{
  return 4;
}

- (id)_encodeString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "dataUsingEncoding:", objc_msgSend((id)objc_opt_class(), "_defaultStringEncoding"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_encodedData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTMLElement _prefixContentString](self, "_prefixContentString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTMLElement _encodeString:](self, "_encodeString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "appendData:", v5);
  -[REHTMLElement _contentString](self, "_contentString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTMLElement _encodeString:](self, "_encodeString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "appendData:", v7);
  -[REHTMLElement _suffixContentString](self, "_suffixContentString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTMLElement _encodeString:](self, "_encodeString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "appendData:", v9);
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (NSData)encodedData
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__26;
  v17 = __Block_byref_object_dispose__26;
  v18 = 0;
  v3 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __28__REHTMLElement_encodedData__block_invoke;
  v12[3] = &unk_24CF8C1C8;
  v12[4] = self;
  v12[5] = &v13;
  REHTMLElementAccessLock(v12);
  v4 = (void *)v14[5];
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[REHTMLElement _encodedData](self, "_encodedData");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v14[5];
    v14[5] = v6;

    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __28__REHTMLElement_encodedData__block_invoke_2;
    v11[3] = &unk_24CF8C1F0;
    v11[4] = self;
    v11[5] = &v13;
    REHTMLElementAccessLock(v11);
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    v9 = (void *)objc_msgSend(v8, "initWithData:encoding:", v14[5], 4);
    objc_msgSend(v9, "length");
    v5 = (id)v14[5];

  }
  _Block_object_dispose(&v13, 8);

  return (NSData *)v5;
}

void __28__REHTMLElement_encodedData__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

void __28__REHTMLElement_encodedData__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (NSArray)classes
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (id)elementByAddingClass:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REHTMLElement elementByAddingClasses:](self, "elementByAddingClasses:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)elementByAddingClasses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[REHTMLElement classes](self, "classes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REHTMLElement elementBySettingClasses:](self, "elementBySettingClasses:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
}

- (id)elementByAddingAtttibute:(id)a3 value:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[REHTMLElement elementByAddingAtttibutes:](self, "elementByAddingAtttibutes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)elementByAddingAtttibutes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[REHTMLElement attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setValuesForKeysWithDictionary:", v4);
  v7 = (void *)objc_msgSend(v6, "copy");
  -[REHTMLElement elementBySettingAtttibutes:](self, "elementBySettingAtttibutes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)append:(id)a3
{
  id v4;
  REHTMLContainerElement *v5;
  void *v6;
  REHTMLContainerElement *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return self;
  v4 = a3;
  v5 = [REHTMLContainerElement alloc];
  v9[0] = self;
  v9[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[REHTMLContainerElement initWithElements:](v5, "initWithElements:", v6);
  return v7;
}

- (id)addChild:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return self;
  v9 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REHTMLElement addChildren:](self, "addChildren:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)addChildren:(id)a3
{
  id v4;
  REHTMLParentElement *v5;
  REHTMLParentElement *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    v5 = -[REHTMLParentElement initWithParents:children:]([REHTMLParentElement alloc], "initWithParents:children:", self, v4);
  else
    v5 = self;
  v6 = v5;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
