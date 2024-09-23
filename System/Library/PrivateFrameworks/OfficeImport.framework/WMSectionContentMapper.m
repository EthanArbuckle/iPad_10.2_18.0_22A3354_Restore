@implementation WMSectionContentMapper

- (WMSectionContentMapper)initWithWDText:(id)a3 parent:(id)a4
{
  id v7;
  WMSectionContentMapper *v8;
  WMSectionContentMapper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WMSectionContentMapper;
  v8 = -[CMMapper initWithParent:](&v11, sel_initWithParent_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->wdText, a3);

  return v9;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t i;
  void *v9;
  WMParagraphMapper *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = -[WDText blockCount](self->wdText, "blockCount");
  if (v7)
  {
    for (i = 0; i < v7; ++i)
    {
      objc_msgSend(v6, "setBlockIndex:", i);
      -[WDText blockAt:](self->wdText, "blockAt:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMSectionContentMapper updateTextFrameState:atIndex:](self, "updateTextFrameState:atIndex:", v6, i);
      if (objc_msgSend(v6, "isFrame"))
      {
        objc_msgSend(v6, "pushTextLevel");
        -[WMSectionContentMapper mapTextFrameAt:withState:](self, "mapTextFrameAt:withState:", v11, v6);
        i = objc_msgSend(v6, "blockIndex");
        objc_msgSend(v6, "popTextLevel");
      }
      else
      {
        if (!objc_msgSend(v9, "blockType"))
        {
          v10 = -[WMParagraphMapper initWithBlock:parent:]([WMParagraphMapper alloc], "initWithBlock:parent:", v9, self);
          -[WMParagraphMapper mapAt:withState:](v10, "mapAt:withState:", v11, v6);
          goto LABEL_9;
        }
        if (objc_msgSend(v9, "blockType") == 1)
        {
          objc_msgSend(v6, "pushTextLevel");
          v10 = -[WMTableMapper initWithWDTable:parent:]([WMTableMapper alloc], "initWithWDTable:parent:", v9, self);
          -[WMParagraphMapper mapAt:withState:](v10, "mapAt:withState:", v11, v6);
          objc_msgSend(v6, "popTextLevel");
LABEL_9:

        }
      }

    }
  }

}

- (void)updateTextFrameState:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id v12;

  v12 = a3;
  -[WMSectionContentMapper paragraphAtIndex:](self, "paragraphAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isTextFrame") & 1) != 0)
  {
    if (a4 && objc_msgSend(v12, "isFrame"))
      v8 = objc_msgSend(v12, "isFrameEnd");
    else
      v8 = 1;
    objc_msgSend(v12, "setIsFrameStart:", v8);
    objc_msgSend(v12, "setIsFrame:", 1);
    -[WMSectionContentMapper paragraphAtIndex:](self, "paragraphAtIndex:", a4 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = !v9 || (objc_msgSend(v9, "isContinuationOf:", v7) & 1) == 0;
    objc_msgSend(v12, "setIsFrameEnd:", v11);

  }
  else
  {
    objc_msgSend(v12, "setIsFrame:", 0);
    objc_msgSend(v12, "setIsFrameStart:", 0);
    objc_msgSend(v12, "setIsFrameEnd:", 0);
  }

}

- (id)paragraphAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;

  if (-[WDText blockCount](self->wdText, "blockCount") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[WDText blockAt:](self->wdText, "blockAt:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "blockType"))
      v6 = 0;
    else
      v6 = v5;

  }
  return v6;
}

- (void)mapTextFrameAt:(id)a3 withState:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  WMParagraphMapper *v12;
  uint64_t v13;
  WMStyle *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "blockIndex");
  -[WMSectionContentMapper paragraphAtIndex:](self, "paragraphAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isFrameStart") & 1) != 0)
  {
    v14 = objc_alloc_init(WMStyle);
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addChild:", v9);
    -[WMSectionContentMapper mapTextFrameStyleTo:withState:](self, "mapTextFrameStyleTo:withState:", v14, v6);
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v9, v14);
    if (v8)
    {
      v10 = (v7 << 32) + 0x100000000;
      v11 = v7 + 1;
      while (1)
      {
        v12 = -[WMParagraphMapper initWithBlock:parent:]([WMParagraphMapper alloc], "initWithBlock:parent:", v8, self);
        -[WMParagraphMapper mapAt:withState:](v12, "mapAt:withState:", v9, v6);
        if (objc_msgSend(v6, "isFrameEnd"))
          break;
        objc_msgSend(v6, "setBlockIndex:", v11);
        -[WMSectionContentMapper paragraphAtIndex:](self, "paragraphAtIndex:", v11);
        v13 = objc_claimAutoreleasedReturnValue();

        -[WMSectionContentMapper updateTextFrameState:atIndex:](self, "updateTextFrameState:atIndex:", v6, v10 >> 32);
        v10 += 0x100000000;
        ++v11;
        v8 = (void *)v13;
        if (!v13)
          goto LABEL_9;
      }

    }
LABEL_9:
    if ((objc_msgSend(v6, "isFrameEnd") & 1) == 0)
      NSLog((NSString *)CFSTR("FIXME: wrong text frame end"));

  }
  else
  {
    NSLog((NSString *)CFSTR("FIXME: wrong text frame start"));
  }

}

- (void)mapTextFrameStyleTo:(id)a3 withState:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WMSectionContentMapper paragraphAtIndex:](self, "paragraphAtIndex:", objc_msgSend(a4, "blockIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isWidthOverridden"))
      objc_msgSend(v9, "appendPropertyForName:length:unit:", 0x24F3C93F8, 2, (double)objc_msgSend(v8, "width"));
    objc_msgSend(v9, "appendPropertyForName:stringValue:", 0x24F3D3678, 0x24F3DA4B8);

  }
  else
  {
    NSLog((NSString *)CFSTR("Fixme: nil paragraph in the text frame"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->wdText, 0);
}

@end
