@implementation TwoLinesRecentContactOutlineCellModel

- (TwoLinesRecentContactOutlineCellModel)initWithRecentContact:(id)a3 backgroundModel:(id)a4
{
  id v7;
  TwoLinesRecentContactOutlineCellModel *v8;
  TwoLinesRecentContactOutlineCellModel *v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100BFE098;
  v12[3] = &unk_1011E8FC0;
  v7 = a3;
  v13 = v7;
  v11.receiver = self;
  v11.super_class = (Class)TwoLinesRecentContactOutlineCellModel;
  v8 = -[TwoLinesBasicOutlineCellModel initWithBackgroundModel:contentModelBlock:](&v11, "initWithBackgroundModel:contentModelBlock:", a4, v12);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_recentContact, a3);

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)-[CRRecentContact hash](self->_recentContact, "hash");
}

- (BOOL)isEqual:(id)a3
{
  TwoLinesRecentContactOutlineCellModel *v4;
  TwoLinesRecentContactOutlineCellModel *v5;
  uint64_t v6;
  TwoLinesRecentContactOutlineCellModel *v7;
  CRRecentContact *v8;
  CRRecentContact *v9;
  unsigned __int8 v10;
  objc_super v12;

  v4 = (TwoLinesRecentContactOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v12.receiver = self;
    v12.super_class = (Class)TwoLinesRecentContactOutlineCellModel;
    if (-[TwoLinesBasicOutlineCellModel isEqual:](&v12, "isEqual:", v7))
    {
      v8 = (CRRecentContact *)objc_claimAutoreleasedReturnValue(-[TwoLinesRecentContactOutlineCellModel recentContact](v7, "recentContact"));
      v9 = v8;
      if (v8 == self->_recentContact)
        v10 = 1;
      else
        v10 = -[CRRecentContact isEqual:](v8, "isEqual:");

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CRRecentContact)recentContact
{
  return self->_recentContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentContact, 0);
}

@end
