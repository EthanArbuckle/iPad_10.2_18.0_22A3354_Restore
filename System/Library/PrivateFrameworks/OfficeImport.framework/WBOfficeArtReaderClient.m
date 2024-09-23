@implementation WBOfficeArtReaderClient

+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 state:(id)a5
{
  objc_msgSend(a1, "readClientDataFromShape:toGraphic:includeText:state:", a3, a4, 1, a5);
}

+ (void)readFrom:(EshContentProperties *)a3 to:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "setHorizontalPosition:", objc_msgSend(a1, "horizontalPosition:", a3));
  objc_msgSend(v6, "setRelativeHorizontalPosition:", objc_msgSend(a1, "relativeHorizontalPosition:", a3));
  objc_msgSend(v6, "setVerticalPosition:", objc_msgSend(a1, "verticalPosition:", a3));
  objc_msgSend(v6, "setRelativeVerticalPosition:", objc_msgSend(a1, "relativeVerticalPosition:", a3));
  objc_msgSend(a1, "wrapDistanceLeft:", a3);
  objc_msgSend(v6, "setWrapDistanceLeft:");
  objc_msgSend(a1, "wrapDistanceTop:", a3);
  objc_msgSend(v6, "setWrapDistanceTop:");
  objc_msgSend(a1, "wrapDistanceRight:", a3);
  objc_msgSend(v6, "setWrapDistanceRight:");
  objc_msgSend(a1, "wrapDistanceBottom:", a3);
  objc_msgSend(v6, "setWrapDistanceBottom:");
  objc_msgSend(v6, "setAllowOverlap:", objc_msgSend(a1, "allowOverlap:", a3));
  objc_msgSend(v6, "setZIndex:", objc_msgSend(v6, "zIndex") + 2);
  if (objc_msgSend(a1, "behindText:", a3))
    objc_msgSend(v6, "setZIndex:", objc_msgSend(v6, "zIndex") - 503316480);

}

+ (int)horizontalPosition:(EshContentProperties *)a3
{
  EshContentProperties *isPositionHorizontalSet;
  int result;

  isPositionHorizontalSet = (EshContentProperties *)EshContentProperties::isPositionHorizontalSet(a3);
  if ((_DWORD)isPositionHorizontalSet)
    result = EshContentProperties::getPositionHorizontal(a3);
  else
    result = EshContentProperties::getDefaultPositionHorizontal(isPositionHorizontalSet);
  if ((result - 1) >= 5)
    return 0;
  return result;
}

+ (int)relativeHorizontalPosition:(EshContentProperties *)a3
{
  EshContentProperties *isPositionHorizontalRelativeSet;
  int result;

  isPositionHorizontalRelativeSet = (EshContentProperties *)EshContentProperties::isPositionHorizontalRelativeSet(a3);
  if ((_DWORD)isPositionHorizontalRelativeSet)
    result = EshContentProperties::getPositionHorizontalRelative(a3);
  else
    result = EshContentProperties::getDefaultPositionHorizontalRelative(isPositionHorizontalRelativeSet);
  if (result >= 4)
    return 2;
  return result;
}

+ (int)verticalPosition:(EshContentProperties *)a3
{
  EshContentProperties *isPositionVerticalSet;
  int result;

  isPositionVerticalSet = (EshContentProperties *)EshContentProperties::isPositionVerticalSet(a3);
  if ((_DWORD)isPositionVerticalSet)
    result = EshContentProperties::getPositionVertical(a3);
  else
    result = EshContentProperties::getDefaultPositionHorizontal(isPositionVerticalSet);
  if ((result - 1) >= 5)
    return 0;
  return result;
}

