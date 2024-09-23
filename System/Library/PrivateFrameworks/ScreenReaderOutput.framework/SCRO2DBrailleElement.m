@implementation SCRO2DBrailleElement

- (SCRO2DBrailleElement)initWithIdentifier:(unint64_t)a3 linesRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  SCRO2DBrailleElement *v7;
  SCRO2DBrailleElement *v8;
  SCRO2DBrailleElement *v9;
  objc_super v11;

  length = a4.length;
  location = a4.location;
  v11.receiver = self;
  v11.super_class = (Class)SCRO2DBrailleElement;
  v7 = -[SCRO2DBrailleElement init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_identifier = a3;
    v7->_linesRange.location = location;
    v7->_linesRange.length = length;
    v9 = v7;
  }

  return v8;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (_NSRange)linesRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_linesRange.length;
  location = self->_linesRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLinesRange:(_NSRange)a3
{
  self->_linesRange = a3;
}

@end
