@implementation TSWPChangeSession

- (unsigned)sessionUID
{
  return self->_sessionUID;
}

- (void)setSessionUID:(unsigned int)a3
{
  -[TSPObject willModify](self, "willModify");
  self->_sessionUID = a3;
}

- (TSKAnnotationAuthor)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->_author = (TSKAnnotationAuthor *)a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->_date = (NSDate *)a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPChangeSession;
  -[TSWPChangeSession dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqualToSession:(id)a3
{
  unsigned int sessionUID;

  sessionUID = self->_sessionUID;
  return sessionUID == objc_msgSend(a3, "sessionUID");
}

@end
