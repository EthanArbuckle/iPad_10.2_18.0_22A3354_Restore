@implementation PRPosterColorVariationsConfiguration

- (PRPosterColorVariationsConfiguration)initWithVariationStorage:(id)a3 version:(unint64_t)a4
{
  id v7;
  PRPosterColorVariationsConfiguration *v8;
  PRPosterColorVariationsConfiguration *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRPosterColorVariationsConfiguration;
  v8 = -[PRPosterColorVariationsConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_variationStorage, a3);
    v9->_version = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterColorVariationsConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PRPosterColorVariationsConfiguration *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  BOOL v12;

  v4 = (PRPosterColorVariationsConfiguration *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PRPosterColorVariationsConfiguration variationStorage](self, "variationStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterColorVariationsConfiguration variationStorage](v7, "variationStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

      if (v10)
      {
        v11 = -[PRPosterColorVariationsConfiguration version](self, "version");
        v12 = v11 == -[PRPosterColorVariationsConfiguration version](v7, "version");
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PRPosterColorVariationsConfiguration variationStorage](self, "variationStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PRPosterColorVariationsConfiguration version](self, "version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSDictionary *variationStorage;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB38B0];
  variationStorage = self->_variationStorage;
  v6 = a3;
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", variationStorage, 200, 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("variationStorage"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PRPosterColorVariationsConfiguration version](self, "version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("version"));

}

- (PRPosterColorVariationsConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  PRPosterColorVariationsConfiguration *v11;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("variationStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, 0),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = (unint64_t)(double)(unint64_t)objc_msgSend(v9, "unsignedIntegerValue");
  else
    v10 = 1;
  v11 = -[PRPosterColorVariationsConfiguration initWithVariationStorage:version:](self, "initWithVariationStorage:version:", v7, v10);

  return v11;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  NSDictionary *variationStorage;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB38B0];
  variationStorage = self->_variationStorage;
  v6 = a3;
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", variationStorage, 200, 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("variationStorage"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PRPosterColorVariationsConfiguration version](self, "version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("version"));

}

- (PRPosterColorVariationsConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  PRPosterColorVariationsConfiguration *v11;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("variationStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, 0),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = (unint64_t)(double)(unint64_t)objc_msgSend(v9, "unsignedIntegerValue");
  else
    v10 = 1;
  v11 = -[PRPosterColorVariationsConfiguration initWithVariationStorage:version:](self, "initWithVariationStorage:version:", v7, v10);

  return v11;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[PRPosterColorVariationsConfiguration variationStorage](self, "variationStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "appendObject:withName:", v4, CFSTR("variationStorage"));

}

- (NSDictionary)variationStorage
{
  return self->_variationStorage;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationStorage, 0);
}

@end
