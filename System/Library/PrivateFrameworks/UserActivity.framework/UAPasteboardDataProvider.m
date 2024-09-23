@implementation UAPasteboardDataProvider

- (UAPasteboardDataProvider)initWithData:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  UAPasteboardDataProvider *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UAPasteboardDataProvider;
  v8 = -[UAPasteboardDataProvider init](&v11, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAPasteboardDataProvider setUuid:](v8, "setUuid:", v9);

    -[UAPasteboardDataProvider setType:](v8, "setType:", v7);
    -[UAPasteboardDataProvider setData:](v8, "setData:", v6);
  }

  return v8;
}

- (void)getDataWithCompletionBlock:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id, _QWORD))a3;
  -[UAPasteboardDataProvider data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DB0];
    -[UAPasteboardDataProvider data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputStreamWithData:", v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v13, 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Zero length data to convert");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -124, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[UAPasteboardDataProvider type](self, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1AF7EB000, v11, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Error, providing nil data for type: %@", buf, 0xCu);

    }
    ((void (**)(id, id, void *))v4)[2](v4, 0, v10);

  }
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
