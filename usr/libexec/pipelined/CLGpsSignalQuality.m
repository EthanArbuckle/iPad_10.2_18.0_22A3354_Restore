@implementation CLGpsSignalQuality

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLGpsSignalQuality)init
{
  -[CLGpsSignalQuality doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLGpsSignalQuality)initWithSignalQuality:(int)a3
{
  CLGpsSignalQuality *v4;
  CLGpsSignalQuality *v5;
  CLGpsSignalQuality *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLGpsSignalQuality;
  v4 = -[CLGpsSignalQuality init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    v4->_quality = a3;
    v6 = v4;
  }

  return v5;
}

- (CLGpsSignalQuality)initWithCoder:(id)a3
{
  id v4;
  CLGpsSignalQuality *v5;
  CLGpsSignalQuality *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLGpsSignalQuality;
  v5 = -[CLGpsSignalQuality init](&v8, "init");
  if (v5)
  {
    v5->_quality = objc_msgSend(v4, "decodeIntForKey:", CFSTR("signalQuality"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt:forKey:", self->_quality, CFSTR("signalQuality"));
}

- (int)quality
{
  return self->_quality;
}

- (void)setQuality:(int)a3
{
  self->_quality = a3;
}

@end
