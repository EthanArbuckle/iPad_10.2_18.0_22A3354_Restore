@implementation OpenFavoritesAction

- (OpenFavoritesAction)initWithFavoriteType:(int64_t)a3
{
  OpenFavoritesAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OpenFavoritesAction;
  result = -[OpenFavoritesAction init](&v5, "init");
  if (result)
    result->_favoritesType = a3;
  return result;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int64_t)favoritesType
{
  return self->_favoritesType;
}

- (void)setFavoritesType:(int64_t)a3
{
  self->_favoritesType = a3;
}

@end
