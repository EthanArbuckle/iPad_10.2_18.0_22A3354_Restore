@implementation CRLShapeLibraryCategory

- (NSString)categoryID
{
  return (NSString *)-[CRLShapeLibraryObject objectForKey:](self, "objectForKey:", CFSTR("id"));
}

- (NSString)localizationKey
{
  return (NSString *)-[CRLShapeLibraryObject objectForKey:](self, "objectForKey:", CFSTR("localizationKey"));
}

- (NSString)name
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryCategory localizationKey](self, "localizationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v2, 0, CFSTR("CRLShapeLibrarianCategoryNames")));

  return (NSString *)v4;
}

- (NSArray)shapeIDs
{
  return (NSArray *)-[CRLShapeLibraryObject objectForKey:](self, "objectForKey:", CFSTR("shapeIDs"));
}

@end
