@implementation GEOStructuredAddress

- (id)_cellContent_subtitleWithTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStructuredAddress administrativeArea](self, "administrativeArea"));
  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStructuredAddress country](self, "country"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uppercaseString"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uppercaseString"));
    if (!objc_msgSend(v10, "isEqualToString:", v11) && objc_msgSend(v6, "length"))
    {

LABEL_13:
      goto LABEL_14;
    }
    v12 = objc_msgSend(v7, "length");

    if (!v12)
      goto LABEL_14;
LABEL_12:
    v9 = v6;
    v6 = v7;
    goto LABEL_13;
  }
  if (!objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
    goto LABEL_12;
LABEL_14:
  v13 = v6;

  return v13;
}

- (id)localityWithFallback:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  if (-[GEOStructuredAddress hasLocality](self, "hasLocality"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStructuredAddress locality](self, "locality"));
  }
  else if (v3)
  {
    if (-[GEOStructuredAddress hasSubAdministrativeArea](self, "hasSubAdministrativeArea"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStructuredAddress subAdministrativeArea](self, "subAdministrativeArea"));
    }
    else if (-[GEOStructuredAddress hasAdministrativeArea](self, "hasAdministrativeArea"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStructuredAddress administrativeArea](self, "administrativeArea"));
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStructuredAddress country](self, "country"));
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
