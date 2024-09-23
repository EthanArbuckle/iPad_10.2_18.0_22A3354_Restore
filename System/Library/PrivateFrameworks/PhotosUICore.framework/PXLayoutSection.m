@implementation PXLayoutSection

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  CGSize size;
  uint64_t v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[3] = self->_identifier;
  *((_BYTE *)v4 + 16) = self->_accurate;
  v4[4] = self->_index;
  size = self->_frame.size;
  *((_OWORD *)v4 + 3) = self->_frame.origin;
  *((CGSize *)v4 + 4) = size;
  v6 = -[NSMutableDictionary mutableCopy](self->_geometriesByKind, "mutableCopy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

- (PXLayoutSection)init
{
  PXLayoutSection *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *geometriesByKind;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXLayoutSection;
  v2 = -[PXLayoutSection init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    geometriesByKind = v2->_geometriesByKind;
    v2->_geometriesByKind = v3;

  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;
  CGSize v35;

  v34 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)PXLayoutSection;
  -[PXLayoutSection description](&v32, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" index:%ld"), self->_index);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromCGRect(self->_frame);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" frame:%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXLayoutSection isAccurate](self, "isAccurate");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" isAccurate:%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingString:", CFSTR(" geometryItems:{\r"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_geometriesByKind;
  v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(" kind: %@:{\r"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKeyedSubscript:](self->_geometriesByKind, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          v15 = 0;
          do
          {
            if (v14)
            {
              objc_msgSend(v14, "geometryAtIndex:", v15);
              v16 = 0;
              v17 = 0;
            }
            else
            {
              v17 = 0;
              v16 = 0;
            }
            v18 = (void *)MEMORY[0x1E0CB3940];
            NSStringFromCGPoint(*(CGPoint *)&v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v35.width = 0.0;
            v35.height = 0.0;
            NSStringFromCGSize(v35);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("  [geometry[%ld] = {center:%@, size:%@}]\r"), 0, v19, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "stringByAppendingString:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            ++v15;
            v13 = v22;
          }
          while (v15 < objc_msgSend(v14, "count"));
        }
        else
        {
          v22 = v13;
        }
        objc_msgSend(v22, "stringByAppendingString:", CFSTR("}"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v27);
  }

  objc_msgSend(v10, "stringByAppendingString:", CFSTR("}"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)setGeometries:(id)a3 withKind:(int64_t)a4
{
  NSMutableDictionary *geometriesByKind;
  void *v7;
  id v8;

  v8 = a3;
  geometriesByKind = self->_geometriesByKind;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[NSMutableDictionary setObject:forKey:](geometriesByKind, "setObject:forKey:", v8, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](geometriesByKind, "removeObjectForKey:", v7);

}

- (id)geometriesWithKind:(int64_t)a3
{
  NSMutableDictionary *geometriesByKind;
  void *v4;
  void *v5;

  geometriesByKind = self->_geometriesByKind;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](geometriesByKind, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateGeometriesWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *geometriesByKind;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  geometriesByKind = self->_geometriesByKind;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PXLayoutSection_enumerateGeometriesWithBlock___block_invoke;
  v7[3] = &unk_1E5144620;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](geometriesByKind, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (NSArray)geometryKinds
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_geometriesByKind, "allKeys");
}

- (void)setSize:(CGSize)a3
{
  -[PXLayoutSection setFrame:](self, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, a3.width, a3.height);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (BOOL)isAccurate
{
  return self->_accurate;
}

- (void)setAccurate:(BOOL)a3
{
  self->_accurate = a3;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void)setGeometryKinds:(id)a3
{
  objc_storeStrong((id *)&self->_geometryKinds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometryKinds, 0);
  objc_storeStrong((id *)&self->_geometriesByKind, 0);
}

void __48__PXLayoutSection_enumerateGeometriesWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  _OWORD v9[9];
  uint64_t v10;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    do
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (v6)
      {
        objc_msgSend(v6, "geometryAtIndex:", v7);
      }
      else
      {
        v10 = 0;
        memset(v9, 0, sizeof(v9));
      }
      (*(void (**)(uint64_t, _OWORD *, _BYTE *))(v8 + 16))(v8, v9, a4);
      if (*a4)
        break;
      ++v7;
    }
    while (v7 < objc_msgSend(v6, "count"));
  }

}

@end
