@implementation SearchUIColorRequest

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SearchUIColorRequest sfColor](self, "sfColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SearchUIColorRequest appearance](self, "appearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SearchUIColorRequest *v4;
  SearchUIColorRequest *v5;
  BOOL v6;

  v4 = (SearchUIColorRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SearchUIColorRequest isEqualToColorRequest:](self, "isEqualToColorRequest:", v5);

  return v6;
}

- (BOOL)isEqualToColorRequest:(id)a3
{
  SearchUIColorRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (SearchUIColorRequest *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    -[SearchUIColorRequest sfColor](self, "sfColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIColorRequest sfColor](v4, "sfColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[SearchUIColorRequest appearance](self, "appearance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIColorRequest appearance](v4, "appearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (SFColor)sfColor
{
  return self->_sfColor;
}

- (void)setSfColor:(id)a3
{
  objc_storeStrong((id *)&self->_sfColor, a3);
}

- (TLKAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_appearance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_sfColor, 0);
}

@end
