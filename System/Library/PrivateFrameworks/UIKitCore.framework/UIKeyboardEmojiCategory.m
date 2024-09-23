@implementation UIKeyboardEmojiCategory

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__UIKeyboardEmojiCategory_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1128 != -1)
    dispatch_once(&_MergedGlobals_1128, block);
  return (id)qword_1ECD7EF88;
}

void __40__UIKeyboardEmojiCategory_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD7EF88;
  qword_1ECD7EF88 = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", qword_1ECD7EF88, sel_localeDidChange, *MEMORY[0x1E0C99720], 0);

  v4 = (void *)objc_opt_new();
  objc_msgSend((id)qword_1ECD7EF88, "setLocalizedNames:", v4);

  v5 = (id)objc_opt_new();
  objc_msgSend((id)qword_1ECD7EF88, "setShortLocalizedNames:", v5);

}

+ (BOOL)doesShowStickers
{
  return _doesShowStickers;
}

+ (void)setDoesShowStickers:(BOOL)a3
{
  _doesShowStickers = a3;
}

- (void)localeDidChange
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[UIKeyboardEmojiCategory sharedManager](UIKeyboardEmojiCategory, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  +[UIKeyboardEmojiCategory sharedManager](UIKeyboardEmojiCategory, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortLocalizedNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

+ (id)enabledCategoryIndexes
{
  void *v3;
  int v4;
  void *v5;

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowRecents");

  if (v4)
  {
    objc_msgSend(a1, "allowedCategoryIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &unk_1E1A940D0;
  }
  return v5;
}

+ (id)allowedCategoryIndexes
{
  if ((_UIApplicationIsStickerPickerService() & (_doesShowStickers != 0)) != 0)
    return &unk_1E1A940E8;
  else
    return &unk_1E1A94100;
}

+ (int64_t)categoryTypeForCategoryIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;

  objc_msgSend(a1, "enabledCategoryIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 7;
  objc_msgSend(a1, "enabledCategoryIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  return v9;
}

+ (unint64_t)categoryIndexForCategoryType:(int64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(a1, "enabledCategoryIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v6;
}

+ (int64_t)numberOfCategories
{
  return 11;
}

+ (id)categories
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  UIKeyboardEmojiCategory *v6;

  v2 = (void *)categories_categories;
  if (!categories_categories)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "numberOfCategories"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)categories_categories;
    categories_categories = v3;

    for (i = 0; i != 12; ++i)
    {
      v6 = objc_alloc_init(UIKeyboardEmojiCategory);
      -[UIKeyboardEmojiCategory setCategoryType:](v6, "setCategoryType:", i);
      objc_msgSend((id)categories_categories, "addObject:", v6);

    }
    v2 = (void *)categories_categories;
  }
  return v2;
}

+ (id)categoriesByType
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  UIKeyboardEmojiCategory *v12;
  UIKeyboardEmojiCategory *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)categoriesByType_categories;
  if (!categoriesByType_categories)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = (void *)categoriesByType_categories;
    categoriesByType_categories = (uint64_t)v4;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "allowedCategoryIndexes", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
          v12 = objc_alloc_init(UIKeyboardEmojiCategory);
          -[UIKeyboardEmojiCategory setCategoryType:](v12, "setCategoryType:", (int)objc_msgSend(v11, "intValue"));
          objc_msgSend((id)categoriesByType_categories, "setObject:forKey:", v12, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v13 = objc_alloc_init(UIKeyboardEmojiCategory);
    -[UIKeyboardEmojiCategory setCategoryType:](v13, "setCategoryType:", 9);
    objc_msgSend((id)categoriesByType_categories, "setObject:forKey:", v13, &unk_1E1A98C70);

    v3 = (void *)categoriesByType_categories;
  }
  return v3;
}

