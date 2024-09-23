@implementation PXLabeledValue

- (PXLabeledValue)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLabeledValue.m"), 22, CFSTR("%s is not available as initializer"), "-[PXLabeledValue init]");

  abort();
}

- (id)_initSeparator
{
  PXLabeledValue *v2;
  PXLabeledValue *v3;
  PXLabeledValueType *value;
  NSString *localizedLabel;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXLabeledValue;
  v2 = -[PXLabeledValue init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    value = v2->_value;
    v2->_value = 0;

    localizedLabel = v3->_localizedLabel;
    v3->_localizedLabel = (NSString *)CFSTR("-");

    v3->_separator = 1;
  }
  return v3;
}

- (PXLabeledValue)initWithValue:(id)a3 localizedLabel:(id)a4
{
  id v8;
  id v9;
  PXLabeledValue *v10;
  PXLabeledValue *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLabeledValue.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedLabel"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PXLabeledValue;
  v10 = -[PXLabeledValue init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_value, a3);
    objc_storeStrong((id *)&v11->_localizedLabel, a4);
    v11->_separator = 0;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p, object:%@, title:\"%@\", badge:\"%@\">"), objc_opt_class(), self, self->_value, self->_localizedLabel, self->_localizedBadgeLabel);
}

- (PXLabeledValue)labeledValueWithLocalizedBadgeLabel:(id)a3
{
  id v4;
  PXLabeledValue *v5;
  void *v6;
  void *v7;
  PXLabeledValue *v8;
  uint64_t v9;
  NSString *localizedBadgeLabel;

  v4 = a3;
  v5 = [PXLabeledValue alloc];
  -[PXLabeledValue value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLabeledValue localizedLabel](self, "localizedLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXLabeledValue initWithValue:localizedLabel:](v5, "initWithValue:localizedLabel:", v6, v7);

  v9 = objc_msgSend(v4, "copy");
  localizedBadgeLabel = v8->_localizedBadgeLabel;
  v8->_localizedBadgeLabel = (NSString *)v9;

  return v8;
}

- (BOOL)isEqualToLabeledValue:(id)a3
{
  id v4;
  uint64_t v5;
  PXLabeledValueType *value;
  char v7;
  NSString *localizedLabel;
  NSString *v9;
  int v10;
  NSString *localizedBadgeLabel;
  NSString *v12;

  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  value = self->_value;
  if (!((unint64_t)value | v5))
  {
    localizedLabel = self->_localizedLabel;
    objc_msgSend(v4, "localizedLabel");
    v9 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
    if (localizedLabel == v9)
    {

    }
    else
    {
      v10 = -[NSString isEqual:](localizedLabel, "isEqual:", v9);

      if (!v10)
      {
        v7 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    localizedBadgeLabel = self->_localizedBadgeLabel;
    objc_msgSend(v4, "localizedBadgeLabel");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (localizedBadgeLabel == v12)
      v7 = 1;
    else
      v7 = -[NSString isEqual:](localizedBadgeLabel, "isEqual:", v12);

    goto LABEL_13;
  }
  if (value == (PXLabeledValueType *)v5)
    v7 = 1;
  else
    v7 = -[PXLabeledValueType isEqual:](value, "isEqual:", v5);
LABEL_14:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PXLabeledValue *v4;
  BOOL v5;

  v4 = (PXLabeledValue *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PXLabeledValue isEqualToLabeledValue:](self, "isEqualToLabeledValue:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[PXLabeledValueType hash](self->_value, "hash");
  return -[NSString hash](self->_localizedLabel, "hash") ^ v3;
}

- (PXLabeledValueType)value
{
  return self->_value;
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (NSString)localizedBadgeLabel
{
  return self->_localizedBadgeLabel;
}

- (BOOL)isSeparator
{
  return self->_separator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedBadgeLabel, 0);
  objc_storeStrong((id *)&self->_localizedLabel, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (PXLabeledValue)separatorLabeledValue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PXLabeledValue_separatorLabeledValue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (separatorLabeledValue_predicate != -1)
    dispatch_once(&separatorLabeledValue_predicate, block);
  return (PXLabeledValue *)(id)separatorLabeledValue__separatorLabeledValue;
}

void __39__PXLabeledValue_separatorLabeledValue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initSeparator");
  v2 = (void *)separatorLabeledValue__separatorLabeledValue;
  separatorLabeledValue__separatorLabeledValue = v1;

}

@end
