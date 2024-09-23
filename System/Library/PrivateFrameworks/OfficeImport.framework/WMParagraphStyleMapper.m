@implementation WMParagraphStyleMapper

- (WMParagraphStyleMapper)initWithWDParagraph:(id)a3 parent:(id)a4 isInTextFrame:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  WMParagraphStyleMapper *v11;
  WMParagraphStyleMapper *v12;
  WMParagraphStyle *mStyle;
  uint64_t v14;
  WDParagraphProperties *wdParaProperties;
  WMParagraphStyle *v16;
  void *v17;
  uint64_t v18;
  WMParagraphStyle *v19;
  WMParagraphStyle *v20;
  objc_super v22;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WMParagraphStyleMapper;
  v11 = -[CMMapper initWithParent:](&v22, sel_initWithParent_, v10);
  v12 = v11;
  if (v11)
  {
    mStyle = v11->mStyle;
    v11->mStyle = 0;

    objc_storeStrong((id *)&v12->wdParagraph, a3);
    -[WDParagraph properties](v12->wdParagraph, "properties");
    v14 = objc_claimAutoreleasedReturnValue();
    wdParaProperties = v12->wdParaProperties;
    v12->wdParaProperties = (WDParagraphProperties *)v14;

    if (-[WDParagraphProperties isBaseStyleOverridden](v12->wdParaProperties, "isBaseStyleOverridden"))
    {
      v16 = [WMParagraphStyle alloc];
      -[WDParagraphProperties baseStyle](v12->wdParaProperties, "baseStyle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[WMParagraphStyle initWithWDStyle:isInTextFrame:](v16, "initWithWDStyle:isInTextFrame:", v17, v5);
      v19 = v12->mStyle;
      v12->mStyle = (WMParagraphStyle *)v18;

    }
    else
    {
      v20 = objc_alloc_init(WMParagraphStyle);
      v17 = v12->mStyle;
      v12->mStyle = v20;
    }

  }
  return v12;
}

- (BOOL)isListItem
{
  return -[WMParagraphStyleMapper getListLevel:andListIndex:fromStyleOnly:](self, "getListLevel:andListIndex:fromStyleOnly:", 0, 0, 0);
}

- (void)mapListStyleAt:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  unsigned __int8 v16;

  v6 = a3;
  v7 = a4;
  if (-[WDParagraphProperties isCharacterPropertiesOverridden](self->wdParaProperties, "isCharacterPropertiesOverridden"))
  {
    -[WDParagraphProperties characterProperties](self->wdParaProperties, "characterProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (!objc_msgSend(v8, "isDeletedOverridden") || (objc_msgSend(v8, "deleted") & 0xFFFFFF7F) != 1)
  {
    v16 = -1;
    v15 = -1;
    if (-[WMParagraphStyleMapper getListLevel:andListIndex:fromStyleOnly:](self, "getListLevel:andListIndex:fromStyleOnly:", &v16, &v15, 0))
    {
      if (v16 == 255)
        v16 = 0;
      if (-[WDParagraphProperties isListIndexOverridden](self->wdParaProperties, "isListIndexOverridden"))
      {
        v9 = v15;
        v10 = v16;
        -[WDParagraphProperties document](self->wdParaProperties, "document");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WMParagraphStyleMapper mapStyleFromListId:listLevel:document:state:](self, "mapStyleFromListId:listLevel:document:state:", v9, v10, v11, v7);

      }
      v12 = v15;
      v13 = v16;
      -[WDParagraphProperties document](self->wdParaProperties, "document");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMParagraphStyleMapper mapBulletFromListId:listLevel:at:document:state:](self, "mapBulletFromListId:listLevel:at:document:state:", v12, v13, v6, v14, v7);

    }
  }

}

- (void)destyleEmptyParagraph
{
  id v2;

  -[CMStyle properties](self->mStyle, "properties");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", 0x24F3E6D18);

}

- (void)mapAt:(id)a3 withState:(id)a4
{
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", a3, self->mStyle);
}

