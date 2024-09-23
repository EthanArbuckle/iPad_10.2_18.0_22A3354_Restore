@implementation PMPresentationMapper

- (CGSize)slideSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CMMapper document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "slideSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)startMappingWithState:(id)a3
{
  OIXMLDocument *v4;
  OIXMLDocument *mXhtmlDoc;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  OIXMLElement *v19;
  OIXMLElement *mBodyElement;
  CMArchiveManager *mArchiver;
  void *v22;
  CMArchiveManager *v23;
  void *v24;
  void *v25;
  CMArchiveManager *v26;
  void *v27;
  CMArchiveManager *v28;
  void *v29;
  id v30;

  -[CMMapper document](self, "document", a3);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[PMPresentationMapper setHtmlDocumentSizeInArchiver](self, "setHtmlDocumentSizeInArchiver");
  v4 = +[CMXmlUtils copyXhtmlDocument](CMXmlUtils, "copyXhtmlDocument");
  mXhtmlDoc = self->mXhtmlDoc;
  self->mXhtmlDoc = v4;

  -[PMPresentationMapper documentTitle](self, "documentTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[CMXmlUtils copyHeadElementWithTitle:deviceWidth:](CMXmlUtils, "copyHeadElementWithTitle:deviceWidth:", v6, self->mWidth);

  -[PMPresentationMapper defaultStyleSheet](self, "defaultStyleSheet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 17, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3DF6B8, 0x24F3E6838);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttribute:", v10);

  objc_msgSend(v7, "addChild:", v9);
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v30, "slideSize");
  v13 = v12;
  objc_msgSend(v30, "slideSize");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("div.slide, div.loading-slide { width: %d; height: %d;}"),
    (int)v13,
    (int)v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 17, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3DF6B8, 0x24F3E6838);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAttribute:", v17);

  objc_msgSend(v7, "addChild:", v16);
  -[OIXMLDocument rootElement](self->mXhtmlDoc, "rootElement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addChild:", v7);

  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 1);
  v19 = (OIXMLElement *)objc_claimAutoreleasedReturnValue();
  mBodyElement = self->mBodyElement;
  self->mBodyElement = v19;

  -[CMArchiveManager commitDataAtPath:](self->super.super.mArchiver, "commitDataAtPath:", 0);
  mArchiver = self->super.super.mArchiver;
  -[OIXMLDocument openingTagString](self->mXhtmlDoc, "openingTagString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMArchiveManager pushText:toPath:](mArchiver, "pushText:toPath:", v22, 0);

  v23 = self->super.super.mArchiver;
  -[OIXMLDocument rootElement](self->mXhtmlDoc, "rootElement");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "openingTagString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMArchiveManager pushText:toPath:](v23, "pushText:toPath:", v25, 0);

  v26 = self->super.super.mArchiver;
  objc_msgSend(v7, "XMLString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMArchiveManager pushText:toPath:](v26, "pushText:toPath:", v27, 0);

  -[CMArchiveManager pushCssToPath:](self->super.super.mArchiver, "pushCssToPath:", 0);
  v28 = self->super.super.mArchiver;
  -[OIXMLElement openingTagString](self->mBodyElement, "openingTagString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMArchiveManager pushText:toPath:](v28, "pushText:toPath:", v29, 0);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CMArchiveManager setAutoCommit:](self->super.super.mArchiver, "setAutoCommit:", 0);
  self->mNextCommit = 1;
  self->mCurrentSlide = 0;
  self->mHasPushedFirstSlides = 0;

}

- (void)setHtmlDocumentSizeInArchiver
{
  double v3;
  double v4;
  double v5;

  -[PMPresentationMapper pageSizeForDeviceIncludingMargins:](self, "pageSizeForDeviceIncludingMargins:", -[CMArchiveManager noDecorations](self->super.super.mArchiver, "noDecorations") ^ 1);
  v4 = v3;
  -[CMArchiveManager setHTMLWidth:](self->super.super.mArchiver, "setHTMLWidth:", (int)v5);
  -[CMArchiveManager setHTMLHeight:](self->super.super.mArchiver, "setHTMLHeight:", (int)v4);
}

- (CGSize)pageSizeForDevice
{
  double v2;
  double v3;
  CGSize result;

  -[PMPresentationMapper pageSizeForDeviceIncludingMargins:](self, "pageSizeForDeviceIncludingMargins:", 0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)documentTitle
{
  return 0;
}

- (void)mapElement:(id)a3 atIndex:(unint64_t)a4 withState:(id)a5 isLastElement:(BOOL)a6
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  PMSlideMapper *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v17;
    -[PMPresentationMapper slideSize](self, "slideSize");
    v12 = v11;
    -[PMPresentationMapper slideSize](self, "slideSize");
    v14 = -[PMSlideMapper initWithPDSlide:slideRect:parent:]([PMSlideMapper alloc], "initWithPDSlide:slideRect:parent:", v10, self, 0.0, 0.0, v12, v13);
    -[PMSlideMapper mapAt:withState:](v14, "mapAt:withState:", self->mBodyElement, v9);
    if (self->mCurrentSlide >= self->mNextCommit)
    {
      if (!a6)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Loading…"), &stru_24F3BFFF8, CFSTR("Localizable"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PMPresentationMapper _pushEmptySlideWithMessage:](self, "_pushEmptySlideWithMessage:", v16);

      }
      -[CMArchiveManager commitDataAtPath:](self->super.super.mArchiver, "commitDataAtPath:", 0);
      self->mNextCommit *= 3;
      if (!self->mHasPushedFirstSlides)
        self->mHasPushedFirstSlides = 1;
    }
    ++self->mCurrentSlide;

  }
}

