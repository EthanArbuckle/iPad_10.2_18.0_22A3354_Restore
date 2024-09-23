@implementation SUItemLink

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUItemLink;
  -[SUItemLink dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[1] = self->_linkTarget;
  v5[2] = self->_linkType;
  v5[3] = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v5[4] = self->_url;
  return v5;
}

- (int64_t)linkTarget
{
  return self->_linkTarget;
}

- (void)setLinkTarget:(int64_t)a3
{
  self->_linkTarget = a3;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
