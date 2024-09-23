@implementation _UIStickerRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIStickerRepresentation)initWithCoder:(id)a3
{
  id v4;
  _UIStickerRepresentation *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSString *type;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  NSString *role;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIStickerRepresentation;
  v5 = -[_UIStickerRepresentation init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("size"));
    v5->_size.width = v10;
    v5->_size.height = v11;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("role"));
    v12 = objc_claimAutoreleasedReturnValue();
    role = v5->_role;
    v5->_role = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UIStickerRepresentation data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

  -[_UIStickerRepresentation type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("type"));

  -[_UIStickerRepresentation size](self, "size");
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("size"));
  -[_UIStickerRepresentation role](self, "role");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("role"));

}

- (id)createPNGDataFromHEICData
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  CGColorSpace *v10;
  void *v11;

  -[_UIStickerRepresentation type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C9DDC8]);
    -[_UIStickerRepresentation data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:", v7);

    v9 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
    v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    objc_msgSend(v9, "PNGRepresentationOfImage:format:colorSpace:options:", v8, *MEMORY[0x1E0C9E070], v10, MEMORY[0x1E0C9AA70]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CGColorSpaceRelease(v10);

  }
  else
  {
    v11 = 0;
  }
  return v11;
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
  objc_storeStrong((id *)&self->_type, a3);
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

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_storeStrong((id *)&self->_role, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
