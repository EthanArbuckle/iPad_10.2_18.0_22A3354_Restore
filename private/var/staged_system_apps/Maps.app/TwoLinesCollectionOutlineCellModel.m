@implementation TwoLinesCollectionOutlineCellModel

- (TwoLinesCollectionOutlineCellModel)initWithCollection:(id)a3 accessoryModels:(id)a4 backgroundModel:(id)a5 actionModel:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TwoLinesCollectionOutlineCellModel *v15;
  TwoLinesCollectionOutlineCellModel *v16;
  objc_super v18;
  _QWORD v19[4];
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100BFEDF0;
  v19[3] = &unk_1011E8FC0;
  v14 = v11;
  v20 = v14;
  v18.receiver = self;
  v18.super_class = (Class)TwoLinesCollectionOutlineCellModel;
  v15 = -[TwoLinesBasicOutlineCellModel initWithBackgroundModel:contentModelBlock:](&v18, "initWithBackgroundModel:contentModelBlock:", a5, v19);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_collection, a3);
    objc_storeStrong((id *)&v16->_accessoryModels, a4);
    objc_storeStrong((id *)&v16->_actionModel, a6);
  }

  return v16;
}

- (unint64_t)hash
{
  return (unint64_t)-[CollectionHandler hash](self->_collection, "hash");
}

- (BOOL)isEqual:(id)a3
{
  TwoLinesCollectionOutlineCellModel *v4;
  TwoLinesCollectionOutlineCellModel *v5;
  uint64_t v6;
  TwoLinesCollectionOutlineCellModel *v7;
  CollectionHandler *v8;
  CollectionHandler *v9;
  NSArray *v10;
  NSArray *v11;
  TwoLinesOutlineCellActionModel *v12;
  TwoLinesOutlineCellActionModel *v13;
  unsigned __int8 v14;
  objc_super v16;

  v4 = (TwoLinesCollectionOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v16.receiver = self;
    v16.super_class = (Class)TwoLinesCollectionOutlineCellModel;
    if (-[TwoLinesBasicOutlineCellModel isEqual:](&v16, "isEqual:", v7))
    {
      v8 = (CollectionHandler *)objc_claimAutoreleasedReturnValue(-[TwoLinesCollectionOutlineCellModel collection](v7, "collection"));
      v9 = v8;
      if (v8 == self->_collection || -[CollectionHandler isEqual:](v8, "isEqual:"))
      {
        v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TwoLinesCollectionOutlineCellModel accessoryModels](v7, "accessoryModels"));
        v11 = v10;
        if (v10 == self->_accessoryModels || -[NSArray isEqual:](v10, "isEqual:"))
        {
          v12 = (TwoLinesOutlineCellActionModel *)objc_claimAutoreleasedReturnValue(-[TwoLinesCollectionOutlineCellModel actionModel](v7, "actionModel"));
          v13 = v12;
          if (v12 == self->_actionModel)
            v14 = 1;
          else
            v14 = -[TwoLinesOutlineCellActionModel isEqual:](v12, "isEqual:");

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)accessoryModels
{
  return self->_accessoryModels;
}

- (id)actionModel
{
  return self->_actionModel;
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_actionModel, 0);
  objc_storeStrong((id *)&self->_accessoryModels, 0);
}

@end
