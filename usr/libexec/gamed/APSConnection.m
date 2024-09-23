@implementation APSConnection

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection valueForKey:](self, "valueForKey:", CFSTR("environmentName")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection valueForKey:](self, "valueForKey:", CFSTR("connectionPortName")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p %@ %@>"), v3, self, v4, v5));

  return v6;
}

@end
