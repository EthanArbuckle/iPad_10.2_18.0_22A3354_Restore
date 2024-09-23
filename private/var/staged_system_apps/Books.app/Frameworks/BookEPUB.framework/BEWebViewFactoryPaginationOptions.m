@implementation BEWebViewFactoryPaginationOptions

- (BEWebViewFactoryPaginationOptions)init
{
  return -[BEWebViewFactoryPaginationOptions initWithMode:usePaginationLineGrid:respectPageBreaks:isHorizontalScroll:contentLayoutSize:gapBetweenPages:viewportWidth:fixedLayoutSize:pageLength:fontSize:developerExtrasEnabled:](self, "initWithMode:usePaginationLineGrid:respectPageBreaks:isHorizontalScroll:contentLayoutSize:gapBetweenPages:viewportWidth:fixedLayoutSize:pageLength:fontSize:developerExtrasEnabled:", 0, 0, 0, 0, 0, CGSizeZero.width, CGSizeZero.height, 0.0, 0.0, CGSizeZero.width, CGSizeZero.height, 0.0, 0.0);
}

- (BEWebViewFactoryPaginationOptions)initWithMode:(unint64_t)a3 usePaginationLineGrid:(BOOL)a4 respectPageBreaks:(BOOL)a5 isHorizontalScroll:(BOOL)a6 contentLayoutSize:(CGSize)a7 gapBetweenPages:(double)a8 viewportWidth:(double)a9 fixedLayoutSize:(CGSize)a10 pageLength:(double)a11 fontSize:(double)a12 developerExtrasEnabled:(BOOL)a13
{
  CGFloat height;
  CGFloat width;
  CGFloat v23;
  CGFloat v24;
  BEWebViewFactoryPaginationOptions *result;
  objc_super v27;

  height = a10.height;
  width = a10.width;
  v23 = a7.height;
  v24 = a7.width;
  v27.receiver = self;
  v27.super_class = (Class)BEWebViewFactoryPaginationOptions;
  result = -[BEWebViewFactoryPaginationOptions init](&v27, "init");
  if (result)
  {
    result->_mode = a3;
    result->_usePaginationLineGrid = a4;
    result->_respectPageBreaks = a5;
    result->_isHorizontalScroll = a6;
    result->_contentLayoutSize.width = v24;
    result->_contentLayoutSize.height = v23;
    result->_gapBetweenPages = a8;
    result->_viewportWidth = a9;
    result->_fixedLayoutSize.width = width;
    result->_fixedLayoutSize.height = height;
    result->_pageLength = a11;
    result->_fontSize = a12;
    result->_developerExtrasEnabled = a13;
  }
  return result;
}

