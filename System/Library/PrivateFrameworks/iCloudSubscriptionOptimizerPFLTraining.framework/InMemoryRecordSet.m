@implementation InMemoryRecordSet

- (InMemoryRecordSet)initWithRecordInfos:(id)a3 recordDatas:(id)a4
{
  id v7;
  id v8;
  InMemoryRecordSet *v9;
  InMemoryRecordSet *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)InMemoryRecordSet;
  v9 = -[InMemoryRecordSet init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_infos, a3);
    objc_storeStrong((id *)&v10->_datas, a4);
    v10->_count = objc_msgSend(v7, "count");
  }

  return v10;
}

- (NSArray)infos
{
  return self->_infos;
}

- (NSArray)datas
{
  return self->_datas;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datas, 0);
  objc_storeStrong((id *)&self->_infos, 0);
}

@end
