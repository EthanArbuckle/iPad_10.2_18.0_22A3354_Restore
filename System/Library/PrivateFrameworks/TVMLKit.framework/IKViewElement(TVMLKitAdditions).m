@implementation IKViewElement(TVMLKitAdditions)

- (uint64_t)tv_associatedViewElement
{
  return objc_msgSend(a1, "tv_associatedViewElementWithDefaultClass:", objc_opt_class());
}

- (id)tv_associatedViewElementWithDefaultClass:()TVMLKitAdditions
{
  void *v5;
  objc_class *v6;

  objc_getAssociatedObject(a1, "TVAssociatedViewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = +[TVElementFactory classForElementType:](TVElementFactory, "classForElementType:", objc_msgSend(a1, "elementType"));
    if (!v6)
      v6 = a3;
    v5 = (void *)objc_msgSend([v6 alloc], "initWithViewElement:", a1);
    objc_setAssociatedObject(a1, "TVAssociatedViewElement", v5, (void *)0x301);
  }
  return v5;
}

- (id)itemElementsOfType:()TVMLKitAdditions
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a1, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v10, "tv_elementType") == 49)
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          objc_msgSend(v10, "children");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v20 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
                if (objc_msgSend(v16, "tv_elementType") == a3)
                  objc_msgSend(v5, "addObject:", v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v13);
          }

        }
        else if (objc_msgSend(v10, "tv_elementType") == a3)
        {
          objc_msgSend(v5, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  return v5;
}

- (int64_t)tv_semanticContentAttribute
{
  void *v1;
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "appDocument");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "templateElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = +[TVMLUtilities semanticContentAttributeForTemplateElement:](TVMLUtilities, "semanticContentAttributeForTemplateElement:", v2);
  return v3;
}

- (uint64_t)tv_scaleModeWithDefaultMode:()TVMLKitAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  uint64_t v11;

  objc_msgSend(a1, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("contentsMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("aspectFit")) & 1) != 0)
    {
      a3 = 1;
      goto LABEL_12;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("aspectFill")) & 1) != 0)
    {
      a3 = 3;
      goto LABEL_12;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("aspectFitBB")) & 1) != 0)
    {
      a3 = 2;
      goto LABEL_12;
    }
    v10 = objc_msgSend(v6, "isEqualToString:", CFSTR("aspectFitHeight")) == 0;
    v11 = 4;
  }
  else
  {
    objc_msgSend(a1, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("aspectFill"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    v10 = v9 == 0;
    v11 = 3;
  }
  if (!v10)
    a3 = v11;
LABEL_12:

  return a3;
}

- (uint64_t)tv_scaleMode
{
  return objc_msgSend(a1, "tv_scaleModeWithDefaultMode:", 1);
}

- (void)tv_setParsedOnce:()TVMLKitAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("tv_parsedOnce"));

}

- (uint64_t)tv_isParsedOnce
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("tv_parsedOnce"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)tv_dispatchEvent:()TVMLKitAdditions canBubble:isCancelable:extraInfo:targetResponder:completionBlock:
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;

  v14 = a3;
  v15 = a6;
  v16 = a8;
  v17 = a7;
  objc_msgSend(a1, "appDocument");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v15;
  v19 = objc_msgSend(v18, "tv_handleEvent:targetResponder:viewElement:extraInfo:", v14, v17, a1, &v22);

  v20 = v22;
  if ((v19 & 1) != 0)
  {
    if (v16)
      (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("on%@"), v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", v14, v21, a4, a5, v20, v16);

  }
}

- (void)retrievePresentationDocumentWithResponder:()TVMLKitAdditions completionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  void *v23;
  id v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "appDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke;
  v20[3] = &unk_24EB86A98;
  v21 = v9;
  v22 = v8;
  v23 = a1;
  v11 = v6;
  v24 = v11;
  v12 = v8;
  v13 = v9;
  v14 = (void *)MEMORY[0x22767F470](v20);
  v25 = CFSTR("presentDocument");
  v15 = (void *)MEMORY[0x22767F470]();
  v26[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_4;
  v18[3] = &unk_24EB86AC0;
  v19 = v11;
  v17 = v11;
  objc_msgSend(a1, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("contextmenu"), 1, 1, v16, v7, v18);

}

@end
