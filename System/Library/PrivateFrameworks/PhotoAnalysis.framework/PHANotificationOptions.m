@implementation PHANotificationOptions

- (PHANotificationOptions)initWithType:(unsigned __int8)a3
{
  PHANotificationOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHANotificationOptions;
  result = -[PHANotificationOptions init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)PHANotificationOptions;
  -[PHANotificationOptions description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringFromNotificationType:", -[PHANotificationOptions type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHANotificationOptions title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHANotificationOptions subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHANotificationOptions keyAsset](self, "keyAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHANotificationOptions deliveryDate](self, "deliveryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHANotificationOptions keyAsset](self, "keyAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHANotificationOptions collectionUUID](self, "collectionUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ Notification with:\n\tTitle: %@\n\tSubtitle: %@\n\tKey asset: %@\n\tDelivery date: %@\n\tKey asset: %@\n\tCollection uuid: %@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void)setBodyText:(id)a3
{
  objc_storeStrong((id *)&self->_bodyText, a3);
}

- (NSDate)deliveryDate
{
  return self->_deliveryDate;
}

- (void)setDeliveryDate:(id)a3
{
  objc_storeStrong((id *)&self->_deliveryDate, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setKeyAsset:(id)a3
{
  objc_storeStrong((id *)&self->_keyAsset, a3);
}

- (NSString)collectionUUID
{
  return self->_collectionUUID;
}

- (void)setCollectionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_collectionUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionUUID, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_deliveryDate, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)stringFromNotificationType:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = &stru_1E85223A0;
  if (a3 == 1)
    v3 = CFSTR("Suggestions");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Memories");
}

@end
