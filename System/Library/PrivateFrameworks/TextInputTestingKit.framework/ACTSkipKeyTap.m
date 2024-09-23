@implementation ACTSkipKeyTap

- (ACTSkipKeyTap)initWithIntendedKey:(id)a3 timestamp:(double)a4
{
  id v7;
  ACTSkipKeyTap *v8;
  ACTSkipKeyTap *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACTSkipKeyTap;
  v8 = -[ACTSkipKeyTap init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_intendedKey, a3);
    v9->_timestamp = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSkipKeyTap intendedKey](self, "intendedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "representedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSkipKeyTap timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: intended=%@, t=%.2f>"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[ACTSkipKeyTap timestamp](self, "timestamp");
  v9 = v8;
  -[ACTSkipKeyTap intendedKey](self, "intendedKey");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_skipTapTimestamp:intendedKey:typingLog:", v10, v6, v9);

}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ACTSkipKeyTap intendedKey](self, "intendedKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "representedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SkipKey intended: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIKBTree)intendedKey
{
  return self->_intendedKey;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedKey, 0);
}

@end
