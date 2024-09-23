@implementation RFMonogramImage

- (RFMonogramImage)initWithProtobuf:(id)a3
{
  id v4;
  RFMonogramImage *v5;
  void *v6;
  void *v7;
  RFMonogramImage *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RFMonogramImage;
  v5 = -[RFMonogramImage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "letters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "letters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMonogramImage setLetters:](v5, "setLetters:", v7);

    }
    if (objc_msgSend(v4, "image_style"))
      -[RFMonogramImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setImage_style:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_image_style = a3;
}

- (BOOL)hasImage_style
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFMonogramImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMonogramImage *v6;
  RFMonogramImage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFMonogramImage initWithData:]([_SFPBRFMonogramImage alloc], "initWithData:", v5);
  v7 = -[RFMonogramImage initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMonogramImage *v6;

  v4 = a3;
  v6 = -[_SFPBRFMonogramImage initWithFacade:]([_SFPBRFMonogramImage alloc], "initWithFacade:", self);
  -[_SFPBRFMonogramImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFMonogramImage *v2;
  void *v3;

  v2 = -[_SFPBRFMonogramImage initWithFacade:]([_SFPBRFMonogramImage alloc], "initWithFacade:", self);
  -[_SFPBRFMonogramImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFMonogramImage *v2;
  void *v3;

  v2 = -[_SFPBRFMonogramImage initWithFacade:]([_SFPBRFMonogramImage alloc], "initWithFacade:", self);
  -[_SFPBRFMonogramImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFMonogramImage letters](self, "letters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLetters:", v6);

  objc_msgSend(v4, "setImage_style:", -[RFMonogramImage image_style](self, "image_style"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFMonogramImage *v6;
  RFMonogramImage *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;

  v6 = (RFMonogramImage *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFMonogramImage isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[RFMonogramImage letters](self, "letters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFMonogramImage letters](v7, "letters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[RFMonogramImage letters](self, "letters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (-[RFMonogramImage letters](self, "letters"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RFMonogramImage letters](v7, "letters"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[RFMonogramImage image_style](self, "image_style");
        v11 = v12 == -[RFMonogramImage image_style](v7, "image_style");
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_12;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[RFMonogramImage letters](self, "letters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[RFMonogramImage image_style](self, "image_style");

  return v5;
}

- (NSString)letters
{
  return self->_letters;
}

- (void)setLetters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)image_style
{
  return self->_image_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_letters, 0);
}

@end
