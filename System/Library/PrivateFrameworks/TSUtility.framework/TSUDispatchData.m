@implementation TSUDispatchData

- (TSUDispatchData)init
{
  return -[TSUDispatchData initWithData:](self, "initWithData:", MEMORY[0x24BDAC990]);
}

- (TSUDispatchData)initWithData:(id)a3
{
  NSObject *v5;
  TSUDispatchData *v6;
  TSUDispatchData *v7;
  TSUDispatchData *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)TSUDispatchData;
    v6 = -[TSUDispatchData init](&v10, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_data, a3);
      v7->_size = dispatch_data_get_size(v5);
      objc_storeStrong((id *)&v7->_fragmentedData, a3);
      v7->_fragmentsCount = v7->_size != 0;
      v7->_maxFragmentsCount = 1000;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)append:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  size_t size;
  size_t v7;
  OS_dispatch_data *concat;
  OS_dispatch_data *fragmentedData;
  unint64_t maxFragmentsCount;
  unint64_t v11;
  NSObject *map;
  NSObject *defragmentedData;
  OS_dispatch_data *v14;
  OS_dispatch_data *v15;
  NSObject *data2;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    data2 = v4;
    size = dispatch_data_get_size(v4);
    v5 = data2;
    if (size)
    {
      v7 = size;
      concat = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_fragmentedData, data2);
      fragmentedData = self->_fragmentedData;
      self->_fragmentedData = concat;

      maxFragmentsCount = self->_maxFragmentsCount;
      self->_size += v7;
      v11 = self->_fragmentsCount + 1;
      self->_fragmentsCount = v11;
      if (v11 >= maxFragmentsCount)
      {
        map = dispatch_data_create_map((dispatch_data_t)self->_fragmentedData, 0, 0);
        objc_storeStrong((id *)&self->_fragmentedData, MEMORY[0x24BDAC990]);
        self->_fragmentsCount = 0;
        defragmentedData = self->_defragmentedData;
        if (defragmentedData)
          v14 = (OS_dispatch_data *)dispatch_data_create_concat(defragmentedData, map);
        else
          v14 = map;
        v15 = self->_defragmentedData;
        self->_defragmentedData = v14;

        objc_storeStrong((id *)&self->_data, self->_defragmentedData);
      }
      else
      {
        map = self->_data;
        self->_data = 0;
      }

      v5 = data2;
    }
  }

}

- (OS_dispatch_data)data
{
  NSObject *defragmentedData;
  NSObject *fragmentedData;
  OS_dispatch_data *concat;
  OS_dispatch_data *data;

  if (!self->_data)
  {
    fragmentedData = self->_fragmentedData;
    defragmentedData = self->_defragmentedData;
    if (defragmentedData)
      concat = (OS_dispatch_data *)dispatch_data_create_concat(defragmentedData, fragmentedData);
    else
      concat = fragmentedData;
    data = self->_data;
    self->_data = concat;

  }
  return self->_data;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)maxFragmentsCount
{
  return self->_maxFragmentsCount;
}

- (void)setMaxFragmentsCount:(unint64_t)a3
{
  self->_maxFragmentsCount = a3;
}

- (OS_dispatch_data)fragmentedData
{
  return self->_fragmentedData;
}

- (OS_dispatch_data)defragmentedData
{
  return self->_defragmentedData;
}

- (unint64_t)fragmentsCount
{
  return self->_fragmentsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defragmentedData, 0);
  objc_storeStrong((id *)&self->_fragmentedData, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
