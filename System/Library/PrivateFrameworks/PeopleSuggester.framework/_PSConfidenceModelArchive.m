@implementation _PSConfidenceModelArchive

- (_PSConfidenceModelArchive)initWithConfidenceModelDictionary:(id)a3
{
  id v5;
  _PSConfidenceModelArchive *v6;
  _PSConfidenceModelArchive *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSConfidenceModelArchive;
  v6 = -[_PSConfidenceModelArchive init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_confidenceModelDictionary, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[_PSConfidenceModelArchive confidenceModelDictionary](self, "confidenceModelDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithConfidenceModelDictionary:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_PSConfidenceModelArchive confidenceModelDictionary](self, "confidenceModelDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_confidenceModelDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (_PSConfidenceModelArchive)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _PSConfidenceModelArchive *v15;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_confidenceModelDictionary);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_PSConfidenceModelArchive initWithConfidenceModelDictionary:](self, "initWithConfidenceModelDictionary:", v14);
  return v15;
}

- (NSDictionary)confidenceModelDictionary
{
  return self->_confidenceModelDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceModelDictionary, 0);
}

@end
