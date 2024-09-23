@implementation RUITableViewSection

- (id)staticValues
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIdentifier:", "rowCount");
  objc_msgSend(v2, "setGetter:", RUIJSSection_getProperty);
  objc_msgSend(v2, "setSetter:", 0);
  objc_msgSend(v2, "setJSPropertyAttributes:", 10);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIdentifier:", "sectionIndex");
  objc_msgSend(v3, "setGetter:", RUIJSSection_getProperty);
  objc_msgSend(v3, "setSetter:", 0);
  objc_msgSend(v3, "setJSPropertyAttributes:", 10);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)staticFunctions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIdentifier:", "insertRow");
  objc_msgSend(v2, "setFunction:", RUIJSSection_insertRow);
  objc_msgSend(v2, "setJSPropertyAttributes:", 0);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIdentifier:", "removeRow");
  objc_msgSend(v3, "setFunction:", RUIJSSection_removeRow);
  objc_msgSend(v3, "setJSPropertyAttributes:", 0);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setIdentifier:", "updateHTMLFooterContent");
  objc_msgSend(v4, "setFunction:", RUIJSSection_updateHTMLFooterContent);
  objc_msgSend(v4, "setJSPropertyAttributes:", 0);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setIdentifier:", "updateHTMLHeaderContent");
  objc_msgSend(v5, "setFunction:", RUIJSSection_updateHTMLHeaderContent);
  objc_msgSend(v5, "setJSPropertyAttributes:", 0);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (RUITableViewSection)initWithAttributes:(id)a3 parent:(id)a4
{
  RUITableViewSection *v4;
  NSMutableArray *v5;
  NSMutableArray *rows;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RUITableViewSection;
  v4 = -[RUIElement initWithAttributes:parent:](&v12, sel_initWithAttributes_parent_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    rows = v4->_rows;
    v4->_rows = v5;

    -[RUIElement style](v4, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[RUIElement style](v4, "style");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sectionHeaderHeight");
      v4->_headerHeight = v9;

      v10 = *MEMORY[0x24BEBE770];
    }
    else
    {
      v10 = *MEMORY[0x24BEBE770];
      v4->_headerHeight = *(double *)MEMORY[0x24BEBE770];
    }
    v4->_footerHeight = v10;
  }
  return v4;
}

- (BOOL)drawTopSeparator
{
  return -[NSNumber BOOLValue](self->_drawsTopSeparator, "BOOLValue");
}

- (void)setDrawTopSeparator:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *drawsTopSeparator;

  v4 = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", a3);
  drawsTopSeparator = self->_drawsTopSeparator;
  self->_drawsTopSeparator = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  RUITableViewSection *v5;
  void *v6;
  void *v7;
  RUITableViewSection *v8;
  void *v9;
  void *v10;
  void *v11;
  RUIHeaderElement *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  RUIFooterElement *v18;
  void *v19;

  -[RUIElement attributes](self, "attributes", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [RUITableViewSection alloc];
  -[RUIElement attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIElement parent](self, "parent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RUITableViewSection initWithAttributes:parent:](v5, "initWithAttributes:parent:", v6, v7);

  -[RUITableViewSection setAttributes:](v8, "setAttributes:", v4);
  -[RUIElement style](self, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIElement setStyle:](v8, "setStyle:", v9);

  -[RUITableViewSection tableElement](self, "tableElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUITableViewSection setTableElement:](v8, "setTableElement:", v10);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("header"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -[RUIElement initWithAttributes:parent:]([RUIHeaderElement alloc], "initWithAttributes:parent:", 0, v8);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("header"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setBody:](v12, "setBody:", v13);

    -[RUITableViewSection setHeader:](v8, "setHeader:", v12);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headerHeight"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headerHeight"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      -[RUITableViewSection setHeaderHeight:](v8, "setHeaderHeight:", v16);

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = -[RUIElement initWithAttributes:parent:]([RUIFooterElement alloc], "initWithAttributes:parent:", 0, v8);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setBody:](v18, "setBody:", v19);

    -[RUITableViewSection setFooter:](v8, "setFooter:", v18);
  }

  return v8;
}

