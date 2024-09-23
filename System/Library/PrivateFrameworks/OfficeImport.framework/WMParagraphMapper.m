@implementation WMParagraphMapper

- (WMParagraphMapper)initWithBlock:(id)a3 parent:(id)a4
{
  id v7;
  WMParagraphMapper *v8;
  WMParagraphMapper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WMParagraphMapper;
  v8 = -[CMMapper initWithParent:](&v11, sel_initWithParent_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->wdParagraph, a3);

  return v9;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  _BOOL8 v8;
  WMParagraphStyleMapper *v9;
  _BOOL4 v10;
  void *v11;
  OIXMLElement **p_mActiveNode;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x22E2DDB58]();
  if (objc_msgSend(v6, "containsParagraph:", self->wdParagraph))
  {
    NSLog((NSString *)CFSTR("Bailing out: mapping a paragraph recursively"));
  }
  else
  {
    objc_msgSend(v6, "pushParagraph:", self->wdParagraph);
    v8 = -[WMParagraphMapper isTextFrame](self, "isTextFrame");
    v9 = -[WMParagraphStyleMapper initWithWDParagraph:parent:isInTextFrame:]([WMParagraphStyleMapper alloc], "initWithWDParagraph:parent:isInTextFrame:", self->wdParagraph, self, v8);
    v10 = -[WMParagraphMapper containsOfficeArt](self, "containsOfficeArt");
    if (-[WMParagraphStyleMapper isListItem](v9, "isListItem") | v10 | v8)
      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    else
      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    p_mActiveNode = &self->mActiveNode;
    objc_storeStrong((id *)&self->mActiveNode, v11);

    -[CMMapper archiver](self, "archiver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "progressiveMappingIsPausedOnPath:", 0);

    if (v14)
      objc_msgSend(v20, "addChild:", *p_mActiveNode);
    -[CMMapper archiver](self, "archiver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pauseProgressiveMappingOnPath:", 0);

    if (v10)
      -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3C9458, *p_mActiveNode, CFSTR("border:1px solid transparent;"));
    -[WMParagraphStyleMapper mapListStyleFromParagraphStyleWithState:](v9, "mapListStyleFromParagraphStyleWithState:", v6);
    -[WMParagraphStyleMapper mapParagraphStyle](v9, "mapParagraphStyle");
    -[WMParagraphStyleMapper mapListStyleAt:state:](v9, "mapListStyleAt:state:", *p_mActiveNode, v6);
    -[WMParagraphStyleMapper mapParagraphProperties](v9, "mapParagraphProperties");
    -[WMParagraphMapper mapParagraphBodyWithState:](self, "mapParagraphBodyWithState:", v6);
    if (!self->mIsDeleted)
    {
      if (-[WMParagraphMapper isCollapsable:](self, "isCollapsable:", *p_mActiveNode))
      {
        -[WMParagraphStyleMapper destyleEmptyParagraph](v9, "destyleEmptyParagraph");
        +[WMCharacterRunMapper addNonCollapsableSpanAt:withState:](WMCharacterRunMapper, "addNonCollapsableSpanAt:withState:", *p_mActiveNode, v6);
      }
      -[WMParagraphStyleMapper mapAt:withState:](v9, "mapAt:withState:", *p_mActiveNode, v6);
    }
    if ((v14 & 1) == 0)
    {
      -[CMMapper archiver](self, "archiver");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "restartProgressiveMappingOnPath:", 0);

      -[CMMapper archiver](self, "archiver");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pushCssToPath:", 0);

      -[CMMapper archiver](self, "archiver");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[OIXMLNode XMLString](*p_mActiveNode, "XMLString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pushText:toPath:", v19, 0);

    }
    objc_msgSend(v6, "popParagraph");

  }
  objc_autoreleasePoolPop(v7);

}

- (BOOL)isTextFrame
{
  void *v2;
  BOOL v3;

  -[WDParagraph properties](self->wdParagraph, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isHorizontalAnchorOverridden")
    && objc_msgSend(v2, "horizontalAnchor")
    || objc_msgSend(v2, "isVerticalAnchorOverridden")
    && objc_msgSend(v2, "verticalAnchor") != 2
    || objc_msgSend(v2, "isHorizontalPositionOverridden") && objc_msgSend(v2, "horizontalPosition"))
  {
    v3 = 1;
  }
  else if (objc_msgSend(v2, "isVerticalPositionOverridden"))
  {
    v3 = objc_msgSend(v2, "verticalPosition") != 0;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)containsOfficeArt
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  int v8;

  v3 = -[WDParagraph runCount](self->wdParagraph, "runCount");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 1;
    do
    {
      -[WDParagraph runAt:](self->wdParagraph, "runAt:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "runType");

      if (v8 == 3)
        break;
      v6 = ++v5 < v4;
    }
    while (v4 != v5);
  }
  else
  {
    return 0;
  }
  return v6;
}

