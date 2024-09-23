@implementation VUIPlistMediaEntityIdentifier

- (VUIPlistMediaEntityIdentifier)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIPlistMediaEntityIdentifier)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v6;
  VUIPlistMediaEntityIdentifier *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  VUIMediaEntityType *mediaEntityType;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIPlistMediaEntityIdentifier;
  v7 = -[VUIPlistMediaEntityIdentifier init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    switch(a4)
    {
      case 0uLL:
        +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 1uLL:
        +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 2uLL:
        +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 3uLL:
        +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 4uLL:
        +[VUIMediaEntityType show](VUIMediaEntityType, "show");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 5uLL:
        +[VUIMediaEntityType season](VUIMediaEntityType, "season");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        mediaEntityType = v7->_mediaEntityType;
        v7->_mediaEntityType = (VUIMediaEntityType *)v10;

        break;
      default:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpected type passed to -initWithIdentifier:type:"));
        break;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VUIPlistMediaEntityIdentifier identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VUIPlistMediaEntityIdentifier *v4;
  VUIPlistMediaEntityIdentifier *v5;
  VUIPlistMediaEntityIdentifier *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (VUIPlistMediaEntityIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[VUIPlistMediaEntityIdentifier identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlistMediaEntityIdentifier identifier](v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      v12 = 1;
    }
    else
    {
      v12 = 0;
      if (v9 && v10)
        v12 = objc_msgSend(v9, "isEqual:", v10);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12.receiver = self;
  v12.super_class = (Class)VUIPlistMediaEntityIdentifier;
  -[VUIPlistMediaEntityIdentifier description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaEntityIdentifier identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@>"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (VUIMediaEntityType)mediaEntityType
{
  return self->_mediaEntityType;
}

- (void)setMediaEntityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntityType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
