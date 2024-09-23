@implementation TTKSimpleKey

- (TTKSimpleKey)initWithString:(id)a3 frame:(CGRect)a4 keyCode:(signed __int16)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  TTKSimpleKey *v13;
  TTKSimpleKey *v14;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TTKSimpleKey;
  v13 = -[TTKSimpleKey init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_string, a3);
    v14->_frame.origin.x = x;
    v14->_frame.origin.y = y;
    v14->_frame.size.width = width;
    v14->_frame.size.height = height;
    v14->_keyCode = a5;
  }

  return v14;
}

- (TTKSimpleKey)initWithJsonDictionary:(id)a3
{
  id v4;
  TTKSimpleKey *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  CGFloat v12;
  float v13;
  CGFloat v14;
  float v15;
  CGFloat v16;
  float v17;
  uint64_t v18;
  NSString *string;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TTKSimpleKey;
  v5 = -[TTKSimpleKey init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("frame"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("x"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("y"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("height"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("width"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v12 = v11;
    objc_msgSend(v8, "floatValue");
    v14 = v13;
    objc_msgSend(v10, "floatValue");
    v16 = v15;
    objc_msgSend(v9, "floatValue");
    v5->_frame.origin.x = v12;
    v5->_frame.origin.y = v14;
    v5->_frame.size.width = v16;
    v5->_frame.size.height = v17;
    objc_msgSend(v4, "objectForKey:", CFSTR("string"));
    v18 = objc_claimAutoreleasedReturnValue();
    string = v5->_string;
    v5->_string = (NSString *)v18;

    objc_msgSend(v4, "objectForKey:", CFSTR("key_code"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_keyCode = objc_msgSend(v20, "intValue");

  }
  return v5;
}

- (id)toJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  CGFloat x;
  void *v7;
  CGFloat y;
  void *v9;
  CGFloat height;
  void *v11;
  CGFloat width;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_string, CFSTR("string"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_keyCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("key_code"));

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  x = self->_frame.origin.x;
  *(float *)&x = x;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", x);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("x"));

  y = self->_frame.origin.y;
  *(float *)&y = y;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("y"));

  height = self->_frame.size.height;
  *(float *)&height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("height"));

  width = self->_frame.size.width;
  *(float *)&width = width;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", width);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("width"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("frame"));
  return v3;
}

- (NSString)string
{
  return self->_string;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (signed)keyCode
{
  return self->_keyCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