- (BOOL)checkListId:(int64_t)a3 level:(unsigned __int8)a4
{
  BOOL v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = 0;
  if (a3 >= 1 && a4 <= 9u)
  {
    -[WDParagraphProperties document](self->wdParaProperties, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "listTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "lists");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "count") >= (unint64_t)a3;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)updateOutlineStateWithListId:(int)a3 listLevel:(unsigned __int8)a4 document:(id)a5 state:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v15 = a5;
  v10 = a6;
  if (-[WMParagraphStyleMapper checkListId:level:](self, "checkListId:level:", (int)v8, v7))
  {
    objc_msgSend(v15, "listWithListId:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "listDefinitionId");
    if ((objc_msgSend(v10, "isCurrentListDefinitionId:", v12) & 1) == 0)
    {
      objc_msgSend(v10, "listStateForListDefinitionWithId:settingUpStateIfNeededWithDocument:", v12, v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCurrentListState:", v13);

    }
    objc_msgSend(v10, "currentListState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCurrentList:", v11);

  }
}

- (void)mapStyleFromListId:(int)a3 listLevel:(unsigned __int8)a4 document:(id)a5 state:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  WMParagraphStyle *mStyle;
  void *v14;
  id v15;

  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v15 = a5;
  v10 = a6;
  if (-[WMParagraphStyleMapper checkListId:level:](self, "checkListId:level:", (int)v8, v7))
  {
    -[WMParagraphStyleMapper updateOutlineStateWithListId:listLevel:document:state:](self, "updateOutlineStateWithListId:listLevel:document:state:", v8, v7, v15, v10);
    objc_msgSend(v10, "currentListState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "levelDescriptionAtIndex:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    mStyle = self->mStyle;
    objc_msgSend(v12, "paragraphProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMParagraphStyle addParagraphProperties:](mStyle, "addParagraphProperties:", v14);

  }
}

- (void)mapBulletFromListId:(int)a3 listLevel:(unsigned __int8)a4 at:(id)a5 document:(id)a6 state:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a4;
  v10 = *(_QWORD *)&a3;
  v16 = a5;
  v12 = a6;
  v13 = a7;
  if (-[WMParagraphStyleMapper checkListId:level:](self, "checkListId:level:", (int)v10, v9))
  {
    -[WMParagraphStyleMapper updateOutlineStateWithListId:listLevel:document:state:](self, "updateOutlineStateWithListId:listLevel:document:state:", v10, v9, v12, v13);
    objc_msgSend(v13, "currentListState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "levelDescriptionAtIndex:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "increaseCounterAtLevel:", v9);
    -[WMParagraphStyleMapper mapBulletAt:forIndex:inLevelDescription:listState:](self, "mapBulletAt:forIndex:inLevelDescription:listState:", v16, v9, v15, v14);

  }
}

- (void)getListLevel:(char *)a3 andListIndex:(int *)a4 foundListLevel:(BOOL *)a5 foundListIndex:(BOOL *)a6 fromParagraphProperties:(id)a7
{
  id v11;

  v11 = a7;
  if (objc_msgSend(v11, "isListIndexOverridden"))
  {
    *a6 = 1;
    if (a4)
      *a4 = objc_msgSend(v11, "listIndex");
  }
  if (objc_msgSend(v11, "isListLevelOverridden"))
  {
    *a5 = 1;
    if (a3)
      *a3 = objc_msgSend(v11, "listLevel");
  }

}

- (void)getListLevel:(char *)a3 andListIndex:(int *)a4 foundListLevel:(BOOL *)a5 foundListIndex:(BOOL *)a6 fromStyle:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v12 = a7;
  if (v12)
  {
    v17 = v12;
    objc_msgSend(v12, "baseStyle");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v17;
    if (v13 != v17)
    {
      objc_msgSend(v17, "baseStyle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMParagraphStyleMapper getListLevel:andListIndex:foundListLevel:foundListIndex:fromStyle:](self, "getListLevel:andListIndex:foundListLevel:foundListIndex:fromStyle:", a3, a4, a5, a6, v15);

      v14 = v17;
    }
    objc_msgSend(v14, "paragraphProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMParagraphStyleMapper getListLevel:andListIndex:foundListLevel:foundListIndex:fromParagraphProperties:](self, "getListLevel:andListIndex:foundListLevel:foundListIndex:fromParagraphProperties:", a3, a4, a5, a6, v16);

    v12 = v17;
  }

}

- (BOOL)getListLevel:(char *)a3 andListIndex:(int *)a4 fromStyleOnly:(BOOL)a5
{
  void *v9;
  __int16 v11;

  v11 = 0;
  if (-[WDParagraphProperties isBaseStyleOverridden](self->wdParaProperties, "isBaseStyleOverridden"))
  {
    -[WDParagraphProperties baseStyle](self->wdParaProperties, "baseStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMParagraphStyleMapper getListLevel:andListIndex:foundListLevel:foundListIndex:fromStyle:](self, "getListLevel:andListIndex:foundListLevel:foundListIndex:fromStyle:", a3, a4, (char *)&v11 + 1, &v11, v9);

  }
  if (!a5)
    -[WMParagraphStyleMapper getListLevel:andListIndex:foundListLevel:foundListIndex:fromParagraphProperties:](self, "getListLevel:andListIndex:foundListLevel:foundListIndex:fromParagraphProperties:", a3, a4, (char *)&v11 + 1, &v11, self->wdParaProperties);
  return v11;
}

- (void)mapListStyleFromParagraphStyleWithState:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  unsigned __int8 v9;

  v4 = a3;
  v9 = -1;
  v8 = -1;
  if (-[WMParagraphStyleMapper getListLevel:andListIndex:fromStyleOnly:](self, "getListLevel:andListIndex:fromStyleOnly:", &v9, &v8, 1))
  {
    v5 = v9;
    if (v9 == 255)
    {
      v5 = 0;
      v9 = 0;
    }
    v6 = v8;
    -[WDParagraphProperties document](self->wdParaProperties, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMParagraphStyleMapper mapStyleFromListId:listLevel:document:state:](self, "mapStyleFromListId:listLevel:document:state:", v6, v5, v7, v4);

  }
}

- (void)mapParagraphStyle
{
  -[WMParagraphStyle addParagraphPropertiesFromStyle](self->mStyle, "addParagraphPropertiesFromStyle");
}

- (void)mapParagraphProperties
{
  -[WMParagraphStyle addParagraphProperties:](self->mStyle, "addParagraphProperties:", self->wdParaProperties);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->wdParagraph, 0);
  objc_storeStrong((id *)&self->wdParaProperties, 0);
}

- (id)labelStringWithGap:(id)a3
{
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ "), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bulletLabelForIndex:(int)a3 inLevelDescription:(id)a4 listState:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 i;
  void *v12;
  int v13;
  void *v14;
  WMListLevelTextMapper *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WMListLevelTextMapper *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v29;

  v29 = a4;
  v7 = a5;
  v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v7, "listDefinition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", (int)objc_msgSend(v9, "levelCount"));

  for (i = 0; ; ++i)
  {
    objc_msgSend(v7, "listDefinition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "levelCount");

    if (v13 <= i)
      break;
    objc_msgSend(v7, "levelDescriptionAtIndex:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

  }
  v15 = [WMListLevelTextMapper alloc];
  objc_msgSend(v29, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDParagraphProperties document](self->wdParaProperties, "document");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "styleSheet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "defaultCharacterProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[WMListLevelTextMapper initWithText:levelDescriptions:language:](v15, "initWithText:levelDescriptions:language:", v16, v10, objc_msgSend(v19, "languageForDefaultText"));

  -[WMListLevelTextMapper listLevelTextForOutline:](v20, "listLevelTextForOutline:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "characterProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isFontOverridden"))
  {
    objc_msgSend(v22, "fontForFontType:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fontForFontType:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCFontUtils stringByFixingString:latinFontFamilyName:symbolFontFamilyName:](TCFontUtils, "stringByFixingString:latinFontFamilyName:symbolFontFamilyName:", v21, v24, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v27;
  }

  return v21;
}

- (void)mapBulletAt:(id)a3 forIndex:(int)a4 inLevelDescription:(id)a5 listState:(id)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  WMParagraphStyle *v14;
  void *v15;
  CMLengthProperty *v16;
  void *v17;
  void *v18;
  id v19;

  v8 = *(_QWORD *)&a4;
  v19 = a3;
  v10 = a5;
  -[WMParagraphStyleMapper bulletLabelForIndex:inLevelDescription:listState:](self, "bulletLabelForIndex:inLevelDescription:listState:", v8, v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingString:", CFSTR(" "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(WMParagraphStyle);
  objc_msgSend(v19, "addChild:", v13);
  +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addChild:", v15);

  if (-[WDParagraphProperties isFirstLineIndentOverridden](self->wdParaProperties, "isFirstLineIndentOverridden"))
  {
    v16 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)-[WDParagraphProperties firstLineIndent](self->wdParaProperties, "firstLineIndent"));
    -[CMStyle addProperty:forKey:](v14, "addProperty:forKey:", v16, 0x24F3E6FF8);

  }
  if (-[WDParagraphProperties isBaseStyleOverridden](self->wdParaProperties, "isBaseStyleOverridden"))
  {
    -[WDParagraphProperties baseStyle](self->wdParaProperties, "baseStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMParagraphStyle addParagraphStyleCharacterProperties:](v14, "addParagraphStyleCharacterProperties:", v17);

  }
  objc_msgSend(v10, "characterProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WMStyle addCharacterProperties:](v14, "addCharacterProperties:", v18);

  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v13, v14);
}

@end