- (BOOL)hasValueForDrawsTopSeparator
{
  return self->_drawsTopSeparator != 0;
}

- (void)insertRow:(id)a3 atIndex:(unint64_t)a4
{
  -[NSMutableArray insertObject:atIndex:](self->_rows, "insertObject:atIndex:", a3, a4);
}

- (void)addRow:(id)a3
{
  -[NSMutableArray addObject:](self->_rows, "addObject:", a3);
}

- (void)removeRowAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_rows, "removeObjectAtIndex:", a3);
}

- (NSArray)rows
{
  unint64_t disclosureLimit;
  RUITableViewRow *v4;
  void *v5;
  void *v6;
  void *v7;
  RUITableViewRow *v8;
  RUITableViewRow *showAllRow;
  RUITableViewRow *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  disclosureLimit = self->_disclosureLimit;
  if (!disclosureLimit || disclosureLimit >= -[NSMutableArray count](self->_rows, "count") - 1)
    return (NSArray *)self->_rows;
  if (!self->_showAllRow)
  {
    v4 = [RUITableViewRow alloc];
    v23 = CFSTR("label");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL"), &stru_24C29B280, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[RUIElement initWithAttributes:parent:](v4, "initWithAttributes:parent:", v7, self);
    showAllRow = self->_showAllRow;
    self->_showAllRow = v8;

    v10 = self->_showAllRow;
    -[RUIElement style](self, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement setStyle:](v10, "setStyle:", v11);

    -[RUITableViewRow tableCell](self->_showAllRow, "tableCell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ruiTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement style](self, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "buttonRowTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v15);

    -[RUITableViewRow tableCell](self->_showAllRow, "tableCell");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIndentationLevel:", 1);

    -[RUITableViewRow tableCell](self->_showAllRow, "tableCell");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement attributes](self, "attributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("showAllIndent"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIndentationWidth:", (double)objc_msgSend(v19, "integerValue"));

  }
  -[NSMutableArray subarrayWithRange:](self->_rows, "subarrayWithRange:", 0, self->_disclosureLimit);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  objc_msgSend(v21, "addObject:", self->_showAllRow);
  return (NSArray *)v21;
}

