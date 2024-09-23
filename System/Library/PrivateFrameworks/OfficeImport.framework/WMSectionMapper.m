@implementation WMSectionMapper

- (WMSectionMapper)initWithWDSection:(id)a3 breakAtStart:(BOOL)a4 breakAtEnd:(BOOL)a5 parent:(id)a6
{
  id v11;
  id v12;
  WMSectionMapper *v13;
  WMSectionMapper *v14;
  id *p_wdSection;
  BOOL v16;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WMSectionMapper;
  v13 = -[CMMapper initWithParent:](&v18, sel_initWithParent_, v12);
  v14 = v13;
  if (v13)
  {
    p_wdSection = (id *)&v13->wdSection;
    objc_storeStrong((id *)&v13->wdSection, a3);
    v14->mTopMargin = (float)objc_msgSend(*p_wdSection, "topMargin");
    v14->mLeftMargin = (float)objc_msgSend(*p_wdSection, "leftMargin");
    v14->mBreakAtStart = a4;
    v14->mBreakAtEnd = a5;
    v16 = objc_msgSend(*p_wdSection, "isTitlePageOverridden")
       && (objc_msgSend(*p_wdSection, "titlePage") & 1) != 0;
    v14->mIsTitlePage = v16;
  }

  return v14;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  WMSectionContentMapper *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addChild:", v7);
  *(float *)&v8 = self->mTopMargin;
  objc_msgSend(v6, "setTopMargin:", v8);
  *(float *)&v9 = self->mLeftMargin;
  objc_msgSend(v6, "setLeftMargin:", v9);
  v10 = (double)-[WDSection pageHeight](self->wdSection, "pageHeight") / 20.0;
  *(float *)&v10 = v10;
  objc_msgSend(v6, "setPageHeight:", v10);
  if (!self->mBreakAtStart)
  {
    v11 = objc_msgSend(v6, "currentPage");
    if (v11)
      objc_msgSend(v6, "setCurrentPage:", (v11 - 1));
  }
  -[WMSectionMapper MapSectionStyleAt:](self, "MapSectionStyleAt:", v7);
  -[WDSection text](self->wdSection, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "blockCount"))
  {
    -[WMSectionMapper mapHeaderAt:withState:](self, "mapHeaderAt:withState:", v7, v6);
    v13 = -[WMSectionContentMapper initWithWDText:parent:]([WMSectionContentMapper alloc], "initWithWDText:parent:", v12, self);
    -[WMSectionContentMapper mapAt:withState:](v13, "mapAt:withState:", v7, v6);
    -[WMSectionMapper mapFooterAt:withState:](self, "mapFooterAt:withState:", v7, v6);

  }
}

- (void)MapSectionStyleAt:(id)a3
{
  WMStyle *v4;
  id v5;

  v5 = a3;
  v4 = objc_alloc_init(WMStyle);
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v5, v4);

}

