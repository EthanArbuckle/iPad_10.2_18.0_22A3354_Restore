@implementation WMDocumentMapper

- (void)setFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)mapWithState:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  CMStyle *v25;
  void *v26;
  CMStyle *v27;
  double v28;
  void *v29;
  CMArchiveManager *mArchiver;
  void *v31;
  CMArchiveManager *v32;
  void *v33;
  CMArchiveManager *v34;
  void *v35;
  CMArchiveManager *v36;
  void *v37;
  CMArchiveManager *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _BOOL8 v46;
  _BOOL8 v47;
  WMSectionMapper *v48;
  CMArchiveManager *v49;
  void *v50;
  CMArchiveManager *v51;
  void *v52;
  CMArchiveManager *v53;
  void *v54;
  void *context;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;

  v62 = a3;
  -[CMMapper document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "sectionCount"))
  {
    v5 = MEMORY[0x22E2DDB58]();
    v6 = +[CMXmlUtils copyXhtmlDocument](CMXmlUtils, "copyXhtmlDocument");
    v59 = v6;
    objc_msgSend(v6, "rootElement");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMDocumentMapper pageSizeForDevice](self, "pageSizeForDevice");
    v8 = v7;
    v10 = (int)v9;
    -[CMArchiveManager setHTMLWidth:](self->super.super.mArchiver, "setHTMLWidth:", v10);
    -[CMArchiveManager setHTMLHeight:](self->super.super.mArchiver, "setHTMLHeight:", (int)v8);
    -[WMDocumentMapper contentSizeForDevice](self, "contentSizeForDevice");
    v12 = v11;
    -[WMDocumentMapper leftMargin](self, "leftMargin");
    v14 = v13;
    -[WMDocumentMapper rightMargin](self, "rightMargin");
    v16 = v15;
    -[WMDocumentMapper topMargin](self, "topMargin");
    v18 = v17;
    -[WMDocumentMapper headerMargin](self, "headerMargin");
    v20 = v19;
    -[WMDocumentMapper bottomMargin](self, "bottomMargin");
    v22 = v21;
    -[WMDocumentMapper documentTitle](self, "documentTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = +[CMXmlUtils copyHeadElementWithTitle:deviceWidth:](CMXmlUtils, "copyHeadElementWithTitle:deviceWidth:", v23, v10);

    v58 = v24;
    objc_msgSend(v60, "addChild:", v24);
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc_init(CMStyle);
    -[CMStyle appendPropertyForName:intValue:](v25, "appendPropertyForName:intValue:", 0x24F3D5678, 0);
    -[CMStyle appendPropertyForName:intValue:](v25, "appendPropertyForName:intValue:", 0x24F3D5698, 0);
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v61, v25);
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc_init(CMStyle);

    -[CMStyle appendPropertyForName:stringWithColons:](v27, "appendPropertyForName:stringWithColons:", 0x24F3D3BF8, CFSTR(":hidden;"));
    -[CMStyle appendPropertyForName:stringWithColons:](v27, "appendPropertyForName:stringWithColons:", 0x24F3D4B58, CFSTR(":relative;"));
    -[CMStyle appendPropertyForName:stringValue:](v27, "appendPropertyForName:stringValue:", 0x24F3E7178, CFSTR("break-word"));
    -[CMStyle appendPropertyForName:intValue:](v27, "appendPropertyForName:intValue:", 0x24F3C93F8, (int)v12);
    -[CMStyle appendPropertyForName:intValue:](v27, "appendPropertyForName:intValue:", 0x24F3E7078, (int)v14);
    -[CMStyle appendPropertyForName:intValue:](v27, "appendPropertyForName:intValue:", 0x24F3E7098, (int)v16);
    -[CMStyle appendPropertyForName:intValue:](v27, "appendPropertyForName:intValue:", 0x24F3E6FD8, 844);
    if (v20 <= 0.0)
      v28 = v18;
    else
      v28 = v20;
    -[CMStyle appendPropertyForName:intValue:](v27, "appendPropertyForName:intValue:", 0x24F3E70B8, (int)v28);
    -[CMStyle appendPropertyForName:intValue:](v27, "appendPropertyForName:intValue:", 0x24F3E7058, (int)v22);
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v26, v27);
    objc_msgSend(v61, "addChild:", v26);
    objc_msgSend(v4, "theme");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "baseStyles");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "colorScheme");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setColorScheme:", v29);

    -[WMDocumentMapper mapDefaultCssStylesAt:](self, "mapDefaultCssStylesAt:", v24);
    mArchiver = self->super.super.mArchiver;
    objc_msgSend(v6, "openingTagString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMArchiveManager pushText:toPath:](mArchiver, "pushText:toPath:", v31, 0);

    v32 = self->super.super.mArchiver;
    objc_msgSend(v60, "openingTagString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMArchiveManager pushText:toPath:](v32, "pushText:toPath:", v33, 0);

    v34 = self->super.super.mArchiver;
    objc_msgSend(v24, "XMLString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMArchiveManager pushText:toPath:](v34, "pushText:toPath:", v35, 0);

    -[CMArchiveManager pushCssToPath:](self->super.super.mArchiver, "pushCssToPath:", 0);
    v36 = self->super.super.mArchiver;
    objc_msgSend(v61, "openingTagString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMArchiveManager pushText:toPath:](v36, "pushText:toPath:", v37, 0);

    v38 = self->super.super.mArchiver;
    objc_msgSend(v26, "openingTagString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)v5;
    -[CMArchiveManager pushText:toPath:](v38, "pushText:toPath:", v39, 0);

    v40 = v4;
    v41 = objc_msgSend(v4, "sectionCount");
    v42 = v41;
    if (v41)
    {
      v43 = 0;
      v44 = v41 - 1;
      do
      {
        objc_msgSend(v40, "sectionAt:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[WMDocumentMapper hasSessionBreakAtIndex:](self, "hasSessionBreakAtIndex:", v43);
        v47 = v44 == v43 || -[WMDocumentMapper hasSessionBreakAtIndex:](self, "hasSessionBreakAtIndex:", v43 + 1);
        v48 = -[WMSectionMapper initWithWDSection:breakAtStart:breakAtEnd:parent:]([WMSectionMapper alloc], "initWithWDSection:breakAtStart:breakAtEnd:parent:", v45, v46, v47, self);
        -[WMSectionMapper mapAt:withState:](v48, "mapAt:withState:", v26, v62);

        ++v43;
      }
      while (v42 != v43);
    }
    objc_msgSend(v60, "addChild:", v61);
    -[CMArchiveManager pushCssToPath:](self->super.super.mArchiver, "pushCssToPath:", 0);
    v49 = self->super.super.mArchiver;
    objc_msgSend(v26, "closingTagString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMArchiveManager pushText:toPath:](v49, "pushText:toPath:", v50, 0);

    v51 = self->super.super.mArchiver;
    objc_msgSend(v61, "closingTagString");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMArchiveManager pushText:toPath:](v51, "pushText:toPath:", v52, 0);

    v53 = self->super.super.mArchiver;
    objc_msgSend(v60, "closingTagString");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMArchiveManager pushText:toPath:](v53, "pushText:toPath:", v54, 0);

    -[CMArchiveManager commitDataAtPath:](self->super.super.mArchiver, "commitDataAtPath:", 0);
    -[CMArchiveManager closeResourceAtPath:](self->super.super.mArchiver, "closeResourceAtPath:", 0);

    v4 = v40;
    objc_autoreleasePoolPop(context);
  }

}

- (CGSize)pageSizeForDevice
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CMMapper document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 980.0;
  if (v4)
  {
    if (objc_msgSend(v4, "isPageWidthOverridden"))
      v6 = (double)(int)((double)objc_msgSend(v4, "pageWidth") / 20.0);
    else
      v6 = 600.0;
    if (objc_msgSend(v4, "isPageHeightOverridden"))
      v5 = (double)(int)((double)objc_msgSend(v4, "pageHeight") / 20.0);
  }
  else
  {
    v6 = 600.0;
  }

  v7 = v6;
  v8 = v5;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)contentSizeForDevice
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  -[CMMapper document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isPageWidthOverridden"))
  {
    v6 = objc_msgSend(v5, "pageWidth");
    v7 = objc_msgSend(v5, "leftMargin");
    v8 = (double)(int)((double)(v6 - (v7 + objc_msgSend(v5, "rightMargin"))) / 20.0);
  }
  else
  {
    -[WMDocumentMapper leftMargin](self, "leftMargin");
    v10 = v9;
    -[WMDocumentMapper rightMargin](self, "rightMargin");
    v8 = 600.0 - (v10 + v11);
  }
  if (objc_msgSend(v5, "isPageHeightOverridden"))
  {
    v12 = objc_msgSend(v5, "pageHeight");
    v13 = objc_msgSend(v5, "topMargin");
    v14 = (double)(int)((double)(v12 - (v13 + objc_msgSend(v5, "bottomMargin"))) / 20.0);
  }
  else
  {
    -[WMDocumentMapper topMargin](self, "topMargin");
    v16 = v15;
    -[WMDocumentMapper bottomMargin](self, "bottomMargin");
    v14 = 980.0 - (v16 + v17);
  }

  v18 = v8;
  v19 = v14;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)leftMargin
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  -[CMMapper document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || !objc_msgSend(v4, "isLeftMarginOverridden")
    || (v5 = (double)objc_msgSend(v4, "leftMargin") / 20.0, v5 > 300.0))
  {
    v5 = 80.0;
  }

  return v5;
}

- (double)rightMargin
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  -[CMMapper document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || !objc_msgSend(v4, "isRightMarginOverridden")
    || (v5 = (double)objc_msgSend(v4, "rightMargin") / 20.0, v5 > 300.0))
  {
    v5 = 80.0;
  }

  return v5;
}

