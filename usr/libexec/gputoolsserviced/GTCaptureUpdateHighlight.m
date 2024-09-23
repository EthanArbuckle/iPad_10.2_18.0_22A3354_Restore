@implementation GTCaptureUpdateHighlight

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureUpdateHighlight)initWithCoder:(id)a3
{
  id v4;
  GTCaptureUpdateHighlight *v5;
  GTCaptureUpdateHighlight *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTCaptureUpdateHighlight;
  v5 = -[GTCaptureRequest initWithCoder:](&v8, "initWithCoder:", v4);
  if (v5)
  {
    v5->_streamRef = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    v5->_enable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enable"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTCaptureUpdateHighlight;
  v4 = a3;
  -[GTCaptureRequest encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, CFSTR("streamRef"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_enable, CFSTR("enable"));

}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (BOOL)enable
{
  return self->_enable;
}

- (void)setEnable:(BOOL)a3
{
  self->_enable = a3;
}

@end
