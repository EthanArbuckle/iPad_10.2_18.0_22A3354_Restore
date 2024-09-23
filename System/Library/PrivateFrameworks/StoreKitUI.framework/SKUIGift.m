@implementation SKUIGift

- (SKUIGift)initWithGiftCategory:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIGift *result;
  objc_super v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIGift initWithGiftCategory:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIGift;
  result = -[SKUIGift init](&v14, sel_init);
  if (result)
    result->_category = a3;
  return result;
}

- (SKUIGift)initWithItem:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIGift *v14;
  SKUIGift *v15;
  objc_super v17;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        -[SKUIGift initWithItem:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIGift;
  v14 = -[SKUIGift init](&v17, sel_init);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_item, a3);

  return v15;
}

- (id)HTTPBodyDictionary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SKUIGiftTheme *theme;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SKUIGift deliveryDate](self, "deliveryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    objc_msgSend(v5, "stringFromDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("customSendGiftDate"));

    objc_msgSend(v3, "setObject:forKey:", CFSTR("custom"), CFSTR("dateSendType"));
  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("today"), CFSTR("dateSendType"));
  }
  -[SKUIGift item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "primaryItemOffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("actionParams"));
    objc_msgSend(v3, "setObject:forKey:", CFSTR("product"), CFSTR("giftType"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[SKUIGift giftAmount](self, "giftAmount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("amount"));

    objc_msgSend(v3, "setObject:forKey:", CFSTR("credit"), CFSTR("giftType"));
  }
  -[SKUIGift message](self, "message");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("message"));
  -[SKUIGift recipientAddresses](self, "recipientAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("toEmail"));

  }
  -[SKUIGift senderEmailAddress](self, "senderEmailAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("senderEmail"));
  -[SKUIGift senderName](self, "senderName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("fromName"));
  theme = self->_theme;
  if (theme)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SKUIGiftTheme themeIdentifier](theme, "themeIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("fcAdamId"));

  }
  objc_msgSend(MEMORY[0x1E0DDC158], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "guid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("guid"));

  return v3;
}

- (void)reset
{
  NSDate *deliveryDate;
  NSString *giftAmountString;
  NSString *message;
  NSArray *recipientAddresses;
  SKUIGiftTheme *theme;
  NSString *totalGiftAmountString;

  deliveryDate = self->_deliveryDate;
  self->_deliveryDate = 0;

  giftAmountString = self->_giftAmountString;
  self->_giftAmount = 0;
  self->_giftAmountString = 0;

  message = self->_message;
  self->_message = 0;

  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = 0;

  theme = self->_theme;
  self->_theme = 0;

  totalGiftAmountString = self->_totalGiftAmountString;
  self->_totalGiftAmountString = 0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = self->_category;
  v6 = -[NSDate copyWithZone:](self->_deliveryDate, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_QWORD *)(v5 + 24) = self->_giftAmount;
  v8 = -[NSString copyWithZone:](self->_giftAmountString, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  objc_storeStrong((id *)(v5 + 40), self->_item);
  v10 = -[NSString copyWithZone:](self->_message, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSArray copyWithZone:](self->_recipientAddresses, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSString copyWithZone:](self->_senderEmailAddress, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[NSString copyWithZone:](self->_senderName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  v18 = -[SKUIGiftTheme copyWithZone:](self->_theme, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  v20 = -[NSString copyWithZone:](self->_totalGiftAmountString, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v20;

  return (id)v5;
}

- (NSDate)deliveryDate
{
  return self->_deliveryDate;
}

- (void)setDeliveryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)giftAmount
{
  return self->_giftAmount;
}

- (void)setGiftAmount:(int64_t)a3
{
  self->_giftAmount = a3;
}

- (NSString)giftAmountString
{
  return self->_giftAmountString;
}

- (void)setGiftAmountString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)giftCategory
{
  return self->_category;
}

- (SKUIItem)item
{
  return self->_item;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (void)setRecipientAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)senderEmailAddress
{
  return self->_senderEmailAddress;
}

- (void)setSenderEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SKUIGiftTheme)theme
{
  return self->_theme;
}

- (void)setTheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)totalGiftAmountString
{
  return self->_totalGiftAmountString;
}

- (void)setTotalGiftAmountString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalGiftAmountString, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_senderEmailAddress, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_giftAmountString, 0);
  objc_storeStrong((id *)&self->_deliveryDate, 0);
}

- (void)initWithGiftCategory:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