- (void)tappedShowAllRowWithTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t i;
  void *v9;
  RUITableViewRow *showAllRow;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RUITableViewRow tableCell](self->_showAllRow, "tableCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_rows, "count") - self->_disclosureLimit);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = self->_disclosureLimit; i < -[NSMutableArray count](self->_rows, "count"); ++i)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", i, objc_msgSend(v6, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  self->_disclosureLimit = 0;
  showAllRow = self->_showAllRow;
  self->_showAllRow = 0;

  objc_msgSend(v4, "beginUpdates");
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteRowsAtIndexPaths:withRowAnimation:", v11, 0);

  objc_msgSend(v4, "insertRowsAtIndexPaths:withRowAnimation:", v7, 0);
  objc_msgSend(v4, "endUpdates");

}

- (void)setAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RUITableViewSection;
  v4 = a3;
  -[RUIElement setAttributes:](&v7, sel_setAttributes_, v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("disclosureLimit"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_disclosureLimit = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("hideTopSeparator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUITableViewSection setDrawTopSeparator:](self, "setDrawTopSeparator:", objc_msgSend(v6, "BOOLValue") ^ 1);
}

- (id)colorFromAttributeString:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)_customHeaderClass
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[RUIElement parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v3, "objectModel"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = (void *)objc_msgSend(v4, "customHeaderClassForSection:", self),
        v4,
        !v5))
  {
    -[RUITableViewSection header](self, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
LABEL_10:
      objc_opt_class();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    -[RUIElement attributes](self, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("image"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[RUIElement attributes](self, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("image2x"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        -[RUIElement attributes](self, "attributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("image3x"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          goto LABEL_10;
        -[RUITableViewSection detailHeader](self, "detailHeader");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          -[RUITableViewSection subHeader](self, "subHeader");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            -[RUITableViewSection header](self, "header");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "attributes");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("color"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              v12 = 0;
              goto LABEL_12;
            }
            goto LABEL_10;
          }
        }
        goto LABEL_9;
      }

    }
LABEL_9:

    goto LABEL_10;
  }
  v6 = v5;
LABEL_11:
  v12 = v6;
LABEL_12:

  return (Class)v12;
}

- (RUITableViewHeaderFooterView)containerizedHeaderView
{
  void *v3;
  RUITableViewHeaderFooterView *containerizedHeaderView;
  BOOL v5;
  RUITableViewHeaderFooterView *v6;
  RUITableViewHeaderFooterView *v7;
  RUITableViewHeaderFooterView *v8;

  -[RUITableViewSection headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  containerizedHeaderView = self->_containerizedHeaderView;
  if (containerizedHeaderView)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = (RUITableViewHeaderFooterView *)objc_opt_new();
    v7 = self->_containerizedHeaderView;
    self->_containerizedHeaderView = v6;

    -[RUITableViewHeaderFooterView embedHeaderView:](self->_containerizedHeaderView, "embedHeaderView:", v3);
    containerizedHeaderView = self->_containerizedHeaderView;
  }
  v8 = containerizedHeaderView;

  return v8;
}

- (RUIHeader)headerView
{
  RUIHeader *headerView;
  id v4;
  void *v5;
  void *v6;
  RUIHeader *v7;
  RUIHeader *v8;
  void *v9;
  void *v10;
  void *v11;
  RUIElement *header;
  void *v13;
  void *v14;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = objc_alloc(-[RUITableViewSection _customHeaderClass](self, "_customHeaderClass"));
    -[RUITableViewSection header](self, "header");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (RUIHeader *)objc_msgSend(v4, "initWithAttributes:", v6);
    v8 = self->_headerView;
    self->_headerView = v7;

    -[RUITableViewSection header](self, "header");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("largeFont"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      header = self->_header;
      -[RUIElement body](header, "body");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedUppercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIElement setBody:](header, "setBody:", v14);

    }
    -[RUIElement configureView:](self->_header, "configureView:", self->_headerView);
    -[RUISubHeaderElement configureView:](self->_subHeader, "configureView:", self->_headerView);
    -[RUIDetailHeaderElement configureView:](self->_detailHeader, "configureView:", self->_headerView);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[RUIHeader setDelegate:](self->_headerView, "setDelegate:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[RUIElement loadImage](self, "loadImage");
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)headerView:(id)a3 activatedLinkWithURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  RUIElement *v9;
  id v10;

  v5 = a4;
  -[RUITableViewSection header](self, "header");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v5, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("url"));
  v9 = -[RUIElement initWithAttributes:parent:]([RUIElement alloc], "initWithAttributes:parent:", v10, self);
  -[RUIElement performAction:forElement:completion:](self, "performAction:forElement:completion:", 2, v9, 0);

}

- (void)headerViewDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  RUITableViewSection *v11;
  uint64_t v12;

  v4 = a3;
  -[RUITableViewSection tableElement](self, "tableElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", self);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__RUITableViewSection_headerViewDidChange___block_invoke;
  block[3] = &unk_24C297860;
  v10 = v4;
  v11 = self;
  v12 = v7;
  v8 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __43__RUITableViewSection_headerViewDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 40), "tableElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reconfigureRowsAtIndexPaths:", v5);

}

- (void)setImage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[RUIHeader setIconImage:](self->_headerView, "setIconImage:", v5);
    -[RUIElement parent](self, "parent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadHeadersAndFootersForSection:", self);

  }
}

