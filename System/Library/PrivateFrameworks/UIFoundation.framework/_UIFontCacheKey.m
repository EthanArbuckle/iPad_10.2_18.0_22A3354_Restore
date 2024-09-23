@implementation _UIFontCacheKey

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  unint64_t hash;

  if (self == a3)
    return 1;
  if (a3)
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      hash = self->_hash;
      if (hash == objc_msgSend(a3, "hash"))
        return -[_UIFontCacheKey _isEqualToKey:](self, "_isEqualToKey:", a3);
    }
  }
  return 0;
}

- (unint64_t)hash
{
  return self->_hash;
}

+ (id)newSystemFontCacheKeyWithDesign:(id)a3 weight:(double)a4 width:(id)a5 pointSize:(double)a6 monospacedDigits:(BOOL)a7
{
  _BOOL8 v7;
  _UIFontSystemCacheKey *v12;

  v7 = a7;
  v12 = objc_alloc_init(_UIFontSystemCacheKey);
  -[_UIFontSystemCacheKey setDesign:](v12, "setDesign:", a3);
  -[_UIFontSystemCacheKey setWeight:](v12, "setWeight:", a4);
  -[_UIFontSystemCacheKey setWidth:](v12, "setWidth:", a5);
  -[_UIFontSystemCacheKey setPointSize:](v12, "setPointSize:", a6);
  -[_UIFontSystemCacheKey setMonospacedDigits:](v12, "setMonospacedDigits:", v7);
  -[_UIFontSystemCacheKey setTextLegibility:](v12, "setTextLegibility:", _AXSEnhanceTextLegibilityEnabled() != 0);
  -[_UIFontCacheKey _precalculateHash](v12, "_precalculateHash");
  return v12;
}

+ (id)newSystemFontCacheKeyWithTraits:(int)a3 pointSize:(double)a4 width:(id)a5
{
  uint64_t v7;
  _UIFontSystemCacheKey *v8;

  v7 = *(_QWORD *)&a3;
  v8 = objc_alloc_init(_UIFontSystemCacheKey);
  -[_UIFontSystemCacheKey setTraits:](v8, "setTraits:", v7);
  -[_UIFontSystemCacheKey setPointSize:](v8, "setPointSize:", a4);
  -[_UIFontSystemCacheKey setWidth:](v8, "setWidth:", a5);
  -[_UIFontSystemCacheKey setTextLegibility:](v8, "setTextLegibility:", _AXSEnhanceTextLegibilityEnabled() != 0);
  -[_UIFontCacheKey _precalculateHash](v8, "_precalculateHash");
  return v8;
}

+ (id)newFontCacheKeyWithFontDescriptor:(id)a3 pointSize:(double)a4 textStyleForScaling:(id)a5 pointSizeForScaling:(double)a6 maximumPointSizeAfterScaling:(double)a7 textLegibility:(BOOL)a8
{
  _BOOL8 v8;
  _UIFontDescriptorCacheKey *v14;

  v8 = a8;
  v14 = objc_alloc_init(_UIFontDescriptorCacheKey);
  -[_UIFontDescriptorCacheKey setFontDescriptor:](v14, "setFontDescriptor:", a3);
  -[_UIFontDescriptorCacheKey setPointSize:](v14, "setPointSize:", a4);
  -[_UIFontDescriptorCacheKey setTextStyleForScaling:](v14, "setTextStyleForScaling:", a5);
  -[_UIFontDescriptorCacheKey setPointSizeForScaling:](v14, "setPointSizeForScaling:", a6);
  -[_UIFontDescriptorCacheKey setMaximumPointSizeAfterScaling:](v14, "setMaximumPointSizeAfterScaling:", a7);
  -[_UIFontDescriptorCacheKey setTextLegibility:](v14, "setTextLegibility:", v8);
  -[_UIFontCacheKey _precalculateHash](v14, "_precalculateHash");
  return v14;
}

+ (id)newFontCacheKeyWithTextStyle:(id)a3 contentSizeCategory:(id)a4 textLegibility:(BOOL)a5
{
  _BOOL8 v5;
  _UIFontTextStyleCacheKey *v8;

  v5 = a5;
  v8 = objc_alloc_init(_UIFontTextStyleCacheKey);
  -[_UIFontTextStyleCacheKey setTextStyle:](v8, "setTextStyle:", a3);
  -[_UIFontTextStyleCacheKey setContentSizeCategory:](v8, "setContentSizeCategory:", a4);
  -[_UIFontTextStyleCacheKey setTextLegibility:](v8, "setTextLegibility:", v5);
  -[_UIFontCacheKey _precalculateHash](v8, "_precalculateHash");
  return v8;
}

- (void)_precalculateHash
{
  self->_hash = -[_UIFontCacheKey _hash](self, "_hash");
}

+ (id)newFontCacheKeyWithFontName:(id)a3 traits:(int)a4 pointSize:(double)a5
{
  uint64_t v6;
  _UIFontNameCacheKey *v8;

  v6 = *(_QWORD *)&a4;
  v8 = objc_alloc_init(_UIFontNameCacheKey);
  -[_UIFontNameCacheKey setFontName:](v8, "setFontName:", a3);
  -[_UIFontNameCacheKey setTraits:](v8, "setTraits:", v6);
  -[_UIFontNameCacheKey setPointSize:](v8, "setPointSize:", a5);
  -[_UIFontCacheKey _precalculateHash](v8, "_precalculateHash");
  return v8;
}

+ (id)newSystemFontCacheKeyWithTraits:(int)a3 pointSize:(double)a4
{
  return (id)objc_msgSend(a1, "newSystemFontCacheKeyWithTraits:pointSize:width:", *(_QWORD *)&a3, 0, a4);
}

- (BOOL)_isEqualToKey:(id)a3
{
  return 1;
}

- (unint64_t)_hash
{
  return 0;
}

@end
