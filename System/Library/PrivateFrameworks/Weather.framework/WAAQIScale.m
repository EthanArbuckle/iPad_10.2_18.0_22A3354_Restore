@implementation WAAQIScale

- (WAAQIScale)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  WAAQIScale *v5;
  WAAQIScale *v6;
  uint64_t v7;
  NSMutableArray *categories;
  WAAQIGradient *v9;
  WAAQIGradient *gradient;
  objc_super v12;

  length = a3.length;
  location = a3.location;
  v12.receiver = self;
  v12.super_class = (Class)WAAQIScale;
  v5 = -[WAAQIScale init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_range.location = location;
    v5->_range.length = length;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    categories = v6->_categories;
    v6->_categories = (NSMutableArray *)v7;

    v9 = -[WAAQIGradient initWithRange:]([WAAQIGradient alloc], "initWithRange:", location, length);
    gradient = v6->_gradient;
    v6->_gradient = v9;

  }
  return v6;
}

- (void)addCategory:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_categories, "addObject:");
}

- (NSMutableArray)categories
{
  return (NSMutableArray *)(id)-[NSMutableArray copy](self->_categories, "copy");
}

+ (id)scaleFromFoundationScale:(id)a3
{
  id v3;
  WAAQIScale *v4;
  uint64_t v5;
  uint64_t v6;
  WAAQIScale *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  WAAQICategory *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  WAAQICategory *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = [WAAQIScale alloc];
    v5 = objc_msgSend(v3, "range");
    v7 = -[WAAQIScale initWithRange:](v4, "initWithRange:", v5, v6);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v34 = v3;
    objc_msgSend(v3, "categories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v13 = [WAAQICategory alloc];
          v14 = objc_msgSend(v12, "range");
          v16 = v15;
          v17 = (void *)MEMORY[0x24BDF6950];
          objc_msgSend(v12, "color");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "wa_colorFromHexString:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[WAAQICategory initWithRange:color:](v13, "initWithRange:color:", v14, v16, v19);

          -[WAAQIScale addCategory:](v7, "addCategory:", v20);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v9);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v34, "gradient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stops");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          v28 = (void *)MEMORY[0x24BDF6950];
          objc_msgSend(v27, "color");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "wa_colorFromHexString:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "location");
          +[WAAQIGradientStop gradientStopWithColor:location:](WAAQIGradientStop, "gradientStopWithColor:location:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          -[WAAQIScale gradient](v7, "gradient");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addGradientStop:", v31);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v24);
    }

    v3 = v34;
  }
  else
  {
    v7 = 0;
  }

  return v7;
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

- (void)setCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (WAAQIGradient)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