- (void)setImageSize:(CGSize)a3
{
  double height;
  double width;
  id v6;

  height = a3.height;
  width = a3.width;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[RUIHeader setImageSize:](self->_headerView, "setImageSize:", width, height);
    -[RUIElement parent](self, "parent");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadHeadersAndFootersForSection:", self);

  }
}

- (void)setImageAlignment:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[RUIHeader setImageAlignment:](self->_headerView, "setImageAlignment:", v3);
    -[RUIElement parent](self, "parent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadHeadersAndFootersForSection:", self);

  }
}

- (BOOL)hasCustomHeader
{
  char isKindOfClass;
  void *v5;
  void *v6;

  if (self->_headerView || -[RUITableViewSection _customHeaderClass](self, "_customHeaderClass"))
  {
    isKindOfClass = 1;
  }
  else
  {
    -[RUITableViewSection header](self, "header");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (Class)_customFooterClass
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  -[RUIElement parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUITableViewSection footer](self, "footer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("privacyBundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "customFooterClassForSection:", self);

      if (v11)
      {
        v7 = v11;
        goto LABEL_3;
      }
    }
    -[RUITableViewSection footer](self, "footer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[RUITableViewSection footer](self, "footer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "attributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("url"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        -[RUITableViewSection footer](self, "footer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "attributes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("activationFunction"));

      }
      -[RUITableViewSection footer](self, "footer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("color"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        -[RUIElement style](self, "style");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[RUIStyle defaultStyle](RUIStyle, "defaultStyle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "isMemberOfClass:", objc_opt_class());

      }
      -[RUITableViewSection footer](self, "footer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v8 = 0;
        goto LABEL_4;
      }

    }
  }
  objc_opt_class();
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v8 = v7;
LABEL_4:

  return (Class)v8;
}

- (RUITableViewHeaderFooterView)containerizedFooterView
{
  void *v3;
  RUITableViewHeaderFooterView *containerizedFooterView;
  BOOL v5;
  RUITableViewHeaderFooterView *v6;
  RUITableViewHeaderFooterView *v7;
  RUITableViewHeaderFooterView *v8;

  -[RUITableViewSection footerView](self, "footerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  containerizedFooterView = self->_containerizedFooterView;
  if (containerizedFooterView)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = (RUITableViewHeaderFooterView *)objc_opt_new();
    v7 = self->_containerizedFooterView;
    self->_containerizedFooterView = v6;

    -[RUITableViewHeaderFooterView embedFooterView:](self->_containerizedFooterView, "embedFooterView:", v3);
    containerizedFooterView = self->_containerizedFooterView;
  }
  v8 = containerizedFooterView;

  return v8;
}

