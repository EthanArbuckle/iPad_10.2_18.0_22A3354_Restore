@implementation WiFiAwarePublishServiceSpecificInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WiFiAwarePublishServiceSpecificInfo blob](self, "blob");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WiFiAwarePublishServiceSpecificInfo.blob"));

  -[WiFiAwarePublishServiceSpecificInfo txtRecordData](self, "txtRecordData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WiFiAwarePublishServiceSpecificInfo.txt"));

  -[WiFiAwarePublishServiceSpecificInfo instanceName](self, "instanceName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WiFiAwarePublishServiceSpecificInfo.instanceName"));

}

- (WiFiAwarePublishServiceSpecificInfo)initWithCoder:(id)a3
{
  id v4;
  WiFiAwarePublishServiceSpecificInfo *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[WiFiAwarePublishServiceSpecificInfo init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishServiceSpecificInfo.blob"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishServiceSpecificInfo setBlob:](v5, "setBlob:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishServiceSpecificInfo.txt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishServiceSpecificInfo setTxtRecordData:](v5, "setTxtRecordData:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishServiceSpecificInfo.instanceName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiAwarePublishServiceSpecificInfo setInstanceName:](v5, "setInstanceName:", v8);
  return v5;
}

- (WiFiAwarePublishServiceSpecificInfo)init
{
  WiFiAwarePublishServiceSpecificInfo *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WiFiAwarePublishServiceSpecificInfo;
  v2 = -[WiFiAwarePublishServiceSpecificInfo init](&v4, sel_init);
  -[WiFiAwarePublishServiceSpecificInfo setBlob:](v2, "setBlob:", 0);
  -[WiFiAwarePublishServiceSpecificInfo setTxtRecordData:](v2, "setTxtRecordData:", 0);
  -[WiFiAwarePublishServiceSpecificInfo setInstanceName:](v2, "setInstanceName:", 0);
  return v2;
}

- (BOOL)blobEquals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwarePublishServiceSpecificInfo blob](self, "blob");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blob");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwarePublishServiceSpecificInfo blob](self, "blob");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blob");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)txtRecordEquals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwarePublishServiceSpecificInfo txtRecordData](self, "txtRecordData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "txtRecordData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwarePublishServiceSpecificInfo txtRecordData](self, "txtRecordData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "txtRecordData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)instanceNameEquals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwarePublishServiceSpecificInfo instanceName](self, "instanceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instanceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwarePublishServiceSpecificInfo instanceName](self, "instanceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "instanceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwarePublishServiceSpecificInfo *v4;
  WiFiAwarePublishServiceSpecificInfo *v5;
  BOOL v6;

  v4 = (WiFiAwarePublishServiceSpecificInfo *)a3;
  if (self == v4)
  {
    v5 = 0;
LABEL_8:
    v6 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    v5 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  if (-[WiFiAwarePublishServiceSpecificInfo blobEquals:](self, "blobEquals:", v5)
    && -[WiFiAwarePublishServiceSpecificInfo txtRecordEquals:](self, "txtRecordEquals:", v5)
    && -[WiFiAwarePublishServiceSpecificInfo instanceNameEquals:](self, "instanceNameEquals:", v5))
  {
    goto LABEL_8;
  }
  v6 = 0;
LABEL_10:

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwarePublishServiceSpecificInfo blob](self, "blob");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishServiceSpecificInfo txtRecordData](self, "txtRecordData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishServiceSpecificInfo instanceName](self, "instanceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WiFiAwarePublishServiceSpecificInfo: blob=%@, txtRecordData=%@, instanceName=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WiFiAwarePublishServiceSpecificInfo *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(WiFiAwarePublishServiceSpecificInfo);
  -[WiFiAwarePublishServiceSpecificInfo blob](self, "blob");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishServiceSpecificInfo setBlob:](v4, "setBlob:", v5);

  -[WiFiAwarePublishServiceSpecificInfo txtRecordData](self, "txtRecordData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishServiceSpecificInfo setTxtRecordData:](v4, "setTxtRecordData:", v6);

  -[WiFiAwarePublishServiceSpecificInfo instanceName](self, "instanceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwarePublishServiceSpecificInfo setInstanceName:](v4, "setInstanceName:", v7);

  return v4;
}

- (NSData)blob
{
  return self->_blob;
}

- (void)setBlob:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)txtRecordData
{
  return self->_txtRecordData;
}

- (void)setTxtRecordData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)instanceName
{
  return self->_instanceName;
}

- (void)setInstanceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceName, 0);
  objc_storeStrong((id *)&self->_txtRecordData, 0);
  objc_storeStrong((id *)&self->_blob, 0);
}

@end
