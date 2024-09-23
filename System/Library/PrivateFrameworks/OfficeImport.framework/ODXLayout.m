@implementation ODXLayout

+ (void)readNode:(_xmlNode *)a3 toDiagram:(id)a4 state:(id)a5
{
  CXNamespace *v6;
  _xmlNode *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(v9, "ODXDiagramNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = OCXFindRequiredChild(a3, v6, (xmlChar *)"layoutNode");

  objc_msgSend(0, "rootNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODXLayoutNode readNode:toLayoutNode:state:](ODXLayoutNode, "readNode:toLayoutNode:state:", v7, v8, v9);

}

@end