- (void)releaseCategories
{
  id v2;

  +[UIKeyboardEmojiCategory categories](UIKeyboardEmojiCategory, "categories");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

+ (id)professionSkinToneEmojiBaseKey:(id)a3
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  id v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "_containsSubstring:", CFSTR("🏻")))
  {
    v4 = objc_msgSend(v3, "length");
    v5 = CFSTR("🏻");
  }
  else if (objc_msgSend(v3, "_containsSubstring:", CFSTR("🏼")))
  {
    v4 = objc_msgSend(v3, "length");
    v5 = CFSTR("🏼");
  }
  else if (objc_msgSend(v3, "_containsSubstring:", CFSTR("🏽")))
  {
    v4 = objc_msgSend(v3, "length");
    v5 = CFSTR("🏽");
  }
  else if (objc_msgSend(v3, "_containsSubstring:", CFSTR("🏾")))
  {
    v4 = objc_msgSend(v3, "length");
    v5 = CFSTR("🏾");
  }
  else
  {
    if (!objc_msgSend(v3, "_containsSubstring:", CFSTR("🏿")))
    {
      v6 = v3;
      goto LABEL_12;
    }
    v4 = objc_msgSend(v3, "length");
    v5 = CFSTR("🏿");
  }
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", v5, &stru_1E16EDF20, 2, 0, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v7 = v6;

  return v7;
}

+ (unint64_t)hasVariantsForEmoji:(id)a3
{
  return 0;
}

+ (id)emojiRecentsFromPreferences
{
  return 0;
}

+ (id)loadPrecomputedEmojiFlagCategory
{
  return 0;
}

+ (id)emojiCategoryStringForCategoryType:(int64_t)a3
{
  id v3;
  id *v4;
  void *v5;
  __CFString *v6;
  id result;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = 0;
  switch(a3)
  {
    case 0:
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v4 = (id *)getEMFEmojiCategoryRecentsSymbolLoc_ptr;
      v13 = getEMFEmojiCategoryRecentsSymbolLoc_ptr;
      if (!getEMFEmojiCategoryRecentsSymbolLoc_ptr)
      {
        v5 = EmojiFoundationLibrary_0();
        v4 = (id *)dlsym(v5, "EMFEmojiCategoryRecents");
        v11[3] = (uint64_t)v4;
        getEMFEmojiCategoryRecentsSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v10, 8);
      if (v4)
      {
        v3 = *v4;
        return v3;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getEMFEmojiCategoryRecents(void)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("UIKeyboardEmojiCategory.m"), 33, CFSTR("%s"), dlerror());

      __break(1u);
      return result;
    case 1:
      getEMFEmojiCategoryPeople();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 2:
      getEMFEmojiCategoryNature();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 3:
      getEMFEmojiCategoryFoodAndDrink();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 5:
      getEMFEmojiCategoryActivity();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 6:
      getEMFEmojiCategoryTravelAndPlaces();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 7:
      getEMFEmojiCategoryFlags();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 9:
      getEMFEmojiCategoryPrepopulated();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 10:
      getEMFEmojiCategoryObjects();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 11:
      getEMFEmojiCategorySymbols();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 13:
      v6 = CFSTR("Memoji");
      goto LABEL_10;
    case 14:
      v6 = CFSTR("Stickers");
LABEL_10:
      _UILocalizedStringInSystemLanguage(v6, v6);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v3;
  }
  return v3;
}

