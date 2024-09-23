@implementation ACTKeyTap

- (ACTKeyTap)initWithIntendedKey:(id)a3 touchedKey:(id)a4 error:(id)a5 location:(CGPoint)a6 timestamp:(double)a7 secondaryString:(BOOL)a8
{
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  id v18;
  ACTKeyTap *v19;
  ACTKeyTap *v20;
  objc_super v22;

  y = a6.y;
  x = a6.x;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ACTKeyTap;
  v19 = -[ACTKeyTap init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_intendedKey, a3);
    objc_storeStrong((id *)&v20->_touchedKey, a4);
    objc_storeStrong((id *)&v20->_error, a5);
    v20->_location.x = x;
    v20->_location.y = y;
    v20->_timestamp = a7;
    v20->_secondaryString = a8;
  }

  return v20;
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
  -[ACTKeyTap intendedKey](self, "intendedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "representedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyTap touchedKey](self, "touchedKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "representedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyTap error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyTap location](self, "location");
  v12 = v11;
  -[ACTKeyTap location](self, "location");
  v14 = v13;
  -[ACTKeyTap timestamp](self, "timestamp");
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
  _BOOL8 v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[ACTKeyTap location](self, "location");
  v8 = v7;
  v10 = v9;
  -[ACTKeyTap timestamp](self, "timestamp");
  v12 = v11;
  -[ACTKeyTap intendedKey](self, "intendedKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyTap touchedKey](self, "touchedKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ACTKeyTap secondaryString](self, "secondaryString");
  -[ACTKeyTap error](self, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v18, "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:", v13, v14, v15, v16, v6, v8, v10, v12);

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
  -[ACTKeyTap intendedKey](self, "intendedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByPaddingToLength:withString:startingAtIndex:", 7, CFSTR(" "), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyTap touchedKey](self, "touchedKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByPaddingToLength:withString:startingAtIndex:", 7, CFSTR(" "), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("KeyTap intended/touched: %@ %@"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)abbreviatedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACTKeyTap intendedKey](self, "intendedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "representedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyTap touchedKey](self, "touchedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "representedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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

- (BOOL)secondaryString
{
  return self->_secondaryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_touchedKey, 0);
  objc_storeStrong((id *)&self->_intendedKey, 0);
}

@end
