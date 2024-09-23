@implementation SKUIVideoViewElement

- (SKUIVideoViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIVideoViewElement *v11;
  void *v12;
  void *v13;
  SKUIImageViewElement *v14;
  SKUIImageViewElement *thumbnailImage;
  void *v16;
  SKUIImageViewElement *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  int v33;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  objc_super v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIVideoViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v40.receiver = self;
  v40.super_class = (Class)SKUIVideoViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v40, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("playback"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("inline")))
      v11->_playbackStyle = 1;
    -[SKUIViewElement firstChildForElementType:](v11, "firstChildForElementType:", 49);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      v13 = (void *)objc_opt_class();
      objc_msgSend(v13, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("video"), 49, 0);
      v14 = -[SKUIImageViewElement initWithDOMElement:parent:elementFactory:]([SKUIImageViewElement alloc], "initWithDOMElement:parent:elementFactory:", v8, v11, v10);
      thumbnailImage = v11->_thumbnailImage;
      v11->_thumbnailImage = v14;

      -[SKUIImageViewElement URL](v11->_thumbnailImage, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v17 = v11->_thumbnailImage;
        v11->_thumbnailImage = 0;

      }
      v18 = (void *)objc_opt_class();
      objc_msgSend(v18, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("video"), 152);
    }
    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"), v35);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v12;
    v38 = v10;
    if (objc_msgSend(v19, "length"))
      v20 = objc_msgSend(v19, "BOOLValue") ^ 1;
    else
      v20 = -1;
    v11->_enabled = v20;
    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
      v11->_itemIdentifier = objc_msgSend(v21, "longLongValue");
    objc_msgSend(v8, "getAttribute:", CFSTR("data-metrics"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v22;
      v24 = v23;
      if (v23)
      {
        v25 = (void *)MEMORY[0x1E0CB36D8];
        objc_msgSend(v23, "dataUsingEncoding:", 4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "JSONObjectWithData:options:error:", v26, 0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
    }
    else
    {
      v24 = 0;
    }
    v27 = 0;
LABEL_22:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v27;
      v29 = v28;
      if (v28)
      {
        objc_msgSend(v28, "objectForKey:", CFSTR("kind"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v31 = v30;
        else
          v31 = 0;
        if ((objc_msgSend(v31, "isEqualToString:", CFSTR("movie")) & 1) != 0)
        {
          v32 = 1;
        }
        else
        {
          v33 = objc_msgSend(v31, "isEqualToString:", CFSTR("tvEpisode"));
          v32 = 2;
          if (!v33)
            v32 = 0;
        }
        v11->_kind = v32;

        v10 = v38;
        v9 = v39;
        goto LABEL_35;
      }
    }
    else
    {
      v29 = 0;
    }
    v30 = 0;
    goto LABEL_27;
  }
LABEL_35:

  return v11;
}

- (NSArray)assets
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__SKUIVideoViewElement_assets__block_invoke;
  v6[3] = &unk_1E73A12A8;
  v4 = v3;
  v7 = v4;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __30__SKUIVideoViewElement_assets__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (SKUIImageViewElement)thumbnailImage
{
  SKUIImageViewElement *thumbnailImage;

  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage)
    return thumbnailImage;
  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
  return (SKUIImageViewElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIVideoViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SKUIVideoViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIVideoViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_enabled = v4->_enabled;
    self->_itemIdentifier = -[SKUIVideoViewElement itemIdentifier](v4, "itemIdentifier");
    self->_playbackStyle = -[SKUIVideoViewElement playbackStyle](v4, "playbackStyle");
    objc_storeStrong((id *)&self->_thumbnailImage, v4->_thumbnailImage);
  }

  return v6;
}

- (BOOL)isEnabled
{
  int enabled;
  objc_super v4;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  v4.receiver = self;
  v4.super_class = (Class)SKUIVideoViewElement;
  return -[SKUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIVideoViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
