@implementation SFAirDropPayload

- (id)description
{
  NSURL *URL;

  URL = self->_URL;
  if (URL)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<SFAirDropPayload: %p, URL:%@, description:%@, previewImage:%@, identifier:%d>"), self, URL, self->_payloadDescription, self->_previewImage, self->_identifer);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<SFAirDropPayload: %p, data-type:%@, description:%@, previewImage:%@, identifier:%d>"), self, self->_type, self->_payloadDescription, self->_previewImage, self->_identifer);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSURL hash](self->_URL, "hash");
  v4 = -[NSData hash](self->_data, "hash") + v3;
  v5 = -[NSString hash](self->_type, "hash");
  v6 = v4 + v5 + -[UIImage hash](self->_previewImage, "hash");
  return v6 + -[NSString hash](self->_payloadDescription, "hash") + self->_identifer;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", self->_URL))
    {
      objc_msgSend(v4, "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", self->_data))
      {
        objc_msgSend(v4, "type");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", self->_type))
        {
          objc_msgSend(v4, "previewImage");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEqual:", self->_previewImage))
          {
            objc_msgSend(v4, "payloadDescription");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v9, "isEqual:", self->_payloadDescription))
              v10 = objc_msgSend(v4, "identifer") == self->_identifer;
            else
              v10 = 0;

          }
          else
          {
            v10 = 0;
          }

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)newPayloadWithData:(id)a3 ofType:(id)a4 description:(id)a5 previewImage:(id)a6 identifier:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  SFAirDropPayload *v15;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(SFAirDropPayload);
  -[SFAirDropPayload setData:](v15, "setData:", v14);

  -[SFAirDropPayload setType:](v15, "setType:", v13);
  -[SFAirDropPayload setPreviewImage:](v15, "setPreviewImage:", v11);

  -[SFAirDropPayload setPayloadDescription:](v15, "setPayloadDescription:", v12);
  -[SFAirDropPayload setIdentifer:](v15, "setIdentifer:", a7);
  return v15;
}

+ (id)newPayloadWithURL:(id)a3 description:(id)a4 previewImage:(id)a5 identifier:(int64_t)a6
{
  id v9;
  id v10;

  v9 = a3;
  v10 = +[SFAirDropPayload newPayloadWithData:ofType:description:previewImage:identifier:](SFAirDropPayload, "newPayloadWithData:ofType:description:previewImage:identifier:", 0, 0, a4, a5, a6);
  objc_msgSend(v10, "setURL:", v9);

  return v10;
}

- (BOOL)wasString
{
  return self->_wasString;
}

- (void)setWasString:(BOOL)a3
{
  self->_wasString = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (void)setPreviewImage:(id)a3
{
  objc_storeStrong((id *)&self->_previewImage, a3);
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)identifer
{
  return self->_identifer;
}

- (void)setIdentifer:(int64_t)a3
{
  self->_identifer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
