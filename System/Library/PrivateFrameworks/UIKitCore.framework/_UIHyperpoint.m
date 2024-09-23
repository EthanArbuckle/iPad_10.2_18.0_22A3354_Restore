@implementation _UIHyperpoint

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  cblas_dcopy_NEWLAPACK();
}

- (void)_mutateValue:(id)a3
{
  void (**v4)(id, double *);

  v4 = (void (**)(id, double *))a3;
  -[_UIHyperpoint willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_value"));
  v4[2](v4, self->__value);

  -[_UIHyperpoint didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_value"));
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("_value"));
}

- (_UIHyperpoint)initWithDimensions:(unint64_t)a3
{
  _UIHyperpoint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIHyperpoint;
  v4 = -[_UIHyperpoint init](&v6, sel_init);
  if (v4)
  {
    v4->__value = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v4->__dimensions = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->__value);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperpoint;
  -[_UIHyperpoint dealloc](&v3, sel_dealloc);
}

- (_UIHyperpoint)initWithValue:(const double *)a3 objCType:(const char *)a4
{
  NSUInteger sizep;

  sizep = 0;
  NSGetSizeAndAlignment(a4, &sizep, 0);
  return -[_UIHyperpoint initWithValue:dimensions:](self, "initWithValue:dimensions:", a3, sizep >> 3);
}

- (_UIHyperpoint)initWithValue:(const double *)a3 dimensions:(unint64_t)a4
{
  _UIHyperpoint *v4;

  v4 = -[_UIHyperpoint initWithDimensions:](self, "initWithDimensions:", a4);
  if (v4)
    cblas_dcopy_NEWLAPACK();
  return v4;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  _UIVectorDescription((uint64_t)self->__value, self->__dimensions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; value = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (const)_value
{
  return self->__value;
}

- (void)_copyValue:(const double *)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28___UIHyperpoint__copyValue___block_invoke;
  v3[3] = &unk_1E16B3EF0;
  v3[4] = self;
  v3[5] = a3;
  -[_UIHyperpoint _mutateValue:](self, "_mutateValue:", v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperpoint)initWithCoder:(id)a3
{
  void *v4;
  _UIHyperpoint *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(a3, "_ui_decodeVectorForKey:returnedCount:", CFSTR("_value"), &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIHyperpoint initWithDimensions:](self, "initWithDimensions:", v7);
  -[_UIHyperpoint _mutateValue:](v5, "_mutateValue:", v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "_ui_encodeVector:count:forKey:", self->__value, self->__dimensions, CFSTR("_value"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UIHyperpoint initWithValue:dimensions:]([_UIHyperpoint alloc], "initWithValue:dimensions:", -[_UIHyperpoint _value](self, "_value"), -[_UIHyperpoint _dimensions](self, "_dimensions"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UIHyperpoint _dimensions](self, "_dimensions");
    v7 = v6 == objc_msgSend(v5, "_dimensions")
      && memcmp(-[_UIHyperpoint _value](self, "_value"), (const void *)objc_msgSend(v5, "_value"), 8 * -[_UIHyperpoint _dimensions](self, "_dimensions")) == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
