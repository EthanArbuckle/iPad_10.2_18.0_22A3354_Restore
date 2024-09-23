@implementation PVAppIdentityDigest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVAppIdentityDigest)initWithVersion:(id)a3 data0:(id)a4 data1:(id)a5 data2:(id)a6 data3:(id)a7 data4:(id)a8 data5:(id)a9
{
  id v16;
  id v17;
  PVAppIdentityDigest *v18;
  PVAppIdentityDigest *v19;
  NSError *error;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v16 = a8;
  v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)PVAppIdentityDigest;
  v18 = -[PVAppIdentityDigest init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->version, a3);
    objc_storeStrong((id *)&v19->data0, a4);
    objc_storeStrong((id *)&v19->data1, a5);
    objc_storeStrong((id *)&v19->data2, a6);
    objc_storeStrong((id *)&v19->data3, a7);
    objc_storeStrong((id *)&v19->data4, a8);
    objc_storeStrong((id *)&v19->data5, a9);
    error = v19->error;
    v19->error = 0;

  }
  return v19;
}

- (PVAppIdentityDigest)initWithError:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  PVAppIdentityDigest *v8;
  uint64_t v9;
  NSData *data0;
  NSData *data1;
  NSData *data2;
  NSData *data3;
  NSData *data4;
  NSData *data5;
  NSError *error;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PVAppIdentityDigest;
  v8 = -[PVAppIdentityDigest init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pvai_wrappedError:error:", -10000, v6);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v8->version, a4);
    data0 = v8->data0;
    v8->data0 = 0;

    data1 = v8->data1;
    v8->data1 = 0;

    data2 = v8->data2;
    v8->data2 = 0;

    data3 = v8->data3;
    v8->data3 = 0;

    data4 = v8->data4;
    v8->data4 = 0;

    data5 = v8->data5;
    v8->data5 = 0;

    error = v8->error;
    v8->error = (NSError *)v9;

  }
  return v8;
}

+ (id)digestWithErrorCode:(int64_t)a3
{
  PVAppIdentityDigest *v4;
  void *v5;
  PVAppIdentityDigest *v6;

  v4 = [PVAppIdentityDigest alloc];
  objc_msgSend(MEMORY[0x24BDD1540], "pvai_errorWithCode:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PVAppIdentityDigest initWithError:version:](v4, "initWithError:version:", v5, &unk_2515D3288);

  return v6;
}

+ (id)digestWithTimeoutError
{
  return +[PVAppIdentityDigest digestWithErrorCode:](PVAppIdentityDigest, "digestWithErrorCode:", -10003);
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *version;
  id v5;

  version = self->version;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->data0, CFSTR("data0"));
  objc_msgSend(v5, "encodeObject:forKey:", self->data1, CFSTR("data1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->data2, CFSTR("data2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->data3, CFSTR("data3"));
  objc_msgSend(v5, "encodeObject:forKey:", self->data4, CFSTR("data4"));
  objc_msgSend(v5, "encodeObject:forKey:", self->data5, CFSTR("data5"));
  objc_msgSend(v5, "encodeObject:forKey:", self->error, CFSTR("error"));

}

- (PVAppIdentityDigest)initWithCoder:(id)a3
{
  id v3;
  PVAppIdentityDigest *v4;
  uint64_t v5;
  NSNumber *version;
  uint64_t v7;
  NSData *data0;
  uint64_t v9;
  NSData *data1;
  uint64_t v11;
  NSData *data2;
  uint64_t v13;
  NSData *data3;
  uint64_t v15;
  NSData *data4;
  uint64_t v17;
  NSData *data5;
  uint64_t v19;
  NSError *error;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PVAppIdentityDigest;
  v3 = a3;
  v4 = -[PVAppIdentityDigest init](&v22, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"), v22.receiver, v22.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  version = v4->version;
  v4->version = (NSNumber *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data0"));
  v7 = objc_claimAutoreleasedReturnValue();
  data0 = v4->data0;
  v4->data0 = (NSData *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data1"));
  v9 = objc_claimAutoreleasedReturnValue();
  data1 = v4->data1;
  v4->data1 = (NSData *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data2"));
  v11 = objc_claimAutoreleasedReturnValue();
  data2 = v4->data2;
  v4->data2 = (NSData *)v11;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data3"));
  v13 = objc_claimAutoreleasedReturnValue();
  data3 = v4->data3;
  v4->data3 = (NSData *)v13;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data4"));
  v15 = objc_claimAutoreleasedReturnValue();
  data4 = v4->data4;
  v4->data4 = (NSData *)v15;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data5"));
  v17 = objc_claimAutoreleasedReturnValue();
  data5 = v4->data5;
  v4->data5 = (NSData *)v17;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v19 = objc_claimAutoreleasedReturnValue();

  error = v4->error;
  v4->error = (NSError *)v19;

  return v4;
}

- (id)asDictionary
{
  NSError *error;
  uint64_t v4;
  NSNumber *version;
  void *v6;
  void *v7;
  NSData *data0;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[7];
  _QWORD v16[7];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  error = self->error;
  if (error)
  {
    v4 = -[NSError code](error, "code");
    version = self->version;
    v17[0] = CFSTR("version");
    v17[1] = CFSTR("error");
    v18[0] = version;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    data0 = self->data0;
    v16[0] = self->version;
    v15[0] = CFSTR("version");
    v15[1] = CFSTR("data0");
    -[NSData base64EncodedStringWithOptions:](data0, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v6;
    v15[2] = CFSTR("data1");
    -[NSData base64EncodedStringWithOptions:](self->data1, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v9;
    v15[3] = CFSTR("data2");
    -[NSData base64EncodedStringWithOptions:](self->data2, "base64EncodedStringWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v10;
    v15[4] = CFSTR("data3");
    -[NSData base64EncodedStringWithOptions:](self->data3, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[4] = v11;
    v15[5] = CFSTR("data4");
    -[NSData base64EncodedStringWithOptions:](self->data4, "base64EncodedStringWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[5] = v12;
    v15[6] = CFSTR("data5");
    -[NSData base64EncodedStringWithOptions:](self->data5, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[6] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)getError
{
  return self->error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->data5, 0);
  objc_storeStrong((id *)&self->data4, 0);
  objc_storeStrong((id *)&self->data3, 0);
  objc_storeStrong((id *)&self->data2, 0);
  objc_storeStrong((id *)&self->data1, 0);
  objc_storeStrong((id *)&self->data0, 0);
  objc_storeStrong((id *)&self->version, 0);
}

@end
