@implementation PKFaceIDBannerHandleState

+ (id)createForGlyphState:(int64_t)a3
{
  id result;
  objc_super v5;

  result = [PKFaceIDBannerHandleState alloc];
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)PKBannerHandleState;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
      *((_QWORD *)result + 1) = 1;
  }
  *((_QWORD *)result + 2) = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFaceIDBannerHandleState)initWithCoder:(id)a3
{
  id v4;
  PKFaceIDBannerHandleState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKFaceIDBannerHandleState;
  v5 = -[PKBannerHandleState initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_glyphState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("glyphState"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKFaceIDBannerHandleState;
  v4 = a3;
  -[PKBannerHandleState encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_glyphState, CFSTR("glyphState"), v5.receiver, v5.super_class);

}

- (int64_t)glyphState
{
  return self->_glyphState;
}

@end
