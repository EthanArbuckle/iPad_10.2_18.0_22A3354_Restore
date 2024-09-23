@implementation WFFinderImageResizeDescriptor

- (WFFinderImageResizeDescriptor)initWithFormat:(unint64_t)a3 size:(unint64_t)a4 preserveMetadata:(BOOL)a5
{
  _BOOL4 v5;
  WFFinderImageResizeDescriptor *v8;
  uint64_t v9;
  NSString *identifier;
  WFFinderImageResizeDescriptor *v11;
  objc_super v13;

  v5 = a5;
  v13.receiver = self;
  v13.super_class = (Class)WFFinderImageResizeDescriptor;
  v8 = -[WFFinderImageResizeDescriptor init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu-%d"), a3, a4, v5);
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_format = a3;
    v8->_size = a4;
    v8->_preserveMetadata = v5;
    v11 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  v3 = (void *)objc_opt_new();
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFFinderImageResizeDescriptor format](self, "format"));
  v5 = (id)objc_msgSend(v3, "combineInteger:", -[WFFinderImageResizeDescriptor size](self, "size"));
  v6 = (id)objc_msgSend(v3, "combineBool:", -[WFFinderImageResizeDescriptor preserveMetadata](self, "preserveMetadata"));
  v7 = objc_msgSend(v3, "finalize");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WFFinderImageResizeDescriptor *v4;
  WFFinderImageResizeDescriptor *v5;
  WFFinderImageResizeDescriptor *v6;
  unint64_t v7;
  unint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;

  v4 = (WFFinderImageResizeDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
    goto LABEL_11;
  }
  v6 = v4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v6 = 0;
LABEL_8:
    LOBYTE(v10) = 0;
    goto LABEL_9;
  }
  v7 = -[WFFinderImageResizeDescriptor format](self, "format");
  if (v7 != -[WFFinderImageResizeDescriptor format](v6, "format"))
    goto LABEL_8;
  v8 = -[WFFinderImageResizeDescriptor size](self, "size");
  if (v8 != -[WFFinderImageResizeDescriptor size](v6, "size"))
    goto LABEL_8;
  v9 = -[WFFinderImageResizeDescriptor preserveMetadata](self, "preserveMetadata");
  v10 = v9 ^ -[WFFinderImageResizeDescriptor preserveMetadata](v6, "preserveMetadata") ^ 1;
LABEL_9:

LABEL_11:
  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, Format: %ld, Size: %ld, Preserve Metadata: %d>"), v5, self, -[WFFinderImageResizeDescriptor format](self, "format"), -[WFFinderImageResizeDescriptor size](self, "size"), -[WFFinderImageResizeDescriptor preserveMetadata](self, "preserveMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WFFinderImageResizeDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WFFinderImageResizeDescriptor *v8;
  WFFinderImageResizeDescriptor *v9;
  WFFinderImageResizeDescriptor *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("format"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("size"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preserveMetadata"));

  v8 = -[WFFinderImageResizeDescriptor initWithFormat:size:preserveMetadata:](self, "initWithFormat:size:preserveMetadata:", v5, v6, v7);
  v9 = v8;
  if (v8)
    v10 = v8;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFFinderImageResizeDescriptor format](self, "format"), CFSTR("format"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFFinderImageResizeDescriptor size](self, "size"), CFSTR("size"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFFinderImageResizeDescriptor preserveMetadata](self, "preserveMetadata"), CFSTR("preserveMetadata"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)format
{
  return self->_format;
}

- (unint64_t)size
{
  return self->_size;
}

- (BOOL)preserveMetadata
{
  return self->_preserveMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
