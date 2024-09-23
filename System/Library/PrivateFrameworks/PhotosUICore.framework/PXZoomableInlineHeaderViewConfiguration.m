@implementation PXZoomableInlineHeaderViewConfiguration

- (PXZoomableInlineHeaderViewConfiguration)initWithTitle:(id)a3 subtitle:(id)a4 swapTitleAndSubtitle:(BOOL)a5 style:(unint64_t)a6
{
  id v11;
  id v12;
  PXZoomableInlineHeaderViewConfiguration *v13;
  PXZoomableInlineHeaderViewConfiguration *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXZoomableInlineHeaderViewConfiguration;
  v13 = -[PXZoomableInlineHeaderViewConfiguration init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_title, a3);
    objc_storeStrong((id *)&v14->_subtitle, a4);
    v14->_swapTitleAndSubtitle = a5;
    v14->_style = a6;
  }

  return v14;
}

- (PXZoomableInlineHeaderViewConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomableInlineHeaderView.m"), 70, CFSTR("%s is not available as initializer"), "-[PXZoomableInlineHeaderViewConfiguration init]");

  abort();
}

- (BOOL)isEqual:(id)a3
{
  PXZoomableInlineHeaderViewConfiguration *v4;
  PXZoomableInlineHeaderViewConfiguration *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;

  v4 = (PXZoomableInlineHeaderViewConfiguration *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXZoomableInlineHeaderViewConfiguration style](v5, "style");
      if (v6 == -[PXZoomableInlineHeaderViewConfiguration style](self, "style"))
      {
        -[PXZoomableInlineHeaderViewConfiguration title](self, "title");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[PXZoomableInlineHeaderViewConfiguration title](v5, "title");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {

        }
        else
        {
          v9 = v8;
          v10 = objc_msgSend(v7, "isEqual:", v8);

          if ((v10 & 1) == 0)
            goto LABEL_6;
        }
        -[PXZoomableInlineHeaderViewConfiguration subtitle](self, "subtitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXZoomableInlineHeaderViewConfiguration subtitle](v5, "subtitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 == v13)
          v11 = 1;
        else
          v11 = objc_msgSend(v12, "isEqual:", v13);

        goto LABEL_14;
      }
LABEL_6:
      v11 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[PXZoomableInlineHeaderViewConfiguration style](self, "style");
  -[PXZoomableInlineHeaderViewConfiguration title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[PXZoomableInlineHeaderViewConfiguration subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (unint64_t)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)swapTitleAndSubtitle
{
  return self->_swapTitleAndSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
