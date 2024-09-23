@implementation OCXContentType

- (OCXContentType)initWithContentType:(id)a3 extension:(id)a4
{
  id v7;
  id v8;
  OCXContentType *v9;
  OCXContentType *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OCXContentType;
  v9 = -[OCXContentType init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mContentType, a3);
    objc_storeStrong((id *)&v10->mExtension, a4);
  }

  return v10;
}

- (OCXContentType)initWithContentType:(id)a3 path:(id)a4
{
  id v7;
  id v8;
  OCXContentType *v9;
  OCXContentType *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OCXContentType;
  v9 = -[OCXContentType init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mContentType, a3);
    objc_storeStrong((id *)&v10->mPath, a4);
  }

  return v10;
}

- (BOOL)isOverride
{
  return -[NSString length](self->mPath, "length") != 0;
}

- (void)writeToStreamWriter:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[OCXContentType isOverride](self, "isOverride"))
  {
    objc_msgSend(v5, "startPlainElement:", CFSTR("Override"));
    objc_msgSend(CFSTR("/"), "stringByAppendingString:", self->mPath);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writePlainAttribute:content:", CFSTR("PartName"), v4);

  }
  else
  {
    objc_msgSend(v5, "startPlainElement:", CFSTR("Default"));
    objc_msgSend(v5, "writePlainAttribute:content:", CFSTR("Extension"), self->mExtension);
  }
  objc_msgSend(v5, "writePlainAttribute:content:", CFSTR("ContentType"), self->mContentType);
  objc_msgSend(v5, "endElement");

}

- (NSString)contentType
{
  return self->mContentType;
}

- (NSString)path
{
  return self->mPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mExtension, 0);
  objc_storeStrong((id *)&self->mPath, 0);
  objc_storeStrong((id *)&self->mContentType, 0);
}

@end
