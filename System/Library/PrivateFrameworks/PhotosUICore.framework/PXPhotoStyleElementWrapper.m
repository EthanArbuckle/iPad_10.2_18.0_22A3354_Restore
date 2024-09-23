@implementation PXPhotoStyleElementWrapper

- (PXPhotoStyleElementWrapper)initWithPhotoStyleElement:(id)a3
{
  id v5;
  PXPhotoStyleElementWrapper *v6;
  PXPhotoStyleElementWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotoStyleElementWrapper;
  v6 = -[PXPhotoStyleElementWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingStyleElement, a3);

  return v7;
}

- (id)defaultName
{
  return -[PXPhotoStyleElement defaultName](self->_underlyingStyleElement, "defaultName");
}

- (double)tone
{
  double result;

  -[PXPhotoStyleElement tone](self->_underlyingStyleElement, "tone");
  return result;
}

- (double)color
{
  double result;

  -[PXPhotoStyleElement color](self->_underlyingStyleElement, "color");
  return result;
}

- (double)intensity
{
  double result;

  -[PXPhotoStyleElement intensity](self->_underlyingStyleElement, "intensity");
  return result;
}

- (id)cast
{
  return -[PXPhotoStyleElement cast](self->_underlyingStyleElement, "cast");
}

- (double)defaultTone
{
  double result;

  -[PXPhotoStyleElement defaultTone](self->_underlyingStyleElement, "defaultTone");
  return result;
}

- (double)defaultColor
{
  double result;

  -[PXPhotoStyleElement defaultColor](self->_underlyingStyleElement, "defaultColor");
  return result;
}

- (double)defaultIntensity
{
  double result;

  -[PXPhotoStyleElement defaultIntensity](self->_underlyingStyleElement, "defaultIntensity");
  return result;
}

- (BOOL)hasNonDefaultValues
{
  return -[PXPhotoStyleElement hasNonDefaultValues](self->_underlyingStyleElement, "hasNonDefaultValues");
}

- (void)updateWithTone:(double)a3 color:(double)a4 intensity:(double)a5
{
  NSObject *v6;
  int v7;
  PXPhotoStyleElementWrapper *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!-[PXPhotoStyleElement updateWithTone:color:intensity:](self->_underlyingStyleElement, "updateWithTone:color:intensity:", a3, a4, a5))
  {
    PLPhotoEditGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_INFO, "Unable to update style %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)resetToDefault
{
  -[PXPhotoStyleElement resetToDefaultValues](self->_underlyingStyleElement, "resetToDefaultValues");
}

- (PXPhotoStyleElement)style
{
  return self->_underlyingStyleElement;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  v3 = (void *)-[PXPhotoStyleElement copy](self->_underlyingStyleElement, "copy", a3);
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPhotoStyleElement:", v3);

  return v4;
}

- (void)setStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_underlyingStyleElement, 0);
}

+ (id)allDefaultStyles
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PXPhotoStyleElementWrapper *v10;
  PXPhotoStyleElementWrapper *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[PXPhotoStyleCollection allDefaultStyles](PXPhotoStyleCollection, "allDefaultStyles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [PXPhotoStyleElementWrapper alloc];
        v11 = -[PXPhotoStyleElementWrapper initWithPhotoStyleElement:](v10, "initWithPhotoStyleElement:", v9, (_QWORD)v13);
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

@end
