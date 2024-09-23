@implementation SUArrayImageModifier

- (void)dealloc
{
  objc_super v3;

  self->_modifiers = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUArrayImageModifier;
  -[SUArrayImageModifier dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL result;
  uint64_t v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[SUArrayImageModifier modifiers](self, "modifiers");
  v6 = (void *)objc_msgSend(a3, "modifiers");
  v7 = -[NSArray count](v5, "count");
  v8 = objc_msgSend(v6, "count");
  result = v7 == v8;
  if (v7 >= 1 && v7 == v8)
  {
    v10 = 1;
    do
    {
      result = objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", v10 - 1), "isEqual:", objc_msgSend(v6, "objectAtIndex:", v10 - 1));
      if (v10 >= v7)
        break;
      ++v10;
    }
    while (result);
  }
  return result;
}

- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double y;
  double x;
  NSArray *modifiers;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  height = a5.height;
  width = a5.width;
  v7 = a4.size.height;
  v8 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  modifiers = self->_modifiers;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](modifiers, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(modifiers);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "drawAfterImageForContext:imageFrame:finalSize:", a3, x, y, v8, v7, width, height);
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](modifiers, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }
}

- (void)drawBeforeImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double y;
  double x;
  NSArray *modifiers;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  height = a5.height;
  width = a5.width;
  v7 = a4.size.height;
  v8 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  modifiers = self->_modifiers;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](modifiers, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(modifiers);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "drawBeforeImageForContext:imageFrame:finalSize:", a3, x, y, v8, v7, width, height);
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](modifiers, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }
}

- (CGSize)finalSizeForSize:(CGSize)a3 originalSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  NSArray *modifiers;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  modifiers = self->_modifiers;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](modifiers, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(modifiers);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "finalSizeForSize:originalSize:", v7, v6, width, height);
        v7 = v13;
        v6 = v14;
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](modifiers, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  v15 = v7;
  v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double y;
  double x;
  NSArray *modifiers;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect result;

  height = a5.height;
  width = a5.width;
  v7 = a4.size.height;
  v8 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v30 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  modifiers = self->_modifiers;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](modifiers, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(modifiers);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "imageFrameForImage:currentFrame:finalSize:", a3, x, y, v8, v7, width, height);
        x = v17;
        y = v18;
        v8 = v19;
        v7 = v20;
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](modifiers, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }
  v21 = x;
  v22 = y;
  v23 = v8;
  v24 = v7;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)scalesImage
{
  NSArray *modifiers;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  modifiers = self->_modifiers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](modifiers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(modifiers);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "scalesImage") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](modifiers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (NSArray)modifiers
{
  return self->_modifiers;
}

- (void)setModifiers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
