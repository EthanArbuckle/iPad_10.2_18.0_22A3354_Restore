@implementation PKPaymentHostUpdate

- (PKPaymentHostUpdate)initWithContact:(id)a3 shippingMethod:(id)a4 paymentMethod:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPaymentHostUpdate *v12;
  PKPaymentHostUpdate *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentHostUpdate;
  v12 = -[PKPaymentHostUpdate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shippingContact, a3);
    objc_storeStrong((id *)&v13->_shippingMethod, a4);
    objc_storeStrong((id *)&v13->_paymentMethod, a5);
  }

  return v13;
}

- (PKPaymentHostUpdate)initWithCoder:(id)a3
{
  id v4;
  PKPaymentHostUpdate *v5;
  uint64_t v6;
  PKContact *shippingContact;
  uint64_t v8;
  PKShippingMethod *shippingMethod;
  uint64_t v10;
  PKPaymentMethod *paymentMethod;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentHostUpdate;
  v5 = -[PKPaymentHostUpdate init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingContact"));
    v6 = objc_claimAutoreleasedReturnValue();
    shippingContact = v5->_shippingContact;
    v5->_shippingContact = (PKContact *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingMethod"));
    v8 = objc_claimAutoreleasedReturnValue();
    shippingMethod = v5->_shippingMethod;
    v5->_shippingMethod = (PKShippingMethod *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentMethod"));
    v10 = objc_claimAutoreleasedReturnValue();
    paymentMethod = v5->_paymentMethod;
    v5->_paymentMethod = (PKPaymentMethod *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKContact *shippingContact;
  id v5;

  shippingContact = self->_shippingContact;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", shippingContact, CFSTR("shippingContact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shippingMethod, CFSTR("shippingMethod"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentMethod, CFSTR("paymentMethod"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKContact)shippingContact
{
  return self->_shippingContact;
}

- (PKShippingMethod)shippingMethod
{
  return self->_shippingMethod;
}

- (PKPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_shippingMethod, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
}

+ (id)paymentUpdateWithProtobuf:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPaymentHostUpdate *v12;

  v3 = a3;
  objc_msgSend(v3, "shippingContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3710];
    v6 = objc_opt_class();
    objc_msgSend(v3, "shippingContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v7, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "shippingMethod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "shippingMethod");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKShippingMethod shippingMethodWithProtobuf:](PKShippingMethod, "shippingMethodWithProtobuf:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "paymentMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "paymentMethod");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentMethod paymentMethodWithProtobuf:](PKPaymentMethod, "paymentMethodWithProtobuf:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = -[PKPaymentHostUpdate initWithContact:shippingMethod:paymentMethod:]([PKPaymentHostUpdate alloc], "initWithContact:shippingMethod:paymentMethod:", v4, v8, v10);

  return v12;
}

- (id)protobuf
{
  PKProtobufPaymentHostUpdate *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(PKProtobufPaymentHostUpdate);
  -[PKPaymentHostUpdate shippingContact](self, "shippingContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36F8];
    -[PKPaymentHostUpdate shippingContact](self, "shippingContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentHostUpdate setShippingContact:](v3, "setShippingContact:", v7);

  }
  -[PKPaymentHostUpdate shippingMethod](self, "shippingMethod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shippingMethodProtobuf");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentHostUpdate setShippingMethod:](v3, "setShippingMethod:", v9);

  -[PKPaymentHostUpdate paymentMethod](self, "paymentMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "protobuf");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentHostUpdate setPaymentMethod:](v3, "setPaymentMethod:", v11);

  return v3;
}

@end
