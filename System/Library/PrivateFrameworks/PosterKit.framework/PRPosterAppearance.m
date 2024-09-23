@implementation PRPosterAppearance

- (PRPosterAppearance)initWithFont:(id)a3 labelColor:(id)a4 preferredTitleAlignment:(unint64_t)a5 preferredTitleLayout:(unint64_t)a6
{
  id v11;
  id v12;
  PRPosterAppearance *v13;
  PRPosterAppearance *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PRPosterAppearance;
  v13 = -[PRPosterAppearance init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_font, a3);
    objc_storeStrong((id *)&v14->_labelColor, a4);
    v14->_preferredTitleAlignment = a5;
    v14->_preferredTitleLayout = a6;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterAppearance *v4;
  PRPosterAppearance *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v4 = (PRPosterAppearance *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PRPosterAppearance font](v5, "font");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterAppearance font](self, "font");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (!v8)
        goto LABEL_9;
      -[PRPosterAppearance labelColor](v5, "labelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterAppearance labelColor](self, "labelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
      v12 = -[PRPosterAppearance preferredTitleAlignment](v5, "preferredTitleAlignment");
      if (v12 == -[PRPosterAppearance preferredTitleAlignment](self, "preferredTitleAlignment"))
      {
        v13 = -[PRPosterAppearance preferredTitleLayout](v5, "preferredTitleLayout");
        v14 = v13 == -[PRPosterAppearance preferredTitleLayout](self, "preferredTitleLayout");
      }
      else
      {
LABEL_9:
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (PRPosterColor)labelColor
{
  return self->_labelColor;
}

- (UIFont)font
{
  return self->_font;
}

- (unint64_t)preferredTitleAlignment
{
  return self->_preferredTitleAlignment;
}

- (unint64_t)preferredTitleLayout
{
  return self->_preferredTitleLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
}

@end
