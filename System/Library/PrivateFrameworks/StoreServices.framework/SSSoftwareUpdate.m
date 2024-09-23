@implementation SSSoftwareUpdate

- (SSSoftwareUpdate)initWithUpdateDictionary:(id)a3
{
  SSSoftwareUpdate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSSoftwareUpdate;
  v4 = -[SSSoftwareUpdate init](&v6, sel_init);
  if (v4)
    v4->_dictionary = (NSDictionary *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSoftwareUpdate;
  -[SSSoftwareUpdate dealloc](&v3, sel_dealloc);
}

- (NSString)bundleIdentifier
{
  id v3;

  v3 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("bundleId"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v3;
  v3 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("bundle-id"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v3;
  else
    return 0;
}

- (int64_t)parentalControlsRank
{
  id v3;
  const __CFString *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("contentRating"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFSTR("value");
    v5 = v3;
  }
  else
  {
    v6 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("parental_control_attributes"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    v4 = CFSTR("rating-software");
    v5 = v6;
  }
  v7 = (void *)objc_msgSend(v5, "objectForKey:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v7, "integerValue");
  return 0;
}

- (int64_t)storeItemIdentifier
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("id"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "longLongValue");
  else
    return 0;
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)updateDictionary
{
  return self->_dictionary;
}

- (int64_t)updateState
{
  return self->_updateState;
}

- (void)setUpdateState:(int64_t)a3
{
  self->_updateState = a3;
}

@end
