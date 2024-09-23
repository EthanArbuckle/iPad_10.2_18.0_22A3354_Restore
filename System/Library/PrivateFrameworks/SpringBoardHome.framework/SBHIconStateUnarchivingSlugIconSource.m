@implementation SBHIconStateUnarchivingSlugIconSource

- (id)leafIconForIdentifier:(id)a3
{
  id v4;
  SBHApplicationIcon *v5;
  NSMutableDictionary *leafAppIcons;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_leafAppIcons, "objectForKey:", v4);
  v5 = (SBHApplicationIcon *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:]([SBHApplicationIcon alloc], "initWithLeafIdentifier:applicationBundleID:", v4, v4);
    leafAppIcons = self->_leafAppIcons;
    if (!leafAppIcons)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = self->_leafAppIcons;
      self->_leafAppIcons = v7;

      leafAppIcons = self->_leafAppIcons;
    }
    -[NSMutableDictionary setObject:forKey:](leafAppIcons, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafAppIcons, 0);
}

@end
