@implementation REMListBadge

- (REMListBadge)initWithEmblem:(id)a3
{
  id v4;
  REMListBadge *v5;
  REMListBadge *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMListBadge;
  v5 = -[REMListBadge init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[REMListBadge setEmblem:](v5, "setEmblem:", v4);

  return v6;
}

- (REMListBadge)initWithEmoji:(id)a3
{
  id v4;
  REMListBadge *v5;
  REMListBadge *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMListBadge;
  v5 = -[REMListBadge init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[REMListBadge setEmoji:](v5, "setEmoji:", v4);

  return v6;
}

- (REMListBadge)initWithRawValue:(id)a3
{
  id v4;
  REMListBadge *v5;
  REMListBadge *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListBadge;
  v5 = -[REMListBadge init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    if (-[REMListBadge _isJSONString:](v5, "_isJSONString:", v4))
    {
      -[REMListBadge _emojiFromRawString:](v6, "_emojiFromRawString:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListBadge setEmoji:](v6, "setEmoji:", v7);

    }
    else
    {
      -[REMListBadge setEmblem:](v6, "setEmblem:", v4);
    }
  }

  return v6;
}

- (NSString)rawValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[REMListBadge emblem](self, "emblem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[REMListBadge emblem](self, "emblem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[REMListBadge emoji](self, "emoji");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("{\"%@\" : \"%@\"}"), CFSTR("Emoji"), v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (BOOL)_isSingleCharacterEmoji:(id)a3
{
  return CEMStringIsSingleEmoji() != 0;
}

- (id)_emojiFromRawString:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  REMDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("Emoji"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isJSONString:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(v3, "characterAtIndex:", 0) == 123;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  -[REMListBadge emblem](self, "emblem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emblem");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMListBadge emblem](self, "emblem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emblem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  -[REMListBadge emoji](self, "emoji");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emoji");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {
    v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    -[REMListBadge emoji](self, "emoji");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emoji");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "isEqual:", v16);

  }
LABEL_10:

  return v11;
}

- (NSString)emblem
{
  return self->emblem;
}

- (void)setEmblem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)emoji
{
  return self->emoji;
}

- (void)setEmoji:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->emoji, 0);
  objc_storeStrong((id *)&self->emblem, 0);
}

@end
