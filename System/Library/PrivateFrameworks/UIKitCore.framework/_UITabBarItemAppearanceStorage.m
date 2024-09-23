@implementation _UITabBarItemAppearanceStorage

- (void)setBadgeTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *badgeTextAttributesForState;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  id v16;

  v6 = a3;
  v16 = v6;
  if (v6)
    goto LABEL_12;
  badgeTextAttributesForState = self->_badgeTextAttributesForState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](badgeTextAttributesForState, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v9)
  {
LABEL_12:
    if (self->_badgeTextAttributesForState)
    {
      if (v6)
      {
LABEL_5:
        v10 = (void *)objc_msgSend(v6, "mutableCopy");
        v11 = self->_badgeTextAttributesForState;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

LABEL_8:
        v6 = v16;
        goto LABEL_9;
      }
    }
    else
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = self->_badgeTextAttributesForState;
      self->_badgeTextAttributesForState = v13;

      v6 = v16;
      if (v16)
        goto LABEL_5;
    }
    v15 = self->_badgeTextAttributesForState;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v10);
    goto LABEL_8;
  }
LABEL_9:

}

- (id)badgeTextAttributesForState:(unint64_t)a3
{
  NSMutableDictionary *badgeTextAttributesForState;
  void *v4;
  void *v5;
  void *v6;

  badgeTextAttributesForState = self->_badgeTextAttributesForState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](badgeTextAttributesForState, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (void)enumerateBadgeTextAttributesWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *badgeTextAttributesForState;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  badgeTextAttributesForState = self->_badgeTextAttributesForState;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72___UITabBarItemAppearanceStorage_enumerateBadgeTextAttributesWithBlock___block_invoke;
  v7[3] = &unk_1E16B5BB0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](badgeTextAttributesForState, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (UIOffset)titleOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_titleOffset.horizontal;
  vertical = self->_titleOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setTitleOffset:(UIOffset)a3
{
  self->_titleOffset = a3;
}

- (UIColor)badgeColor
{
  return self->_badgeColor;
}

- (void)setBadgeColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_badgeTextAttributesForState, 0);
}

@end
