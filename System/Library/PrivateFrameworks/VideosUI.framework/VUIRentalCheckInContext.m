@implementation VUIRentalCheckInContext

- (VUIRentalCheckInContext)initWithRentalID:(id)a3 dsid:(id)a4
{
  id v7;
  id v8;
  VUIRentalCheckInContext *v9;
  VUIRentalCheckInContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIRentalCheckInContext;
  v9 = -[VUIRentalCheckInContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rentalID, a3);
    objc_storeStrong((id *)&v10->_dsid, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  VUIRentalCheckInContext *v4;
  VUIRentalCheckInContext *v5;
  VUIRentalCheckInContext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (VUIRentalCheckInContext *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if (self == v4)
  {
    v11 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[VUIRentalCheckInContext rentalID](self, "rentalID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIRentalCheckInContext rentalID](v6, "rentalID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToNumber:", v8))
    {
      -[VUIRentalCheckInContext dsid](self, "dsid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIRentalCheckInContext dsid](v6, "dsid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToNumber:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
LABEL_6:
    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[VUIRentalCheckInContext rentalID](self, "rentalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[VUIRentalCheckInContext dsid](self, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSNumber)rentalID
{
  return self->_rentalID;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_rentalID, 0);
}

@end
