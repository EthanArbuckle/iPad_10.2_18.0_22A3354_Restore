@implementation PUSlideshowContextRegistry

- (PUSlideshowContextRegistry)init
{
  PUSlideshowContextRegistry *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowContextRegistry;
  v2 = -[PUSlideshowContextRegistry init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSlideshowContextRegistry _setDisplayContexts:](v2, "_setDisplayContexts:", v3);

  }
  return v2;
}

- (BOOL)addDisplayContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[PUSlideshowContextRegistry _displayContexts](self, "_displayContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    -[PUSlideshowContextRegistry _displayContexts](self, "_displayContexts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);

  }
  return v6 ^ 1;
}

- (BOOL)removeDisplayContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  -[PUSlideshowContextRegistry displayContexts](self, "displayContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[PUSlideshowContextRegistry _displayContexts](self, "_displayContexts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v4);

  }
  return v6;
}

- (PUSlideshowDisplayContext)currentDisplayContext
{
  void *v2;
  void *v3;

  -[PUSlideshowContextRegistry _displayContexts](self, "_displayContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PUSlideshowDisplayContext *)v3;
}

- (NSArray)displayContexts
{
  void *v2;
  void *v3;

  -[PUSlideshowContextRegistry _displayContexts](self, "_displayContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSMutableArray)_displayContexts
{
  return self->__displayContexts;
}

- (void)_setDisplayContexts:(id)a3
{
  objc_storeStrong((id *)&self->__displayContexts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__displayContexts, 0);
}

@end
