@implementation PXPlacesMapLayoutResultImpl

- (PXPlacesMapLayoutResultImpl)init
{
  PXPlacesMapLayoutResultImpl *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *items;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapLayoutResultImpl;
  v2 = -[PXPlacesMapLayoutResultImpl init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    items = v2->_items;
    v2->_items = v3;

  }
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapLayoutResultImpl viewPort](self, "viewPort");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Viewport %@\n"), v4);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_items;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "coordinate");
        v12 = v11;
        objc_msgSend(v10, "coordinate");
        v14 = v13;
        objc_msgSend(v10, "geotaggables");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("Item %f, %f has %ld children\n"), v12, v14, objc_msgSend(v15, "count"));

      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return (NSString *)v3;
}

- (void)addItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPlacesMapLayoutResultImpl items](self, "items");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPlacesMapLayoutResultImpl items](self, "items");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionOrderedSet:", v4);

}

- (void)removeItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPlacesMapLayoutResultImpl items](self, "items");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (PXPlacesMapViewPort)viewPort
{
  return self->_viewPort;
}

- (void)setViewPort:(id)a3
{
  objc_storeStrong((id *)&self->_viewPort, a3);
}

- (NSMutableOrderedSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_viewPort, 0);
}

@end
