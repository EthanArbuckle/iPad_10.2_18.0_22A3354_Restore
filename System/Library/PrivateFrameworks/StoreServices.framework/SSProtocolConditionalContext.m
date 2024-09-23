@implementation SSProtocolConditionalContext

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSProtocolConditionalContext;
  -[SSProtocolConditionalContext dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[1] = objc_msgSend(self->_itemLookupBlock, "copyWithZone:", a3);
  v5[2] = -[NSString copyWithZone:](self->_platformName, "copyWithZone:", a3);
  v5[3] = -[NSString copyWithZone:](self->_systemVersion, "copyWithZone:", a3);
  return v5;
}

- (id)itemLookupBlock
{
  return self->_itemLookupBlock;
}

- (void)setItemLookupBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)platformName
{
  return self->_platformName;
}

- (void)setPlatformName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
