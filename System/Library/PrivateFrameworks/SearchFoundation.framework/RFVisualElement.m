@implementation RFVisualElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setImage_element:(id)a3
{
  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_image_element, a3);
}

- (BOOL)hasImage_element
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFVisualElement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFVisualElement *v6;
  RFVisualElement *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFVisualElement initWithData:]([_SFPBRFVisualElement alloc], "initWithData:", v5);
  v7 = -[RFVisualElement initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFVisualElement *v6;

  v4 = a3;
  v6 = -[_SFPBRFVisualElement initWithFacade:]([_SFPBRFVisualElement alloc], "initWithFacade:", self);
  -[_SFPBRFVisualElement data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFVisualElement *v2;
  void *v3;

  v2 = -[_SFPBRFVisualElement initWithFacade:]([_SFPBRFVisualElement alloc], "initWithFacade:", self);
  -[_SFPBRFVisualElement dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFVisualElement *v2;
  void *v3;

  v2 = -[_SFPBRFVisualElement initWithFacade:]([_SFPBRFVisualElement alloc], "initWithFacade:", self);
  -[_SFPBRFVisualElement jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[RFVisualElement hasImage_element](self, "hasImage_element"))
  {
    -[RFVisualElement image_element](self, "image_element");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setImage_element:", v6);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFVisualElement *v4;
  RFVisualElement *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (RFVisualElement *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[RFVisualElement isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[RFVisualElement image_element](self, "image_element");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFVisualElement image_element](v5, "image_element");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[RFVisualElement image_element](self, "image_element");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[RFVisualElement image_element](self, "image_element");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFVisualElement image_element](v5, "image_element");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[RFVisualElement image_element](self, "image_element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (RFImageElement)image_element
{
  return self->_image_element;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image_element, 0);
}

- (RFVisualElement)initWithProtobuf:(id)a3
{
  id v4;
  RFVisualElement *v5;
  void *v6;
  RFImageElement *v7;
  void *v8;
  RFImageElement *v9;
  RFVisualElement *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RFVisualElement;
  v5 = -[RFVisualElement init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "image_element");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFImageElement alloc];
      objc_msgSend(v4, "image_element");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFImageElement initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFVisualElement setImage_element:](v5, "setImage_element:", v9);

    }
    v10 = v5;
  }

  return v5;
}

@end
