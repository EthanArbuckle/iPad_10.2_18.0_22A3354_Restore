@implementation MFNanoBridgeSettingsUnifiedMailbox

- (MFNanoBridgeSettingsUnifiedMailbox)initWithType:(int64_t)a3
{
  MFNanoBridgeSettingsUnifiedMailbox *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFNanoBridgeSettingsUnifiedMailbox;
  result = -[MFNanoBridgeSettingsUnifiedMailbox init](&v5, "init");
  if (result)
    result->_type = a3;
  return result;
}

- (unint64_t)mailboxFilterType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_type));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kNSCodingKeyType"));

}

- (MFNanoBridgeSettingsUnifiedMailbox)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  MFNanoBridgeSettingsUnifiedMailbox *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("kNSCodingKeyType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = -[MFNanoBridgeSettingsUnifiedMailbox initWithType:](self, "initWithType:", v7);
  return v8;
}

- (id)displayName
{
  NSBundle *v2;
  void *v3;
  void *v4;

  if (self->_type == 7)
  {
    v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ALL_INBOXES"), &stru_100531B00, CFSTR("Main")));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)icon
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (self->_type == 7)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphFavoriteInboxUnifiedMailbox, 7));
    v3 = off_1005A2840();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageWithTintColor:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFNanoBridgeSettingsUnifiedMailbox;
  if (-[MFNanoBridgeSettingsMailbox isEqual:](&v7, "isEqual:", v4))
    v5 = objc_msgSend(v4, "type") == (id)self->_type;
  else
    v5 = 0;

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

@end
