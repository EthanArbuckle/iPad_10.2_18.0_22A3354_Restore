@implementation RTWorkoutDistanceEnumerationOptions

- (RTWorkoutDistanceEnumerationOptions)initWithBatchSize:(unint64_t)a3 ascending:(BOOL)a4
{
  RTWorkoutDistanceEnumerationOptions *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTWorkoutDistanceEnumerationOptions;
  result = -[RTWorkoutDistanceEnumerationOptions init](&v7, sel_init);
  if (result)
  {
    result->_ascending = a4;
    result->_batchSize = a3;
  }
  return result;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBatchSize:ascending:", self->_batchSize, self->_ascending);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 ascending;
  id v5;

  ascending = self->_ascending;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", ascending, CFSTR("ascending"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batchSize, CFSTR("batchSize"));

}

- (RTWorkoutDistanceEnumerationOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ascending"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batchSize"));

  return -[RTWorkoutDistanceEnumerationOptions initWithBatchSize:ascending:](self, "initWithBatchSize:ascending:", v6, v5);
}

- (id)description
{
  const __CFString *v2;

  if (self->_ascending)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ascending, %@, batchSize, %lu"), v2, self->_batchSize);
}

- (BOOL)ascending
{
  return self->_ascending;
}

@end
