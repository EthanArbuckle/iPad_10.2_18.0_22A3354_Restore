@implementation PKApplicationMessageGroupDescriptor

+ (id)createForIdentifier:(id)a3 withSingularSummary:(id)a4 pluralSummary:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKApplicationMessageGroupDescriptor *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PKApplicationMessageGroupDescriptor *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [PKApplicationMessageGroupDescriptor alloc];
  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v13;
  v15 = 0;
  if (v10 && v11 && v12 && v13)
  {
    v24.receiver = v10;
    v24.super_class = (Class)PKApplicationMessageGroupDescriptor;
    v16 = objc_msgSendSuper2(&v24, sel_init);
    if (v16)
    {
      v17 = objc_msgSend(v11, "copy");
      v18 = (void *)v16[1];
      v16[1] = v17;

      v19 = objc_msgSend(v12, "copy");
      v20 = (void *)v16[2];
      v16[2] = v19;

      v21 = objc_msgSend(v14, "copy");
      v22 = (void *)v16[3];
      v16[3] = v21;

    }
    v10 = v16;
    v15 = v10;
  }

  return v15;
}

- (PKApplicationMessageGroupDescriptor)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageGroupDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKApplicationMessageGroupDescriptor *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *singularSummary;
  uint64_t v11;
  NSString *pluralSummary;
  PKApplicationMessageGroupDescriptor *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKApplicationMessageGroupDescriptor;
  v5 = -[PKApplicationMessageGroupDescriptor init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    if (!v5->_identifier)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKApplicationMessageGroupDescriptor"), 0, 0);
      objc_msgSend(v4, "failWithError:", v14);

      v13 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("singular"));
    v9 = objc_claimAutoreleasedReturnValue();
    singularSummary = v5->_singularSummary;
    v5->_singularSummary = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("plural"));
    v11 = objc_claimAutoreleasedReturnValue();
    pluralSummary = v5->_pluralSummary;
    v5->_pluralSummary = (NSString *)v11;

  }
  v13 = v5;
LABEL_6:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_singularSummary, CFSTR("singular"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pluralSummary, CFSTR("plural"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  char v6;
  id v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v7 = v4;
    v8 = v7;
    if (self)
    {
      v9 = (void *)*((_QWORD *)v7 + 1);
      v10 = self->_identifier;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
        v6 = 1;
      }
      else
      {
        v6 = 0;
        if (v10 && v11)
          v6 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);
      }

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)singularSummary
{
  return self->_singularSummary;
}

- (NSString)pluralSummary
{
  return self->_pluralSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluralSummary, 0);
  objc_storeStrong((id *)&self->_singularSummary, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
