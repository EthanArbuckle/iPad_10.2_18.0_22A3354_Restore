@implementation PRPosterLabel

- (void)posterAppearanceDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "font");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterLabel font](self, "font");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
    -[PRPosterLabel setFont:](self, "setFont:", v9);
  -[PRPosterLabel textColor](self, "textColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
    -[PRPosterLabel setTextColor:](self, "setTextColor:", v6);

}

@end
