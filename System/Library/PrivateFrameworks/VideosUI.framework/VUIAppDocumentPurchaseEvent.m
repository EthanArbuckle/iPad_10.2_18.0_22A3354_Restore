@implementation VUIAppDocumentPurchaseEvent

- (VUIAppDocumentPurchaseEvent)initWithDescriptor:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The %@ initializer is not available."), v6);

  return 0;
}

- (VUIAppDocumentPurchaseEvent)initWithPurchaseEventDescriptor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIAppDocumentPurchaseEvent;
  return -[VUIAppDocumentUpdateEvent initWithDescriptor:](&v4, sel_initWithDescriptor_, a3);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUIAppDocumentPurchaseEvent;
  -[VUIAppDocumentUpdateEvent dictionaryRepresentation](&v9, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[VUIAppDocumentPurchaseEvent _purchaseEventDescriptor](self, "_purchaseEventDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canonicalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v6, CFSTR("canonicalId"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end
