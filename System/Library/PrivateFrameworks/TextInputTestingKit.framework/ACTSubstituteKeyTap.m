@implementation ACTSubstituteKeyTap

- (ACTSubstituteKeyTap)initWithIntendedKey:(id)a3 touchedKey:(id)a4 error:(id)a5 location:(CGPoint)a6 timestamp:(double)a7
{
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  id v16;
  ACTSubstituteKeyTap *v17;
  ACTSubstituteKeyTap *v18;
  objc_super v20;

  y = a6.y;
  x = a6.x;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ACTSubstituteKeyTap;
  v17 = -[ACTSubstituteKeyTap init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_intendedKey, a3);
    objc_storeStrong((id *)&v18->_touchedKey, a4);
    objc_storeStrong((id *)&v18->_error, a5);
    v18->_location.x = x;
    v18->_location.y = y;
    v18->_timestamp = a7;
  }

  return v18;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSubstituteKeyTap intendedKey](self, "intendedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "representedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSubstituteKeyTap touchedKey](self, "touchedKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "representedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSubstituteKeyTap error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSubstituteKeyTap location](self, "location");
  v12 = v11;
  -[ACTSubstituteKeyTap location](self, "location");
  v14 = v13;
  -[ACTSubstituteKeyTap timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: intended=%@, touched=%@, error=%@, loc=(%.0f,%.0f), t=%.2f>"), v5, v7, v9, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[ACTSubstituteKeyTap location](self, "location");
  v8 = v7;
  v10 = v9;
  -[ACTSubstituteKeyTap timestamp](self, "timestamp");
  v12 = v11;
  -[ACTSubstituteKeyTap intendedKey](self, "intendedKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSubstituteKeyTap touchedKey](self, "touchedKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSubstituteKeyTap error](self, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v17, "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:", v13, v14, 0, v15, v6, v8, v10, v12);

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACTSubstituteKeyTap intendedKey](self, "intendedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByPaddingToLength:withString:startingAtIndex:", 7, CFSTR(" "), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSubstituteKeyTap touchedKey](self, "touchedKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByPaddingToLength:withString:startingAtIndex:", 7, CFSTR(" "), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SubstituteKeyTap intended/touched: %@ %@"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UIKBTree)intendedKey
{
  return self->_intendedKey;
}

- (UIKBTree)touchedKey
{
  return self->_touchedKey;
}

- (TIPointError)error
{
  return self->_error;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_touchedKey, 0);
  objc_storeStrong((id *)&self->_intendedKey, 0);
}

@end
