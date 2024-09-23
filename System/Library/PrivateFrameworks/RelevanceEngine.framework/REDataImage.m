@implementation REDataImage

- (REDataImage)initWithData:(id)a3 scale:(double)a4
{
  id v6;
  REDataImage *v7;
  uint64_t v8;
  NSData *data;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REDataImage;
  v7 = -[REDataImage init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    data = v7->_data;
    v7->_data = (NSData *)v8;

    v7->_scale = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithData:scale:", self->_data, self->_scale);
}

- (unint64_t)hash
{
  unint64_t scale;

  scale = (unint64_t)self->_scale;
  return -[NSData hash](self->_data, "hash") ^ scale;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  NSData *v7;
  NSData *data;
  BOOL v9;
  double v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "data");
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    data = self->_data;
    if (v7 == data
      || (objc_msgSend(v6, "data"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqualToData:", self->_data)))
    {
      objc_msgSend(v6, "scale");
      *(float *)&v10 = v10 - self->_scale;
      v9 = fabsf(*(float *)&v10) < 0.00000011921;
      if (v7 == data)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (REDataImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REDataImage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v7 = -[REDataImage initWithData:scale:](self, "initWithData:scale:", v5);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v5;
  id v6;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("data"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_scale);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("scale"));

}

- (NSData)data
{
  return self->_data;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
