@implementation _UIFontDescriptorCacheKey

- (BOOL)_isEqualToKey:(id)a3
{
  UIFontDescriptor *fontDescriptor;
  int v6;
  NSString *textStyleForScaling;

  if (self->super._hash != *((_QWORD *)a3 + 1) || vabdd_f64(self->_pointSize, *((double *)a3 + 4)) >= 0.00000011920929)
    goto LABEL_10;
  fontDescriptor = self->_fontDescriptor;
  if (fontDescriptor == *((UIFontDescriptor **)a3 + 3)
    || (v6 = -[UIFontDescriptor isEqual:](fontDescriptor, "isEqual:")) != 0)
  {
    textStyleForScaling = self->_textStyleForScaling;
    if (textStyleForScaling == *((NSString **)a3 + 5)
      || (v6 = -[NSString isEqualToString:](textStyleForScaling, "isEqualToString:")) != 0)
    {
      if (self->_pointSizeForScaling == *((double *)a3 + 6)
        && self->_maximumPointSizeAfterScaling == *((double *)a3 + 7))
      {
        LOBYTE(v6) = self->_textLegibility == *((unsigned __int8 *)a3 + 16);
        return v6;
      }
LABEL_10:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)setFontDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setTextStyleForScaling:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setTextLegibility:(BOOL)a3
{
  self->_textLegibility = a3;
}

- (void)setPointSizeForScaling:(double)a3
{
  self->_pointSizeForScaling = a3;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (void)setMaximumPointSizeAfterScaling:(double)a3
{
  self->_maximumPointSizeAfterScaling = a3;
}

- (unint64_t)_hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[UIFontDescriptor hash](self->_fontDescriptor, "hash");
  v4 = vcvtmd_u64_f64((self->_pointSize + self->_pointSizeForScaling + self->_maximumPointSizeAfterScaling) * 100.0);
  return -[NSString hash](self->_textStyleForScaling, "hash") ^ v3 ^ self->_textLegibility ^ v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFontDescriptorCacheKey;
  -[_UIFontDescriptorCacheKey dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("descriptor: <%p:%@>, pointSize: %g, textStyleForScaling: %@, pointSizeForScaling: %g, maximumPointSizeAfterScaling: %g"), self->_fontDescriptor, -[UIFontDescriptor postscriptName](self->_fontDescriptor, "postscriptName"), *(_QWORD *)&self->_pointSize, self->_textStyleForScaling, *(_QWORD *)&self->_pointSizeForScaling, *(_QWORD *)&self->_maximumPointSizeAfterScaling);
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (NSString)textStyleForScaling
{
  return self->_textStyleForScaling;
}

- (double)pointSizeForScaling
{
  return self->_pointSizeForScaling;
}

- (double)maximumPointSizeAfterScaling
{
  return self->_maximumPointSizeAfterScaling;
}

- (BOOL)textLegibility
{
  return self->_textLegibility;
}

@end
