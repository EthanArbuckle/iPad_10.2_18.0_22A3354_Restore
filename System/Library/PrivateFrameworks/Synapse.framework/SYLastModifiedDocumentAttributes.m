@implementation SYLastModifiedDocumentAttributes

- (SYLastModifiedDocumentAttributes)initWithFileURL:(id)a3 modifiedDate:(id)a4
{
  id v7;
  id v8;
  SYLastModifiedDocumentAttributes *v9;
  SYLastModifiedDocumentAttributes *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SYLastModifiedDocumentAttributes;
  v9 = -[SYLastModifiedDocumentAttributes init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileURL, a3);
    objc_storeStrong((id *)&v10->_modifiedDate, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SYLastModifiedDocumentAttributes fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fileURL"));

  -[SYLastModifiedDocumentAttributes modifiedDate](self, "modifiedDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("modifiedDate"));

}

- (SYLastModifiedDocumentAttributes)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  SYLastModifiedDocumentAttributes *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifiedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[SYLastModifiedDocumentAttributes initWithFileURL:modifiedDate:](self, "initWithFileURL:modifiedDate:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
