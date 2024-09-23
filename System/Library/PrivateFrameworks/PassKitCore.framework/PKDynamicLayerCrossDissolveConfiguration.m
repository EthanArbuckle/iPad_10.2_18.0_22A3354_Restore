@implementation PKDynamicLayerCrossDissolveConfiguration

- (PKDynamicLayerCrossDissolveConfiguration)initWithDictionary:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  PKDynamicLayerCrossDissolveConfiguration *v8;
  objc_super v10;

  v4 = a3;
  if (!v4)
    goto LABEL_9;
  v10.receiver = self;
  v10.super_class = (Class)PKDynamicLayerCrossDissolveConfiguration;
  self = -[PKDynamicLayerCrossDissolveConfiguration init](&v10, sel_init);
  if (self)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("intensity"));
    v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 == CFSTR("default")
      || v5 && (v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("default")), v6, v7))
    {
      self->_intensity = 0;

      goto LABEL_7;
    }

LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
LABEL_7:
  self = self;
  v8 = self;
LABEL_10:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDynamicLayerCrossDissolveConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKDynamicLayerCrossDissolveConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDynamicLayerCrossDissolveConfiguration;
  v5 = -[PKDynamicLayerCrossDissolveConfiguration init](&v7, sel_init);
  if (v5)
    -[PKDynamicLayerCrossDissolveConfiguration setIntensity:](v5, "setIntensity:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("crossDissolveIntensity")));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_intensity, CFSTR("crossDissolveIntensity"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[PKDynamicLayerCrossDissolveConfiguration init](+[PKDynamicLayerCrossDissolveConfiguration allocWithZone:](PKDynamicLayerCrossDissolveConfiguration, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_intensity;
  return result;
}

- (unint64_t)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(unint64_t)a3
{
  self->_intensity = a3;
}

@end
