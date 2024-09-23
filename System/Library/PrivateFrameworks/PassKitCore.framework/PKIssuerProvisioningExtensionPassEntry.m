@implementation PKIssuerProvisioningExtensionPassEntry

- (id)paymentPassEntry
{
  PKIssuerProvisioningExtensionPassEntry *v3;

  if (-[PKIssuerProvisioningExtensionPassEntry type](self, "type") == 1)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKIssuerProvisioningExtensionPassEntry)init
{
  NSObject *v3;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionPassEntry: invalid initializer.", v5, 2u);
  }

  return 0;
}

- (id)_initWithType:(int64_t)a3 identifier:(id)a4 title:(id)a5 art:(CGImage *)a6
{
  id v10;
  id v11;
  void *v12;
  PKIssuerProvisioningExtensionPassEntry *v13;
  PKIssuerProvisioningExtensionPassEntry *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *title;
  PKIssuerProvisioningExtensionPassEntry *v19;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[16];

  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10 && v11 && a6)
  {
    v22.receiver = self;
    v22.super_class = (Class)PKIssuerProvisioningExtensionPassEntry;
    v13 = -[PKIssuerProvisioningExtensionPassEntry init](&v22, sel_init);
    v14 = v13;
    if (v13)
    {
      v13->_type = a3;
      v15 = objc_msgSend(v10, "copy");
      identifier = v14->_identifier;
      v14->_identifier = (NSString *)v15;

      v17 = objc_msgSend(v12, "copy");
      title = v14->_title;
      v14->_title = (NSString *)v17;

      v14->_art = CGImageRetain(a6);
    }
    self = v14;
    v19 = self;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionPassEntry: initializer missing required parameters.", buf, 2u);
    }

    v19 = 0;
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_art);
  v3.receiver = self;
  v3.super_class = (Class)PKIssuerProvisioningExtensionPassEntry;
  -[PKIssuerProvisioningExtensionPassEntry dealloc](&v3, sel_dealloc);
}

- (PKIssuerProvisioningExtensionPassEntry)initWithCoder:(id)a3
{
  id v4;
  PKIssuerProvisioningExtensionPassEntry *v5;
  PKIssuerProvisioningExtensionPassEntry *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *title;
  NSData *v11;
  NSData *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKIssuerProvisioningExtensionPassEntry;
  v5 = -[PKIssuerProvisioningExtensionPassEntry init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKIssuerProvisioningExtensionPassEntry setType:](v5, "setType:", 0);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v9 = objc_claimAutoreleasedReturnValue();
    title = v6->_title;
    v6->_title = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("art"));
    v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v6->_art = PKCreateCGImage(v11);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  __CFData *Mutable;
  __CFData *v5;
  CGImageDestination *v6;
  CGImageDestination *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_title, CFSTR("title"));
  if (self->_art)
  {
    Mutable = CFDataCreateMutable(0, 0);
    if (Mutable)
    {
      v5 = Mutable;
      v6 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier"), 1uLL, 0);
      if (v6)
      {
        v7 = v6;
        CGImageDestinationAddImage(v6, self->_art, 0);
        if (CGImageDestinationFinalize(v7))
          objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("art"));
        CFRelease(v7);
      }
      CFRelease(v5);
    }
  }

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKIssuerProvisioningExtensionPassEntry *v4;
  BOOL v5;

  v4 = (PKIssuerProvisioningExtensionPassEntry *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKIssuerProvisioningExtensionPassEntry _isEqualToEntry:](self, "_isEqualToEntry:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToEntry:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  NSString *title;
  NSString *v9;
  BOOL v10;

  v4 = a3;
  if (!v4)
    goto LABEL_15;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_15;
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_15;
  }
  title = self->_title;
  v9 = (NSString *)v4[2];
  if (!title || !v9)
  {
    if (title == v9)
      goto LABEL_13;
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  if ((-[NSString isEqual:](title, "isEqual:") & 1) == 0)
    goto LABEL_15;
LABEL_13:
  v10 = self->_type == v4[4];
LABEL_16:

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (CGImageRef)art
{
  return self->_art;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
