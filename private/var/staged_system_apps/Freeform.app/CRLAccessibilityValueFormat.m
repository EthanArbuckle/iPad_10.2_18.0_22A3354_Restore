@implementation CRLAccessibilityValueFormat

- (CRLAccessibilityValueFormat)initWithNumberFormat:(id)a3 andUnitStringsDictKey:(id)a4
{
  id v6;
  id v7;
  CRLAccessibilityValueFormat *v8;
  CRLAccessibilityValueFormat *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLAccessibilityValueFormat;
  v8 = -[CRLAccessibilityValueFormat init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[CRLAccessibilityValueFormat setNumberFormat:](v8, "setNumberFormat:", v6);
    -[CRLAccessibilityValueFormat setUnitStringsDictKey:](v9, "setUnitStringsDictKey:", v7);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLAccessibilityValueFormat *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  CRLAccessibilityValueFormat *v9;

  v4 = [CRLAccessibilityValueFormat alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityValueFormat numberFormat](self, "numberFormat"));
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityValueFormat unitStringsDictKey](self, "unitStringsDictKey"));
  v8 = objc_msgSend(v7, "copy");
  v9 = -[CRLAccessibilityValueFormat initWithNumberFormat:andUnitStringsDictKey:](v4, "initWithNumberFormat:andUnitStringsDictKey:", v6, v8);

  return v9;
}

- (NSString)numberFormat
{
  return self->_numberFormat;
}

- (void)setNumberFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)unitStringsDictKey
{
  return self->_unitStringsDictKey;
}

- (void)setUnitStringsDictKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitStringsDictKey, 0);
  objc_storeStrong((id *)&self->_numberFormat, 0);
}

@end
