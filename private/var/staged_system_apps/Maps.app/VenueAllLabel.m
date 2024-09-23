@implementation VenueAllLabel

- (VenueAllLabel)init
{
  VenueAllLabel *v2;
  void *v3;
  uint64_t v4;
  NSString *name;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VenueAllLabel;
  v2 = -[VenueAllLabel init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Venues] All"), CFSTR("localized string not found"), 0));
    name = v2->_name;
    v2->_name = (NSString *)v4;

  }
  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
