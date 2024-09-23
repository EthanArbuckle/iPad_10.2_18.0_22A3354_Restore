@implementation _TUIMappedDynamicArrayInstance

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  _TUIMappedDynamicArrayInstance *v11;
  id v12;

  length = a3.length;
  location = a3.location;
  v10[1] = 3221225472;
  v10[2] = sub_6F7B8;
  v10[3] = &unk_23E5F8;
  v11 = self;
  v12 = a5;
  v9.receiver = v11;
  v9.super_class = (Class)_TUIMappedDynamicArrayInstance;
  v10[0] = _NSConcreteStackBlock;
  v8 = v12;
  -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](&v9, "fetchDataForRange:generation:block:", location, length, a4, v10);

}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  id v7;
  objc_super v8;
  _QWORD v9[4];
  _TUIMappedDynamicArrayInstance *v10;
  id v11;

  v9[1] = 3221225472;
  v9[2] = sub_6F8B4;
  v9[3] = &unk_23E5F8;
  v10 = self;
  v11 = a5;
  v8.receiver = v10;
  v8.super_class = (Class)_TUIMappedDynamicArrayInstance;
  v9[0] = _NSConcreteStackBlock;
  v7 = v11;
  -[_TUIDynamicArrayInstance fetchDataForIndexes:generation:block:](&v8, "fetchDataForIndexes:generation:block:", a3, a4, v9);

}

- (TUIDynamicArrayDataMapping)dataMapper
{
  return self->_dataMapper;
}

- (void)setDataMapper:(id)a3
{
  objc_storeStrong((id *)&self->_dataMapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataMapper, 0);
}

@end
