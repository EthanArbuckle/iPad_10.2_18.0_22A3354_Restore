@implementation VUILibrarySeasonViewModel

- (VUILibrarySeasonViewModel)initWithSeasonIdentifier:(id)a3 type:(unint64_t)a4
{
  id v7;
  VUILibrarySeasonViewModel *v8;
  VUILibrarySeasonViewModel *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUILibrarySeasonViewModel;
  v8 = -[VUILibrarySeasonViewModel init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_seasonIdentifier, a3);
    v9->_type = a4;
  }

  return v9;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[VUILibrarySeasonViewModel seasonIdentifier](self, "seasonIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%lu"), v6, -[VUILibrarySeasonViewModel type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[VUILibrarySeasonViewModel type](self, "type");
  -[VUILibrarySeasonViewModel seasonIdentifier](self, "seasonIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VUILibrarySeasonViewModel *v4;
  VUILibrarySeasonViewModel *v5;
  VUILibrarySeasonViewModel *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  BOOL v13;
  unint64_t v14;

  v4 = (VUILibrarySeasonViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[VUILibrarySeasonViewModel seasonIdentifier](self, "seasonIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUILibrarySeasonViewModel seasonIdentifier](v6, "seasonIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          if (!v9 || !v10)
          {

LABEL_14:
            v13 = 0;
            goto LABEL_15;
          }
          v12 = objc_msgSend(v9, "isEqual:", v10);

          if ((v12 & 1) == 0)
            goto LABEL_14;
        }
        v14 = -[VUILibrarySeasonViewModel type](self, "type");
        v13 = v14 == -[VUILibrarySeasonViewModel type](v6, "type");
LABEL_15:

        goto LABEL_16;
      }
    }
    v13 = 0;
  }
LABEL_16:

  return v13;
}

- (VUIMediaEntityIdentifier)seasonIdentifier
{
  return self->_seasonIdentifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seasonIdentifier, 0);
}

@end
