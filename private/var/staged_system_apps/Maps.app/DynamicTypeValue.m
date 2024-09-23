@implementation DynamicTypeValue

- (double)scaledValue
{
  uint64_t v3;
  void *v4;
  uint64_t (**v5)(void);
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double result;

  v3 = objc_claimAutoreleasedReturnValue(-[DynamicTypeValue fontProvider](self, "fontProvider"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[DynamicTypeValue fontProvider](self, "fontProvider")),
        v6 = v5[2](),
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6),
        v5,
        v4,
        v7))
  {
    -[DynamicTypeValue unscaledValue](self, "unscaledValue");
    objc_msgSend(v7, "_mapkit_scaledValueForValue:scalingForMacIdiom:respectingTraitEnvironment:", 1, 0);
    v9 = v8;

    return v9;
  }
  else
  {
    -[DynamicTypeValue unscaledValue](self, "unscaledValue");
  }
  return result;
}

- (id)fontProvider
{
  return self->_fontProvider;
}

- (void)setFontProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)unscaledValue
{
  return self->_unscaledValue;
}

- (void)setUnscaledValue:(double)a3
{
  self->_unscaledValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fontProvider, 0);
}

@end
