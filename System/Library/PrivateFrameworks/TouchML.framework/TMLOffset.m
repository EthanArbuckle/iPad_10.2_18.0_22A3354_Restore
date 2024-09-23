@implementation TMLOffset

- (TMLOffset)initWithOffset:(UIOffset)a3
{
  CGFloat vertical;
  CGFloat horizontal;
  TMLOffset *result;
  objc_super v6;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v6.receiver = self;
  v6.super_class = (Class)TMLOffset;
  result = -[TMLOffset init](&v6, sel_init);
  if (result)
  {
    result->_offset.horizontal = horizontal;
    result->_offset.vertical = vertical;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  return (id)objc_msgSend_initWithOffset_(v8, v9, self->_offset.horizontal, self->_offset.vertical);
}

- (id)UIOffsetValue
{
  return (id)objc_msgSend_valueWithUIOffset_(MEMORY[0x24BDD1968], a2, self->_offset.horizontal, self->_offset.vertical);
}

+ (void)initializeJSContext:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  _QWORD v15[5];

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v7 = (void *)objc_msgSend_initWithOffset_(v5, v6, *MEMORY[0x24BDF7BF0], *(double *)(MEMORY[0x24BDF7BF0] + 8));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, v9, v7, CFSTR("UIOffsetZero"));

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_22AD4D8C0;
  v15[3] = &unk_24F501280;
  v15[4] = a1;
  v10 = (void *)MEMORY[0x22E2E7E44](v15);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, v12, v10, CFSTR("offset"));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, v14, v10, CFSTR("UIOffsetMake"));

}

- (double)horizontal
{
  return self->_offset.horizontal;
}

- (double)vertical
{
  return self->_offset.vertical;
}

- (id)description
{
  return NSStringFromUIOffset(self->_offset);
}

- (UIOffset)offset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_offset.horizontal;
  vertical = self->_offset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

@end
