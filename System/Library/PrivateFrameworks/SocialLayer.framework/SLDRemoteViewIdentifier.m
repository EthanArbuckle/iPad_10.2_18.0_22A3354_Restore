@implementation SLDRemoteViewIdentifier

+ (id)identifierForStyle:(id)a3 tag:(id)a4
{
  id v5;
  id v6;
  SLDRemoteViewIdentifier *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SLDRemoteViewIdentifier initWithStyle:tag:]([SLDRemoteViewIdentifier alloc], "initWithStyle:tag:", v6, v5);

  return v7;
}

- (SLDRemoteViewIdentifier)initWithStyle:(id)a3 tag:(id)a4
{
  id v7;
  id v8;
  SLDRemoteViewIdentifier *v9;
  SLDRemoteViewIdentifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLDRemoteViewIdentifier;
  v9 = -[SLDRemoteViewIdentifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_style, a3);
    objc_storeStrong((id *)&v10->_tag, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SLDRemoteViewIdentifier style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDRemoteViewIdentifier tag](self, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SLDRemoteViewIdentifier: %p> style:[%@] tag:[%@]"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SLDRemoteViewIdentifier *v5;
  SLDRemoteViewIdentifier *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (SLDRemoteViewIdentifier *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v11 = 1;
    }
    else
    {
      -[SLDRemoteViewIdentifier style](v5, "style");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDRemoteViewIdentifier style](self, "style");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[SLDRemoteViewIdentifier tag](v6, "tag");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDRemoteViewIdentifier tag](self, "tag");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SLDRemoteViewIdentifier style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SLDRemoteViewIdentifier tag](self, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (UISSlotStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (SLDSlotTag)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
