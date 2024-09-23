@implementation SUScriptMediaItem

+ (id)copyScriptMediaTypesForNativeMediaTypes:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = 0;
  while (1)
  {
    v6 = __SUMediaTypeMapping[v5];
    if (v6 == a3)
      break;
    if ((v6 & a3) != 0)
      objc_msgSend(v4, "addObject:", __SUMediaTypeMapping[v5 + 1]);
    v5 += 2;
    if (v5 == 20)
      return v4;
  }
  objc_msgSend(v4, "removeAllObjects");
  objc_msgSend(v4, "addObject:", __SUMediaTypeMapping[v5 + 1]);
  return v4;
}

+ (unint64_t)nativeMediaTypesForScriptMediaTypes:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(a3);
      v9 = 0;
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
      while (!objc_msgSend((id)__SUMediaTypeMapping[v9 + 1], "isEqualToString:", v10))
      {
        v9 += 2;
        if (v9 == 20)
          goto LABEL_11;
      }
      v6 |= __SUMediaTypeMapping[v9];
LABEL_11:
      ;
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v5);
  return v6;
}

+ (id)scriptMediaTypeForNativeMediaType:(unint64_t)a3
{
  uint64_t v3;

  v3 = 0;
  while (__SUMediaTypeMapping[v3] != a3)
  {
    v3 += 2;
    if (v3 == 20)
      return 0;
  }
  return (id)__SUMediaTypeMapping[v3 + 1];
}

- (MPMediaItem)nativeItem
{
  return (MPMediaItem *)-[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
}

- (id)imageURLWithWidth:(id)a3 height:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__21;
  v12 = __Block_byref_object_dispose__21;
  v13 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  v4 = (void *)v9[5];
  if (v4)
    v5 = v4;
  else
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = v5;
  _Block_object_dispose(&v8, 8);
  return v6;
}

void __46__SUScriptMediaItem_imageURLWithWidth_height___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSData *v9;
  void *v10;
  uint64_t v11;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  v3 = objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BDDBC40]);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "webFrame"), "dataSource");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("itms-api:media-image/%@-%ld-%ld.png"), objc_msgSend(v4, "stringValue"), objc_msgSend(*(id *)(a1 + 40), "integerValue"), objc_msgSend(*(id *)(a1 + 48), "integerValue"));
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v6 = objc_msgSend(v5, "subresourceForURL:", v11);
    v7 = (void *)v11;
    if (!v6)
    {
      v8 = (void *)objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BDDBB20]);
      if (v8
        && (v9 = UIImagePNGRepresentation((UIImage *)objc_msgSend(v8, "imageWithSize:", (double)objc_msgSend(*(id *)(a1 + 40), "integerValue"), (double)objc_msgSend(*(id *)(a1 + 48), "integerValue")))) != 0)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA948]), "initWithData:URL:MIMEType:textEncodingName:frameName:", v9, v11, CFSTR("image/png"), 0, 0);
        objc_msgSend(v5, "addSubresource:", v10);

      }
      else
      {

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = 0;
      }
      v7 = (void *)v11;
    }

  }
}

- (id)valueForProperty:(id)a3
{
  char isKindOfClass;
  uint64_t *v4;
  id v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__21;
  v11 = __Block_byref_object_dispose__21;
  v12 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WebThreadRunOnMainThread();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend((id)v8[5], "reason"));

      v4 = v8;
      v8[5] = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v4 = v8;
  }
  v5 = (id)v4[5];
  if (!v5)
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  _Block_object_dispose(&v7, 8);
  return v5;
}

id __38__SUScriptMediaItem_valueForProperty___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "valueForProperty:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return CFSTR("iTunesMediaItem");
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_29, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaItem;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_29 = (uint64_t)sel_imageURLWithWidth_height_;
    unk_255186850 = CFSTR("imageURLForSize");
    qword_255186858 = (uint64_t)sel_valueForProperty_;
    unk_255186860 = CFSTR("valueForProperty");
  }
}

@end
