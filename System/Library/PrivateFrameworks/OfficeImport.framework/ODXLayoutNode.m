@implementation ODXLayoutNode

+ (void)readNode:(_xmlNode *)a3 toLayoutNode:(id)a4 state:(id)a5
{
  id v7;
  _xmlNode *i;
  CXNamespace *v9;
  _BOOL4 HasName;
  ODDLayoutVariablePropertySet *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      objc_msgSend(v7, "ODXDiagramNamespace");
      v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      HasName = CXNodeHasName(i, v9, (xmlChar *)"varLst");

      if (HasName)
      {
        v11 = objc_alloc_init(ODDLayoutVariablePropertySet);
        objc_msgSend(v12, "setVariableList:", v11);
        +[ODXLayoutVariablePropertySet readNode:toSet:state:](ODXLayoutVariablePropertySet, "readNode:toSet:state:", i, v11, v7);

      }
      else
      {
        +[ODXLayoutObjectList readChildNode:toList:state:](ODXLayoutObjectList, "readChildNode:toList:state:", i, v12, v7);
      }
    }
  }

}

@end
