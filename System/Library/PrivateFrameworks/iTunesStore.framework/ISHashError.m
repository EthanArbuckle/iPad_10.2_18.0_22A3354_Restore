@implementation ISHashError

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISHashError;
  -[ISHashError dealloc](&v3, sel_dealloc);
}

- (NSString)hashFailureHeaderString
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bytes=%lld-%lld,md5=%@"), self->_rangeStart, self->_rangeEnd, self->_actualHashString);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = -[NSString copyWithZone:](self->_actualHashString, "copyWithZone:", a3);
  v5[2] = -[NSString copyWithZone:](self->_expectedHashString, "copyWithZone:", a3);
  v5[3] = self->_rangeEnd;
  v5[4] = self->_rangeStart;
  return v5;
}

- (NSString)actualHashString
{
  return self->_actualHashString;
}

- (void)setActualHashString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)expectedHashString
{
  return self->_expectedHashString;
}

- (void)setExpectedHashString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)rangeEnd
{
  return self->_rangeEnd;
}

- (void)setRangeEnd:(int64_t)a3
{
  self->_rangeEnd = a3;
}

- (int64_t)rangeStart
{
  return self->_rangeStart;
}

- (void)setRangeStart:(int64_t)a3
{
  self->_rangeStart = a3;
}

@end
