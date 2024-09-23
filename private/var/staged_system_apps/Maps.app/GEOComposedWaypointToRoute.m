@implementation GEOComposedWaypointToRoute

- (id)shortDescription
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypointToRoute name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p, name: %@>"), v3, self, v4));

  return v5;
}

@end