- (id)blipAtIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[CMMapper document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blips");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blipAtIndex:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)finishMappingWithState:(id)a3
{
  void *v4;
  void *v5;
  CMArchiveManager *mArchiver;
  void *v7;
  CMArchiveManager *v8;
  void *v9;
  void *v10;
  CMArchiveManager *v11;
  void *v12;

  if (-[CMArchiveManager isCancelled](self->super.super.mArchiver, "isCancelled", a3))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("This document is only partially previewed."), &stru_24F3BFFF8, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PMPresentationMapper _pushEmptySlideWithMessage:](self, "_pushEmptySlideWithMessage:", v5);

  }
  mArchiver = self->super.super.mArchiver;
  -[OIXMLElement closingTagString](self->mBodyElement, "closingTagString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMArchiveManager pushText:toPath:](mArchiver, "pushText:toPath:", v7, 0);

  v8 = self->super.super.mArchiver;
  -[OIXMLDocument rootElement](self->mXhtmlDoc, "rootElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "closingTagString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMArchiveManager pushText:toPath:](v8, "pushText:toPath:", v10, 0);

  v11 = self->super.super.mArchiver;
  -[OIXMLDocument closingTagString](self->mXhtmlDoc, "closingTagString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMArchiveManager pushText:toPath:](v11, "pushText:toPath:", v12, 0);

  -[CMArchiveManager commitDataAtPath:](self->super.super.mArchiver, "commitDataAtPath:", 0);
  -[CMArchiveManager closeResourceAtPath:](self->super.super.mArchiver, "closeResourceAtPath:", 0);
}

- (id)defaultStyleSheet
{
  void *v2;
  int v3;
  const __CFString *v4;

  -[CMMapper archiver](self, "archiver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "noDecorations");

  if (v3)
    v4 = CFSTR("@media screen { body { margin : 0 !important; } }\n");
  else
    v4 = CFSTR("@media screen {\nbody {\nbackground: #ACB2BB;\n}\n}\n");
  objc_msgSend(CFSTR("body\n{\n-webkit-text-size-adjust: none;\n}\n@media print {\ndiv.loading-slide {\ndisplay: none;\n}\n}\ndiv\n{\nmargin-top: 0;\nmargin-bottom: 0;\nfont-family:Arial, sans-serif;\n}\n p\n{\nmargin-top: 0;\nmargin-bottom: 0;\nword-wrap:break-word;\n}\ntable\n{\nborder-collapse: collapse;\nborder-color: black;\nborder-style: solid;\nborder-width: thin;\n}\ntd\n{\nword-wrap:break-word;\nfont-family:Arial;\nvertical-align:top;\nborder-style: solid;\nborder-width: thin;\n}\ndiv.slide\n{\nposition:relative;\n}div.slide, div.loading-slide\n{\noverflow:hidden;\npage-break-inside: avoid;\nmargin-top: 5px;\n}\ndiv.slide:first-of-type {\n  margin-top: 0;\n}\ndiv.loading-slide\n{\nposition: absolute;\nbackground:#BBBBBB;\n}\n"),
    "stringByAppendingString:",
    v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PMPresentationMapper)initWithDocument:(id)a3 archiver:(id)a4
{
  id v6;
  id v7;
  PMPresentationMapper *v8;
  PMPresentationMapper *v9;
  double v10;
  NSMutableArray *v11;
  NSMutableArray *mSlideGuids;
  NSMutableArray *v13;
  NSMutableArray *mSlideNames;
  NSString *mResourceUrlPrefix;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PMPresentationMapper;
  v8 = -[CMDocumentMapper initWithDocument:archiver:](&v17, sel_initWithDocument_archiver_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[PMPresentationMapper slideSize](v8, "slideSize");
    v9->mWidth = (int)(v10 + 0.0);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mSlideGuids = v9->mSlideGuids;
    v9->mSlideGuids = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mSlideNames = v9->mSlideNames;
    v9->mSlideNames = v13;

    mResourceUrlPrefix = v9->mResourceUrlPrefix;
    v9->mResourceUrlPrefix = (NSString *)&stru_24F3BFFF8;

  }
  return v9;
}

- (CGSize)pageSizeForDeviceIncludingMargins:(BOOL)a3
{
  _BOOL4 v3;
  double v4;
  double v5;
  CGSize result;

  v3 = a3;
  -[PMPresentationMapper slideSize](self, "slideSize");
  if (v3)
  {
    v5 = v5 + 5.0;
    v4 = v4 + -3.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_pushEmptySlideWithMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CMStyle *v7;
  void *v8;
  CMStyle *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CMStringProperty *v14;
  void *v15;
  CMArchiveManager *mArchiver;
  void *v17;
  id v18;

  v18 = a3;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("style"), CFSTR("position: relative; width:0; height: 0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAttribute:", v5);

  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMPresentationMapper slideSize](self, "slideSize");
  -[PMPresentationMapper slideSize](self, "slideSize");
  v7 = objc_alloc_init(CMStyle);
  -[CMStyle appendOriginInfoFromPoint:](v7, "appendOriginInfoFromPoint:", 0.0, 0.0);
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("class"), CFSTR("loading-slide"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttribute:", v8);

  -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](self, "addStyleUsingGlobalCacheTo:style:embedStyle:", v6, v7, 1);
  objc_msgSend(v4, "addChild:", v6);
  v9 = objc_alloc_init(CMStyle);

  -[PMPresentationMapper slideSize](self, "slideSize");
  v11 = v10;
  -[PMPresentationMapper slideSize](self, "slideSize");
  v13 = v12;
  -[CMStyle appendPropertyForName:stringValue:](v9, "appendPropertyForName:stringValue:", 0x24F3D4B58, 0x24F3DCD38);
  -[CMStyle appendPositionInfoFromRect:](v9, "appendPositionInfoFromRect:", 0.0, v11 * 0.5 + -30.0, v13, 60.0);
  v14 = -[CMStringProperty initWithString:]([CMStringProperty alloc], "initWithString:", 0x24F3D4578);
  -[CMStyle addProperty:forKey:](v9, "addProperty:forKey:", v14, CFSTR("text-align"));
  -[CMStyle appendPropertyForName:stringWithColons:](v9, "appendPropertyForName:stringWithColons:", 0x24F3D6278, CFSTR(":Arial;"));
  -[CMStyle appendPropertyForName:stringWithColons:](v9, "appendPropertyForName:stringWithColons:", 0x24F3D6298, CFSTR(":48;"));
  +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 3, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](self, "addStyleUsingGlobalCacheTo:style:embedStyle:", v15, v9, 1);
  objc_msgSend(v6, "addChild:", v15);
  mArchiver = self->super.super.mArchiver;
  objc_msgSend(v4, "XMLString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMArchiveManager pushText:toPath:](mArchiver, "pushText:toPath:", v17, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBodyElement, 0);
  objc_storeStrong((id *)&self->mXhtmlDoc, 0);
  objc_storeStrong((id *)&self->mResourceUrlProtocol, 0);
  objc_storeStrong((id *)&self->mResourceUrlPrefix, 0);
  objc_storeStrong((id *)&self->mSlideGuids, 0);
  objc_storeStrong((id *)&self->mSlideNames, 0);
}

@end
