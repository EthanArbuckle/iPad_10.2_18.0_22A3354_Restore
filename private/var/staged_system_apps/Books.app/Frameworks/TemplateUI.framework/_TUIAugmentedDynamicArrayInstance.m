@implementation _TUIAugmentedDynamicArrayInstance

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  _TUIAugmentedDynamicArrayInstance *v10;
  id v11;
  id v12;
  _NSRange v13;

  v9[1] = 3221225472;
  v9[2] = sub_BFDC4;
  v9[3] = &unk_240EC0;
  v13 = a3;
  v10 = self;
  v11 = a4;
  v12 = a5;
  v8.receiver = v10;
  v8.super_class = (Class)_TUIAugmentedDynamicArrayInstance;
  v9[0] = _NSConcreteStackBlock;
  v6 = v12;
  v7 = v11;
  -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](&v8, "fetchDataForRange:generation:block:", v13.location, v13.length, v7, v9);

}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  _TUIAugmentedDynamicArrayInstance *v12;
  id v13;
  id v14;
  id v15;

  v11[1] = 3221225472;
  v11[2] = sub_BFECC;
  v11[3] = &unk_240EE8;
  v12 = self;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v10.receiver = v12;
  v10.super_class = (Class)_TUIAugmentedDynamicArrayInstance;
  v11[0] = _NSConcreteStackBlock;
  v7 = v15;
  v8 = v14;
  v9 = v13;
  -[_TUIDynamicArrayInstance fetchDataForIndexes:generation:block:](&v10, "fetchDataForIndexes:generation:block:", v9, v8, v11);

}

- (TUIDynamicArrayDataAugmenting)dataAugmenter
{
  return self->_dataAugmenter;
}

- (void)setDataAugmenter:(id)a3
{
  objc_storeStrong((id *)&self->_dataAugmenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataAugmenter, 0);
}

@end
