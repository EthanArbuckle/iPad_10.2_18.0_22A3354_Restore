@implementation MFPalette

- (MFPalette)init
{
  MFPalette *v2;
  uint64_t v3;
  NSMutableArray *m_colours;
  uint64_t i;
  NSMutableArray *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFPalette;
  v2 = -[MFPalette init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 256);
    m_colours = v2->m_colours;
    v2->m_colours = (NSMutableArray *)v3;

    for (i = 0; i != 768; i += 3)
    {
      v6 = v2->m_colours;
      +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", g_defaultPalette[i], g_defaultPalette[i + 1], g_defaultPalette[i + 2]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v6, "addObject:", v7);

    }
  }
  return v2;
}

- (int)selectInto:(id)a3
{
  objc_msgSend(a3, "setSelectedPalette:", self);
  return 0;
}

+ (MFPalette)paletteWithColours:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColours:", v4);

  return (MFPalette *)v5;
}

- (MFPalette)initWithColours:(id)a3
{
  id v4;
  MFPalette *v5;
  uint64_t v6;
  NSMutableArray *m_colours;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFPalette;
  v5 = -[MFPalette init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    m_colours = v5->m_colours;
    v5->m_colours = (NSMutableArray *)v6;

    -[NSMutableArray setArray:](v5->m_colours, "setArray:", v4);
  }

  return v5;
}

- (BOOL)setEntries:(int)a3 in_colours:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a4;
  if (a3 < 0 || (int)-[NSMutableArray count](self->m_colours, "count") < a3)
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](self->m_colours, "replaceObjectsInRange:withObjectsFromArray:", a3, objc_msgSend(v6, "count"), v6);
    v7 = 1;
  }

  return v7;
}

- (BOOL)resize:(int)a3
{
  int v5;
  int v6;
  int v7;
  NSMutableArray *m_colours;
  void *v9;

  v5 = -[NSMutableArray count](self->m_colours, "count");
  v6 = -[NSMutableArray count](self->m_colours, "count");
  if (v5 >= a3)
  {
    if (a3 < v6)
      -[NSMutableArray removeObjectsInRange:](self->m_colours, "removeObjectsInRange:", a3, -[NSMutableArray count](self->m_colours, "count") - a3);
  }
  else
  {
    v7 = a3 - v6;
    if (a3 > v6)
    {
      do
      {
        m_colours = self->m_colours;
        +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", 0, 0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](m_colours, "addObject:", v9);

        --v7;
      }
      while (v7);
    }
  }
  return 1;
}

- (id)getColour:(int)a3
{
  void *v5;

  if (a3 < 0 || (int)-[NSMutableArray count](self->m_colours, "count") <= a3)
  {
    +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->m_colours, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_colours, 0);
}

@end
