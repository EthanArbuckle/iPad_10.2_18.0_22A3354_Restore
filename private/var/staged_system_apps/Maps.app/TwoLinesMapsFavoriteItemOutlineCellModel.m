@implementation TwoLinesMapsFavoriteItemOutlineCellModel

- (TwoLinesMapsFavoriteItemOutlineCellModel)initWithMapsFavoriteItem:(id)a3 accessoryModels:(id)a4 backgroundModel:(id)a5
{
  id v9;
  id v10;
  id v11;
  TwoLinesMapsFavoriteItemOutlineCellModel *v12;
  TwoLinesMapsFavoriteItemOutlineCellModel *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;

  v9 = a3;
  v10 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100BFE7E8;
  v16[3] = &unk_1011E8FC0;
  v11 = v9;
  v17 = v11;
  v15.receiver = self;
  v15.super_class = (Class)TwoLinesMapsFavoriteItemOutlineCellModel;
  v12 = -[TwoLinesBasicOutlineCellModel initWithBackgroundModel:contentModelBlock:](&v15, "initWithBackgroundModel:contentModelBlock:", a5, v16);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_item, a3);
    objc_storeStrong((id *)&v13->_accessoryModels, a4);
  }

  return v13;
}

- (unint64_t)hash
{
  return (unint64_t)-[MapsFavoriteItem hash](self->_item, "hash");
}

- (BOOL)isEqual:(id)a3
{
  TwoLinesMapsFavoriteItemOutlineCellModel *v4;
  TwoLinesMapsFavoriteItemOutlineCellModel *v5;
  uint64_t v6;
  TwoLinesMapsFavoriteItemOutlineCellModel *v7;
  _TtC4Maps16MapsFavoriteItem *v8;
  _TtC4Maps16MapsFavoriteItem *v9;
  NSArray *v10;
  NSArray *v11;
  unsigned __int8 v12;
  objc_super v14;

  v4 = (TwoLinesMapsFavoriteItemOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v14.receiver = self;
    v14.super_class = (Class)TwoLinesMapsFavoriteItemOutlineCellModel;
    if (-[TwoLinesBasicOutlineCellModel isEqual:](&v14, "isEqual:", v7))
    {
      v8 = (_TtC4Maps16MapsFavoriteItem *)objc_claimAutoreleasedReturnValue(-[TwoLinesMapsFavoriteItemOutlineCellModel item](v7, "item"));
      v9 = v8;
      if (v8 == self->_item || -[MapsFavoriteItem isEqual:](v8, "isEqual:"))
      {
        v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TwoLinesMapsFavoriteItemOutlineCellModel accessoryModels](v7, "accessoryModels"));
        v11 = v10;
        if (v10 == self->_accessoryModels)
          v12 = 1;
        else
          v12 = -[NSArray isEqual:](v10, "isEqual:");

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)accessoryModels
{
  return self->_accessoryModels;
}

- (_TtC4Maps16MapsFavoriteItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_accessoryModels, 0);
}

@end
