@implementation REFileImage

- (REFileImage)initWithPath:(id)a3 scale:(double)a4
{
  id v6;
  REFileImage *v7;
  uint64_t v8;
  NSString *path;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REFileImage;
  v7 = -[REFileImage init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    path = v7->_path;
    v7->_path = (NSString *)v8;

    v7->_scale = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPath:scale:", self->_path, self->_scale);
}

- (unint64_t)hash
{
  unint64_t scale;

  scale = (unint64_t)self->_scale;
  return -[NSString hash](self->_path, "hash") ^ scale;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  int v9;
  BOOL v10;
  double v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "path");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_path;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = -[NSString isEqual:](v6, "isEqual:", v7);

      if (!v9)
      {
        v10 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    objc_msgSend(v5, "scale");
    *(float *)&v11 = v11 - self->_scale;
    v10 = fabsf(*(float *)&v11) < 0.00000011921;
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (REFileImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REFileImage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v7 = -[REFileImage initWithPath:scale:](self, "initWithPath:scale:", v5);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *path;
  id v5;
  id v6;

  path = self->_path;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", path, CFSTR("path"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_scale);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("scale"));

}

- (NSString)path
{
  return self->_path;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
