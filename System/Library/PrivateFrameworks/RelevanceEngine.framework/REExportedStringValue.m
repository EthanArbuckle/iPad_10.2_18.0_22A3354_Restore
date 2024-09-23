@implementation REExportedStringValue

- (REExportedStringValue)initWithString:(id)a3
{
  id v4;
  REExportedStringValue *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REExportedStringValue;
  v5 = -[REExportedStringValue init](&v8, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "identifier");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v6;
    }
    objc_storeStrong((id *)&v5->_string, v4);
  }

  return v5;
}

- (id)stringValue
{
  return self->_string;
}

- (unint64_t)type
{
  return 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
