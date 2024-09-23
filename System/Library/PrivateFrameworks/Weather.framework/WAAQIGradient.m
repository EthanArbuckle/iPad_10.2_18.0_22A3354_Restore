@implementation WAAQIGradient

- (WAAQIGradient)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  WAAQIGradient *v5;
  WAAQIGradient *v6;
  uint64_t v7;
  NSMutableArray *internalStops;
  uint64_t v9;
  NSMutableIndexSet *locationStops;
  uint64_t v11;
  NSMutableDictionary *colorsByLocation;
  objc_super v14;

  length = a3.length;
  location = a3.location;
  v14.receiver = self;
  v14.super_class = (Class)WAAQIGradient;
  v5 = -[WAAQIGradient init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_range.location = location;
    v5->_range.length = length;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    internalStops = v6->_internalStops;
    v6->_internalStops = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v9 = objc_claimAutoreleasedReturnValue();
    locationStops = v6->_locationStops;
    v6->_locationStops = (NSMutableIndexSet *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    colorsByLocation = v6->_colorsByLocation;
    v6->_colorsByLocation = (NSMutableDictionary *)v11;

  }
  return v6;
}

- (void)addGradientStop:(id)a3
{
  NSMutableArray *internalStops;
  id v5;
  NSMutableDictionary *colorsByLocation;
  void *v7;
  void *v8;
  void *v9;
  NSMutableIndexSet *locationStops;
  float v11;
  float v12;

  if (a3)
  {
    internalStops = self->_internalStops;
    v5 = a3;
    -[NSMutableArray addObject:](internalStops, "addObject:", v5);
    colorsByLocation = self->_colorsByLocation;
    objc_msgSend(v5, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "location");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](colorsByLocation, "setObject:forKey:", v7, v9);

    locationStops = self->_locationStops;
    objc_msgSend(v5, "location");
    v12 = v11;

    -[NSMutableIndexSet addIndex:](locationStops, "addIndex:", (unint64_t)v12);
  }
}

- (NSArray)stops
{
  return (NSArray *)-[NSMutableArray sortedArrayUsingComparator:](self->_internalStops, "sortedArrayUsingComparator:", &__block_literal_global_1);
}

uint64_t __22__WAAQIGradient_stops__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  void *v11;
  uint64_t v12;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "location");
  objc_msgSend(v4, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "location");
  v9 = v8;

  LODWORD(v10) = v9;
  objc_msgSend(v7, "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "compare:", v11);

  return v12;
}

- (id)gradientStopForLocation:(unint64_t)a3
{
  NSMutableDictionary *colorsByLocation;
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  colorsByLocation = self->_colorsByLocation;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](colorsByLocation, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v9 = -[NSMutableIndexSet indexLessThanOrEqualToIndex:](self->_locationStops, "indexLessThanOrEqualToIndex:", a3);
    v10 = -[NSMutableIndexSet indexGreaterThanOrEqualToIndex:](self->_locationStops, "indexGreaterThanOrEqualToIndex:", a3);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = -[NSMutableIndexSet firstIndex](self->_locationStops, "firstIndex");
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = -[NSMutableIndexSet lastIndex](self->_locationStops, "lastIndex");
    v11 = self->_colorsByLocation;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = self->_colorsByLocation;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0.0;
    v25 = 0.0;
    v23 = 0.0;
    objc_msgSend(v13, "getRed:green:blue:alpha:", &v25, &v24, &v23, 0);
    v21 = 0.0;
    v22 = 0.0;
    v20 = 0.0;
    objc_msgSend(v16, "getRed:green:blue:alpha:", &v22, &v21, &v20, 0);
    v17 = 0.0;
    if (v9 != v10)
      v17 = ((double)a3 - (double)v9) / ((double)v10 - (double)v9);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v25 - (v25 - v22) * v17, v24 - (v24 - v21) * v17, v23 - (v23 - v20) * v17, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  *(float *)&v8 = (float)a3;
  +[WAAQIGradientStop gradientStopWithColor:location:](WAAQIGradientStop, "gradientStopWithColor:location:", v7, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSMutableArray)internalStops
{
  return self->_internalStops;
}

- (void)setInternalStops:(id)a3
{
  objc_storeStrong((id *)&self->_internalStops, a3);
}

- (NSMutableIndexSet)locationStops
{
  return self->_locationStops;
}

- (NSMutableDictionary)colorsByLocation
{
  return self->_colorsByLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorsByLocation, 0);
  objc_storeStrong((id *)&self->_locationStops, 0);
  objc_storeStrong((id *)&self->_internalStops, 0);
}

@end
