@implementation SidecarMutableItem

- (SidecarMutableItem)initWithType:(id)a3 capacity:(unint64_t)a4
{
  SidecarMutableItem *v5;
  SidecarMutableItem *v6;
  uint64_t v7;
  NSMutableData *mutableData;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SidecarMutableItem;
  v5 = -[SidecarItem initWithData:type:](&v10, sel_initWithData_type_, 0, a3);
  v6 = v5;
  if (v5)
  {
    v5->_capacity = a4;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", a4);
    mutableData = v6->_mutableData;
    v6->_mutableData = (NSMutableData *)v7;

  }
  return v6;
}

- (id)data
{
  NSMutableData *mutableData;

  if (-[NSMutableData length](self->_mutableData, "length") == self->_capacity)
    mutableData = self->_mutableData;
  else
    mutableData = 0;
  return mutableData;
}

- (BOOL)appendData:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t capacity;
  unint64_t v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  NSUInteger v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  capacity = self->_capacity;
  v7 = capacity - -[NSMutableData length](self->_mutableData, "length");
  if (v5 > v7)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v13 = objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[SidecarItem type](self, "type");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v7;
      v17 = objc_msgSend(v4, "length");
      v18 = -[NSMutableData length](self->_mutableData, "length");
      v19 = self->_capacity;
      v20 = 138544130;
      v21 = v15;
      v22 = 2048;
      v23 = v17;
      v7 = v16;
      v24 = 2048;
      v25 = v18;
      v26 = 2048;
      v27 = v19;
      _os_log_impl(&dword_220044000, v10, OS_LOG_TYPE_ERROR, "item exceeded capacity: %{public}@ (%lu + %lu > %lu)", (uint8_t *)&v20, 0x2Au);

    }
  }
  else
  {
    -[NSMutableData appendData:](self->_mutableData, "appendData:", v4);
    v8 = -[NSMutableData length](self->_mutableData, "length") == self->_capacity;
    *((_BYTE *)self + 40) = *((_BYTE *)self + 40) & 0xFE | v8;
    if (!v8)
      goto LABEL_9;
    SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[SidecarItem type](self, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_capacity;
      v20 = 138543618;
      v21 = v11;
      v22 = 2048;
      v23 = v12;
      _os_log_impl(&dword_220044000, v10, OS_LOG_TYPE_INFO, "item complete: %{public}@ (%lu bytes)", (uint8_t *)&v20, 0x16u);

    }
  }

LABEL_9:
  return v5 <= v7;
}

- (BOOL)isComplete
{
  return *((_BYTE *)self + 40) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableData, 0);
}

@end
