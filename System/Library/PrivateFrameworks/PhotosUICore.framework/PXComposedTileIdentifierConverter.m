@implementation PXComposedTileIdentifierConverter

- (PXComposedTileIdentifierConverter)init
{
  return -[PXComposedTileIdentifierConverter initWithTileIdentifierConverters:](self, "initWithTileIdentifierConverters:", MEMORY[0x1E0C9AA60]);
}

- (PXComposedTileIdentifierConverter)initWithTileIdentifierConverters:(id)a3
{
  id v4;
  PXComposedTileIdentifierConverter *v5;
  uint64_t v6;
  NSArray *converters;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXComposedTileIdentifierConverter;
  v5 = -[PXComposedTileIdentifierConverter init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    converters = v5->_converters;
    v5->_converters = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXComposedTileIdentifierConverter converters](self, "converters", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "transformTileIdentifier:group:", a3, a4) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXComposedTileIdentifierConverter converters](self, "converters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "reverseTransformTileIdentifier:", a3) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (NSArray)converters
{
  return self->_converters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_converters, 0);
}

@end
