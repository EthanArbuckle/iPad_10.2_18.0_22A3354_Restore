@implementation PXFavoriteMemoriesAction

- (PXFavoriteMemoriesAction)initWithMemories:(id)a3 favorite:(BOOL)a4
{
  _BOOL4 v4;
  PXFavoriteMemoriesAction *v5;
  PXFavoriteMemoriesAction *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  NSString *localizedActionName;
  objc_super v12;

  v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFavoriteMemoriesAction;
  v5 = -[PXMemoriesAction initWithMemories:](&v12, sel_initWithMemories_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_favorite = v4;
    if (v4)
      v7 = CFSTR("heart");
    else
      v7 = CFSTR("heart.slash");
    objc_storeStrong((id *)&v5->_actionSystemImageName, v7);
    if (v6->_favorite)
      v8 = CFSTR("PXMemoriesFeedMultiFavoriteActionTitle");
    else
      v8 = CFSTR("PXMemoriesFeedMultiUnfavoriteActionTitle");
    PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
    v9 = objc_claimAutoreleasedReturnValue();
    localizedActionName = v6->_localizedActionName;
    v6->_localizedActionName = (NSString *)v9;

  }
  return v6;
}

- (PXFavoriteMemoriesAction)initWithMemories:(id)a3
{
  id v4;
  PXFavoriteMemoriesAction *v5;

  v4 = a3;
  v5 = -[PXFavoriteMemoriesAction initWithMemories:favorite:](self, "initWithMemories:favorite:", v4, objc_msgSend((id)objc_opt_class(), "toggledValueForMemories:", v4));

  return v5;
}

- (id)actionIdentifier
{
  return CFSTR("FavoriteMemories");
}

- (void)performAction:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v6[4];
  BOOL v7;

  v4 = a3;
  v5 = -[PXFavoriteMemoriesAction isFavorite](self, "isFavorite");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__PXFavoriteMemoriesAction_performAction___block_invoke;
  v6[3] = &__block_descriptor_33_e44_v24__0__PHMemoryChangeRequest_8__NSString_16l;
  v7 = v5;
  -[PXMemoriesAction performMemoryChanges:completionHandler:](self, "performMemoryChanges:completionHandler:", v6, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v6[4];
  BOOL v7;

  v4 = a3;
  v5 = -[PXFavoriteMemoriesAction isFavorite](self, "isFavorite");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PXFavoriteMemoriesAction_performUndo___block_invoke;
  v6[3] = &__block_descriptor_33_e44_v24__0__PHMemoryChangeRequest_8__NSString_16l;
  v7 = !v5;
  -[PXMemoriesAction performMemoryChanges:completionHandler:](self, "performMemoryChanges:completionHandler:", v6, v4);

}

- (id)localizedActionName
{
  return self->_localizedActionName;
}

- (id)actionSystemImageName
{
  return self->_actionSystemImageName;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSystemImageName, 0);
  objc_storeStrong((id *)&self->_localizedActionName, 0);
}

uint64_t __40__PXFavoriteMemoriesAction_performUndo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFavorite:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __42__PXFavoriteMemoriesAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFavorite:", *(unsigned __int8 *)(a1 + 32));
}

+ (BOOL)toggledValueForMemories:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = PXExists();
  else
    v4 = 1;

  return v4;
}

+ (id)menuTitleForMemories:(id)a3
{
  __CFString *v3;

  if (objc_msgSend(a1, "toggledValueForMemories:", a3))
    v3 = CFSTR("PXMemoriesFeedFavoriteMenuActionTitle");
  else
    v3 = CFSTR("PXMemoriesFeedUnfavoriteMenuActionTitle");
  PXLocalizedStringFromTable(v3, CFSTR("PhotosUICore"));
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __52__PXFavoriteMemoriesAction_toggledValueForMemories___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFavorite") ^ 1;
}

@end
