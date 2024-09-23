@implementation CRLSEImportableItem

- (BOOL)isPDF
{
  if (self->_url)
    return -[UTType conformsToType:](self->_mediaUTI, "conformsToType:", UTTypePDF);
  else
    return 0;
}

- (BOOL)isHTTP
{
  NSURL *url;
  void *v4;
  void *v5;
  BOOL v6;

  url = self->_url;
  if (!url)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](url, "scheme"));
  if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("http")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self->_url, "scheme"));
    v6 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("https")) == 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)setUrl:(id)a3
{
  NSURL *v5;
  void *v6;
  void *v7;
  void *v8;
  UTType *v9;
  UTType *mediaUTI;
  NSURLResourceKey v11;

  v5 = (NSURL *)a3;
  if (self->_url != v5)
  {
    objc_storeStrong((id *)&self->_url, a3);
    v11 = NSURLContentTypeKey;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL resourceValuesForKeys:error:](self->_url, "resourceValuesForKeys:error:", v6, 0));
    v8 = v7;
    if (v7)
    {
      v9 = (UTType *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSURLContentTypeKey));
      mediaUTI = self->_mediaUTI;
      self->_mediaUTI = v9;

    }
  }

}

- (UTType)mediaUTI
{
  return self->_mediaUTI;
}

- (void)setMediaUTI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)url
{
  return self->_url;
}

- (UIImage)image
{
  return (UIImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_mediaUTI, 0);
}

@end
