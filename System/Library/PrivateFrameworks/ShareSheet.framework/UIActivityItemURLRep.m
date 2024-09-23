@implementation UIActivityItemURLRep

- (BOOL)isFileURL
{
  void *v2;
  char v3;

  -[UIActivityItemURLRep URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFileURL");

  return v3;
}

- (id)scheme
{
  void *v2;
  void *v3;

  -[UIActivityItemURLRep URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (int64_t)attachmentURLType
{
  return self->_attachmentURLType;
}

- (void)setAttachmentURLType:(int64_t)a3
{
  self->_attachmentURLType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