+ (int)relativeVerticalPosition:(EshContentProperties *)a3
{
  EshContentProperties *isPositionVerticalRelativeSet;
  int result;

  isPositionVerticalRelativeSet = (EshContentProperties *)EshContentProperties::isPositionVerticalRelativeSet(a3);
  if ((_DWORD)isPositionVerticalRelativeSet)
    result = EshContentProperties::getPositionVerticalRelative(a3);
  else
    result = EshContentProperties::getDefaultPositionHorizontalRelative(isPositionVerticalRelativeSet);
  if (result >= 4)
    return 2;
  return result;
}

+ (double)wrapDistanceLeft:(EshContentProperties *)a3
{
  EshContentProperties *isWrapDistanceLeftSet;
  int WrapDistanceLeft;

  isWrapDistanceLeftSet = (EshContentProperties *)EshContentProperties::isWrapDistanceLeftSet(a3);
  if ((_DWORD)isWrapDistanceLeftSet)
    WrapDistanceLeft = EshContentProperties::getWrapDistanceLeft(a3);
  else
    WrapDistanceLeft = EshContentProperties::getDefaultWrapDistanceLeft(isWrapDistanceLeftSet);
  return (double)WrapDistanceLeft / 12700.0;
}

+ (double)wrapDistanceTop:(EshContentProperties *)a3
{
  EshContentProperties *isWrapDistanceTopSet;
  int WrapDistanceTop;

  isWrapDistanceTopSet = (EshContentProperties *)EshContentProperties::isWrapDistanceTopSet(a3);
  if ((_DWORD)isWrapDistanceTopSet)
    WrapDistanceTop = EshContentProperties::getWrapDistanceTop(a3);
  else
    WrapDistanceTop = EshContentProperties::getDefaultPositionHorizontal(isWrapDistanceTopSet);
  return (double)WrapDistanceTop / 12700.0;
}

+ (double)wrapDistanceRight:(EshContentProperties *)a3
{
  EshContentProperties *isWrapDistanceRightSet;
  int WrapDistanceRight;

  isWrapDistanceRightSet = (EshContentProperties *)EshContentProperties::isWrapDistanceRightSet(a3);
  if ((_DWORD)isWrapDistanceRightSet)
    WrapDistanceRight = EshContentProperties::getWrapDistanceRight(a3);
  else
    WrapDistanceRight = EshContentProperties::getDefaultWrapDistanceLeft(isWrapDistanceRightSet);
  return (double)WrapDistanceRight / 12700.0;
}

+ (double)wrapDistanceBottom:(EshContentProperties *)a3
{
  EshContentProperties *isWrapDistanceBottomSet;
  int WrapDistanceBottom;

  isWrapDistanceBottomSet = (EshContentProperties *)EshContentProperties::isWrapDistanceBottomSet(a3);
  if ((_DWORD)isWrapDistanceBottomSet)
    WrapDistanceBottom = EshContentProperties::getWrapDistanceBottom(a3);
  else
    WrapDistanceBottom = EshContentProperties::getDefaultPositionHorizontal(isWrapDistanceBottomSet);
  return (double)WrapDistanceBottom / 12700.0;
}

+ (BOOL)allowOverlap:(EshContentProperties *)a3
{
  EshContentProperties *isAllowOverlapSet;

  isAllowOverlapSet = (EshContentProperties *)EshContentProperties::isAllowOverlapSet(a3);
  if ((_DWORD)isAllowOverlapSet)
    return EshContentProperties::getAllowOverlap(a3);
  else
    return EshContentProperties::getDefaultAllowOverlap(isAllowOverlapSet);
}

+ (BOOL)behindText:(EshContentProperties *)a3
{
  EshContentProperties *isBehindTextSet;

  isBehindTextSet = (EshContentProperties *)EshContentProperties::isBehindTextSet(a3);
  if ((_DWORD)isBehindTextSet)
    return EshContentProperties::getBehindText(a3);
  else
    return EshContentProperties::getDefaultPositionHorizontal(isBehindTextSet);
}

+ (BOOL)escherIsFullySupported
{
  return 0;
}

+ (BOOL)tablesAreAllowed
{
  return 0;
}

