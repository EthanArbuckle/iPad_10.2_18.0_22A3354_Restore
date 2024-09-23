@implementation ICBook

- (ICBook)initWithCoder:(id)a3
{
  id v4;
  ICBook *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICBook;
  v5 = -[ICBook init](&v15, sel_init);
  if (v5)
  {
    -[ICBook setPurchaseHistoryID:](v5, "setPurchaseHistoryID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICPurchasedBookPurchaseHistoryID")));
    -[ICBook setStoreID:](v5, "setStoreID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICPurchasedBookStoreID")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPurchasedBookTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBook setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPurchasedBookAuthor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBook setAuthor:](v5, "setAuthor:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPurchasedBookGenre"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBook setGenre:](v5, "setGenre:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPurchasedBookDatePurchased"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBook setDatePurchased:](v5, "setDatePurchased:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPurchasedBookArtworkURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBook setArtworkURL:](v5, "setArtworkURL:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPurchasedBookRedownloadParameters"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBook setRedownloadParameters:](v5, "setRedownloadParameters:", v11);

    -[ICBook setVppLicensed:](v5, "setVppLicensed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ICPurchasedBookVPPLicensed")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPurchasedBookVPPOrganizationID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBook setVppOrganizationID:](v5, "setVppOrganizationID:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPurchasedBookVPPOrganizationDisplayName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBook setVppOrganizationDisplayName:](v5, "setVppOrganizationDisplayName:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[ICBook purchaseHistoryID](self, "purchaseHistoryID"), CFSTR("ICPurchasedBookPurchaseHistoryID"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[ICBook storeID](self, "storeID"), CFSTR("ICPurchasedBookStoreID"));
  -[ICBook title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ICPurchasedBookTitle"));

  -[ICBook author](self, "author");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ICPurchasedBookAuthor"));

  -[ICBook genre](self, "genre");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ICPurchasedBookGenre"));

  -[ICBook datePurchased](self, "datePurchased");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ICPurchasedBookDatePurchased"));

  -[ICBook artworkURL](self, "artworkURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ICPurchasedBookArtworkURL"));

  -[ICBook redownloadParameters](self, "redownloadParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("ICPurchasedBookRedownloadParameters"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ICBook isVPPLicensed](self, "isVPPLicensed"), CFSTR("ICPurchasedBookVPPLicensed"));
  -[ICBook vppOrganizationID](self, "vppOrganizationID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("ICPurchasedBookVPPOrganizationID"));

  -[ICBook vppOrganizationDisplayName](self, "vppOrganizationDisplayName");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("ICPurchasedBookVPPOrganizationDisplayName"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ICBook title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p title='%@'>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)purchaseHistoryID
{
  return self->_purchaseHistoryID;
}

- (void)setPurchaseHistoryID:(unint64_t)a3
{
  self->_purchaseHistoryID = a3;
}

- (unint64_t)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(unint64_t)a3
{
  self->_storeID = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)datePurchased
{
  return self->_datePurchased;
}

- (void)setDatePurchased:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)redownloadParameters
{
  return self->_redownloadParameters;
}

- (void)setRedownloadParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isVPPLicensed
{
  return self->_vppLicensed;
}

- (void)setVppLicensed:(BOOL)a3
{
  self->_vppLicensed = a3;
}

- (NSString)vppOrganizationID
{
  return self->_vppOrganizationID;
}

- (void)setVppOrganizationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)vppOrganizationDisplayName
{
  return self->_vppOrganizationDisplayName;
}

- (void)setVppOrganizationDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vppOrganizationDisplayName, 0);
  objc_storeStrong((id *)&self->_vppOrganizationID, 0);
  objc_storeStrong((id *)&self->_redownloadParameters, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_datePurchased, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
