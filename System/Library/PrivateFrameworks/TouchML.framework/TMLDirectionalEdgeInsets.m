@implementation TMLDirectionalEdgeInsets

- (TMLDirectionalEdgeInsets)initWithDirectionalEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing;
  CGFloat bottom;
  CGFloat leading;
  CGFloat top;
  TMLDirectionalEdgeInsets *result;
  objc_super v8;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)TMLDirectionalEdgeInsets;
  result = -[TMLDirectionalEdgeInsets init](&v8, sel_init);
  if (result)
  {
    result->_directionalEdgeInsets.top = top;
    result->_directionalEdgeInsets.leading = leading;
    result->_directionalEdgeInsets.bottom = bottom;
    result->_directionalEdgeInsets.trailing = trailing;
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
  return (id)objc_msgSend_initWithDirectionalEdgeInsets_(v8, v9, self->_directionalEdgeInsets.top, self->_directionalEdgeInsets.leading, self->_directionalEdgeInsets.bottom, self->_directionalEdgeInsets.trailing);
}

- (id)NSDirectionalEdgeInsetsValue
{
  return (id)objc_msgSend_valueWithDirectionalEdgeInsets_(MEMORY[0x24BDD1968], a2, self->_directionalEdgeInsets.top, self->_directionalEdgeInsets.leading, self->_directionalEdgeInsets.bottom, self->_directionalEdgeInsets.trailing);
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
  const char *v15;
  double v16;
  _QWORD v17[5];

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v7 = (void *)objc_msgSend_initWithDirectionalEdgeInsets_(v5, v6, *MEMORY[0x24BDF65E8], *(double *)(MEMORY[0x24BDF65E8] + 8), *(double *)(MEMORY[0x24BDF65E8] + 16), *(double *)(MEMORY[0x24BDF65E8] + 24));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, v9, v7, CFSTR("NSDirectionalEdgeInsetsZero"));

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_22AD2B3BC;
  v17[3] = &unk_24F4FDF50;
  v17[4] = a1;
  v10 = (void *)MEMORY[0x22E2E7E44](v17);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, v12, v10, CFSTR("directionalEdgeInsets"));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, v14, v10, CFSTR("NSDirectionalEdgeInsetsMake"));

  objc_msgSend_setObject_forKeyedSubscript_(v4, v15, v16, &unk_24F4FDF90, CFSTR("NSDirectionalEdgeInsetsEqualToDirectionalEdgeInsets"));
}

- (double)top
{
  return self->_directionalEdgeInsets.top;
}

- (double)leading
{
  return self->_directionalEdgeInsets.leading;
}

- (double)bottom
{
  return self->_directionalEdgeInsets.bottom;
}

- (double)trailing
{
  return self->_directionalEdgeInsets.trailing;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TMLDirectionalEdgeInsets;
  -[TMLDirectionalEdgeInsets description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, self->_directionalEdgeInsets.top, CFSTR("%@{top: %.2f, leading: %.2f, bottom: %.2f, trailing: %.2f"), v4, *(_QWORD *)&self->_directionalEdgeInsets.top, *(_QWORD *)&self->_directionalEdgeInsets.leading, *(_QWORD *)&self->_directionalEdgeInsets.bottom, *(_QWORD *)&self->_directionalEdgeInsets.trailing);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDirectionalEdgeInsets)directionalEdgeInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_directionalEdgeInsets.top;
  leading = self->_directionalEdgeInsets.leading;
  bottom = self->_directionalEdgeInsets.bottom;
  trailing = self->_directionalEdgeInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

@end
