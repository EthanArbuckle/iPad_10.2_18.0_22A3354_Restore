@implementation SUControlAppearance

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUControlAppearance;
  -[SUControlAppearance dealloc](&v3, sel_dealloc);
}

- (void)enumerateImagesUsingBlock:(id)a3
{
  id v5;
  NSMutableDictionary *images;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  images = self->_images;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __49__SUControlAppearance_enumerateImagesUsingBlock___block_invoke;
  v20[3] = &unk_24DE7E1E0;
  v20[4] = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](images, "enumerateKeysAndObjectsUsingBlock:", v20);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "integerValue");
        v12 = -[SUControlAppearance _copyKeyForState:barMetrics:](self, "_copyKeyForState:barMetrics:", v11, 0);
        v13 = -[NSMutableDictionary objectForKey:](self->_images, "objectForKey:", v12);

        v14 = -[SUControlAppearance _copyKeyForState:barMetrics:](self, "_copyKeyForState:barMetrics:", v11, 1);
        v15 = -[NSMutableDictionary objectForKey:](self->_images, "objectForKey:", v14);

        (*((void (**)(id, uint64_t, uint64_t, uint64_t))a3 + 2))(a3, v11, v13, v15);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v8);
  }

}

uint64_t __49__SUControlAppearance_enumerateImagesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;

  v3 = (void *)objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(":"));
  result = objc_msgSend(v3, "count");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(v3, "objectAtIndex:", 0));
  return result;
}

- (void)enumerateTextAttributesUsingBlock:(id)a3
{
  NSMutableDictionary *textAttributes;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  textAttributes = self->_textAttributes;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](textAttributes, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(textAttributes);
        (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "integerValue"), -[NSMutableDictionary objectForKey:](self->_textAttributes, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)));
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](textAttributes, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)enumerateTitlePositionsUsingBlock:(id)a3
{
  NSMutableDictionary *titlePositions;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  titlePositions = self->_titlePositions;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](titlePositions, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(titlePositions);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = (void *)-[NSMutableDictionary objectForKey:](self->_titlePositions, "objectForKey:", v10);
        v12 = objc_msgSend(v10, "integerValue");
        objc_msgSend(v11, "UIOffsetValue");
        (*((void (**)(id, uint64_t))a3 + 2))(a3, v12);
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](titlePositions, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
}

- (id)imageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  id v5;
  id v6;

  v5 = -[SUControlAppearance _copyKeyForState:barMetrics:](self, "_copyKeyForState:barMetrics:", a3, a4);
  v6 = (id)-[NSMutableDictionary objectForKey:](self->_images, "objectForKey:", v5);

  return v6;
}

- (int64_t)numberOfImages
{
  return -[NSMutableDictionary count](self->_images, "count");
}

- (void)setImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  id v7;
  NSMutableDictionary *images;
  id v9;

  v7 = -[SUControlAppearance _copyKeyForState:barMetrics:](self, "_copyKeyForState:barMetrics:", a4, a5);
  images = self->_images;
  v9 = v7;
  if (a3)
  {
    if (!images)
    {
      images = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_images = images;
    }
    -[NSMutableDictionary setObject:forKey:](images, "setObject:forKey:", a3, v9);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](images, "removeObjectForKey:");
  }

}

- (void)setTextAttributes:(id)a3 forState:(unint64_t)a4
{
  uint64_t v6;
  NSMutableDictionary *textAttributes;
  void *v8;
  id v9;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a4);
  textAttributes = self->_textAttributes;
  v9 = (id)v6;
  if (a3)
  {
    if (!textAttributes)
      self->_textAttributes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = (void *)objc_msgSend(a3, "copy");
    -[NSMutableDictionary setObject:forKey:](self->_textAttributes, "setObject:forKey:", v8, v9);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](textAttributes, "removeObjectForKey:");
  }

}

- (void)setTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4
{
  double vertical;
  double horizontal;
  uint64_t v7;
  double v8;
  NSMutableDictionary *titlePositions;
  BOOL v10;
  id v11;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a4);
  v8 = *(double *)(MEMORY[0x24BDF7BF0] + 8);
  titlePositions = self->_titlePositions;
  v10 = *MEMORY[0x24BDF7BF0] == horizontal && v8 == vertical;
  v11 = (id)v7;
  if (v10)
  {
    -[NSMutableDictionary removeObjectForKey:](titlePositions, "removeObjectForKey:", v7, *MEMORY[0x24BDF7BF0], v8);
  }
  else
  {
    if (!titlePositions)
    {
      titlePositions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_titlePositions = titlePositions;
    }
    -[NSMutableDictionary setObject:forKey:](titlePositions, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIOffset:", horizontal, vertical), v11);
  }

}