+ (void)readClientDataFromGroup:(id)a3 toGroup:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  WDAContent *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(WDAContent);
  objc_msgSend(v8, "setClientData:", v10);
  -[WDAContent setDrawable:](v10, "setDrawable:", v8);
  objc_opt_class();
  v11 = v9;
  -[WDAContent setTextType:](v10, "setTextType:", objc_msgSend(v11, "currentTextType"));

  if (+[OABReaderClient sourceDrawableIsTopLevel:](OABReaderClient, "sourceDrawableIsTopLevel:", v16))
  {
    v12 = -[WDAContent createAnchor](v10, "createAnchor");
    v13 = objc_msgSend(v16, "eshGroup");
    v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v13 + 136))(v13);
    -[WDAContent anchor](v10, "anchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readFrom:to:", v14, v15);

  }
}

+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 includeText:(BOOL)a5 state:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  WDAContent *v12;
  id v13;
  const void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a5;
  v20 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_alloc_init(WDAContent);
  objc_msgSend(v10, "setClientData:", v12);
  -[WDAContent setDrawable:](v12, "setDrawable:", v10);
  objc_opt_class();
  v13 = v11;
  -[WDAContent setTextType:](v12, "setTextType:", objc_msgSend(v13, "currentTextType"));

  v14 = (const void *)objc_msgSend(v20, "eshShape");
  if (+[OABReaderClient sourceDrawableIsTopLevel:](OABReaderClient, "sourceDrawableIsTopLevel:", v20))
  {
    v15 = -[WDAContent createAnchor](v12, "createAnchor");
    v16 = (*(uint64_t (**)(const void *))(*(_QWORD *)v14 + 168))(v14);
    -[WDAContent anchor](v12, "anchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readFrom:to:", v16, v17);

  }
  if (v7)
  {
    if (v14)
    else
      v18 = 0;
    objc_opt_class();
    objc_msgSend(v13, "reader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBTextBox readFrom:parent:reader:](WBTextBox, "readFrom:parent:reader:", v18, v12, v19);

  }
}

+ (BOOL)xmlEquivalentOfDrawableCanBeUsed
{
  return 0;
}

+ (int)oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)a3 state:(id)a4
{
  return -1;
}

+ (void)readClientDataFromObject:(id)a3 toDrawable:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_class();
  TSUDynamicCast(v10, (uint64_t)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (v11)
  {
    v12 = v15;
    objc_msgSend(a1, "readClientDataFromGroup:toGroup:state:", v12, v11, v9);
    objc_msgSend(v11, "children");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __69__WBOfficeArtReaderClient_readClientDataFromObject_toDrawable_state___block_invoke;
    v16[3] = &unk_24F3B1C58;
    v19 = a1;
    v14 = v12;
    v17 = v14;
    v18 = v9;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

  }
  else
  {
    objc_msgSend(a1, "readClientDataFromShape:toGraphic:includeText:state:", v15, v8, 1, v9);
  }

}

void __69__WBOfficeArtReaderClient_readClientDataFromObject_toDrawable_state___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "childAt:", a3 + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readClientDataFromObject:toDrawable:state:", v6, v7, *(_QWORD *)(a1 + 40));

}

+ (id)readDrawableFromPackagePart:(id)a3 foundInObject:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  xmlNodePtr v13;
  void *v14;
  int v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  v11 = v10;
  objc_msgSend(v11, "xmlDrawingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPackagePart:", v8);
  v13 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v8, "xmlDocument"));
  objc_msgSend(v8, "contentType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("application/vnd.ms-office.DrsE2oDoc+xml"));

  if (v15)
  {
    +[OAXGraphicalObject readFromParentXmlNode:inNamespace:drawingState:](OAXGraphicalObject, "readFromParentXmlNode:inNamespace:drawingState:", v13, 0, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readClientDataFromObject:toDrawable:state:", v9, v16, v11);
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v12, "setPackagePart:", 0);

  return v16;
}

@end
