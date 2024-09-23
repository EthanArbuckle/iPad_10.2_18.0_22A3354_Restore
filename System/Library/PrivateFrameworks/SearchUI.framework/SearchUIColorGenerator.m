@implementation SearchUIColorGenerator

- (SearchUIColorGenerator)initWithSFColor:(id)a3
{
  id v4;
  SearchUIColorGenerator *v5;
  SearchUIColorGenerator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIColorGenerator;
  v5 = -[SearchUIColorGenerator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SearchUIColorGenerator setSfColor:](v5, "setSfColor:", v4);

  return v6;
}

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  -[SearchUIColorGenerator sfColor](self, "sfColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(v6, "redComponent");
  v9 = fmin(v8, 1.0);
  objc_msgSend(v6, "greenComponent");
  v11 = fmin(v10, 1.0);
  objc_msgSend(v6, "blueComponent");
  v13 = fmin(v12, 1.0);
  objc_msgSend(v6, "alphaComponent");
  if (v14 == 0.0)
    v14 = 1.0;
  objc_msgSend(v7, "colorWithRed:green:blue:alpha:", v9, v11, v13, fmin(v14, 1.0));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
  {
    v18[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v17);

  }
  else
  {
    v5[2](v5, 0);
  }

}

- (int)defaultTintStyle
{
  return 2;
}

- (SFColor)sfColor
{
  return self->_sfColor;
}

- (void)setSfColor:(id)a3
{
  objc_storeStrong((id *)&self->_sfColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfColor, 0);
}

@end
