@implementation _RELargeSetFeatureValue

- (_RELargeSetFeatureValue)initWithSet:(id)a3
{
  id v4;
  _RELargeSetFeatureValue *v5;
  uint64_t v6;
  NSSet *values;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_RELargeSetFeatureValue;
  v5 = -[_RELargeSetFeatureValue init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    values = v5->_values;
    v5->_values = (NSSet *)v6;

  }
  return v5;
}

- (id)setValue
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