+ (int64_t)emojiCategoryTypeForCategoryString:(id)a3
{
  id v3;
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;

  v3 = a3;
  getEMFEmojiCategoryPrepopulated();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 9;
  }
  else
  {
    getEMFEmojiCategoryPeople();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      getEMFEmojiCategoryNature();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
      {
        v6 = 2;
      }
      else
      {
        getEMFEmojiCategoryFoodAndDrink();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          v6 = 3;
        }
        else
        {
          getEMFEmojiCategoryActivity();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v3, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
          {
            v6 = 5;
          }
          else
          {
            getEMFEmojiCategoryTravelAndPlaces();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v3, "isEqualToString:", v15);

            if ((v16 & 1) != 0)
            {
              v6 = 6;
            }
            else
            {
              getEMFEmojiCategoryObjects();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v3, "isEqualToString:", v17);

              if ((v18 & 1) != 0)
              {
                v6 = 10;
              }
              else
              {
                getEMFEmojiCategorySymbols();
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v3, "isEqualToString:", v19);

                if ((v20 & 1) != 0)
                {
                  v6 = 11;
                }
                else
                {
                  getEMFEmojiCategoryFlags();
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v3, "isEqualToString:", v21);

                  if ((v22 & 1) != 0)
                  {
                    v6 = 7;
                  }
                  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UIKeyboardEmojiCategoryMemoji")) & 1) != 0)
                  {
                    v6 = 13;
                  }
                  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UIKeyboardEmojiCategoryStickers")))
                  {
                    v6 = 14;
                  }
                  else
                  {
                    v6 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v6;
}

+ (id)categoryForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "emojiCategoryStringForCategoryType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "categoriesByType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "emoji");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!a3 || !v10)
  {
    objc_msgSend(getEMFEmojiCategoryClass(), "_emojiSetForIdentifier:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v22 = v8;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            v19 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * i);
            +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v19, +[UIKeyboardEmojiCategory hasVariantsForEmoji:](UIKeyboardEmojiCategory, "hasVariantsForEmoji:", v19));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              objc_msgSend(v13, "addObject:", v20);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v16);
      }

      v8 = v22;
      if (v13)
      {
        objc_msgSend(v22, "setEmoji:", v13);

      }
    }

  }
  return v8;
}

+ (BOOL)isRTLMode
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  BOOL v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v3, "semanticContentAttribute")) == UIUserInterfaceLayoutDirectionRightToLeft;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "characterDirectionForLanguage:", v3) == 2;
  }
  v6 = v4;

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_categoryType = -1;
  -[UIKeyboardEmojiCategory setEmoji:](self, "setEmoji:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardEmojiCategory;
  -[UIKeyboardEmojiCategory dealloc](&v3, sel_dealloc);
}

+ (id)localizedStringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  TIBundleForInputMode();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)name
{
  unint64_t v2;

  v2 = -[UIKeyboardEmojiCategory categoryType](self, "categoryType");
  if (v2 > 0xE)
    return 0;
  else
    return &off_1E16D5928[v2]->isa;
}

+ (id)displayName:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "emojiCategoryStringForCategoryType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardEmojiCategory sharedManager](UIKeyboardEmojiCategory, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(getEMFEmojiCategoryClass(), "categoryWithIdentifier:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardEmojiCategory sharedManager](UIKeyboardEmojiCategory, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v3);

  }
  +[UIKeyboardEmojiCategory sharedManager](UIKeyboardEmojiCategory, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)fallbackDisplayName:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "emojiCategoryStringForCategoryType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardEmojiCategory sharedManager](UIKeyboardEmojiCategory, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortLocalizedNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(getEMFEmojiCategoryClass(), "categoryWithIdentifier:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardEmojiCategory sharedManager](UIKeyboardEmojiCategory, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortLocalizedNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortLocalizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v3);

  }
  +[UIKeyboardEmojiCategory sharedManager](UIKeyboardEmojiCategory, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shortLocalizedNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(int64_t)a3
{
  self->_categoryType = a3;
}

- (NSMutableDictionary)localizedNames
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalizedNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)shortLocalizedNames
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setShortLocalizedNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)emoji
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEmoji:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)lastVisibleFirstEmojiIndex
{
  return self->_lastVisibleFirstEmojiIndex;
}

- (void)setLastVisibleFirstEmojiIndex:(int64_t)a3
{
  self->_lastVisibleFirstEmojiIndex = a3;
}

- (NSString)displaySymbol
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaySymbol, 0);
  objc_storeStrong((id *)&self->_shortLocalizedNames, 0);
  objc_storeStrong((id *)&self->_localizedNames, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
}

@end
