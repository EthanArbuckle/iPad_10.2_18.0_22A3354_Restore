@implementation RMConnectionClientCachedMessage

- (id)initWithName:(void *)a3 data:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)RMConnectionClientCachedMessage;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (id)initWithName:(void *)a3 data:(void *)a4 streamingCallback:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)RMConnectionClientCachedMessage;
    v11 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      v12 = MEMORY[0x22E2AD64C](v10);
      v13 = a1[3];
      a1[3] = (id)v12;

    }
  }

  return a1;
}

- (uint64_t)data
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamingCallback, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
