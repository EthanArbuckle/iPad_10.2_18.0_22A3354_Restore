@implementation SBDodgingItem

- (SBDodgingItem)initWithUniqueIdentifier:(id)a3 view:(id)a4 delegate:(id)a5 dodgingResolverViewController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBDodgingItem *v15;
  uint64_t v16;
  NSString *uniqueIdentifier;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SBDodgingItem;
  v15 = -[SBDodgingItem init](&v23, sel_init);
  if (v15)
  {
    if (v11)
    {
      if (v13)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBDodgingItem.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifier"));

      if (v13)
      {
LABEL_4:
        if (v14)
        {
LABEL_5:
          v16 = objc_msgSend(v11, "copy");
          uniqueIdentifier = v15->_uniqueIdentifier;
          v15->_uniqueIdentifier = (NSString *)v16;

          objc_storeStrong((id *)&v15->_view, a4);
          objc_storeWeak((id *)&v15->_delegate, v13);
          objc_storeStrong((id *)&v15->_dodgingResolverViewController, a6);
          goto LABEL_6;
        }
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBDodgingItem initWithUniqueIdentifier:view:delegate:dodgingResolverViewController:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("SBDodgingItem.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dodgingResolverViewController"));

        goto LABEL_5;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBDodgingItem.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v14)
      goto LABEL_5;
    goto LABEL_9;
  }
LABEL_6:

  return v15;
}

- (void)setNeedsUpdateAnimated:(BOOL)a3
{
  -[SBDodgingResolverViewController setItemNeedsUpdate:animated:](self->_dodgingResolverViewController, "setItemNeedsUpdate:animated:", self, a3);
}

- (id)invalidate
{
  return -[SBDodgingResolverViewController invalidateItem:](self->_dodgingResolverViewController, "invalidateItem:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  NSString *uniqueIdentifier;
  UIView *view;
  id WeakRetained;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  uniqueIdentifier = self->_uniqueIdentifier;
  view = self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = (void *)objc_msgSend(v4, "initWithUniqueIdentifier:view:delegate:dodgingResolverViewController:", uniqueIdentifier, view, WeakRetained, self->_dodgingResolverViewController);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", self->_uniqueIdentifier);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_uniqueIdentifier, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDodgingItem;
  -[SBDodgingItem description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), self->_uniqueIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)containerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerSize.width;
  height = self->_containerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  self->_containerSize = a3;
}

- (UICoordinateSpace)containerCoordinateSpace
{
  return self->_containerCoordinateSpace;
}

- (void)setContainerCoordinateSpace:(id)a3
{
  objc_storeStrong((id *)&self->_containerCoordinateSpace, a3);
}

- (NSArray)otherDodgingIdentifiers
{
  return self->_otherDodgingIdentifiers;
}

- (void)setOtherDodgingIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_otherDodgingIdentifiers, a3);
}

- (SBDodgingItemDelegate)delegate
{
  return (SBDodgingItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)view
{
  return self->_view;
}

- (SBDodgingItemPreference)preference
{
  return self->_preference;
}

- (void)setPreference:(id)a3
{
  objc_storeStrong((id *)&self->_preference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preference, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_otherDodgingIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_dodgingResolverViewController, 0);
}

@end
