@implementation SUSegmentedControlAppearance

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUSegmentedControlAppearance;
  -[SUSegmentedControlAppearance dealloc](&v3, sel_dealloc);
}

+ (id)defaultBarAppearance
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  objc_msgSend(v2, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentBarButton"), v3), 0, 0);
  objc_msgSend(v2, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentBarButtonHighlighted"), v3), 4, 0);
  objc_msgSend(v2, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentBarDivider"), v3), 0, 0, 0);
  objc_msgSend(v2, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentBarDividerHighlighted"), v3), 0, 4, 0);
  objc_msgSend(v2, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentBarMiniButton"), v3), 0, 1);
  objc_msgSend(v2, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentBarMiniButtonHighlighted"), v3), 4, 1);
  objc_msgSend(v2, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentBarMiniDivider"), v3), 0, 0, 1);
  objc_msgSend(v2, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentBarMiniDividerHighlighted"), v3), 0, 4, 1);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.784313725, 1.0);
  v6 = *MEMORY[0x24BDF6600];
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x24BDF6600]);
  v7 = +[SUUIAppearance _defaultShadowWithColor:offset:](SUUIAppearance, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), 0.0, -1.0);
  v8 = *MEMORY[0x24BDF6640];
  objc_msgSend(v4, "setObject:forKey:", v7, *MEMORY[0x24BDF6640]);
  objc_msgSend(v2, "setTitleTextAttributes:forState:", v4, 0);

  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.87, 1.0), v6);
  objc_msgSend(v9, "setObject:forKey:", +[SUUIAppearance _defaultShadowWithColor:offset:](SUUIAppearance, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.11, 1.0), 0.0, -1.0), v8);
  objc_msgSend(v2, "setTitleTextAttributes:forState:", v9, 4);

  return v2;
}

+ (id)defaultOptionsAppearanceForTintStyle:(int64_t)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (a3 == 1)
  {
    objc_msgSend(v4, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsDarkButton"), v5), 0, 0);
    objc_msgSend(v4, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsDarkButtonSelected"), v5), 4, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsDarkDivider"), v5), 0, 0, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsDarkDividerSelected"), v5), 0, 4, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsDarkDividerSelected"), v5), 4, 0, 0);
    objc_msgSend(v4, "setOptionsBackgroundImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsDarkBackground"), v5));
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.823529412, 1.0);
    v8 = *MEMORY[0x24BDF6600];
    objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x24BDF6600]);
    v9 = +[SUUIAppearance _defaultShadowWithColor:offset:](SUUIAppearance, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.35), 0.0, -1.0);
    v10 = *MEMORY[0x24BDF6640];
    objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x24BDF6640]);
    objc_msgSend(v4, "setTitleTextAttributes:forState:", v6, 0);

    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0), v8);
    v12 = (void *)MEMORY[0x24BDF6950];
    v13 = 0.8;
    v14 = 0.0;
  }
  else
  {
    objc_msgSend(v4, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsButton"), v5), 0, 0);
    objc_msgSend(v4, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsButtonSelected"), v5), 4, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsDivider"), v5), 0, 0, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsDividerSelected"), v5), 0, 4, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsDividerSelected"), v5), 4, 0, 0);
    objc_msgSend(v4, "setOptionsBackgroundImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISegmentOptionsBackground"), v5));
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.39, 1.0);
    v17 = *MEMORY[0x24BDF6600];
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BDF6600]);
    v18 = +[SUUIAppearance _defaultShadowWithColor:offset:](SUUIAppearance, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.93, 1.0), 0.0, 1.0);
    v10 = *MEMORY[0x24BDF6640];
    objc_msgSend(v15, "setObject:forKey:", v18, *MEMORY[0x24BDF6640]);
    objc_msgSend(v4, "setTitleTextAttributes:forState:", v15, 0);

    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0), v17);
    v12 = (void *)MEMORY[0x24BDF6950];
    v14 = 0.42;
    v13 = 1.0;
  }
  objc_msgSend(v11, "setObject:forKey:", +[SUUIAppearance _defaultShadowWithColor:offset:](SUUIAppearance, "_defaultShadowWithColor:offset:", objc_msgSend(v12, "colorWithWhite:alpha:", v14, v13), 0.0, -1.0), v10);
  objc_msgSend(v4, "setTitleTextAttributes:forState:", v11, 4);

  return v4;
}

- (id)backgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  return -[SUControlAppearance imageForState:barMetrics:](self->_backgroundImages, "imageForState:barMetrics:", a3, a4);
}

- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  id v6;
  id v7;

  v6 = -[SUSegmentedControlAppearance _newDividerImageKeyWithLeftState:rightState:barMetrics:](self, "_newDividerImageKeyWithLeftState:rightState:barMetrics:", a3, a4, a5);
  v7 = (id)-[NSMutableDictionary objectForKey:](self->_dividerImages, "objectForKey:", v6);

  return v7;
}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  SUControlAppearance *backgroundImages;

  backgroundImages = self->_backgroundImages;
  if (!backgroundImages)
  {
    backgroundImages = objc_alloc_init(SUControlAppearance);
    self->_backgroundImages = backgroundImages;
  }
  -[SUControlAppearance setImage:forState:barMetrics:](backgroundImages, "setImage:forState:barMetrics:", a3, a4, a5);
}

