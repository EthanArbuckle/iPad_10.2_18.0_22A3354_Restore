@implementation SKUIEditorialLayout

- (SKUIEditorialLayout)initWithEditorial:(id)a3 layoutCache:(id)a4
{
  id v7;
  id v8;
  SKUIEditorialLayout *v9;
  SKUIEditorialLayout *v10;
  int64x2_t v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIEditorialLayout initWithEditorial:layoutCache:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIEditorialLayout;
  v9 = -[SKUIEditorialLayout init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_editorial, a3);
    objc_storeStrong((id *)&v10->_textLayoutCache, a4);
    v11 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&v10->_landscapeLinkLayoutIndex = v11;
    v10->_landscapeTitleLayoutIndex = 0x7FFFFFFFFFFFFFFFLL;
    *(int64x2_t *)&v10->_portraitLinkLayoutIndex = v11;
    v10->_portraitTitleLayoutIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)bodyTextLayoutForOrientation:(int64_t)a3
{
  int64_t landscapeTextLayoutIndex;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    landscapeTextLayoutIndex = self->_landscapeTextLayoutIndex;
  }
  else
  {
    landscapeTextLayoutIndex = self->_portraitTextLayoutIndex;
  }
  if (landscapeTextLayoutIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[SKUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)layoutHeightForOrientation:(int64_t)a3 expanded:(BOOL)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  SKUIEditorialComponent *editorial;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v19;
  uint64_t v20;
  float v21;

  -[SKUIEditorialLayout bodyTextLayoutForOrientation:](self, "bodyTextLayoutForOrientation:");
  v7 = objc_claimAutoreleasedReturnValue();
  -[SKUIEditorialLayout linkLayoutForOrientation:](self, "linkLayoutForOrientation:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIEditorialLayout titleTextLayoutForOrientation:](self, "titleTextLayoutForOrientation:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v7 && !v8 && !v9)
  {
    v11 = 80.0;
    goto LABEL_18;
  }
  v21 = 0.0;
  v19 = 0u;
  v20 = 0;
  editorial = self->_editorial;
  if (editorial)
    -[SKUIEditorialComponent editorialStyle](editorial, "editorialStyle", (unsigned __int128)0, (unsigned __int128)0, 0);
  if (v7)
  {
    if (a4 || !objc_msgSend((id)v7, "requiresTruncation"))
      objc_msgSend((id)v7, "textSize", v19, v20);
    else
      objc_msgSend((id)v7, "truncatedSize");
    v11 = v13;
    if (v10)
      goto LABEL_13;
  }
  else
  {
    v11 = 0.0;
    if (v10)
    {
LABEL_13:
      objc_msgSend((id)v10, "textSize", v19, v20);
      v11 = v11 + v14 + v21;
    }
  }
  if (v8)
  {
    v15 = *((float *)&v20 + 1);
    if (!(v7 | v10))
      v15 = -0.0;
    v16 = v11 + v15;
    objc_msgSend(v8, "totalSize", v19, v20);
    v11 = v17 + v16;
  }
LABEL_18:

  return v11;
}

- (void)enqueueLayoutRequests
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  SKUILayoutCache *textLayoutCache;
  void *v10;
  void *v11;
  int64_t v12;
  SKUILayoutCache *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  SKUILayoutCache *v18;
  void *v19;
  void *v20;
  int64_t v21;
  SKUILayoutCache *v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  uint64_t v27;
  SKUILayoutCache *v28;
  void *v29;
  void *v30;
  int64_t v31;
  SKUILayoutCache *v32;
  void *v33;
  void *v34;
  int64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
  {
    v4 = self->_landscapeWidth > 0.00000011920929;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v4 = v6 > 375.0 && self->_landscapeWidth > 0.00000011920929;

  }
  -[SKUIEditorialComponent bodyText](self->_editorial, "bodyText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    -[SKUIEditorialComponent bodyAttributedText](self->_editorial, "bodyAttributedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_12;
  }
  textLayoutCache = self->_textLayoutCache;
  -[SKUIEditorialLayout _bodyTextLayoutRequestWithTotalWidth:](self, "_bodyTextLayoutRequestWithTotalWidth:", self->_portraitWidth);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SKUILayoutCache addLayoutRequests:](textLayoutCache, "addLayoutRequests:", v11);

  self->_portraitTextLayoutIndex = v12;
  if (v4)
  {
    v13 = self->_textLayoutCache;
    -[SKUIEditorialLayout _bodyTextLayoutRequestWithTotalWidth:](self, "_bodyTextLayoutRequestWithTotalWidth:", self->_landscapeWidth);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SKUILayoutCache addLayoutRequests:](v13, "addLayoutRequests:", v15);

    self->_landscapeTextLayoutIndex = v16;
  }
LABEL_12:
  -[SKUIEditorialComponent titleText](self->_editorial, "titleText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = self->_textLayoutCache;
    -[SKUIEditorialLayout _titleTextLayoutRequestWithTotalWidth:](self, "_titleTextLayoutRequestWithTotalWidth:", self->_portraitWidth);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SKUILayoutCache addLayoutRequests:](v18, "addLayoutRequests:", v20);

    self->_portraitTitleLayoutIndex = v21;
    if (v4)
    {
      v22 = self->_textLayoutCache;
      -[SKUIEditorialLayout _titleTextLayoutRequestWithTotalWidth:](self, "_titleTextLayoutRequestWithTotalWidth:", self->_landscapeWidth);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[SKUILayoutCache addLayoutRequests:](v22, "addLayoutRequests:", v24);

      self->_landscapeTitleLayoutIndex = v25;
    }
  }
  -[SKUIEditorialComponent links](self->_editorial, "links");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    v28 = self->_textLayoutCache;
    -[SKUIEditorialLayout _linkLayoutRequestWithTotalWidth:](self, "_linkLayoutRequestWithTotalWidth:", self->_portraitWidth);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[SKUILayoutCache addLayoutRequests:](v28, "addLayoutRequests:", v30);

    self->_portraitLinkLayoutIndex = v31;
    if (v4)
    {
      v32 = self->_textLayoutCache;
      -[SKUIEditorialLayout _linkLayoutRequestWithTotalWidth:](self, "_linkLayoutRequestWithTotalWidth:", self->_landscapeWidth);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SKUILayoutCache addLayoutRequests:](v32, "addLayoutRequests:", v34);

      self->_landscapeLinkLayoutIndex = v35;
    }
  }
}

