@implementation SharingXPCHelperImageItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3
{
  return -[SharingXPCHelperImageItem initWithImageTitle:imageData:cacheLookupKey:](self, "initWithImageTitle:imageData:cacheLookupKey:", a3, 0, 0);
}

- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3 imageData:(id)a4 cacheLookupKey:(id)a5
{
  id v9;
  id v10;
  id v11;
  SharingXPCHelperImageItem *v12;
  SharingXPCHelperImageItem *v13;
  NSArray *contactIDs;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SharingXPCHelperImageItem;
  v12 = -[SharingXPCHelperImageItem init](&v16, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageTitle, a3);
    objc_storeStrong((id *)&v13->_imageData, a4);
    objc_storeStrong((id *)&v13->_cacheLookupKey, a5);
    contactIDs = v13->_contactIDs;
    v13->_contactIDs = (NSArray *)&__NSArray0__struct;

  }
  return v13;
}

- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3 image:(CGImage *)a4 cacheLookupKey:(id)a5
{
  SharingXPCHelperImageItem *v6;

  v6 = -[SharingXPCHelperImageItem initWithImageTitle:imageData:cacheLookupKey:](self, "initWithImageTitle:imageData:cacheLookupKey:", a3, 0, a5);
  if (v6)
    v6->_image = (CGImage *)CFRetain(a4);
  return v6;
}

- (SharingXPCHelperImageItem)initWithCoder:(id)a3
{
  id v4;
  SharingXPCHelperImageItem *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SharingXPCHelperImageItem;
  v5 = -[SharingXPCHelperImageItem init](&v19, "init");
  if (v5)
  {
    v6 = v4;
    v8 = objc_opt_class(NSString, v7);
    NSDecodeObjectIfPresent(v6, CFSTR("SharingXPCHelperImageItem-ImageTitle"), v8, &v5->_imageTitle);

    v9 = v6;
    v11 = objc_opt_class(NSData, v10);
    NSDecodeObjectIfPresent(v9, CFSTR("SharingXPCHelperImageItem-ImageData"), v11, &v5->_imageData);

    v12 = v9;
    v14 = objc_opt_class(NSString, v13);
    NSDecodeObjectIfPresent(v12, CFSTR("SharingXPCHelperImageItem-CacheLookupKey"), v14, &v5->_cacheLookupKey);

    v15 = v12;
    v17 = objc_opt_class(NSArray, v16);
    NSDecodeStandardContainerIfPresent(v15, CFSTR("SharingXPCHelperImageItem-ContactIDsKey"), v17, &v5->_contactIDs);

  }
  return v5;
}

- (void)dealloc
{
  CGImage *image;
  objc_super v4;

  image = self->_image;
  if (image)
    CFRelease(image);
  v4.receiver = self;
  v4.super_class = (Class)SharingXPCHelperImageItem;
  -[SharingXPCHelperImageItem dealloc](&v4, "dealloc");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *imageTitle;
  NSData *imageData;
  CGImage *image;
  uint64_t v8;
  void *v9;
  NSString *cacheLookupKey;
  NSArray *contactIDs;
  void *v12;
  id v13;

  v4 = a3;
  imageTitle = self->_imageTitle;
  v13 = v4;
  if (imageTitle)
  {
    objc_msgSend(v4, "encodeObject:forKey:", imageTitle, CFSTR("SharingXPCHelperImageItem-ImageTitle"));
    v4 = v13;
  }
  imageData = self->_imageData;
  if (imageData)
  {
    objc_msgSend(v4, "encodeObject:forKey:", imageData, CFSTR("SharingXPCHelperImageItem-ImageData"));
  }
  else
  {
    image = self->_image;
    if (image)
    {
      v8 = SFDataFromCGImage(image);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("SharingXPCHelperImageItem-ImageData"));

    }
  }
  cacheLookupKey = self->_cacheLookupKey;
  if (cacheLookupKey)
    objc_msgSend(v13, "encodeObject:forKey:", cacheLookupKey, CFSTR("SharingXPCHelperImageItem-CacheLookupKey"));
  contactIDs = self->_contactIDs;
  v12 = v13;
  if (contactIDs)
  {
    objc_msgSend(v13, "encodeObject:forKey:", contactIDs, CFSTR("SharingXPCHelperImageItem-ContactIDsKey"));
    v12 = v13;
  }

}

- (id)description
{
  const __CFString *v2;
  id v4;

  v4 = 0;
  if (self->_imageData)
    v2 = CFSTR("has");
  else
    v2 = CFSTR("does not have");
  NSAppendPrintF(&v4, "SharingXPCHelperImageItem for %{private}@ %@ imageData", self->_imageTitle, v2);
  return v4;
}

- (NSString)imageTitle
{
  return self->_imageTitle;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (CGImage)image
{
  return self->_image;
}

- (NSString)cacheLookupKey
{
  return self->_cacheLookupKey;
}

- (void)setCacheLookupKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheLookupKey, a3);
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
{
  objc_storeStrong((id *)&self->_contactIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_cacheLookupKey, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageTitle, 0);
}

@end
