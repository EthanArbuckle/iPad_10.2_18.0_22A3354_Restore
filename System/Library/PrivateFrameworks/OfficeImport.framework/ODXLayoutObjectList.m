@implementation ODXLayoutObjectList

+ (void)readNode:(_xmlNode *)a3 toList:(id)a4 state:(id)a5
{
  id v8;
  _xmlNode *i;
  id v10;

  v10 = a4;
  v8 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE)
      objc_msgSend(a1, "readChildNode:toList:state:", i, v10, v8);
  }

}

+ (void)readChildNode:(_xmlNode *)a3 toList:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  _BOOL4 HasName;
  ODDAlgorithm *v10;
  CXNamespace *v11;
  _BOOL4 v12;
  CXNamespace *v13;
  _BOOL4 v14;
  CXNamespace *v15;
  _BOOL4 v16;
  CXNamespace *v17;
  _BOOL4 v18;
  id v19;

  v19 = a4;
  v7 = a5;
  objc_msgSend(v7, "ODXDiagramNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  HasName = CXNodeHasName(a3, v8, (xmlChar *)"alg");

  if (HasName)
  {
    v10 = objc_alloc_init(ODDAlgorithm);
    objc_msgSend(v19, "addChild:", v10);
    +[ODXAlgorithm readNode:toAlgorithm:](ODXAlgorithm, "readNode:toAlgorithm:", a3, v10);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v7, "ODXDiagramNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = CXNodeHasName(a3, v11, (xmlChar *)"shape");

  if (v12)
  {
    v10 = objc_alloc_init(ODDShape);
    objc_msgSend(v19, "addChild:", v10);
    +[ODXShape readNode:toShape:state:](ODXShape, "readNode:toShape:state:", a3, v10, v7);
    goto LABEL_11;
  }
  objc_msgSend(v7, "ODXDiagramNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = CXNodeHasName(a3, v13, (xmlChar *)"forEach");

  if (v14)
  {
    v10 = objc_alloc_init(ODDForEach);
    objc_msgSend(v19, "addChild:", v10);
    +[ODXForEach readNode:toForEach:state:](ODXForEach, "readNode:toForEach:state:", a3, v10, v7);
    goto LABEL_11;
  }
  objc_msgSend(v7, "ODXDiagramNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = CXNodeHasName(a3, v15, (xmlChar *)"layoutNode");

  if (v16)
  {
    v10 = objc_alloc_init(ODDLayoutNode);
    objc_msgSend(v19, "addChild:", v10);
    +[ODXLayoutNode readNode:toLayoutNode:state:](ODXLayoutNode, "readNode:toLayoutNode:state:", a3, v10, v7);
    goto LABEL_11;
  }
  objc_msgSend(v7, "ODXDiagramNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = CXNodeHasName(a3, v17, (xmlChar *)"choose");

  if (v18)
  {
    v10 = objc_alloc_init(ODDChoose);
    objc_msgSend(v19, "addChild:", v10);
    +[ODXChoose readNode:toChoose:state:](ODXChoose, "readNode:toChoose:state:", a3, v10, v7);
    goto LABEL_11;
  }
LABEL_12:

}

@end