- (id)linkLayoutForOrientation:(int64_t)a3
{
  int64_t landscapeLinkLayoutIndex;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    landscapeLinkLayoutIndex = self->_landscapeLinkLayoutIndex;
  }
  else
  {
    landscapeLinkLayoutIndex = self->_portraitLinkLayoutIndex;
  }
  if (landscapeLinkLayoutIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[SKUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setLayoutWidth:(double)a3 forOrientation:(int64_t)a4
{
  uint64_t v4;

  if (a4 == 1)
  {
    v4 = 40;
  }
  else
  {
    if (a4)
      return;
    v4 = 72;
  }
  *(double *)((char *)&self->super.isa + v4) = a3;
}

- (id)titleTextLayoutForOrientation:(int64_t)a3
{
  int64_t landscapeTitleLayoutIndex;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    landscapeTitleLayoutIndex = self->_landscapeTitleLayoutIndex;
  }
  else
  {
    landscapeTitleLayoutIndex = self->_portraitTitleLayoutIndex;
  }
  if (landscapeTitleLayoutIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[SKUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_bodyTextLayoutRequestWithTotalWidth:(double)a3
{
  SKUITextLayoutRequest *v5;
  SKUIEditorialComponent *editorial;
  void *v7;
  void *v8;
  uint64_t v10;
  unint64_t v11;

  v5 = objc_alloc_init(SKUITextLayoutRequest);
  v10 = 0;
  editorial = self->_editorial;
  if (editorial)
  {
    -[SKUIEditorialComponent editorialStyle](editorial, "editorialStyle", 0);
    editorial = self->_editorial;
  }
  -[SKUIEditorialComponent bodyAttributedText](editorial, "bodyAttributedText", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUITextLayoutRequest setAttributedText:](v5, "setAttributedText:", v7);

  -[SKUITextLayoutRequest setFontWeight:](v5, "setFontWeight:", 0);
  -[SKUITextLayoutRequest setNumberOfLines:](v5, "setNumberOfLines:", -[SKUIEditorialComponent maximumBodyLines](self->_editorial, "maximumBodyLines"));
  -[SKUIEditorialComponent bodyText](self->_editorial, "bodyText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUITextLayoutRequest setText:](v5, "setText:", v8);

  -[SKUITextLayoutRequest setTextAlignment:](v5, "setTextAlignment:", SKUICTTextAlignmentForPageComponentAlignment(v11));
  -[SKUITextLayoutRequest setWidth:](v5, "setWidth:", a3);
  if (0.0 > 0.00000011921)
    -[SKUITextLayoutRequest setFontSize:](v5, "setFontSize:", 0.0);
  return v5;
}

- (id)_linkLayoutRequestWithTotalWidth:(double)a3
{
  SKUIEditorialLinkLayoutRequest *v5;
  void *v6;

  v5 = objc_alloc_init(SKUIEditorialLinkLayoutRequest);
  -[SKUIEditorialComponent links](self->_editorial, "links");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIEditorialLinkLayoutRequest setLinks:](v5, "setLinks:", v6);

  -[SKUIEditorialLinkLayoutRequest setWidth:](v5, "setWidth:", a3);
  return v5;
}

- (id)_titleTextLayoutRequestWithTotalWidth:(double)a3
{
  SKUITextLayoutRequest *v5;
  SKUIEditorialComponent *editorial;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v14;
  unint64_t v15;

  v5 = objc_alloc_init(SKUITextLayoutRequest);
  v14 = 0;
  editorial = self->_editorial;
  if (editorial)
    -[SKUIEditorialComponent editorialStyle](editorial, "editorialStyle", (unsigned __int128)0, 0);
  -[SKUITextLayoutRequest setFontWeight:](v5, "setFontWeight:", 0, v14);
  -[SKUIEditorialComponent titleText](self->_editorial, "titleText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUITextLayoutRequest setText:](v5, "setText:", v7);

  -[SKUITextLayoutRequest setTextAlignment:](v5, "setTextAlignment:", SKUICTTextAlignmentForPageComponentAlignment(v15));
  -[SKUITextLayoutRequest setWidth:](v5, "setWidth:", a3);
  LODWORD(v8) = 0;
  if (0.0 <= 0.00000011921)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11 == 1)
      v12 = &kSKUITextBoxLayoutTitleFontSizeIPad;
    else
      v12 = &kSKUITextBoxLayoutTitleFontSizeIPhone;
    v9 = *(double *)v12;
  }
  else
  {
    v9 = 0.0;
  }
  -[SKUITextLayoutRequest setFontSize:](v5, "setFontSize:", v9);
  return v5;
}

- (SKUIEditorialComponent)editorialComponent
{
  return self->_editorial;
}

- (SKUILayoutCache)layoutCache
{
  return self->_textLayoutCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_editorial, 0);
}

- (void)initWithEditorial:layoutCache:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIEditorialLayout initWithEditorial:layoutCache:]";
}

@end
