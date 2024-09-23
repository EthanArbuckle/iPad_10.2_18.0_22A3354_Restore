@implementation TRITaskQueuingOptions

- (TRITaskQueuingOptions)initWithDuplicateTaskResolution:(unint64_t)a3
{
  TRITaskQueuingOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRITaskQueuingOptions;
  result = -[TRITaskQueuingOptions init](&v5, sel_init);
  if (result)
    result->_duplicateTaskResolution = a3;
  return result;
}

+ (id)optionsWithDuplicateTaskResolution:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDuplicateTaskResolution:", a3);
}

- (id)copyWithReplacementDuplicateTaskResolution:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDuplicateTaskResolution:", a3);
}

- (BOOL)isEqualToOptions:(id)a3
{
  unint64_t duplicateTaskResolution;

  if (!a3)
    return 0;
  duplicateTaskResolution = self->_duplicateTaskResolution;
  return duplicateTaskResolution == objc_msgSend(a3, "duplicateTaskResolution");
}

- (BOOL)isEqual:(id)a3
{
  TRITaskQueuingOptions *v4;
  TRITaskQueuingOptions *v5;
  BOOL v6;

  v4 = (TRITaskQueuingOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRITaskQueuingOptions isEqualToOptions:](self, "isEqualToOptions:", v5);

  return v6;
}

- (unint64_t)hash
{
  return self->_duplicateTaskResolution;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRITaskQueuingOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  TRITaskQueuingOptions *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("duplicateTaskResolution"));
  if (v5)
    goto LABEL_2;
  objc_msgSend(v4, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("duplicateTaskResolution")) & 1) == 0)
  {
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Missing serialized value for TRITaskQueuingOptions.duplicateTaskResolution");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRITaskQueuingOptionsOCNTErrorDomain"), 1, v8);
    objc_msgSend(v4, "failWithError:", v9);

    goto LABEL_6;
  }
LABEL_2:
  self = -[TRITaskQueuingOptions initWithDuplicateTaskResolution:](self, "initWithDuplicateTaskResolution:", v5);
  v6 = self;
LABEL_7:

  return v6;
}

- (void)defaultEncodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_duplicateTaskResolution, CFSTR("duplicateTaskResolution"));
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 671, CFSTR("Do not use NSKeyedArchiver to persist instances of TRITaskQueuingOptions to disk. If you want to persist this object to disk, create a protobuf schema."));

  }
  -[TRITaskQueuingOptions defaultEncodeWithCoder:](self, "defaultEncodeWithCoder:", v6);

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_duplicateTaskResolution);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRITaskQueuingOptions | duplicateTaskResolution:%@>"), v4);

  return v5;
}

- (unint64_t)duplicateTaskResolution
{
  return self->_duplicateTaskResolution;
}

+ (id)defaultOptionsWithIgnoreDuplicates
{
  return +[TRITaskQueuingOptions optionsWithDuplicateTaskResolution:](TRITaskQueuingOptions, "optionsWithDuplicateTaskResolution:", 0);
}

@end
