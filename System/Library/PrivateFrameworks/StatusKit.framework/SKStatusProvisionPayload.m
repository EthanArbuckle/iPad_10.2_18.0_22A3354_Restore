@implementation SKStatusProvisionPayload

- (SKStatusProvisionPayload)initWithStatusPayload:(id)a3 validFrom:(id)a4 validUntil:(id)a5
{
  id v9;
  id v10;
  id v11;
  SKStatusProvisionPayload *v12;
  SKStatusProvisionPayload *v13;
  void *v14;
  uint64_t v15;
  NSString *identifier;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SKStatusProvisionPayload;
  v12 = -[SKStatusProvisionPayload init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_statusPayload, a3);
    objc_storeStrong((id *)&v13->_validFrom, a4);
    objc_storeStrong((id *)&v13->_validUntil, a5);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v15;

  }
  return v13;
}

+ (id)logger
{
  if (logger_onceToken_9 != -1)
    dispatch_once(&logger_onceToken_9, &__block_literal_global_10);
  return (id)logger__logger_9;
}

void __34__SKStatusProvisionPayload_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKStatusProvisionPayload");
  v1 = (void *)logger__logger_9;
  logger__logger_9 = (uint64_t)v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  SKStatusPayload *statusPayload;
  id v5;

  statusPayload = self->_statusPayload;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", statusPayload, CFSTR("payload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validFrom, CFSTR("valid-from"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validUntil, CFSTR("valid-until"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptedStatusPayload, CFSTR("encrypted-payload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_decryptionKey, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initializationVector, CFSTR("initialization-vector"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commitmentSalt, CFSTR("commitment-salt"));

}

- (SKStatusProvisionPayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SKStatusProvisionPayload *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valid-from"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valid-until"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SKStatusProvisionPayload initWithStatusPayload:validFrom:validUntil:](self, "initWithStatusPayload:validFrom:validUntil:", v5, v6, v7);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encrypted-payload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusProvisionPayload setEncryptedStatusPayload:](v8, "setEncryptedStatusPayload:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusProvisionPayload setIdentifier:](v8, "setIdentifier:", v10);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusProvisionPayload setDecryptionKey:](v8, "setDecryptionKey:", v11);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialization-vector"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusProvisionPayload setInitializationVector:](v8, "setInitializationVector:", v12);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commitment-salt"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKStatusProvisionPayload setCommitmentSalt:](v8, "setCommitmentSalt:", v13);
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKStatusProvisionPayload identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusProvisionPayload statusPayload](self, "statusPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusProvisionPayload validFrom](self, "validFrom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusProvisionPayload validUntil](self, "validUntil");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusProvisionPayload decryptionKey](self, "decryptionKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("NO");
  if (!v9)
    v10 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = \"%@\"; payload = \"%@\"; validFrom = \"%@\"; validUntil = \"%@\"; hasKey = \"%@\";"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (SKStatusPayload)statusPayload
{
  return self->_statusPayload;
}

- (NSData)decryptionKey
{
  return self->_decryptionKey;
}

- (void)setDecryptionKey:(id)a3
{
  objc_storeStrong((id *)&self->_decryptionKey, a3);
}

- (NSDate)validFrom
{
  return self->_validFrom;
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (NSData)encryptedStatusPayload
{
  return self->_encryptedStatusPayload;
}

- (void)setEncryptedStatusPayload:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedStatusPayload, a3);
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
  objc_storeStrong((id *)&self->_initializationVector, a3);
}

- (NSData)commitmentSalt
{
  return self->_commitmentSalt;
}

- (void)setCommitmentSalt:(id)a3
{
  objc_storeStrong((id *)&self->_commitmentSalt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitmentSalt, 0);
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_encryptedStatusPayload, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_validFrom, 0);
  objc_storeStrong((id *)&self->_decryptionKey, 0);
  objc_storeStrong((id *)&self->_statusPayload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
