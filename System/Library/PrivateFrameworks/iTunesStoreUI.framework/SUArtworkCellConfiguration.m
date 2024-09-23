@implementation SUArtworkCellConfiguration

- (void)dealloc
{
  objc_super v3;

  -[SUArtworkCellConfiguration cancelArtworkRequests](self, "cancelArtworkRequests");

  self->_artworkLoadOperations = 0;
  self->_artworkByURL = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUArtworkCellConfiguration;
  -[SUArrayCellConfiguration dealloc](&v3, sel_dealloc);
}

- (id)artworkImageForItemImage:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = objc_msgSend(a3, "URL");
  if (!v5)
    return (id)objc_msgSend(self->super.super._context, "placeholderImage");
  v6 = v5;
  v7 = -[SUArtworkCellConfiguration copyImageDataProvider](self, "copyImageDataProvider");
  objc_msgSend(a3, "imageScale");
  objc_msgSend(v7, "setInputImageScale:");
  v8 = -[SUArtworkCellConfiguration _artworkImageForURL:dataProvider:](self, "_artworkImageForURL:dataProvider:", v6, v7);

  return v8;
}

- (id)artworkImageForURL:(id)a3
{
  id v5;
  id v6;

  if (!a3)
    return (id)objc_msgSend(self->super.super._context, "placeholderImage");
  v5 = -[SUArtworkCellConfiguration copyImageDataProvider](self, "copyImageDataProvider");
  v6 = -[SUArtworkCellConfiguration _artworkImageForURL:dataProvider:](self, "_artworkImageForURL:dataProvider:", a3, v5);

  return v6;
}

- (void)cancelArtworkRequests
{
  void *v3;
  NSMutableArray *artworkLoadOperations;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(self->super.super._context, "imagePool");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  artworkLoadOperations = self->_artworkLoadOperations;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](artworkLoadOperations, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(artworkLoadOperations);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "setDelegate:", 0);
        objc_msgSend(v3, "cancelOperation:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](artworkLoadOperations, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  -[NSMutableDictionary removeAllObjects](self->_artworkByURL, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_artworkLoadOperations, "removeAllObjects");
}

- (id)copyImageDataProvider
{
  return (id)objc_msgSend((id)objc_msgSend(self->super.super._context, "imageProvider"), "copy");
}

- (void)reloadAfterArtworkLoad
{
  -[SUArrayCellConfiguration reloadData](self, "reloadData");
  -[SUCellConfigurationView reloadView](-[SUCellConfiguration view](self, "view"), "reloadView");
}

+ (id)copyDefaultContext
{
  return objc_alloc_init(SUArtworkCellContext);
}

- (void)setRepresentedObject:(id)a3
{
  objc_super v5;

  if (self->super.super._representedObject != a3)
  {
    -[SUArtworkCellConfiguration cancelArtworkRequests](self, "cancelArtworkRequests");
    v5.receiver = self;
    v5.super_class = (Class)SUArtworkCellConfiguration;
    -[SUCellConfiguration setRepresentedObject:](&v5, sel_setRepresentedObject_, a3);
  }
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  objc_msgSend(a3, "setDelegate:", 0, a4);
  -[NSMutableArray removeObject:](self->_artworkLoadOperations, "removeObject:", a3);
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  uint64_t v7;

  if (a4)
  {
    if (!self->_artworkByURL)
      self->_artworkByURL = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = objc_msgSend((id)objc_msgSend(a3, "requestProperties"), "URL");
    -[NSMutableDictionary setObject:forKey:](self->_artworkByURL, "setObject:forKey:", a4, v7);
    objc_msgSend((id)objc_msgSend(self->super.super._context, "imageCache"), "addImage:forURL:dataProvider:", a4, v7, objc_msgSend(a3, "dataProvider"));
    -[SUArtworkCellConfiguration reloadAfterArtworkLoad](self, "reloadAfterArtworkLoad");
  }
  objc_msgSend(a3, "setDelegate:", 0);
  -[NSMutableArray removeObject:](self->_artworkLoadOperations, "removeObject:", a3);
}

- (id)_artworkImageForURL:(id)a3 dataProvider:(id)a4
{
  id result;
  id v8;
  void *v9;
  NSMutableArray *artworkLoadOperations;
  void *v11;

  result = (id)-[NSMutableDictionary objectForKey:](self->_artworkByURL, "objectForKey:");
  if (!result)
  {
    result = (id)objc_msgSend((id)objc_msgSend(self->super.super._context, "imageCache"), "imageForURL:dataProvider:", a3, a4);
    if (!result)
    {
      v8 = objc_alloc_init(MEMORY[0x24BEC8C30]);
      objc_msgSend(v8, "setDataProvider:", a4);
      objc_msgSend(v8, "setDelegate:", self);
      objc_msgSend(v8, "setUrlKnownToBeTrusted:", 1);
      objc_msgSend(v8, "setShouldMessageMainThread:", 1);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", a3);
      objc_msgSend(v8, "setRequestProperties:", v9);

      artworkLoadOperations = self->_artworkLoadOperations;
      if (!artworkLoadOperations)
      {
        artworkLoadOperations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        self->_artworkLoadOperations = artworkLoadOperations;
      }
      -[NSMutableArray addObject:](artworkLoadOperations, "addObject:", v8);
      objc_msgSend((id)objc_msgSend(self->super.super._context, "imagePool"), "addOperation:withFlags:", v8, 1);
      v11 = (void *)objc_msgSend(self->super.super._context, "placeholderImage");

      return v11;
    }
  }
  return result;
}

@end
