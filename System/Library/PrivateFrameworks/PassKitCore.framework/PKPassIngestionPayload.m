@implementation PKPassIngestionPayload

- (PKPassIngestionPayload)init
{

  return 0;
}

- (PKPassIngestionPayload)initWithData:(id)a3
{
  return (PKPassIngestionPayload *)-[PKPassIngestionPayload _initWithData:fileDescriptor:pass:](self, "_initWithData:fileDescriptor:pass:", a3, 0, 0);
}

- (PKPassIngestionPayload)initWithFileDescriptor:(int)a3
{
  PKFileDescriptorXPCContainer *v4;
  PKPassIngestionPayload *v5;

  v4 = -[PKFileDescriptorXPCContainer initWithFileDescriptor:]([PKFileDescriptorXPCContainer alloc], "initWithFileDescriptor:", *(_QWORD *)&a3);
  v5 = -[PKPassIngestionPayload _initWithData:fileDescriptor:pass:](self, "_initWithData:fileDescriptor:pass:", 0, v4, 0);

  return v5;
}

- (PKPassIngestionPayload)initWithPass:(id)a3
{
  return (PKPassIngestionPayload *)-[PKPassIngestionPayload _initWithData:fileDescriptor:pass:](self, "_initWithData:fileDescriptor:pass:", 0, 0, a3);
}

- (id)_initWithData:(id)a3 fileDescriptor:(id)a4 pass:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPassIngestionPayload *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPassIngestionPayload;
  v12 = -[PKPassIngestionPayload init](&v15, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPassIngestionPayload invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPassIngestionPayload;
  -[PKPassIngestionPayload dealloc](&v3, sel_dealloc);
}

- (id)createPass
{
  id v2;
  NSData *data;
  NSObject *v4;
  PKFileDescriptorXPCContainer *fd;
  uint64_t v7;
  id v8;
  NSObject *v9;
  char v10;
  PKPass *pass;
  id v13;
  _QWORD v14[5];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint8_t v22[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  data = self->_data;
  if (data)
  {
    v21 = 0;
    v2 = +[PKObject createWithData:warnings:error:](PKPass, "createWithData:warnings:error:", data, 0, &v21);
    if (!v2)
    {
      PKLogFacilityTypeGetObject(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "Cannot add pass: pass cannot be instantiated from data.", buf, 2u);
      }

      goto LABEL_19;
    }
    return v2;
  }
  fd = self->_fd;
  if (!fd)
  {
    pass = self->_pass;
    if (pass)
      return pass;
    goto LABEL_19;
  }
  *(_QWORD *)buf = 0;
  v16 = buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__61;
  v19 = __Block_byref_object_dispose__61;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __36__PKPassIngestionPayload_createPass__block_invoke;
  v14[3] = &unk_1E2AD7168;
  v14[4] = buf;
  -[PKFileDescriptorXPCContainer accessFileDescriptorWithBlock:](fd, "accessFileDescriptorWithBlock:", v14);
  v7 = *((_QWORD *)v16 + 5);
  if (v7)
  {
    v13 = 0;
    v2 = +[PKObject createWithFileDataAccessor:validationOptions:warnings:error:](PKPass, "createWithFileDataAccessor:validationOptions:warnings:error:", v7, 14, 0, &v13);
    v8 = v13;
    if (v8)
    {
      PKLogFacilityTypeGetObject(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v22 = 138412290;
        v23 = v8;
        _os_log_error_impl(&dword_18FC92000, v9, OS_LOG_TYPE_ERROR, "Failed to create pass due to validation error: %@", v22, 0xCu);
      }

      goto LABEL_12;
    }
    if (!v2)
    {
LABEL_12:

      v10 = 1;
      goto LABEL_18;
    }
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
LABEL_18:
  _Block_object_dispose(buf, 8);

  if ((v10 & 1) != 0)
LABEL_19:
    v2 = 0;
  return v2;
}

void __36__PKPassIngestionPayload_createPass__block_invoke(uint64_t a1, uint64_t a2)
{
  PKSerializedDataAccessor *v3;
  uint64_t v4;
  void *v5;

  v3 = -[PKSerializedDataAccessor initWithFileDescriptor:error:]([PKSerializedDataAccessor alloc], "initWithFileDescriptor:error:", a2, 0);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)invalidate
{
  PKFileDescriptorXPCContainer *fd;
  NSData *data;
  PKPass *pass;

  -[PKFileDescriptorXPCContainer invalidate](self->_fd, "invalidate");
  fd = self->_fd;
  self->_fd = 0;

  data = self->_data;
  self->_data = 0;

  pass = self->_pass;
  self->_pass = 0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassIngestionPayload)initWithCoder:(id)a3
{
  id v4;
  PKPassIngestionPayload *v5;
  uint64_t v6;
  PKFileDescriptorXPCContainer *fd;
  uint64_t v8;
  NSData *data;
  uint64_t v10;
  PKPassIngestionProperties *properties;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassIngestionPayload;
  v5 = -[PKPassIngestionPayload init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fd"));
    v6 = objc_claimAutoreleasedReturnValue();
    fd = v5->_fd;
    v5->_fd = (PKFileDescriptorXPCContainer *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("properties"));
    v10 = objc_claimAutoreleasedReturnValue();
    properties = v5->_properties;
    v5->_properties = (PKPassIngestionProperties *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "encodeObject:forKey:", self->_fd, CFSTR("fd"));
  if (self->_pass)
    v5 = self->_data == 0;
  else
    v5 = 0;
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8](v4);
    -[PKObject archiveData](self->_pass, "archiveData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("data"));

    objc_autoreleasePoolPop(v6);
  }
  else
  {
    objc_msgSend(v8, "encodeObject:forKey:");
  }
  objc_msgSend(v8, "encodeObject:forKey:", self->_properties, CFSTR("properties"));

}

- (PKPassIngestionProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_fd, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
