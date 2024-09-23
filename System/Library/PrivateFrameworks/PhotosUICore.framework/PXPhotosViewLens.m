@implementation PXPhotosViewLens

- (PXPhotosViewLens)initWithTitle:(id)a3 symbolName:(id)a4 defaultSectionBodyStyle:(int64_t)a5
{
  id v8;
  id v9;
  PXPhotosViewLens *v10;
  void *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *symbolName;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PXPhotosViewLens;
  v10 = -[PXPhotosViewLens init](&v19, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v14;

    v16 = objc_msgSend(v9, "copy");
    symbolName = v10->_symbolName;
    v10->_symbolName = (NSString *)v16;

    v10->_defaultSectionBodyStyle = a5;
  }

  return v10;
}

- (PXPhotosViewLens)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewLens.m"), 138, CFSTR("%s is not available as initializer"), "-[PXPhotosViewLens init]");

  abort();
}

- (int64_t)curationLength
{
  return 0;
}

- (BOOL)isDefaultCurationLength
{
  return 1;
}

- (BOOL)allowsActionMenu
{
  return 1;
}

- (BOOL)allowsBlur
{
  void *v3;
  char v4;

  if (-[PXPhotosViewLens defaultSectionBodyStyle](self, "defaultSectionBodyStyle") == 3)
    return 1;
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableBlurAndScrollSnapInContiguousGrids");

  return v4;
}

- (BOOL)allowsScrollSnap
{
  void *v3;
  char v4;

  if (-[PXPhotosViewLens defaultSectionBodyStyle](self, "defaultSectionBodyStyle") == 3)
    return 1;
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableBlurAndScrollSnapInContiguousGrids");

  return v4;
}

- (BOOL)allowsActionType:(id)a3
{
  return 1;
}

- (BOOL)ignoresTopSafeAreaInset
{
  return 0;
}

- (BOOL)allowsFooter
{
  return 1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; title:%@ symbolName:%@ sectionBodyStyle:%ld>"),
    v5,
    self,
    self->_title,
    self->_symbolName,
    self->_defaultSectionBodyStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](identifier, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (int64_t)defaultSectionBodyStyle
{
  return self->_defaultSectionBodyStyle;
}

- (BOOL)wantsCuration
{
  return self->_wantsCuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (PXPhotosViewLens)zoomableGrid
{
  if (zoomableGrid_onceToken[0] != -1)
    dispatch_once(zoomableGrid_onceToken, &__block_literal_global_152991);
  return (PXPhotosViewLens *)(id)zoomableGrid_lens;
}

+ (PXPhotosViewLens)grid
{
  if (grid_onceToken != -1)
    dispatch_once(&grid_onceToken, &__block_literal_global_132_152986);
  return (PXPhotosViewLens *)(id)grid_lens;
}

+ (id)lensForCurationLength:(int64_t)a3 isDefault:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  _PXPhotosCurationLengthLens *v8;

  v4 = a4;
  if (lensForCurationLength_isDefault__onceToken != -1)
    dispatch_once(&lensForCurationLength_isDefault__onceToken, &__block_literal_global_133_152969);
  v6 = 1000;
  if (!v4)
    v6 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6 * a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)lensForCurationLength_isDefault__cachedLenses, "objectForKeyedSubscript:", v7);
  v8 = (_PXPhotosCurationLengthLens *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[_PXPhotosCurationLengthLens initWithCurationLength:isDefault:]([_PXPhotosCurationLengthLens alloc], "initWithCurationLength:isDefault:", a3, v4);
    objc_msgSend((id)lensForCurationLength_isDefault__cachedLenses, "setObject:forKeyedSubscript:", v8, v7);
  }

  return v8;
}

void __52__PXPhotosViewLens_lensForCurationLength_isDefault___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)lensForCurationLength_isDefault__cachedLenses;
  lensForCurationLength_isDefault__cachedLenses = (uint64_t)v0;

}

void __24__PXPhotosViewLens_grid__block_invoke()
{
  PXPhotosViewLens *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXPhotosViewLens alloc];
  PXLocalizedStringFromTable(CFSTR("PXPhotosGridLensAll"), CFSTR("LemonadeLocalizable"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXPhotosViewLens initWithTitle:symbolName:defaultSectionBodyStyle:](v0, "initWithTitle:symbolName:defaultSectionBodyStyle:", v3, CFSTR("square.grid.3x3.fill"), 0);
  v2 = (void *)grid_lens;
  grid_lens = v1;

}

void __32__PXPhotosViewLens_zoomableGrid__block_invoke()
{
  PXPhotosViewLens *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXPhotosViewLens alloc];
  PXLocalizedStringFromTable(CFSTR("PXPhotosGridLensAll"), CFSTR("LemonadeLocalizable"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXPhotosViewLens initWithTitle:symbolName:defaultSectionBodyStyle:](v0, "initWithTitle:symbolName:defaultSectionBodyStyle:", v3, CFSTR("square.grid.3x3.fill"), 1);
  v2 = (void *)zoomableGrid_lens;
  zoomableGrid_lens = v1;

}

@end
