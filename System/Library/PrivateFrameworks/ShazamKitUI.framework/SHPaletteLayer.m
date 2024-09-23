@implementation SHPaletteLayer

- (SHPaletteLayer)initWithCoder:(id)a3
{
  SHPaletteLayer *v3;
  uint64_t v4;
  SHPalette *palette;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SHPaletteLayer;
  v3 = -[SHPaletteLayer initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v3)
  {
    +[SHPalette default](SHPalette, "default");
    v4 = objc_claimAutoreleasedReturnValue();
    palette = v3->_palette;
    v3->_palette = (SHPalette *)v4;

    -[SHPaletteLayer setup](v3, "setup");
  }
  return v3;
}

- (SHPaletteLayer)init
{
  void *v3;
  SHPaletteLayer *v4;

  +[SHPalette default](SHPalette, "default");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SHPaletteLayer initWithPalette:](self, "initWithPalette:", v3);

  return v4;
}

- (SHPaletteLayer)initWithPalette:(id)a3
{
  id v5;
  SHPaletteLayer *v6;
  SHPaletteLayer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHPaletteLayer;
  v6 = -[SHPaletteLayer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_palette, a3);
    -[SHPaletteLayer setup](v7, "setup");
  }

  return v7;
}

- (void)setup
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("You must override %@ in a subclass"), v4);

}

- (SHPalette)palette
{
  return self->_palette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
}

@end
