@implementation _UIDatePickerLinkedLabelStorage

- (_UIDatePickerLinkedLabelStorage)init
{
  _UIDatePickerLinkedLabelStorage *v2;
  uint64_t v3;
  UILabel *sizingLabel;
  uint64_t v5;
  NSHashTable *attachedLabels;
  uint64_t v7;
  NSCache *sizeCache;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerLinkedLabelStorage;
  v2 = -[_UIDatePickerLinkedLabelStorage init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sizingLabel = v2->_sizingLabel;
    v2->_sizingLabel = (UILabel *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    attachedLabels = v2->_attachedLabels;
    v2->_attachedLabels = (NSHashTable *)v5;

    v7 = objc_opt_new();
    sizeCache = v2->_sizeCache;
    v2->_sizeCache = (NSCache *)v7;

    -[NSCache setCountLimit:](v2->_sizeCache, "setCountLimit:", 40);
  }
  return v2;
}

- (void)_attachLabel:(id)a3
{
  -[NSHashTable addObject:](self->_attachedLabels, "addObject:", a3);
  -[_UIDatePickerLinkedLabelStorage _resetPriority](self, "_resetPriority");
}

- (void)_detachLabel:(id)a3
{
  -[NSHashTable removeObject:](self->_attachedLabels, "removeObject:", a3);
  -[_UIDatePickerLinkedLabelStorage _resetPriority](self, "_resetPriority");
}

- (void)_notifyAllLabelsExcept:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_attachedLabels;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if (v10 != v4)
          objc_msgSend(v10, "_setNeedsStorageSync", (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_resetPriority
{
  self->_currentPriority = 0;
  -[_UIDatePickerLinkedLabelStorage _notifyAllLabelsExcept:](self, "_notifyAllLabelsExcept:", 0);
}

- (void)_setPriority:(int64_t)a3 label:(id)a4
{
  if (self->_currentPriority != a3)
  {
    self->_currentPriority = a3;
    -[_UIDatePickerLinkedLabelStorage _notifyAllLabelsExcept:](self, "_notifyAllLabelsExcept:", a4);
  }
}

- (unint64_t)_currentPriority
{
  return self->_currentPriority;
}

- (CGSize)_sizeForText:(id)a3 font:(id)a4 height:(double)a5 overrideAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[_UIDatePickerLinkedLabelCacheKey keyWithText:font:height:](_UIDatePickerLinkedLabelCacheKey, "keyWithText:font:height:", v10, v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0.0;
  v20 = 0.0;
  if (!-[_UIDatePickerLinkedLabelStorage _cachedSizeForKey:size:](self, "_cachedSizeForKey:size:", v13, &v19))
  {
    _UIAttributedTitleForTitle(v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_sizingLabel, "setAttributedText:", v14);

    -[UILabel sizeThatFits:](self->_sizingLabel, "sizeThatFits:", INFINITY, a5);
    v19 = v15;
    v20 = v16;
    -[_UIDatePickerLinkedLabelStorage _setCachedSize:forKey:](self, "_setCachedSize:forKey:", v13);
  }

  v17 = v19;
  v18 = v20;
  result.height = v18;
  result.width = v17;
  return result;
}

- (BOOL)_cachedSizeForKey:(id)a3 size:(CGSize *)a4
{
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;

  -[NSCache objectForKey:](self->_sizeCache, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4 && v5)
  {
    objc_msgSend(v5, "CGSizeValue");
    a4->width = v7;
    a4->height = v8;
  }

  return v6 != 0;
}

- (void)_setCachedSize:(CGSize)a3 forKey:(id)a4
{
  double height;
  double width;
  NSCache *sizeCache;
  void *v7;
  id v8;
  id v9;

  height = a3.height;
  width = a3.width;
  sizeCache = self->_sizeCache;
  v7 = (void *)MEMORY[0x1E0CB3B18];
  v8 = a4;
  objc_msgSend(v7, "valueWithCGSize:", width, height);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSCache setObject:forKey:](sizeCache, "setObject:forKey:", v9, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeCache, 0);
  objc_storeStrong((id *)&self->_attachedLabels, 0);
  objc_storeStrong((id *)&self->_sizingLabel, 0);
}

@end
