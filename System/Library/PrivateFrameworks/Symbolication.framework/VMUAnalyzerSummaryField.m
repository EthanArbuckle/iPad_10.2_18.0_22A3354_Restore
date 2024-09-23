@implementation VMUAnalyzerSummaryField

- (VMUAnalyzerSummaryField)initWithKey:(id)a3 numericalValue:(unint64_t)a4 objectValue:(id)a5 fieldType:(int)a6
{
  id v11;
  id v12;
  VMUAnalyzerSummaryField *v13;
  VMUAnalyzerSummaryField *v14;

  v11 = a3;
  v12 = a5;
  v13 = -[VMUAnalyzerSummaryField init](self, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_key, a3);
    v14->_numericalValue = a4;
    objc_storeStrong((id *)&v14->_objectValue, a5);
    v14->_fieldType = a6;
  }

  return v14;
}

- (NSString)formattedValue
{
  void *v2;

  if (self->_fieldType == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", VMUMemorySizeString(self->_numericalValue));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_objectValue)
      -[NSObject description](self->_objectValue, "description");
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), self->_numericalValue);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (unint64_t)numericalValue
{
  return self->_numericalValue;
}

- (void)setNumericalValue:(unint64_t)a3
{
  self->_numericalValue = a3;
}

- (NSObject)objectValue
{
  return self->_objectValue;
}

- (void)setObjectValue:(id)a3
{
  objc_storeStrong((id *)&self->_objectValue, a3);
}

- (int)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(int)a3
{
  self->_fieldType = a3;
}

- (void)setFormattedValue:(id)a3
{
  objc_storeStrong((id *)&self->_formattedValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedValue, 0);
  objc_storeStrong((id *)&self->_objectValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
