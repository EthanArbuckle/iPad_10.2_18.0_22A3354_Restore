@implementation PKExpiredPassesGeocodeRequestItem

- (PKExpiredPassesGeocodeRequestItem)initWithCell:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  PKExpiredPassesGeocodeRequestItem *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKExpiredPassesGeocodeRequestItem;
  v8 = -[PKExpiredPassesGeocodeRequestItem init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "pass");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7 && v9)
    {
      -[PKExpiredPassesGeocodeRequestItem setLocation:](v8, "setLocation:", v7);
      -[PKExpiredPassesGeocodeRequestItem setCell:](v8, "setCell:", v6);
      -[PKExpiredPassesGeocodeRequestItem setPass:](v8, "setPass:", v10);
      objc_msgSend(v10, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKExpiredPassesGeocodeRequestItem setUniqueID:](v8, "setUniqueID:", v11);

    }
  }

  return v8;
}

- (PKExpiredPassesTableViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