- (void)setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5 barMetrics:(int64_t)a6
{
  id v8;
  NSMutableDictionary *dividerImages;
  id v10;

  v8 = -[SUSegmentedControlAppearance _newDividerImageKeyWithLeftState:rightState:barMetrics:](self, "_newDividerImageKeyWithLeftState:rightState:barMetrics:", a4, a5, a6);
  dividerImages = self->_dividerImages;
  v10 = v8;
  if (a3)
  {
    if (!dividerImages)
    {
      dividerImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_dividerImages = dividerImages;
    }
    -[NSMutableDictionary setObject:forKey:](dividerImages, "setObject:forKey:", a3, v10);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](dividerImages, "removeObjectForKey:");
  }

}

- (void)styleSegmentedControl:(id)a3
{
  SUControlAppearance *backgroundImages;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  NSMutableDictionary *titleTextAttributes;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableDictionary *obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  backgroundImages = self->_backgroundImages;
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __54__SUSegmentedControlAppearance_styleSegmentedControl___block_invoke;
  v35[3] = &unk_24DE7E190;
  v35[4] = a3;
  -[SUControlAppearance enumerateImagesUsingBlock:](backgroundImages, "enumerateImagesUsingBlock:", v35);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_dividerImages;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(":"));
        if (objc_msgSend(v11, "count") == 3)
        {
          v12 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "integerValue");
          v13 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 1), "integerValue");
          v14 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 2), "integerValue");
          v15 = objc_opt_respondsToSelector();
          v16 = -[NSMutableDictionary objectForKey:](self->_dividerImages, "objectForKey:", v10);
          if ((v15 & 1) != 0)
            objc_msgSend(a3, "_setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", v16, v12, v13, v14);
          else
            objc_msgSend(a3, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", v16, v12, v13, v14);
        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "_setOptionsBackgroundImage:", self->_optionsBackgroundImage);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  titleTextAttributes = self->_titleTextAttributes;
  v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](titleTextAttributes, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(titleTextAttributes);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        v23 = objc_opt_respondsToSelector();
        v24 = -[NSMutableDictionary objectForKey:](self->_titleTextAttributes, "objectForKey:", v22);
        v25 = objc_msgSend(v22, "integerValue");
        if ((v23 & 1) != 0)
          objc_msgSend(a3, "_setTitleTextAttributes:forState:", v24, v25);
        else
          objc_msgSend(a3, "setTitleTextAttributes:forState:", v24, v25);
      }
      v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](titleTextAttributes, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v19);
  }
}

uint64_t __54__SUSegmentedControlAppearance_styleSegmentedControl___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v8;
  void *v9;

  v8 = objc_opt_respondsToSelector();
  v9 = *(void **)(a1 + 32);
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "_setBackgroundImage:forState:barMetrics:", a3, a2, 0);
    return objc_msgSend(*(id *)(a1 + 32), "_setBackgroundImage:forState:barMetrics:", a4, a2, 1);
  }
  else
  {
    objc_msgSend(v9, "setBackgroundImage:forState:barMetrics:", a3, a2, 0);
    return objc_msgSend(*(id *)(a1 + 32), "setBackgroundImage:forState:barMetrics:", a4, a2, 1);
  }
}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  uint64_t v6;
  NSMutableDictionary *titleTextAttributes;
  void *v8;
  id v9;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a4);
  titleTextAttributes = self->_titleTextAttributes;
  v9 = (id)v6;
  if (a3)
  {
    if (!titleTextAttributes)
      self->_titleTextAttributes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = (void *)objc_msgSend(a3, "copy");
    -[NSMutableDictionary setObject:forKey:](self->_titleTextAttributes, "setObject:forKey:", v8, v9);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](titleTextAttributes, "removeObjectForKey:");
  }

}

- (id)titleTextAttributesForState:(unint64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  v5 = (id)-[NSMutableDictionary objectForKey:](self->_titleTextAttributes, "objectForKey:", v4);

  return v5;
}

- (id)_newDividerImageKeyWithLeftState:(unint64_t)a3 rightState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%lu:%lu:%ld"), a3, a4, a5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = -[SUControlAppearance copyWithZone:](self->_backgroundImages, "copyWithZone:", a3);
  v5[2] = -[NSMutableDictionary mutableCopyWithZone:](self->_dividerImages, "mutableCopyWithZone:", a3);
  v5[3] = self->_optionsBackgroundImage;
  v5[4] = -[NSMutableDictionary mutableCopyWithZone:](self->_titleTextAttributes, "mutableCopyWithZone:", a3);
  return v5;
}

- (UIImage)optionsBackgroundImage
{
  return self->_optionsBackgroundImage;
}

- (void)setOptionsBackgroundImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
