@implementation SXHorizontalStackLayout

- (SXHorizontalStackLayout)init
{
  SXHorizontalStackLayout *v2;
  uint64_t v3;
  NSMutableDictionary *widths;
  uint64_t v5;
  NSMutableDictionary *positions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXHorizontalStackLayout;
  v2 = -[SXHorizontalStackLayout init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    widths = v2->_widths;
    v2->_widths = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    positions = v2->_positions;
    v2->_positions = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (double)widthForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[SXHorizontalStackLayout widths](self, "widths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (double)positionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[SXHorizontalStackLayout positions](self, "positions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (void)setWidth:(double)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[SXHorizontalStackLayout widths](self, "widths");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)setPosition:(double)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[SXHorizontalStackLayout positions](self, "positions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SXHorizontalStackLayout positions](self, "positions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXHorizontalStackLayout widths](self, "widths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\nPositions: %@ \nWidths: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSMutableDictionary)widths
{
  return self->_widths;
}

- (NSMutableDictionary)positions
{
  return self->_positions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positions, 0);
  objc_storeStrong((id *)&self->_widths, 0);
}

@end
