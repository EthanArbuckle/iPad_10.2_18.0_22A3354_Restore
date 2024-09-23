@implementation FMDRequestAccessoryLocations

- (FMDRequestAccessoryLocations)initWithAccount:(id)a3 accessoryLocations:(id)a4
{
  id v6;
  FMDRequestAccessoryLocations *v7;
  FMDRequestAccessoryLocations *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMDRequestAccessoryLocations;
  v7 = -[FMDRequest initWithAccount:](&v10, "initWithAccount:", a3);
  v8 = v7;
  if (v7)
    -[FMDRequestAccessoryLocations setAccessoryLocations:](v7, "setAccessoryLocations:", v6);

  return v8;
}

- (id)urlTemplateType
{
  return CFSTR("lastKnownLocation");
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDRequestAccessoryLocations;
  v3 = -[FMDRequest requestBody](&v7, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAccessoryLocations accessoryLocations](self, "accessoryLocations"));
  objc_msgSend(v4, "fm_safeSetObject:forKey:", v5, CFSTR("locations"));

  return v4;
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  LOBYTE(self) = objc_opt_isKindOfClass(v4, v6);

  return self & 1;
}

- (NSArray)accessoryLocations
{
  return self->_accessoryLocations;
}

- (void)setAccessoryLocations:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryLocations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryLocations, 0);
}

@end
