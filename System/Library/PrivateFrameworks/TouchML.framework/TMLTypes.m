@implementation TMLTypes

+ (BOOL)isNil:(id)a3
{
  double v3;

  return objc_msgSend_isNil_(TMLJSNil, a2, v3, a3);
}

+ (id)convertSize:(CGSize)a3
{
  double height;
  double width;
  TMLValue *v5;
  const char *v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  height = a3.height;
  width = a3.width;
  v5 = [TMLValue alloc];
  objc_msgSend_valueWithCGSize_(MEMORY[0x24BDD1968], v6, width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithValue_valueType_(v5, v8, v9, v7, 8);
  objc_msgSend_convertTmlValue_(TMLJSEnvironment, v11, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)convertPoint:(CGPoint)a3
{
  double y;
  double x;
  TMLValue *v5;
  const char *v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  v5 = [TMLValue alloc];
  objc_msgSend_valueWithCGPoint_(MEMORY[0x24BDD1968], v6, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithValue_valueType_(v5, v8, v9, v7, 10);
  objc_msgSend_convertTmlValue_(TMLJSEnvironment, v11, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)convertRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TMLValue *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;

  length = a3.length;
  location = a3.location;
  v5 = [TMLValue alloc];
  objc_msgSend_valueWithRange_(MEMORY[0x24BDD1968], v6, v7, location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithValue_valueType_(v5, v9, v10, v8, 14);
  objc_msgSend_convertTmlValue_(TMLJSEnvironment, v12, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)convertRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TMLValue *v7;
  const char *v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = [TMLValue alloc];
  objc_msgSend_valueWithCGRect_(MEMORY[0x24BDD1968], v8, x, y, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithValue_valueType_(v7, v10, v11, v9, 9);
  objc_msgSend_convertTmlValue_(TMLJSEnvironment, v13, v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)convertOffset:(UIOffset)a3
{
  double vertical;
  double horizontal;
  TMLValue *v5;
  const char *v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v5 = [TMLValue alloc];
  objc_msgSend_valueWithUIOffset_(MEMORY[0x24BDD1968], v6, horizontal, vertical);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithValue_valueType_(v5, v8, v9, v7, 29);
  objc_msgSend_convertTmlValue_(TMLJSEnvironment, v11, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