- (RemoteUITableFooter)footerView
{
  RemoteUITableFooter *footerView;
  id v4;
  void *v5;
  void *v6;
  RemoteUITableFooter *v7;
  RemoteUITableFooter *v8;

  footerView = self->_footerView;
  if (!footerView)
  {
    v4 = objc_alloc(-[RUITableViewSection _customFooterClass](self, "_customFooterClass"));
    -[RUITableViewSection footer](self, "footer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (RemoteUITableFooter *)objc_msgSend(v4, "initWithAttributes:", v6);
    v8 = self->_footerView;
    self->_footerView = v7;

    -[RUIElement configureView:](self->_footer, "configureView:", self->_footerView);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[RemoteUITableFooter setDelegate:](self->_footerView, "setDelegate:", self);
    footerView = self->_footerView;
  }
  return footerView;
}

- (void)footerView:(id)a3 activatedLinkWithURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  RUIElement *v9;
  id v10;

  v5 = a4;
  -[RUITableViewSection footer](self, "footer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v5, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("url"));
  v9 = -[RUIElement initWithAttributes:parent:]([RUIElement alloc], "initWithAttributes:parent:", v10, self);
  -[RUIElement performAction:forElement:completion:](self, "performAction:forElement:completion:", 2, v9, 0);

}

- (BOOL)hasCustomFooter
{
  return self->_footerView || -[RUITableViewSection _customFooterClass](self, "_customFooterClass") != 0;
}

- (void)populatePostbackDictionary:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_rows;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "populatePostbackDictionary:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)subElementWithID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_rows;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v25);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v13 = v10;
LABEL_16:
          v23 = v13;

          goto LABEL_17;
        }
        objc_msgSend(v10, "subElementWithID:", v4);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_16;
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v7)
        continue;
      break;
    }
  }

  v14 = 152;
  -[RUIElement identifier](self->_header, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", v4);

  if (v16)
    goto LABEL_14;
  v14 = 160;
  -[RUIElement identifier](self->_subHeader, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", v4);

  if (v18)
    goto LABEL_14;
  v14 = 168;
  -[RUIElement identifier](self->_detailHeader, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", v4);

  if (v20
    || (v14 = 176,
        -[RUIElement identifier](self->_footer, "identifier"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "isEqualToString:", v4),
        v21,
        v22))
  {
LABEL_14:
    v23 = *(id *)((char *)&self->super.super.isa + v14);
  }
  else
  {
    v23 = 0;
  }
LABEL_17:

  return v23;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v10;
  char v11;
  void *v12;
  int v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RUIElement identifier](self->_header, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
    goto LABEL_4;
  -[RUIElement identifier](self->_subHeader, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v4))
  {

LABEL_4:
LABEL_5:
    v7 = 112;
LABEL_6:
    v8 = *(id *)((char *)&self->super.super.isa + v7);
    goto LABEL_7;
  }
  -[RUIElement identifier](self->_detailHeader, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v4);

  if ((v11 & 1) != 0)
    goto LABEL_5;
  -[RUIElement identifier](self->_footer, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v4);

  if (v13)
  {
    v7 = 120;
    goto LABEL_6;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_rows;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "viewForElementIdentifier:", v4, (_QWORD)v20);
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v8 = (id)v19;

          goto LABEL_7;
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v16)
        continue;
      break;
    }
  }

  v8 = 0;
LABEL_7:

  return v8;
}

- (id)subElementsWithName:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_rows;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "name", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
        objc_msgSend(v11, "subElementsWithName:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v14);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void)setContainerizedHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_containerizedHeaderView, a3);
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (void)setContainerizedFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_containerizedFooterView, a3);
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (void)setFooterHeight:(double)a3
{
  self->_footerHeight = a3;
}

- (RUITableViewRow)showAllRow
{
  return self->_showAllRow;
}

- (void)setShowAllRow:(id)a3
{
  objc_storeStrong((id *)&self->_showAllRow, a3);
}

- (RUIElement)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (RUISubHeaderElement)subHeader
{
  return self->_subHeader;
}

- (void)setSubHeader:(id)a3
{
  objc_storeStrong((id *)&self->_subHeader, a3);
}

- (RUIDetailHeaderElement)detailHeader
{
  return self->_detailHeader;
}

- (void)setDetailHeader:(id)a3
{
  objc_storeStrong((id *)&self->_detailHeader, a3);
}

- (RUIElement)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (RUIMultiChoiceElement)multiChoiceElement
{
  return self->_multiChoiceElement;
}

- (void)setMultiChoiceElement:(id)a3
{
  objc_storeStrong((id *)&self->_multiChoiceElement, a3);
}

- (RUITableView)tableElement
{
  return (RUITableView *)objc_loadWeakRetained((id *)&self->_tableElement);
}

- (void)setTableElement:(id)a3
{
  objc_storeWeak((id *)&self->_tableElement, a3);
}

- (BOOL)configured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableElement);
  objc_storeStrong((id *)&self->_multiChoiceElement, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_detailHeader, 0);
  objc_storeStrong((id *)&self->_subHeader, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_showAllRow, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_drawsTopSeparator, 0);
  objc_storeStrong((id *)&self->_containerizedFooterView, 0);
  objc_storeStrong((id *)&self->_containerizedHeaderView, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
