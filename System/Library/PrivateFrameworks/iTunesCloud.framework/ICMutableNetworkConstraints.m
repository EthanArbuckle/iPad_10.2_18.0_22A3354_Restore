@implementation ICMutableNetworkConstraints

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ICNetworkConstraints _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[ICNetworkConstraints _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (void)setShouldAllowDataForAllNetworkTypes:(BOOL)a3
{
  -[NSMutableDictionary removeAllObjects](self->super._networkTypeToDataAllowed, "removeAllObjects");
  self->super._dataAllowedFallbackValue = a3;
  self->super._cellularDataAllowedFallbackValue = a3;
  self->super._wiFiDataAllowedFallbackValue = a3;
}

- (void)setShouldAllowData:(BOOL)a3 forNetworkType:(int64_t)a4
{
  _BOOL8 v5;
  NSMutableDictionary *networkTypeToDataAllowed;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v5 = a3;
  networkTypeToDataAllowed = self->super._networkTypeToDataAllowed;
  if (!networkTypeToDataAllowed)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->super._networkTypeToDataAllowed;
    self->super._networkTypeToDataAllowed = v8;

    networkTypeToDataAllowed = self->super._networkTypeToDataAllowed;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](networkTypeToDataAllowed, "setObject:forKey:", v11, v10);

}

- (void)setShouldAllowDataForCellularNetworkTypes:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->super._networkTypeToSizeLimit, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((unint64_t)((int)objc_msgSend(v11, "intValue") - 1) <= 0x1F2)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->super._networkTypeToSizeLimit, "removeObjectsForKeys:", v5);
  self->super._cellularDataAllowedFallbackValue = a3;

}

- (void)setShouldAllowDataForWiFiNetworkTypes:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->super._networkTypeToSizeLimit, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((unint64_t)((int)objc_msgSend(v11, "intValue") - 1000) <= 0x3E7)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->super._networkTypeToSizeLimit, "removeObjectsForKeys:", v5);
  self->super._wiFiDataAllowedFallbackValue = a3;

}

- (void)setSizeLimit:(id)a3 forNetworkType:(int64_t)a4
{
  id v6;
  NSMutableDictionary *networkTypeToSizeLimit;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v6 = a3;
  networkTypeToSizeLimit = self->super._networkTypeToSizeLimit;
  v11 = v6;
  if (v6)
  {
    if (!networkTypeToSizeLimit)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->super._networkTypeToSizeLimit;
      self->super._networkTypeToSizeLimit = v8;

      networkTypeToSizeLimit = self->super._networkTypeToSizeLimit;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](networkTypeToSizeLimit, "setObject:forKey:", v11, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](networkTypeToSizeLimit, "removeObjectForKey:", v10);
  }

}

@end
