@implementation WDParagraph

- (WDParagraph)initWithText:(id)a3
{
  id v4;
  WDParagraph *v5;
  WDParagraphProperties *v6;
  void *v7;
  uint64_t v8;
  WDParagraphProperties *mProperties;
  NSMutableArray *v10;
  NSMutableArray *mRuns;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDParagraph;
  v5 = -[WDBlock initWithText:](&v13, sel_initWithText_, v4);
  if (v5)
  {
    v6 = [WDParagraphProperties alloc];
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WDParagraphProperties initWithDocument:](v6, "initWithDocument:", v7);
    mProperties = v5->mProperties;
    v5->mProperties = (WDParagraphProperties *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mRuns = v5->mRuns;
    v5->mRuns = v10;

    v5->identifier = 0;
  }

  return v5;
}

- (id)properties
{
  return self->mProperties;
}

- (id)addCharacterRun
{
  WDCharacterRun *v3;

  v3 = -[WDCharacterRun initWithParagraph:]([WDCharacterRun alloc], "initWithParagraph:", self);
  -[NSMutableArray addObject:](self->mRuns, "addObject:", v3);
  return v3;
}

- (unint64_t)runCount
{
  return -[NSMutableArray count](self->mRuns, "count");
}

- (id)runAt:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mRuns, "objectAtIndex:", a3);
}

- (void)removeLastCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v11;

  v3 = a3;
  v5 = -[NSMutableArray count](self->mRuns, "count");
  if (v5)
  {
    v6 = v5;
    -[NSMutableArray objectAtIndex:](self->mRuns, "objectAtIndex:", v5 - 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "runType"))
    {
      v7 = v11;
      objc_msgSend(v7, "removeLastCharacter:", v3);
      objc_msgSend(v7, "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (v6 >= 2 && v9 == 0)
        -[NSMutableArray removeLastObject](self->mRuns, "removeLastObject");

    }
  }
}

- (void)addRun:(id)a3
{
  -[NSMutableArray addObject:](self->mRuns, "addObject:", a3);
}

- (id)addFieldMarker
{
  WDFieldMarker *v3;

  v3 = -[WDFieldMarker initWithParagraph:]([WDFieldMarker alloc], "initWithParagraph:", self);
  -[NSMutableArray addObject:](self->mRuns, "addObject:", v3);
  return v3;
}

- (id)addBookmark:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v6;
  WDBookmark *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[WDBookmark initWithParagraph:name:type:]([WDBookmark alloc], "initWithParagraph:name:type:", self, v6, v4);
  -[NSMutableArray addObject:](self->mRuns, "addObject:", v7);

  return v7;
}

- (int)blockType
{
  return 0;
}

- (BOOL)isTextFrame
{
  void *v2;
  BOOL v3;

  -[WDParagraph properties](self, "properties");
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

- (BOOL)isContinuationOf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  -[WDParagraph properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isHorizontalAnchorOverridden")
    && objc_msgSend(v6, "isHorizontalAnchorOverridden")
    && (v7 = objc_msgSend(v5, "horizontalAnchor"), v7 == objc_msgSend(v6, "horizontalAnchor"))
    && objc_msgSend(v5, "isVerticalAnchorOverridden")
    && objc_msgSend(v6, "isVerticalAnchorOverridden")
    && (v8 = objc_msgSend(v5, "verticalAnchor"), v8 == objc_msgSend(v6, "verticalAnchor"))
    && objc_msgSend(v5, "isHorizontalPositionOverridden")
    && objc_msgSend(v6, "isHorizontalPositionOverridden")
    && (v9 = objc_msgSend(v5, "horizontalPosition"), v9 == objc_msgSend(v6, "horizontalPosition"))
    && objc_msgSend(v5, "isVerticalPositionOverridden")
    && objc_msgSend(v6, "isVerticalPositionOverridden")
    && (v10 = objc_msgSend(v5, "verticalPosition"), v10 == objc_msgSend(v6, "verticalPosition"))
    && objc_msgSend(v5, "isWidthOverridden")
    && objc_msgSend(v6, "isWidthOverridden"))
  {
    v11 = objc_msgSend(v5, "width");
    v12 = v11 == objc_msgSend(v6, "width");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)addSpecialCharacter
{
  WDSpecialCharacter *v3;

  v3 = -[WDSpecialCharacter initWithParagraph:]([WDSpecialCharacter alloc], "initWithParagraph:", self);
  -[NSMutableArray addObject:](self->mRuns, "addObject:", v3);
  return v3;
}

- (id)addFootnote
{
  WDNote *v3;

  v3 = -[WDNote initWithParagraph:footnote:]([WDNote alloc], "initWithParagraph:footnote:", self, 1);
  -[NSMutableArray addObject:](self->mRuns, "addObject:", v3);
  return v3;
}

- (id)addBookmark
{
  WDBookmark *v3;

  v3 = -[WDRun initWithParagraph:]([WDBookmark alloc], "initWithParagraph:", self);
  -[NSMutableArray addObject:](self->mRuns, "addObject:", v3);
  return v3;
}

- (id)addFieldMarker:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[WDParagraph addFieldMarker](self, "addFieldMarker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFieldMarkerType:", v3);
  return v4;
}

