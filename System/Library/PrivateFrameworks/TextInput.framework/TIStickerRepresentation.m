@implementation TIStickerRepresentation

- (TIStickerRepresentation)initWithData:(id)a3 uti:(id)a4 role:(id)a5 size:(CGSize)a6 effect:(int64_t)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  id v16;
  TIStickerRepresentation *v17;
  TIStickerRepresentation *v18;
  objc_super v20;

  height = a6.height;
  width = a6.width;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TIStickerRepresentation;
  v17 = -[TIStickerRepresentation init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_data, a3);
    objc_storeStrong((id *)&v18->_uti, a4);
    objc_storeStrong((id *)&v18->_role, a5);
    v18->_size.width = width;
    v18->_size.height = height;
    v18->_effect = a7;
  }

  return v18;
}

- (TIStickerRepresentation)initWithCoder:(id)a3
{
  id v4;
  TIStickerRepresentation *v5;
  void *v6;
  uint64_t v7;
  NSData *data;
  void *v9;
  uint64_t v10;
  UTType *uti;
  void *v12;
  uint64_t v13;
  NSString *role;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TIStickerRepresentation;
  v5 = -[TIStickerRepresentation init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    data = v5->_data;
    v5->_data = (NSData *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uti"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    uti = v5->_uti;
    v5->_uti = (UTType *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("role"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    role = v5->_role;
    v5->_role = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getValue:size:", &v5->_size, 16);

    v5->_effect = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("effect"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  void *v5;
  id v6;

  data = self->_data;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", data, CFSTR("data"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_uti, CFSTR("uti"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_role, CFSTR("role"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_size, "{CGSize=dd}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("size"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_effect, CFSTR("effect"));
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (UTType)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
  objc_storeStrong((id *)&self->_uti, a3);
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_storeStrong((id *)&self->_role, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (int64_t)effect
{
  return self->_effect;
}

- (void)setEffect:(int64_t)a3
{
  self->_effect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
