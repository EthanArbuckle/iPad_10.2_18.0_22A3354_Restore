@implementation ICSFreeBusy

+ (id)name
{
  return CFSTR("VFREEBUSY");
}

- (NSArray)freebusy
{
  return (NSArray *)-[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("FREEBUSY"));
}

- (void)setFreebusy:(id)a3
{
  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", a3, CFSTR("FREEBUSY"));
}

- (NSString)x_calendarserver_mask_uid
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-CALENDARSERVER-MASK-UID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_calendarserver_mask_uid:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-CALENDARSERVER-MASK-UID"));
}

- (NSString)x_calendarserver_extended_freebusy
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-CALENDARSERVER-EXTENDED-FREEBUSY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_calendarserver_extended_freebusy:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-CALENDARSERVER-EXTENDED-FREEBUSY"));
}

@end
