@implementation TVMediaInfo

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[TVMediaInfo playlist](self, "playlist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[TVMediaInfo overlayView](self, "overlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[TVMediaInfo imageProxies](self, "imageProxies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  TVMediaInfo *v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  if (v8 == self)
  {
    v12 = 1;
  }
  else
  {
    v9 = -[TVMediaInfo intent](self, "intent");
    if (v9 == -[TVMediaInfo intent](v8, "intent"))
    {
      -[TVMediaInfo playlist](self, "playlist");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVMediaInfo playlist](v8, "playlist");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[TVMediaInfo playlist](self, "playlist");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVMediaInfo playlist](v8, "playlist");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v12 = 0;
          goto LABEL_28;
        }
      }
      -[TVMediaInfo overlayView](self, "overlayView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVMediaInfo overlayView](v8, "overlayView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 != v14)
      {

        v12 = 0;
        goto LABEL_27;
      }
      -[TVMediaInfo contentView](self, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVMediaInfo contentView](v8, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 != v16)
      {
        v12 = 0;
LABEL_26:

LABEL_27:
        if (v10 == v11)
        {
LABEL_29:

          goto LABEL_30;
        }
LABEL_28:

        goto LABEL_29;
      }
      v27 = v15;
      -[TVMediaInfo imageProxies](self, "imageProxies");
      v17 = objc_claimAutoreleasedReturnValue();
      -[TVMediaInfo imageProxies](v8, "imageProxies");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v17;
      if ((void *)v17 == v29)
      {
        v24 = v16;
      }
      else
      {
        -[TVMediaInfo imageProxies](self, "imageProxies");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVMediaInfo imageProxies](v8, "imageProxies");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v18;
        if (!objc_msgSend(v18, "isEqualToArray:"))
        {
          v12 = 0;
          v15 = v27;
LABEL_24:

LABEL_25:
          goto LABEL_26;
        }
        v24 = v16;
      }
      v15 = v27;
      -[TVMediaInfo backgroundColor](self, "backgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVMediaInfo backgroundColor](v8, "backgroundColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v19;
      if (v19 == v23)
      {

        v12 = 1;
      }
      else
      {
        -[TVMediaInfo backgroundColor](self, "backgroundColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVMediaInfo backgroundColor](v8, "backgroundColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v22, "isEqual:", v20);

      }
      v16 = v24;
      if (v30 == v29)
        goto LABEL_25;
      goto LABEL_24;
    }
    v12 = 0;
  }
LABEL_30:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIntent:", -[TVMediaInfo intent](self, "intent"));
  -[TVMediaInfo playlist](self, "playlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaylist:", v5);

  -[TVMediaInfo overlayView](self, "overlayView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayView:", v6);

  -[TVMediaInfo contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentView:", v7);

  -[TVMediaInfo imageProxies](self, "imageProxies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageProxies:", v8);

  -[TVMediaInfo backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v9);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TVMediaInfo intent](self, "intent");
  -[TVMediaInfo overlayView](self, "overlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVMediaInfo contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVMediaInfo backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVMediaInfo playlist](self, "playlist");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVMediaInfo imageProxies](self, "imageProxies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Intent = %lu, overlayView = %@, contentView = %@, backgroundColor = %@, playlist = %@, imageProxies = %@"), v5, self, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(int64_t)a3
{
  self->_intent = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (void)setImageProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TVPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_imageProxies, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
