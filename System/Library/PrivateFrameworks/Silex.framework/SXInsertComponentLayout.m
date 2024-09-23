@implementation SXInsertComponentLayout

- (SXInsertComponentLayout)initWithColumnRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  SXInsertComponentLayout *result;
  objc_super v6;

  length = a3.length;
  location = a3.location;
  v6.receiver = self;
  v6.super_class = (Class)SXInsertComponentLayout;
  result = -[SXInsertComponentLayout init](&v6, sel_init);
  if (result)
  {
    result->_columnRange.location = location;
    result->_columnRange.length = length;
  }
  return result;
}

- (_SXComponentContentInset)contentInset
{
  return (_SXComponentContentInset)(*(unsigned int *)&self->_contentInset.all | ((unint64_t)self->_contentInset.bottom << 32));
}

- (_NSRange)columnRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_columnRange.length;
  location = self->_columnRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)ignoreDocumentGutter
{
  return self->_ignoreDocumentGutter;
}

- (unint64_t)ignoreDocumentMargin
{
  return self->_ignoreDocumentMargin;
}

- (void)setIgnoreDocumentMargin:(unint64_t)a3
{
  self->_ignoreDocumentMargin = a3;
}

- (_SXConvertibleValue)minimumHeight
{
  unint64_t unit;
  double value;
  _SXConvertibleValue result;

  unit = self->_minimumHeight.unit;
  value = self->_minimumHeight.value;
  result.unit = unit;
  result.value = value;
  return result;
}

- (_SXConvertibleValue)maximumContentWidth
{
  unint64_t unit;
  double value;
  _SXConvertibleValue result;

  unit = self->_maximumContentWidth.unit;
  value = self->_maximumContentWidth.value;
  result.unit = unit;
  result.value = value;
  return result;
}

- (SXEdgeSpacing)margin
{
  return self->_margin;
}

- (void)setMargin:(id)a3
{
  objc_storeStrong((id *)&self->_margin, a3);
}

- (unint64_t)horizontalContentAlignment
{
  return self->_horizontalContentAlignment;
}

- (_SXConvertibleValue)suggestedHeight
{
  unint64_t unit;
  double value;
  _SXConvertibleValue result;

  unit = self->_suggestedHeight.unit;
  value = self->_suggestedHeight.value;
  result.unit = unit;
  result.value = value;
  return result;
}

- (SXEdgeSpacing)padding
{
  return self->_padding;
}

- (unint64_t)ignoreViewportPadding
{
  return self->_ignoreViewportPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_padding, 0);
  objc_storeStrong((id *)&self->_margin, 0);
}

@end
