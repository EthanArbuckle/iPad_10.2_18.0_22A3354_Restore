@implementation SMUTimeFormatter

- (SMUTimeFormatter)init
{
  SMUTimeFormatter *v2;
  AVTimeFormatter *v3;
  AVTimeFormatter *formatter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SMUTimeFormatter;
  v2 = -[SMUTimeFormatter init](&v6, sel_init);
  if (v2)
  {
    v3 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x24BDB26B8]);
    formatter = v2->_formatter;
    v2->_formatter = v3;

  }
  return v2;
}

- (void)setFormatTemplate:(double)a3
{
  -[AVTimeFormatter setFormatTemplate:](self->_formatter, "setFormatTemplate:", a3);
}

- (double)formatTemplate
{
  double result;

  -[AVTimeFormatter formatTemplate](self->_formatter, "formatTemplate");
  return result;
}

- (void)setFullWidth:(BOOL)a3
{
  -[AVTimeFormatter setFullWidth:](self->_formatter, "setFullWidth:", a3);
}

- (BOOL)isFullWidth
{
  return -[AVTimeFormatter isFullWidth](self->_formatter, "isFullWidth");
}

- (void)setStyle:(int64_t)a3
{
  -[AVTimeFormatter setStyle:](self->_formatter, "setStyle:", a3);
}

- (int64_t)style
{
  return -[AVTimeFormatter style](self->_formatter, "style");
}

- (id)stringFromCMTime:(id *)a3
{
  AVTimeFormatter *formatter;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  formatter = self->_formatter;
  v5 = *a3;
  -[AVTimeFormatter stringFromCMTime:](formatter, "stringFromCMTime:", &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stringFromSeconds:(double)a3
{
  return (id)-[AVTimeFormatter stringFromSeconds:](self->_formatter, "stringFromSeconds:", a3);
}

- (id)stringForObjectValue:(id)a3
{
  return (id)-[AVTimeFormatter stringForObjectValue:](self->_formatter, "stringForObjectValue:", a3);
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  return (id)-[AVTimeFormatter attributedStringForObjectValue:withDefaultAttributes:](self->_formatter, "attributedStringForObjectValue:withDefaultAttributes:", a3, a4);
}

- (id)editingStringForObjectValue:(id)a3
{
  return (id)-[AVTimeFormatter editingStringForObjectValue:](self->_formatter, "editingStringForObjectValue:", a3);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return -[AVTimeFormatter getObjectValue:forString:errorDescription:](self->_formatter, "getObjectValue:forString:errorDescription:", a3, a4, a5);
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  return -[AVTimeFormatter isPartialStringValid:newEditingString:errorDescription:](self->_formatter, "isPartialStringValid:newEditingString:errorDescription:", a3, a4, a5);
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  return -[AVTimeFormatter isPartialStringValid:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:](self->_formatter, "isPartialStringValid:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:", a3, a4, a5, a6.location, a6.length, a7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
