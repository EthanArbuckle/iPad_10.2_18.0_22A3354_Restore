@implementation UISUIOpenInByCopySecurityScopedResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUIOpenInByCopySecurityScopedResource)initWithCoder:(id)a3
{
  id v4;
  UISUIOpenInByCopySecurityScopedResource *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UISUIOpenInByCopySecurityScopedResource;
  v5 = -[UISUISecurityScopedResource initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmarkExportDataEncodedAsString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIOpenInByCopySecurityScopedResource setBookmarkExportDataEncodedAsString:](v5, "setBookmarkExportDataEncodedAsString:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISUIOpenInByCopySecurityScopedResource;
  v4 = a3;
  -[UISUISecurityScopedResource encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[UISUIOpenInByCopySecurityScopedResource bookmarkExportDataEncodedAsString](self, "bookmarkExportDataEncodedAsString", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bookmarkExportDataEncodedAsString"));

}

- (NSString)bookmarkExportDataEncodedAsString
{
  return self->_bookmarkExportDataEncodedAsString;
}

- (void)setBookmarkExportDataEncodedAsString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkExportDataEncodedAsString, 0);
}

@end