- (void)styleBarButtonItem:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];

  v5 = objc_msgSend(a3, "style");
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__SUControlAppearance_styleBarButtonItem___block_invoke;
  v9[3] = &unk_24DE7E208;
  v9[4] = a3;
  v9[5] = v5;
  -[SUControlAppearance enumerateImagesUsingBlock:](self, "enumerateImagesUsingBlock:", v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __42__SUControlAppearance_styleBarButtonItem___block_invoke_2;
  v8[3] = &unk_24DE7E1B8;
  v8[4] = a3;
  -[SUControlAppearance enumerateTextAttributesUsingBlock:](self, "enumerateTextAttributesUsingBlock:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __42__SUControlAppearance_styleBarButtonItem___block_invoke_3;
  v7[3] = &unk_24DE7E230;
  v7[4] = a3;
  -[SUControlAppearance enumerateTitlePositionsUsingBlock:](self, "enumerateTitlePositionsUsingBlock:", v7);
}

uint64_t __42__SUControlAppearance_styleBarButtonItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = a1 + 32;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(v9 + 8);
  if (v8)
  {
    objc_msgSend(v7, "setBackgroundImage:forState:style:barMetrics:", a3, a2, v8, 0);
    return objc_msgSend(*(id *)(a1 + 32), "setBackgroundImage:forState:style:barMetrics:", a4, a2, *(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    objc_msgSend(v7, "setBackgroundImage:forState:barMetrics:", a3, a2);
    return objc_msgSend(*(id *)(a1 + 32), "setBackgroundImage:forState:barMetrics:", a4, a2, 1);
  }
}

uint64_t __42__SUControlAppearance_styleBarButtonItem___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitleTextAttributes:forState:", a3, a2);
}

uint64_t __42__SUControlAppearance_styleBarButtonItem___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitlePositionAdjustment:forBarMetrics:", a2);
}

- (void)styleButton:(id)a3
{
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v5 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__SUControlAppearance_styleButton___block_invoke;
  v7[3] = &unk_24DE7E190;
  v7[4] = a3;
  -[SUControlAppearance enumerateImagesUsingBlock:](self, "enumerateImagesUsingBlock:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __35__SUControlAppearance_styleButton___block_invoke_2;
  v6[3] = &unk_24DE7E1B8;
  v6[4] = a3;
  -[SUControlAppearance enumerateTextAttributesUsingBlock:](self, "enumerateTextAttributesUsingBlock:", v6);
}

uint64_t __35__SUControlAppearance_styleButton___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  double v6;
  double v7;
  double v8;
  double v9;
  double v13;
  float v14;
  double v15;

  v3 = a3;
  objc_msgSend(a3, "capInsets");
  if (v9 == *(double *)(MEMORY[0x24BDF7718] + 8)
    && v6 == *MEMORY[0x24BDF7718]
    && v8 == *(double *)(MEMORY[0x24BDF7718] + 24)
    && v7 == *(double *)(MEMORY[0x24BDF7718] + 16))
  {
    objc_msgSend(v3, "size");
    v14 = v13 * 0.5;
    v15 = floorf(v14);
    v3 = (void *)objc_msgSend(v3, "resizableImageWithCapInsets:", 0.0, v15, 0.0, v13 - v15 + -1.0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundImage:forState:", v3, a2);
}

void *__35__SUControlAppearance_styleButton___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  void *result;
  void *v8;
  void *v9;

  v6 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF6600]);
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setTitleColor:forState:", v6, a2);
  result = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF6640]);
  v8 = result;
  if (result)
    result = (void *)objc_msgSend(*(id *)(a1 + 32), "setTitleShadowColor:forState:", objc_msgSend(result, "shadowColor"), a2);
  if (!a2)
  {
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    result = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF65F8]);
    if (result)
      result = (void *)objc_msgSend(v9, "setFont:", result);
    if (v8)
    {
      objc_msgSend(v8, "shadowOffset");
      return (void *)objc_msgSend(v9, "setShadowOffset:");
    }
  }
  return result;
}

- (id)textAttributesForState:(unint64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  v5 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_textAttributes, "objectForKey:", v4), "copy");

  return v5;
}

- (UIOffset)titlePositionAdjustmentForBarMetrics:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIOffset result;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_titlePositions, "objectForKey:", v4);
  if (v5)
  {
    objc_msgSend(v5, "UIOffsetValue");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v7 = *MEMORY[0x24BDF7BF0];
    v9 = *(double *)(MEMORY[0x24BDF7BF0] + 8);
  }

  v10 = v7;
  v11 = v9;
  result.vertical = v11;
  result.horizontal = v10;
  return result;
}

- (id)_copyKeyForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%lu:%ld"), a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = -[NSMutableDictionary mutableCopyWithZone:](self->_images, "mutableCopyWithZone:", a3);
  v5[2] = -[NSMutableDictionary mutableCopyWithZone:](self->_textAttributes, "mutableCopyWithZone:", a3);
  v5[3] = -[NSMutableDictionary mutableCopyWithZone:](self->_titlePositions, "mutableCopyWithZone:", a3);
  return v5;
}

@end
