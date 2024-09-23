@implementation PKCacheRecipientItem

- (PKCacheRecipientItem)initWithItem:(id)a3
{
  id v5;
  PKCacheRecipientItem *v6;
  PKCacheRecipientItem *v7;
  uint64_t v8;
  NSDate *insertDate;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCacheRecipientItem;
  v6 = -[PKCacheRecipientItem init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    insertDate = v7->_insertDate;
    v7->_insertDate = (NSDate *)v8;

  }
  return v7;
}

- (BOOL)hasExpired
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[PKPeerPaymentRecipient cacheUntil](self->_item, "cacheUntil");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NSDate dateByAddingTimeInterval:](self->_insertDate, "dateByAddingTimeInterval:", 3600.0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7) == -1;

  return v8;
}

- (BOOL)isNewerThan:(id)a3
{
  return -[NSDate compare:](self->_insertDate, "compare:", *((_QWORD *)a3 + 1)) != NSOrderedAscending;
}

- (PKCacheRecipientItem)initWithCoder:(id)a3
{
  id v4;
  PKCacheRecipientItem *v5;
  uint64_t v6;
  PKPeerPaymentRecipient *item;
  uint64_t v8;
  NSDate *insertDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCacheRecipientItem;
  v5 = -[PKCacheRecipientItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v6 = objc_claimAutoreleasedReturnValue();
    item = v5->_item;
    v5->_item = (PKPeerPaymentRecipient *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v8 = objc_claimAutoreleasedReturnValue();
    insertDate = v5->_insertDate;
    v5->_insertDate = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPeerPaymentRecipient *item;
  id v5;

  item = self->_item;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", item, CFSTR("i"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_insertDate, CFSTR("d"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecipient)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_insertDate, 0);
}

@end