- (void)mapHeaderAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  _BOOL4 mIsTitlePage;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  CMStyle *v18;
  WMSectionContentMapper *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  -[WDSection firstPageHeader](self->wdSection, "firstPageHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[WMSectionMapper isContentEmpty:](WMSectionMapper, "isContentEmpty:", v7);

  if (!v8)
  {
    -[WDSection firstPageHeader](self->wdSection, "firstPageHeader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[WDSection oddPageHeader](self->wdSection, "oddPageHeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[WMSectionMapper isContentEmpty:](WMSectionMapper, "isContentEmpty:", v9))
  {

  }
  else
  {
    mIsTitlePage = self->mIsTitlePage;

    if (!mIsTitlePage)
    {
      -[WDSection oddPageHeader](self->wdSection, "oddPageHeader");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLastHeader:", v10);
      goto LABEL_5;
    }
  }
  -[WDSection evenPageHeader](self->wdSection, "evenPageHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[WMSectionMapper isContentEmpty:](WMSectionMapper, "isContentEmpty:", v12))
  {

    goto LABEL_11;
  }
  v13 = self->mIsTitlePage;

  if (v13)
  {
LABEL_11:
    objc_msgSend(v6, "lastHeader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_18;
    goto LABEL_12;
  }
  -[WDSection evenPageHeader](self->wdSection, "evenPageHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLastHeader:", v10);
LABEL_5:
  if (!v10)
    goto LABEL_11;
LABEL_12:
  if (self->mBreakAtStart)
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMapper archiver](self, "archiver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "progressiveMappingIsPausedOnPath:", 0);

    if (v16)
      objc_msgSend(v25, "addChild:", v14);
    -[CMMapper archiver](self, "archiver");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pauseProgressiveMappingOnPath:", 0);

    v18 = objc_alloc_init(CMStyle);
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v14, v18);
    objc_msgSend(v6, "setIsHeaderOrFooter:", 1);
    v19 = -[WMSectionContentMapper initWithWDText:parent:]([WMSectionContentMapper alloc], "initWithWDText:parent:", v10, self);
    -[WMSectionContentMapper mapAt:withState:](v19, "mapAt:withState:", v14, v6);
    objc_msgSend(v6, "setIsHeaderOrFooter:", 0);
    -[CMMapper archiver](self, "archiver");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "restartProgressiveMappingOnPath:", 0);

    if ((v16 & 1) == 0)
    {
      -[CMMapper archiver](self, "archiver");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "restartProgressiveMappingOnPath:", 0);

      -[CMMapper archiver](self, "archiver");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pushCssToPath:", 0);

      -[CMMapper archiver](self, "archiver");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "XMLString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pushText:toPath:", v24, 0);

    }
    objc_msgSend(v6, "setIsHeaderOrFooter:", 0);

  }
LABEL_18:

}

+ (BOOL)isContentEmpty:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "blockCount");
    if (v5)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        objc_msgSend(v4, "blockAt:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "blockType"))
        {
          if (objc_msgSend(v8, "blockType") == 1)
            goto LABEL_11;
        }
        else if (objc_msgSend(v8, "runCount"))
        {
LABEL_11:

          goto LABEL_10;
        }

        v6 = ++v7 >= v5;
      }
      while (v5 != v7);
    }
  }
  v6 = 1;
LABEL_10:

  return v6;
}

- (void)mapFooterAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  WMSectionContentMapper *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[WDSection firstPageFooter](self->wdSection, "firstPageFooter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[WMSectionMapper isContentEmpty:](WMSectionMapper, "isContentEmpty:", v7);

  if (v8)
  {
    -[WDSection oddPageFooter](self->wdSection, "oddPageFooter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[WMSectionMapper isContentEmpty:](WMSectionMapper, "isContentEmpty:", v9);

    if (v10)
    {
      -[WDSection evenPageFooter](self->wdSection, "evenPageFooter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = +[WMSectionMapper isContentEmpty:](WMSectionMapper, "isContentEmpty:", v11);

      if (v12)
      {
        v13 = 0;
        goto LABEL_11;
      }
      -[WDSection evenPageFooter](self->wdSection, "evenPageFooter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WDSection oddPageFooter](self->wdSection, "oddPageFooter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[WDSection firstPageFooter](self->wdSection, "firstPageFooter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v14;
  if (!v14 || !objc_msgSend(v14, "blockCount"))
  {
LABEL_11:
    objc_msgSend(v6, "lastFooter");
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
    if (!v15)
      goto LABEL_14;
    goto LABEL_12;
  }
  objc_msgSend(v6, "setLastFooter:", v13);
LABEL_12:
  if (self->mBreakAtEnd)
  {
    objc_msgSend(v6, "setIsHeaderOrFooter:", 1);
    v16 = -[WMSectionContentMapper initWithWDText:parent:]([WMSectionContentMapper alloc], "initWithWDText:parent:", v13, self);
    -[WMSectionContentMapper mapAt:withState:](v16, "mapAt:withState:", v17, v6);
    objc_msgSend(v6, "setIsHeaderOrFooter:", 0);

  }
LABEL_14:

}

- (void)setTopMargin:(float)a3
{
  self->mTopMargin = a3;
}

- (float)topMargin
{
  return self->mTopMargin;
}

- (void)setLeftMargin:(float)a3
{
  self->mLeftMargin = a3;
}

- (float)leftMargin
{
  return self->mLeftMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->wdSection, 0);
}

@end
