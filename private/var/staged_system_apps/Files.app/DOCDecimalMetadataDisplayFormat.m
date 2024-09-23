@implementation DOCDecimalMetadataDisplayFormat

- (DOCDecimalMetadataDisplayFormat)init
{
  DOCDecimalMetadataDisplayFormat *v2;
  DOCDecimalMetadataDisplayFormat *v3;
  NSString *decimalFormatString;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCDecimalMetadataDisplayFormat;
  v2 = -[DOCDecimalMetadataDisplayFormat init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_prefersIntegerFractionalDisplay = 0;
    *(_OWORD *)&v2->_maxFractionalDigits = xmmword_1004D4CB0;
    decimalFormatString = v2->_decimalFormatString;
    v2->_decimalFormatString = 0;

  }
  return v3;
}

- (id)displayStringForMetadataValue:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    v7 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat displayStringForMetadataNumberValue:](self, "displayStringForMetadataNumberValue:", v4));
      goto LABEL_6;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat displayStringForMetadataStringValue:](self, "displayStringForMetadataStringValue:", v4));
LABEL_6:
  v8 = (void *)v6;
LABEL_8:

  return v8;
}

- (id)displayStringForMetadataStringValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  double v15;
  double v16;
  unsigned __int8 v17;
  void *v18;
  double v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/")));
  v6 = objc_msgSend(v5, "count");
  if (v6 == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber decimalNumberWithString:](NSDecimalNumber, "decimalNumberWithString:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber decimalNumberWithString:](NSDecimalNumber, "decimalNumberWithString:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:](NSDecimalNumberHandler, "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 0x7FFFLL, 0, 0, 0, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "decimalNumberByDividingBy:withBehavior:", v10, v11));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber decimalNumberWithString:](NSDecimalNumber, "decimalNumberWithString:", v4));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber"));
  v14 = objc_msgSend(v12, "isEqual:", v13);

  v15 = 0.0;
  if ((v14 & 1) == 0)
  {
    objc_msgSend(v12, "doubleValue");
    v15 = v16;
  }

  if (v6 == (id)2)
    v17 = v14;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    if (v6 != (id)2)
    {
      objc_msgSend(v4, "doubleValue");
      v15 = v19;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat displayStringForMetadataNumberValue:](self, "displayStringForMetadataNumberValue:", v20));

  }
  return v18;
}

- (id)displayStringForMetadataNumberValue:(id)a3
{
  double v4;
  double v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "doubleValue");
  v5 = v4;
  if (-[DOCDecimalMetadataDisplayFormat prefersIntegerFractionalDisplay](self, "prefersIntegerFractionalDisplay"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat _integerFractionalDisplayStringByFormattingDoubleValue:](self, "_integerFractionalDisplayStringByFormattingDoubleValue:", v5));
  else
    v6 = 0;
  if (!objc_msgSend(v6, "length"))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat _decimalDisplayStringByFormattingDoubleValue:](self, "_decimalDisplayStringByFormattingDoubleValue:", v5));

    v6 = (void *)v7;
  }
  return v6;
}

- (id)_integerFractionalDisplayStringByFormattingDoubleValue:(double)a3
{
  uint64_t v3;
  BOOL v4;
  NSNumberFormatter *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3 > 0.0 && a3 < 1.0;
  if (v4 && (LODWORD(v3) = vcvtad_u64_f64(1.0 / a3), vabdd_f64(a3, 1.0 / (double)v3) < 0.001))
  {
    v5 = objc_opt_new(NSNumberFormatter);
    -[NSNumberFormatter setNumberStyle:](v5, "setNumberStyle:", 1);
    -[NSNumberFormatter setMaximumFractionDigits:](v5, "setMaximumFractionDigits:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v6, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("1/%@"), v7));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_decimalDisplayStringByFormattingDoubleValue:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  if (-[DOCDecimalMetadataDisplayFormat lengthUnits](self, "lengthUnits"))
    v5 = objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat _decimalLengthFormattedDoubleValue:](self, "_decimalLengthFormattedDoubleValue:", a3));
  else
    v5 = objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat _decimalDefaultFormattedDoubleValue:](self, "_decimalDefaultFormattedDoubleValue:", a3));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat decimalFormatString](self, "decimalFormatString"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat decimalFormatString](self, "decimalFormatString"));
    v10 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v6));

    v6 = (void *)v10;
  }
  return v6;
}

- (id)_decimalLengthFormattedDoubleValue:(double)a3
{
  NSLengthFormatter *v5;
  void *v6;
  void *v7;

  v5 = objc_opt_new(NSLengthFormatter);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSLengthFormatter numberFormatter](v5, "numberFormatter"));
  -[DOCDecimalMetadataDisplayFormat _configureNumberFormatter:](self, "_configureNumberFormatter:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSLengthFormatter stringFromValue:unit:](v5, "stringFromValue:unit:", -[DOCDecimalMetadataDisplayFormat lengthUnits](self, "lengthUnits"), a3));
  return v7;
}

- (id)_decimalDefaultFormattedDoubleValue:(double)a3
{
  NSNumberFormatter *v5;
  void *v6;
  void *v7;

  v5 = objc_opt_new(NSNumberFormatter);
  -[DOCDecimalMetadataDisplayFormat _configureNumberFormatter:](self, "_configureNumberFormatter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v5, "stringFromNumber:", v6));

  return v7;
}

- (void)_configureNumberFormatter:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setNumberStyle:", 1);
  objc_msgSend(v4, "setMaximumFractionDigits:", -[DOCDecimalMetadataDisplayFormat maxFractionalDigits](self, "maxFractionalDigits"));

}

- (BOOL)prefersIntegerFractionalDisplay
{
  return self->_prefersIntegerFractionalDisplay;
}

- (void)setPrefersIntegerFractionalDisplay:(BOOL)a3
{
  self->_prefersIntegerFractionalDisplay = a3;
}

- (int64_t)maxFractionalDigits
{
  return self->_maxFractionalDigits;
}

- (void)setMaxFractionalDigits:(int64_t)a3
{
  self->_maxFractionalDigits = a3;
}

- (int64_t)lengthUnits
{
  return self->_lengthUnits;
}

- (void)setLengthUnits:(int64_t)a3
{
  self->_lengthUnits = a3;
}

- (NSString)decimalFormatString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDecimalFormatString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decimalFormatString, 0);
}

@end
