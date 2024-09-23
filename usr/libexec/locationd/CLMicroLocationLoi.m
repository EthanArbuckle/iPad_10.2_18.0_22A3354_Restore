@implementation CLMicroLocationLoi

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationLoi;
  -[CLMicroLocationLoi dealloc](&v3, "dealloc");
}

- (NSUUID)loiIdentifier
{
  return self->_loiIdentifier;
}

- (CLMicroLocationLoi)initWithIdentifier:(id)a3 andType:(int64_t)a4
{
  CLMicroLocationLoi *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLMicroLocationLoi;
  v6 = -[CLMicroLocationLoi init](&v8, "init");
  if (v6)
  {
    v6->_loiIdentifier = (NSUUID *)objc_msgSend(a3, "copy");
    v6->_type = a4;
  }
  return v6;
}

- (void)setLoiIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