- (void)mapParagraphBodyWithState:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  WMParagraphMapper *v6;
  void *v7;
  WMFieldMapper *v8;
  WMParagraphMapper *v9;
  uint64_t v10;
  WMParagraphMapper *v11;
  WMParagraphMapper *v12;
  WMParagraphMapper *v13;
  id v14;

  v14 = a3;
  v4 = -[WDParagraph runCount](self->wdParagraph, "runCount");
  self->mIsDeleted = v4 != 0;
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    while (1)
    {
      -[WDParagraph runAt:](self->wdParagraph, "runAt:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRunIndex:", v5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v7, "fieldMarkerType") == 19)
        {
          v8 = [WMFieldMapper alloc];
          if (v6)
            v9 = v6;
          else
            v9 = self;
          v10 = -[WMFieldMapper initWithWDFieldMarker:parent:](v8, "initWithWDFieldMarker:parent:", v7, v9);

          v6 = (WMParagraphMapper *)v10;
        }
        -[WMParagraphMapper mapFieldMarkerAt:marker:withState:](v6, "mapFieldMarkerAt:marker:withState:", self->mActiveNode, v7, v14);
        if (objc_msgSend(v7, "fieldMarkerType") != 21)
          goto LABEL_17;
        -[CMMapper parent](v6, "parent");
        v11 = (WMParagraphMapper *)objc_claimAutoreleasedReturnValue();

        if (v11 == self)
        {
          v12 = v6;
          v6 = 0;
        }
        else
        {
          -[CMMapper parent](v6, "parent");
          v12 = v6;
          v6 = (WMParagraphMapper *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        if (v6)
          v13 = v6;
        else
          v13 = self;
        v12 = v13;
        -[WMParagraphMapper mapRunAt:run:withState:](v12, "mapRunAt:run:withState:", self->mActiveNode, v7, v14);
      }

LABEL_17:
      if (v4 == ++v5)
      {

        break;
      }
    }
  }

}

- (void)mapRunAt:(id)a3 run:(id)a4 withState:(id)a5
{
  id v7;
  WMCharacterRunMapper *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v9, "isHidden") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[WMCharacterRunMapper initWithWDCharacterRun:parent:]([WMCharacterRunMapper alloc], "initWithWDCharacterRun:parent:", v9, self);
      -[WMCharacterRunMapper mapAt:withState:](v8, "mapAt:withState:", self->mActiveNode, v7);
      if (self->mIsDeleted)
        self->mIsDeleted = -[WMCharacterRunMapper isDeleted](v8, "isDeleted");
    }
    else
    {
      if (objc_msgSend(v9, "runType") == 4 || objc_msgSend(v9, "runType") == 5)
      {
        v8 = -[WMPictureMapper initWithWDPicture:parent:]([WMPictureMapper alloc], "initWithWDPicture:parent:", v9, self);
        -[WMCharacterRunMapper mapAt:withState:](v8, "mapAt:withState:", self->mActiveNode, v7);
      }
      else if (objc_msgSend(v9, "runType") == 3)
      {
        v8 = -[WMOfficeArtMapper initWithWdOfficeArt:parent:]([WMOfficeArtMapper alloc], "initWithWdOfficeArt:parent:", v9, self);
        -[WMCharacterRunMapper mapAt:withState:](v8, "mapAt:withState:", self->mActiveNode, v7);
      }
      else if (objc_msgSend(v9, "runType") == 10)
      {
        v8 = -[WMSymbolMapper initWithWDSymbol:parent:]([WMSymbolMapper alloc], "initWithWDSymbol:parent:", v9, self);
        -[WMCharacterRunMapper mapAt:withState:](v8, "mapAt:withState:", self->mActiveNode, v7);
      }
      else
      {
        if (objc_msgSend(v9, "runType") != 12)
          goto LABEL_11;
        v8 = -[WMBookmarkMapper initWithWDBookmark:parent:]([WMBookmarkMapper alloc], "initWithWDBookmark:parent:", v9, self);
        -[WMCharacterRunMapper mapAt:withState:](v8, "mapAt:withState:", self->mActiveNode, v7);
      }
      self->mIsDeleted = 0;
    }

  }
LABEL_11:

}

- (BOOL)isCollapsable:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!objc_msgSend(a3, "childrenCount"))
    return 1;
  v4 = -[WDParagraph runCount](self->wdParagraph, "runCount");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = 0;
  while (1)
  {
    -[WDParagraph runAt:](self->wdParagraph, "runAt:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "runType") == 3)
    {
      v6 = 1;
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    if (objc_msgSend(v8, "runType") == 10)
    {
      v6 = 0;
      goto LABEL_19;
    }
LABEL_8:

    if (v5 == ++v7)
      return v6;
  }
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = !objc_msgSend(v9, "length")
    || objc_msgSend(v9, "length") == 1 && objc_msgSend(v9, "characterAtIndex:", 0) == 32;

LABEL_19:
  return v6;
}

- (id)activeNode
{
  return self->mActiveNode;
}

- (id)runAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[WDParagraph runCount](self->wdParagraph, "runCount") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[WDParagraph runAt:](self->wdParagraph, "runAt:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (void)mapPlaceholderAt:(id)a3 rect:(CGRect)a4 withState:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  void *v11;
  CMStyle *v12;
  CMMapper *v13;
  id v14;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v10 = a5;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addChild:", v11);
  v12 = objc_alloc_init(CMStyle);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  -[CMStyle appendPropertyForName:length:unit:](v12, "appendPropertyForName:length:unit:", 0x24F3D5698, 4, CGRectGetHeight(v15));
  v13 = -[CMMapper initWithParent:]([CMMapper alloc], "initWithParent:", 0);
  -[CMMapper addStyleUsingGlobalCacheTo:style:](v13, "addStyleUsingGlobalCacheTo:style:", v11, v12);
  +[WMCharacterRunMapper addNonCollapsableSpanAt:withState:](WMCharacterRunMapper, "addNonCollapsableSpanAt:withState:", v11, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mActiveNode, 0);
  objc_storeStrong((id *)&self->wdParagraph, 0);
}

@end
