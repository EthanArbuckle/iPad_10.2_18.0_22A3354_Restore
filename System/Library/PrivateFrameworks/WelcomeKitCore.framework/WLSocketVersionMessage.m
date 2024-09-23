@implementation WLSocketVersionMessage

- (WLSocketVersionMessage)initWithVersion:(unint64_t)a3
{
  WLSocketVersionMessage *v4;
  WLSocketVersionMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WLSocketVersionMessage;
  v4 = -[WLSocketMessage initWithType:](&v7, sel_initWithType_, 2);
  v5 = v4;
  if (v4)
    -[WLSocketVersionMessage setVersion:](v4, "setVersion:", a3);
  return v5;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

@end
