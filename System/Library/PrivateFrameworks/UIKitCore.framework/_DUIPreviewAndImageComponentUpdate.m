@implementation _DUIPreviewAndImageComponentUpdate

- (_DUIPreviewAndImageComponentUpdate)initWithPreviewAndImageComponent:(id)a3 isFromSource:(BOOL)a4
{
  _DUIPreviewAndImageComponentUpdate *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DUIPreviewAndImageComponentUpdate;
  result = -[_DUIPreviewAndImageComponent initWithPreviewAndImageComponent:](&v6, sel_initWithPreviewAndImageComponent_, a3);
  if (result)
    result->_isFromSource = a4;
  return result;
}

- (_DUIPreviewAndImageComponentUpdate)initWithCoder:(id)a3
{
  id v4;
  _DUIPreviewAndImageComponentUpdate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_DUIPreviewAndImageComponentUpdate;
  v5 = -[_DUIPreviewAndImageComponent initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_isFromSource = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFromSource"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DUIPreviewAndImageComponentUpdate;
  v4 = a3;
  -[_DUIPreviewAndImageComponent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isFromSource, CFSTR("isFromSource"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_isFromSource == v4[32])
  {
    v7.receiver = self;
    v7.super_class = (Class)_DUIPreviewAndImageComponentUpdate;
    v5 = -[_DUIPreviewAndImageComponent isEqual:](&v7, sel_isEqual_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  _BOOL8 isFromSource;
  objc_super v4;

  isFromSource = self->_isFromSource;
  v4.receiver = self;
  v4.super_class = (Class)_DUIPreviewAndImageComponentUpdate;
  return -[_DUIPreviewAndImageComponent hash](&v4, sel_hash) ^ isFromSource;
}

- (BOOL)isFromSource
{
  return self->_isFromSource;
}

- (void)setIsFromSource:(BOOL)a3
{
  self->_isFromSource = a3;
}

@end
