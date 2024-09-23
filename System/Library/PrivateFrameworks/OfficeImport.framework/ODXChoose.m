@implementation ODXChoose

+ (void)readNode:(_xmlNode *)a3 toChoose:(id)a4 state:(id)a5
{
  id v8;
  _xmlNode *i;
  CXNamespace *v10;
  _BOOL4 HasName;
  CXNamespace *v12;
  _BOOL4 v13;
  id v14;

  v14 = a4;
  v8 = a5;
  for (i = OCXFirstChild(a3); ; i = OCXNextSibling(i))
  {
    objc_msgSend(v8, "ODXDiagramNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    HasName = CXNodeHasName(i, v10, (xmlChar *)"if");

    if (!HasName)
      break;
    objc_msgSend(a1, "readIfNode:toChoose:state:", i, v14, v8);
  }
  objc_msgSend(v8, "ODXDiagramNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = CXNodeHasName(i, v12, (xmlChar *)"else");

  if (v13)
  {
    objc_msgSend(a1, "readElseNode:toChoose:state:", i, v14, v8);
    i = OCXNextSibling(i);
  }
  if (i)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Unexpected choose node child."));

}

+ (void)readIfNode:(_xmlNode *)a3 toChoose:(id)a4 state:(id)a5
{
  id v7;
  ODDWhen *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  v8 = objc_alloc_init(ODDWhen);
  objc_msgSend(v10, "addWhen:", v8);
  -[ODDWhen iteratorSpecification](v8, "iteratorSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODXIteratorSpecification readFromNode:toSpecification:state:](ODXIteratorSpecification, "readFromNode:toSpecification:state:", a3, v9, v7);

  +[ODXLayoutObjectList readNode:toList:state:](ODXLayoutObjectList, "readNode:toList:state:", a3, v8, v7);
}

+ (void)readElseNode:(_xmlNode *)a3 toChoose:(id)a4 state:(id)a5
{
  id v7;
  ODDOtherwise *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  v8 = objc_alloc_init(ODDOtherwise);
  objc_msgSend(v9, "setOtherwise:", v8);
  +[ODXLayoutObjectList readNode:toList:state:](ODXLayoutObjectList, "readNode:toList:state:", a3, v8, v7);

}

@end
