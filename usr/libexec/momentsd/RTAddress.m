@implementation RTAddress

- (id)getPreferredName
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_claimAutoreleasedReturnValue(-[RTAddress areasOfInterest](self, "areasOfInterest"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress areasOfInterest](self, "areasOfInterest")),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress areasOfInterest](self, "areasOfInterest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress thoroughfare](self, "thoroughfare"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress locality](self, "locality"));
    v8 = v10;
    if (v9)
    {

      if (v8)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress thoroughfare](self, "thoroughfare"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress locality](self, "locality"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v11, v12));

      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress thoroughfare](self, "thoroughfare"));
      }
    }
  }
  return v8;
}

@end
