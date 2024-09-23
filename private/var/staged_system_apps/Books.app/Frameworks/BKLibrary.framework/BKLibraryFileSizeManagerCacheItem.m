@implementation BKLibraryFileSizeManagerCacheItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BKLibraryFileSizeManagerCacheItem)initWithCoder:(id)a3
{
  id v4;
  BKLibraryFileSizeManagerCacheItem *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryFileSizeManagerCacheItem;
  v5 = -[BKLibraryFileSizeManagerCacheItem init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL), CFSTR("fileURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[BKLibraryFileSizeManagerCacheItem setFileURL:](v5, "setFileURL:", v7);

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("fileOnDiskLastTouchDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[BKLibraryFileSizeManagerCacheItem setFileOnDiskLastTouchDate:](v5, "setFileOnDiskLastTouchDate:", v9);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("fileSize"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[BKLibraryFileSizeManagerCacheItem setFileSizeNumber:](v5, "setFileSizeNumber:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManagerCacheItem fileURL](self, "fileURL"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fileURL"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManagerCacheItem fileOnDiskLastTouchDate](self, "fileOnDiskLastTouchDate"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fileOnDiskLastTouchDate"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManagerCacheItem fileSizeNumber](self, "fileSizeNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("fileSize"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  BKLibraryFileSizeManagerCacheItem *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_opt_new(BKLibraryFileSizeManagerCacheItem);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManagerCacheItem fileURL](self, "fileURL"));
    -[BKLibraryFileSizeManagerCacheItem setFileURL:](v4, "setFileURL:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManagerCacheItem fileOnDiskLastTouchDate](self, "fileOnDiskLastTouchDate"));
    -[BKLibraryFileSizeManagerCacheItem setFileOnDiskLastTouchDate:](v4, "setFileOnDiskLastTouchDate:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryFileSizeManagerCacheItem fileSizeNumber](self, "fileSizeNumber"));
    -[BKLibraryFileSizeManagerCacheItem setFileSizeNumber:](v4, "setFileSizeNumber:", v7);

  }
  return v4;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)fileOnDiskLastTouchDate
{
  return self->_fileOnDiskLastTouchDate;
}

- (void)setFileOnDiskLastTouchDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)fileSizeNumber
{
  return self->_fileSizeNumber;
}

- (void)setFileSizeNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSizeNumber, 0);
  objc_storeStrong((id *)&self->_fileOnDiskLastTouchDate, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
