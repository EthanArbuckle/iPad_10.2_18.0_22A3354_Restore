@implementation APPBColor

- (void)clearColors
{
  -[NSMutableArray removeAllObjects](self->_colors, "removeAllObjects");
}

- (void)addColors:(id)a3
{
  id v4;
  NSMutableArray *colors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  colors = self->_colors;
  v8 = v4;
  if (!colors)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_colors;
    self->_colors = v6;

    v4 = v8;
    colors = self->_colors;
  }
  -[NSMutableArray addObject:](colors, "addObject:", v4);

}

- (unint64_t)colorsCount
{
  return (unint64_t)-[NSMutableArray count](self->_colors, "count");
}

- (id)colorsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_colors, "objectAtIndex:", a3);
}

+ (Class)colorsType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (void)clearDarkModeColors
{
  -[NSMutableArray removeAllObjects](self->_darkModeColors, "removeAllObjects");
}

- (void)addDarkModeColors:(id)a3
{
  id v4;
  NSMutableArray *darkModeColors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  darkModeColors = self->_darkModeColors;
  v8 = v4;
  if (!darkModeColors)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_darkModeColors;
    self->_darkModeColors = v6;

    v4 = v8;
    darkModeColors = self->_darkModeColors;
  }
  -[NSMutableArray addObject:](darkModeColors, "addObject:", v4);

}

- (unint64_t)darkModeColorsCount
{
  return (unint64_t)-[NSMutableArray count](self->_darkModeColors, "count");
}

- (id)darkModeColorsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_darkModeColors, "objectAtIndex:", a3);
}

+ (Class)darkModeColorsType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBColor;
  v3 = -[APPBColor description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBColor dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *colors;
  NSMutableArray *darkModeColors;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  colors = self->_colors;
  if (colors)
    objc_msgSend(v3, "setObject:forKey:", colors, CFSTR("colors"));
  darkModeColors = self->_darkModeColors;
  if (darkModeColors)
    objc_msgSend(v4, "setObject:forKey:", darkModeColors, CFSTR("darkModeColors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_direction));
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("direction"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBColorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_colors;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField(v4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9), 1);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_darkModeColors;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField(v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), 2);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  PBDataWriterWriteInt32Field(v4, self->_direction, 3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  _DWORD *v12;

  v12 = a3;
  if (-[APPBColor colorsCount](self, "colorsCount"))
  {
    objc_msgSend(v12, "clearColors");
    v4 = -[APPBColor colorsCount](self, "colorsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBColor colorsAtIndex:](self, "colorsAtIndex:", i));
        objc_msgSend(v12, "addColors:", v7);

      }
    }
  }
  if (-[APPBColor darkModeColorsCount](self, "darkModeColorsCount"))
  {
    objc_msgSend(v12, "clearDarkModeColors");
    v8 = -[APPBColor darkModeColorsCount](self, "darkModeColorsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APPBColor darkModeColorsAtIndex:](self, "darkModeColorsAtIndex:", j));
        objc_msgSend(v12, "addDarkModeColors:", v11);

      }
    }
  }
  v12[6] = self->_direction;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = self->_colors;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addColors:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_darkModeColors;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addDarkModeColors:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  v5[6] = self->_direction;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *colors;
  NSMutableArray *darkModeColors;
  BOOL v7;

  v4 = a3;
  v7 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((colors = self->_colors, !((unint64_t)colors | *((_QWORD *)v4 + 1)))
     || -[NSMutableArray isEqual:](colors, "isEqual:"))
    && ((darkModeColors = self->_darkModeColors, !((unint64_t)darkModeColors | *((_QWORD *)v4 + 2)))
     || -[NSMutableArray isEqual:](darkModeColors, "isEqual:"))
    && self->_direction == *((_DWORD *)v4 + 6);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[NSMutableArray hash](self->_colors, "hash");
  return (unint64_t)-[NSMutableArray hash](self->_darkModeColors, "hash") ^ v3 ^ (2654435761 * self->_direction);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[APPBColor addColors:](self, "addColors:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[APPBColor addDarkModeColors:](self, "addDarkModeColors:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), (_QWORD)v15);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  self->_direction = *((_DWORD *)v4 + 6);
}

- (NSMutableArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_storeStrong((id *)&self->_colors, a3);
}

- (NSMutableArray)darkModeColors
{
  return self->_darkModeColors;
}

- (void)setDarkModeColors:(id)a3
{
  objc_storeStrong((id *)&self->_darkModeColors, a3);
}

- (int)direction
{
  return self->_direction;
}

- (void)setDirection:(int)a3
{
  self->_direction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeColors, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

+ (id)stringsToColorArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = objc_alloc((Class)PCNativePrimitiveColor);
        v12 = objc_msgSend(v11, "initWithString:", v10, (_QWORD)v16);
        if (v12)
        {
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = objc_msgSend(v4, "copy");
  return v14;
}

@end