- (double)topMargin
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  -[CMMapper document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || !objc_msgSend(v4, "isTopMarginOverridden")
    || (v5 = (double)objc_msgSend(v4, "topMargin") / 20.0, v5 > 500.0))
  {
    v5 = 50.0;
  }

  return v5;
}

- (double)headerMargin
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[CMMapper document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0.0;
  if (v4)
  {
    objc_msgSend(v4, "firstPageHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "blockCount"))
    {

    }
    else
    {
      objc_msgSend(v4, "oddPageHeader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "blockCount");

      if (!v8)
        goto LABEL_8;
    }
    if (!objc_msgSend(v4, "isTopMarginOverridden")
      || (v5 = (double)objc_msgSend(v4, "headerMargin") / 20.0, v5 > 500.0))
    {
      v5 = 34.0;
    }
  }
LABEL_8:

  return v5;
}

- (double)bottomMargin
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  -[CMMapper document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || !objc_msgSend(v4, "isBottomMarginOverridden")
    || (v5 = (double)objc_msgSend(v4, "bottomMargin") / 20.0, v5 > 500.0))
  {
    v5 = 50.0;
  }

  return v5;
}

- (id)documentTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;

  -[CMMapper document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "summary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "length"))
      goto LABEL_11;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, "oleFilename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "length"))
  {
    v8 = v7;
LABEL_12:
    v9 = v8;
    v6 = v8;
    goto LABEL_13;
  }
  -[WMDocumentMapper fileName](self, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "length"))
  {
LABEL_11:
    v8 = v6;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CMArchiveManager name](self->super.super.mArchiver, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (id)archiver
{
  return self->super.super.mArchiver;
}

- (void)mapDefaultCssStylesAt:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 17, CFSTR("body\n{\n-webkit-text-size-adjust: none;\nfont-size:18;\n}\ndiv\n{\nmargin-top: 0;\nmargin-bottom: 0;\n}\n p\n{\nmargin-top: 0;\nmargin-bottom: 0;\nline-height: 120%\n}\n span\n{\nline-height: 120%\n}\ntable\n{\nborder-collapse: collapse;\nborder-color: black;\nfont-size:12;\n}\ntd\n{\nword-wrap:break-word\n}\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3DF6B8, 0x24F3E6838);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAttribute:", v4);

  objc_msgSend(v8, "addChild:", v3);
  +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 17, CFSTR(".bumpedFont15\n{\nfont-size:1.5em;\n}\n.bumpedFont17\n{\nfont-size:1.7em;\n}\n.bumpedFont20\n{\nfont-size:2.0em;\n}\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3DF6B8, 0x24F3E6838);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:", v6);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3E5238, 0x24F3E6C98);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:", v7);

  objc_msgSend(v8, "addChild:", v5);
}

- (BOOL)hasSessionBreakAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  BOOL v8;

  -[CMMapper document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "sectionAt:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isBreakTypeOverridden"))
      v7 = objc_msgSend(v6, "breakType");
    else
      v7 = 2;
    v8 = v7 > 1;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (int)defaultTabWidth
{
  void *v2;
  void *v3;
  int v4;

  -[CMMapper document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "defaultTabWidth"))
    v4 = objc_msgSend(v3, "defaultTabWidth");
  else
    v4 = 720;

  return v4;
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

- (id)fileName
{
  return objc_getProperty(self, a2, 48, 1);
}

- (id)styleMatrix
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CMMapper document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "baseStyles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "styleMatrix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFileName, 0);
}

@end
