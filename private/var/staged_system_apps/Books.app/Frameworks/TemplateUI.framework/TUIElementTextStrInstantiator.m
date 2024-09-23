@implementation TUIElementTextStrInstantiator

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUITextModelBuilding;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id v16;
  TUIStringTextFragment *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  htmlParserCtxtPtr MemoryParserCtxt;
  xmlParserCtxt *v24;
  id v25;
  htmlDocPtr Memory;
  id v27;
  const xmlNode *RootElement;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  htmlDocPtr v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  TUIStringTextFragment *v41;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 102, a4.var0));
  v13 = sub_5C748(v12, (unint64_t)objc_msgSend(v9, "options"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 215, a4.var0));
  v15 = v14;
  if (!v14)
    goto LABEL_26;
  v16 = v14;
  if ((v13 & 1) == 0)
    goto LABEL_6;
  if (qword_2CB460 != -1)
    dispatch_once(&qword_2CB460, &stru_23F180);
  if (objc_msgSend(v16, "rangeOfCharacterFromSet:", qword_2CB458) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<body>%@</body>"), v16));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataUsingEncoding:", 4));
    v21 = v20;
    if (v20
      && (v22 = objc_retainAutorelease(v20),
          (MemoryParserCtxt = htmlCreateMemoryParserCtxt((const char *)objc_msgSend(v22, "bytes"), (int)objc_msgSend(v22, "length"))) != 0))
    {
      v24 = MemoryParserCtxt;
      v25 = objc_retainAutorelease(v22);
      Memory = htmlCtxtReadMemory(v24, (const char *)objc_msgSend(v25, "bytes"), (int)objc_msgSend(v25, "length"), "http://baseurl/baseurl.html", "UTF-8", 10336);
      v35 = Memory;
      if (!Memory)
      {
        v27 = objc_retainAutorelease(v25);
        Memory = htmlCtxtReadMemory(v24, (const char *)objc_msgSend(v27, "bytes"), (int)objc_msgSend(v27, "length"), "http://baseurl/baseurl.html", "UTF-8", 10337);
      }
      htmlFreeParserCtxt(v24);

      if (Memory)
      {
        RootElement = xmlDocGetRootElement(Memory);
        if (RootElement)
        {
          v29 = sub_5E2B8(RootElement, 0, (v35 != 0) & (v13 >> 1));
          v18 = (void *)objc_claimAutoreleasedReturnValue(v29);
        }
        else
        {
          v18 = 0;
        }
        xmlFreeDoc(Memory);
        goto LABEL_18;
      }
    }
    else
    {

    }
    v18 = 0;
  }
  else
  {
LABEL_6:
    v17 = -[TUIStringTextFragment initWithString:]([TUIStringTextFragment alloc], "initWithString:", v16);
    v41 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));

  }
LABEL_18:

  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v30 = v18;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "appendToBuilder:context:", v9, v11);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v32);
  }

LABEL_26:
}

@end
