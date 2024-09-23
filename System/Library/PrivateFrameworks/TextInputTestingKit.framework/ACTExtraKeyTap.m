@implementation ACTExtraKeyTap

- (ACTExtraKeyTap)initWithTouchedKey:(id)a3 location:(CGPoint)a4 timestamp:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  ACTExtraKeyTap *v11;
  ACTExtraKeyTap *v12;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACTExtraKeyTap;
  v11 = -[ACTExtraKeyTap init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_touchedKey, a3);
    v12->_location.x = x;
    v12->_location.y = y;
    v12->_timestamp = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTExtraKeyTap touchedKey](self, "touchedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "representedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTExtraKeyTap location](self, "location");
  v9 = v8;
  -[ACTExtraKeyTap location](self, "location");
  v11 = v10;
  -[ACTExtraKeyTap timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: touchedKey=%@, loc=(%.0f,%.0f), t=%.2f>"), v5, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
  id v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[ACTExtraKeyTap location](self, "location");
  v8 = v7;
  v10 = v9;
  -[ACTExtraKeyTap timestamp](self, "timestamp");
  v12 = v11;
  -[ACTExtraKeyTap touchedKey](self, "touchedKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v15, "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:", 0, v13, 0, 0, v6, v8, v10, v12);

}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ACTExtraKeyTap touchedKey](self, "touchedKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("ExtraKey touched: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIKBTree)touchedKey
{
  return self->_touchedKey;
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
  objc_storeStrong((id *)&self->_touchedKey, 0);
}

@end