- (id)addSymbol
{
  WDSymbol *v3;

  v3 = -[WDSymbol initWithParagraph:]([WDSymbol alloc], "initWithParagraph:", self);
  -[NSMutableArray addObject:](self->mRuns, "addObject:", v3);
  return v3;
}

- (id)addEndnote
{
  WDNote *v3;

  v3 = -[WDNote initWithParagraph:footnote:]([WDNote alloc], "initWithParagraph:footnote:", self, 0);
  -[NSMutableArray addObject:](self->mRuns, "addObject:", v3);
  return v3;
}

- (id)addAnnotation:(int)a3
{
  return -[WDParagraph addAnnotation:atIndex:](self, "addAnnotation:atIndex:", *(_QWORD *)&a3, -1);
}

- (WDParagraph)initWithText:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  WDParagraph *v8;
  WDParagraph *v9;
  WDCharacterRun *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[WDParagraph initWithText:](self, "initWithText:", v6);
  v9 = v8;
  if (v8)
  {
    -[WDParagraphProperties setBaseStyle:](v8->mProperties, "setBaseStyle:", 0);
    v10 = -[WDCharacterRun initWithParagraph:string:]([WDCharacterRun alloc], "initWithParagraph:string:", v9, v7);
    -[NSMutableArray addObject:](v9->mRuns, "addObject:", v10);

  }
  return v9;
}

- (void)clearProperties
{
  WDParagraphProperties *mProperties;

  mProperties = self->mProperties;
  self->mProperties = 0;

}

- (id)runs
{
  return self->mRuns;
}

- (void)insertRun:(id)a3 atIndex:(unint64_t)a4
{
  -[NSMutableArray insertObject:atIndex:](self->mRuns, "insertObject:atIndex:", a3, a4);
}

- (void)removeRun:(id)a3
{
  -[NSMutableArray removeObject:](self->mRuns, "removeObject:", a3);
}

- (void)clearRuns
{
  NSMutableArray *mRuns;

  mRuns = self->mRuns;
  self->mRuns = 0;

}

- (id)addAnnotation:(int)a3 atIndex:(unint64_t)a4
{
  WDAnnotation *v6;

  v6 = -[WDAnnotation initWithParagraph:type:]([WDAnnotation alloc], "initWithParagraph:type:", self, *(_QWORD *)&a3);
  if (a4 == -1 || -[NSMutableArray count](self->mRuns, "count") < a4)
    -[NSMutableArray addObject:](self->mRuns, "addObject:", v6);
  else
    -[NSMutableArray insertObject:atIndex:](self->mRuns, "insertObject:atIndex:", v6, a4);
  return v6;
}

- (id)addHyperlinkFieldMarker
{
  WDHyperlinkFieldMarker *v3;

  v3 = -[WDFieldMarker initWithParagraph:]([WDHyperlinkFieldMarker alloc], "initWithParagraph:", self);
  -[NSMutableArray addObject:](self->mRuns, "addObject:", v3);
  return v3;
}

- (id)addHyperlinkFieldMarker:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[WDParagraph addHyperlinkFieldMarker](self, "addHyperlinkFieldMarker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFieldMarkerType:", v3);
  return v4;
}

- (id)addDateTime:(id)a3
{
  id v4;
  WDDateTime *v5;

  v4 = a3;
  v5 = -[WDDateTime initWithParagraph:date:]([WDDateTime alloc], "initWithParagraph:date:", self, v4);
  -[NSMutableArray addObject:](self->mRuns, "addObject:", v5);

  return v5;
}

- (id)addMath:(id)a3
{
  id v4;
  WDMath *v5;

  v4 = a3;
  v5 = -[WDMath initWithParagraph:xmlBlob:]([WDMath alloc], "initWithParagraph:xmlBlob:", self, v4);
  -[NSMutableArray addObject:](self->mRuns, "addObject:", v5);

  return v5;
}

- (float)maxReflectionDistance
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;

  v3 = -[NSMutableArray count](self->mRuns, "count");
  if (!v3)
    return 0.0;
  v4 = v3;
  v5 = 0;
  v6 = 0.0;
  do
  {
    -[NSMutableArray objectAtIndex:](self->mRuns, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "runType"))
    {
      v8 = v7;
      objc_msgSend(v8, "properties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isReflectionOverridden"))
      {
        objc_msgSend(v9, "reflection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "distance");
          if (v12 > v6)
            v6 = v12;
        }

      }
    }

    ++v5;
  }
  while (v4 != v5);
  return v6;
}

- (id)runIterator
{
  return -[WDArrayIterator initWithArray:]([WDArrayIterator alloc], "initWithArray:", self->mRuns);
}

- (id)newRunIterator
{
  return -[WDArrayIterator initWithArray:]([WDArrayIterator alloc], "initWithArray:", self->mRuns);
}

- (BOOL)isEmpty
{
  uint64_t v3;
  unsigned int v4;
  void *v5;
  char v6;

  if (!-[NSMutableArray count](self->mRuns, "count"))
    return 1;
  v3 = 0;
  v4 = 1;
  do
  {
    -[NSMutableArray objectAtIndex:](self->mRuns, "objectAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmpty");

    if ((v6 & 1) == 0)
      break;
    v3 = v4;
  }
  while (-[NSMutableArray count](self->mRuns, "count") > (unint64_t)v4++);
  return v6;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDParagraph;
  -[WDBlock description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->identifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRuns, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end
