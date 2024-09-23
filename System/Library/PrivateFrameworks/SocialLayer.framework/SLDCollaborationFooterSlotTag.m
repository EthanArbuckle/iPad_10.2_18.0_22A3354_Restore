@implementation SLDCollaborationFooterSlotTag

+ (id)tagForTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5
{
  id v7;
  id v8;
  SLDCollaborationFooterSlotTag *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[SLDCollaborationFooterSlotTag initWithTitle:subtitle:maxWidth:]([SLDCollaborationFooterSlotTag alloc], "initWithTitle:subtitle:maxWidth:", v8, v7, a5);

  return v9;
}

- (SLDCollaborationFooterSlotTag)initWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5
{
  id v8;
  id v9;
  SLDCollaborationFooterSlotTag *v10;
  NSObject *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *subtitle;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SLDCollaborationFooterSlotTag;
  v10 = -[SLDCollaborationFooterSlotTag init](&v17, sel_init);
  if (v10)
  {
    if ((!v8 || objc_msgSend(v8, "isEqualToString:", &stru_1E3797070))
      && (!v9 || objc_msgSend(v9, "isEqualToString:", &stru_1E3797070)))
    {
      SLFrameworkLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SLDCollaborationFooterSlotTag initWithTitle:subtitle:maxWidth:].cold.1(v11);

    }
    v12 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    subtitle = v10->_subtitle;
    v10->_subtitle = (NSString *)v14;

    v10->_maxWidth = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SLDCollaborationFooterSlotTag *v4;
  void *v5;
  void *v6;
  SLDCollaborationFooterSlotTag *v7;

  v4 = [SLDCollaborationFooterSlotTag alloc];
  -[SLDCollaborationFooterSlotTag title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCollaborationFooterSlotTag subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCollaborationFooterSlotTag maxWidth](self, "maxWidth");
  v7 = -[SLDCollaborationFooterSlotTag initWithTitle:subtitle:maxWidth:](v4, "initWithTitle:subtitle:maxWidth:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SLDCollaborationFooterSlotTag *v5;
  SLDCollaborationFooterSlotTag *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (SLDCollaborationFooterSlotTag *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v14 = 1;
    }
    else
    {
      -[SLDCollaborationFooterSlotTag maxWidth](v5, "maxWidth");
      v8 = v7;
      -[SLDCollaborationFooterSlotTag maxWidth](self, "maxWidth");
      if (SL_CGFloatApproximatelyEqualToFloat(v8, v9))
      {
        -[SLDCollaborationFooterSlotTag title](v6, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDCollaborationFooterSlotTag title](self, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {
          -[SLDCollaborationFooterSlotTag subtitle](v6, "subtitle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLDCollaborationFooterSlotTag subtitle](self, "subtitle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;

  -[SLDCollaborationFooterSlotTag title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SLDCollaborationFooterSlotTag subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SLDCollaborationFooterSlotTag maxWidth](self, "maxWidth");
  v8 = v6 ^ (unint64_t)v7;

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithTitle:(os_log_t)log subtitle:maxWidth:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "SLDCollaborationFooterSlotTag initialized with nil title and subtitle", v1, 2u);
}

@end
