@implementation NSManagedObjectID(PLManagedObject)

- (id)pl_shortURI
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "URIRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PLShortObjectIDFromURL(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