- (int64_t)wkPaginationMode
{
  unint64_t mode;
  unint64_t v3;
  int64_t v4;

  mode = self->_mode;
  v3 = mode - 2;
  v4 = mode - 1;
  if (v3 >= 3)
    return 0;
  else
    return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BEWebViewFactoryPaginationOptions *v7;
  id v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  char v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v4 = a3;
  v5 = objc_opt_class(BEWebViewFactoryPaginationOptions);
  v6 = BUDynamicCast(v5, v4);
  v7 = (BEWebViewFactoryPaginationOptions *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
    goto LABEL_7;
  if (v7 == self)
  {
    v12 = 1;
    goto LABEL_9;
  }
  v8 = -[BEWebViewFactoryPaginationOptions mode](v7, "mode");
  if (v8 != (id)-[BEWebViewFactoryPaginationOptions mode](self, "mode"))
    goto LABEL_7;
  v9 = -[BEWebViewFactoryPaginationOptions usePaginationLineGrid](v7, "usePaginationLineGrid");
  if (v9 != -[BEWebViewFactoryPaginationOptions usePaginationLineGrid](self, "usePaginationLineGrid"))
    goto LABEL_7;
  v10 = -[BEWebViewFactoryPaginationOptions respectPageBreaks](v7, "respectPageBreaks");
  if (v10 != -[BEWebViewFactoryPaginationOptions respectPageBreaks](self, "respectPageBreaks"))
    goto LABEL_7;
  v11 = -[BEWebViewFactoryPaginationOptions isHorizontalScroll](v7, "isHorizontalScroll");
  if (v11 != -[BEWebViewFactoryPaginationOptions isHorizontalScroll](self, "isHorizontalScroll"))
    goto LABEL_7;
  -[BEWebViewFactoryPaginationOptions contentLayoutSize](v7, "contentLayoutSize");
  v15 = v14;
  v17 = v16;
  -[BEWebViewFactoryPaginationOptions contentLayoutSize](self, "contentLayoutSize");
  v12 = 0;
  if (v15 == v19 && v17 == v18)
  {
    -[BEWebViewFactoryPaginationOptions gapBetweenPages](v7, "gapBetweenPages");
    v21 = v20;
    -[BEWebViewFactoryPaginationOptions gapBetweenPages](self, "gapBetweenPages");
    if (v21 != v22
      || (-[BEWebViewFactoryPaginationOptions viewportWidth](v7, "viewportWidth"),
          v24 = v23,
          -[BEWebViewFactoryPaginationOptions viewportWidth](self, "viewportWidth"),
          v24 != v25))
    {
LABEL_7:
      v12 = 0;
      goto LABEL_9;
    }
    -[BEWebViewFactoryPaginationOptions fixedLayoutSize](v7, "fixedLayoutSize");
    v27 = v26;
    v29 = v28;
    -[BEWebViewFactoryPaginationOptions fixedLayoutSize](self, "fixedLayoutSize");
    v12 = 0;
    if (v27 == v31 && v29 == v30)
    {
      -[BEWebViewFactoryPaginationOptions pageLength](v7, "pageLength");
      v33 = v32;
      -[BEWebViewFactoryPaginationOptions pageLength](self, "pageLength");
      v12 = v33 == v34;
    }
  }
LABEL_9:

  return v12;
}

- (BOOL)isPaginated
{
  return (char *)-[BEWebViewFactoryPaginationOptions mode](self, "mode") == (char *)&dword_0 + 2
      || (char *)-[BEWebViewFactoryPaginationOptions mode](self, "mode") == (char *)&dword_0 + 3
      || (int *)-[BEWebViewFactoryPaginationOptions mode](self, "mode") == &dword_4;
}

- (double)scrollPageLength
{
  unint64_t v3;
  double result;
  unsigned int v5;
  double v6;

  v3 = -[BEWebViewFactoryPaginationOptions mode](self, "mode");
  result = 0.0;
  if (!v3)
  {
    v5 = -[BEWebViewFactoryPaginationOptions isHorizontalScroll](self, "isHorizontalScroll", 0.0);
    -[BEWebViewFactoryPaginationOptions contentLayoutSize](self, "contentLayoutSize");
    if (!v5)
      return v6;
  }
  return result;
}

- (BEWebViewFactoryPaginationOptions)initWithFixedSize:(CGSize)a3
{
  return -[BEWebViewFactoryPaginationOptions initWithMode:usePaginationLineGrid:respectPageBreaks:isHorizontalScroll:contentLayoutSize:gapBetweenPages:viewportWidth:fixedLayoutSize:pageLength:fontSize:developerExtrasEnabled:](self, "initWithMode:usePaginationLineGrid:respectPageBreaks:isHorizontalScroll:contentLayoutSize:gapBetweenPages:viewportWidth:fixedLayoutSize:pageLength:fontSize:developerExtrasEnabled:", 1, 0, 0, 0, 0, CGSizeZero.width, CGSizeZero.height, 0.0);
}

- (void)applyToWebView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_setPaginationMode:", -[BEWebViewFactoryPaginationOptions wkPaginationMode](self, "wkPaginationMode"));
  objc_msgSend(v4, "_setPageLength:", self->_pageLength);
  objc_msgSend(v4, "_setGapBetweenPages:", self->_gapBetweenPages);
  objc_msgSend(v4, "_setPaginationBehavesLikeColumns:", !self->_respectPageBreaks);
  objc_msgSend(v4, "_setPaginationLineGridEnabled:", self->_usePaginationLineGrid);

}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)usePaginationLineGrid
{
  return self->_usePaginationLineGrid;
}

- (BOOL)respectPageBreaks
{
  return self->_respectPageBreaks;
}

- (BOOL)isHorizontalScroll
{
  return self->_isHorizontalScroll;
}

- (CGSize)contentLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentLayoutSize.width;
  height = self->_contentLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)gapBetweenPages
{
  return self->_gapBetweenPages;
}

- (double)viewportWidth
{
  return self->_viewportWidth;
}

- (CGSize)fixedLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fixedLayoutSize.width;
  height = self->_fixedLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)pageLength
{
  return self->_pageLength;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (BOOL)developerExtrasEnabled
{
  return self->_developerExtrasEnabled;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];

  v8[0] = CFSTR("pageLength");
  -[BEWebViewFactoryPaginationOptions pageLength](self, "pageLength");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v9[0] = v3;
  v8[1] = CFSTR("gapBetweenPages");
  -[BEWebViewFactoryPaginationOptions gapBetweenPages](self, "gapBetweenPages");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v9[1] = v4;
  v8[2] = CFSTR("mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BEWebViewFactoryPaginationOptions mode](self, "mode")));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));

  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryPaginationOptions dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v2, 0, &v6));

  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;

  return v4;
}

@end
