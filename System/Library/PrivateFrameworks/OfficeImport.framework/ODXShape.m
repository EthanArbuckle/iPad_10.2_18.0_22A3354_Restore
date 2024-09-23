@implementation ODXShape

+ (void)readNode:(_xmlNode *)a3 toShape:(id)a4 state:(id)a5
{
  id v8;
  _xmlNode *v9;
  CXNamespace *v10;
  _BOOL4 HasName;
  id v12;

  v12 = a4;
  v8 = a5;
  objc_msgSend(a1, "readTypeFromNode:toShape:", a3, v12);
  v9 = OCXFirstChild(a3);
  objc_msgSend(v8, "ODXDiagramNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  HasName = CXNodeHasName(v9, v10, (xmlChar *)"adjLst");

  if (HasName)
    objc_msgSend(a1, "readAdjustmentListNode:toShape:state:", v9, v12, v8);

}

+ (void)readTypeFromNode:(_xmlNode *)a3 toShape:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqualToString:", CFSTR("none")) & 1) == 0)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("conn")) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v8 = +[OAXGeometry shapeTypeForString:](OAXGeometry, "shapeTypeForString:", v6);
      if ((_DWORD)v8 == -130883970)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Invalid layout shape type."));
      objc_msgSend(v9, "setPresetType:", v8);
      v7 = 2;
    }
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v9, "setType:", v7);

}

+ (void)readAdjustmentListNode:(_xmlNode *)a3 toShape:(id)a4 state:(id)a5
{
  id v7;
  _xmlNode *v8;
  CXNamespace *v9;
  _BOOL4 HasName;
  ODDShapeAdjustment *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  v8 = OCXFirstChild(a3);
  while (1)
  {
    objc_msgSend(v7, "ODXDiagramNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    HasName = CXNodeHasName(v8, v9, (xmlChar *)"adj");

    if (!HasName)
      break;
    v11 = objc_alloc_init(ODDShapeAdjustment);
    objc_msgSend(v12, "addAdjustment:", v11);
    if (CXRequiredUnsignedLongAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx"))
      -[ODDShapeAdjustment setIndex:](v11, "setIndex:");
    else
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Missing required index attribute."));
    -[ODDShapeAdjustment setValue:](v11, "setValue:", CXRequiredDoubleAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
    v8 = OCXNextSibling(v8);

  }
  if (v8)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Unexpected adjustment node child."));

}

@end
