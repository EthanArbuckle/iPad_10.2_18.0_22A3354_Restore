@implementation _UIActivityPlaceholderItemProxy

+ (id)unproxiedItemForItem:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "isProxy"))
  {
    objc_msgSend(v3, "placeholderItem");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = v3;
    v4 = v7;

  }
  return v4;
}

+ (id)unproxiedItemsForItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "unproxiedItemForItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (_UIActivityPlaceholderItemProxy)initWithPlaceholderItem:(id)a3
{
  id v5;

  objc_storeStrong(&self->_uikit_placeholderItem, a3);
  v5 = a3;
  objc_setAssociatedObject(self, &__UIActivityPlaceholderItemAssocitatedObjectKey, v5, (void *)1);

  return self;
}

- (id)placeholderItem
{
  return objc_getAssociatedObject(self, &__UIActivityPlaceholderItemAssocitatedObjectKey);
}

- (BOOL)isProxy
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(self->_uikit_placeholderItem, "description");
}

- (BOOL)isEqual:(id)a3
{
  return objc_msgSend(self->_uikit_placeholderItem, "isEqual:", a3);
}

- (unint64_t)hash
{
  return objc_msgSend(self->_uikit_placeholderItem, "hash");
}

- (Class)superclass
{
  return (Class)objc_msgSend(self->_uikit_placeholderItem, "superclass");
}

- (Class)class
{
  return (Class)objc_opt_class();
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", self->_uikit_placeholderItem);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(self->_uikit_placeholderItem, "methodSignatureForSelector:", a3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_uikit_placeholderItem, 0);
}

@end
