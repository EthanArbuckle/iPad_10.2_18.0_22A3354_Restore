@implementation MFGeneratedSummaryCollectionItemID

- (MFGeneratedSummaryCollectionItemID)initWithAnchorMessageItemID:(id)a3
{
  id v5;
  MFGeneratedSummaryCollectionItemID *v6;
  MFGeneratedSummaryCollectionItemID *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFGeneratedSummaryCollectionItemID;
  v6 = (MFGeneratedSummaryCollectionItemID *)-[MFGeneratedSummaryCollectionItemID initAsEphemeralID:](&v9, "initAsEphemeralID:", 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_anchorMessageItemID, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  MFGeneratedSummaryCollectionItemID *v4;
  uint64_t v5;
  MFGeneratedSummaryCollectionItemID *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = (MFGeneratedSummaryCollectionItemID *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class(MFGeneratedSummaryCollectionItemID);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      if ((-[MFGeneratedSummaryCollectionItemID isEphemeral](self, "isEphemeral") & 1) != 0
        || -[MFGeneratedSummaryCollectionItemID isEphemeral](v6, "isEphemeral"))
      {
        v11.receiver = self;
        v11.super_class = (Class)MFGeneratedSummaryCollectionItemID;
        v7 = -[MFGeneratedSummaryCollectionItemID isEqual:](&v11, "isEqual:", v6);
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFGeneratedSummaryCollectionItemID anchorMessageItemID](self, "anchorMessageItemID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFGeneratedSummaryCollectionItemID anchorMessageItemID](v6, "anchorMessageItemID"));
        v7 = objc_msgSend(v8, "isEqual:", v9);

      }
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  objc_super v6;

  if (-[MFGeneratedSummaryCollectionItemID isEphemeral](self, "isEphemeral"))
  {
    v6.receiver = self;
    v6.super_class = (Class)MFGeneratedSummaryCollectionItemID;
    return -[MFGeneratedSummaryCollectionItemID hash](&v6, "hash");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFGeneratedSummaryCollectionItemID anchorMessageItemID](self, "anchorMessageItemID"));
    v3 = objc_msgSend(v4, "hash");

  }
  return (unint64_t)v3;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)NSString);
  v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFGeneratedSummaryCollectionItemID anchorMessageItemID](self, "anchorMessageItemID"));
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MFGeneratedSummaryCollectionItemID)initWithCoder:(id)a3
{
  MFGeneratedSummaryCollectionItemID *v4;
  id v5;
  uint64_t v6;
  MFGeneratedSummaryCollectionItemID *v7;
  _QWORD v9[4];
  id v10;
  MFGeneratedSummaryCollectionItemID *v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100164860;
  v9[3] = &unk_100521188;
  v10 = a3;
  v11 = self;
  v4 = self;
  v5 = v10;
  v6 = EFDecodeCacheableInstance(v4, v5, v9);
  v7 = (MFGeneratedSummaryCollectionItemID *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  MFGeneratedSummaryCollectionItemID *v10;

  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_1001649A8;
  v8 = &unk_10051A910;
  v9 = a3;
  v10 = self;
  v4 = v9;
  EFEncodeCacheableInstance(self);

}

- (EMCollectionItemID)anchorMessageItemID
{
  return (EMCollectionItemID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorMessageItemID, 0);
}

@end
