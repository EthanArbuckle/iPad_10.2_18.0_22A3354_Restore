@implementation _NSCustomTextRenderingDisplayLinkInfo

- (_NSCustomTextRenderingDisplayLinkInfo)initWithTimestamp:(double)a3 duration:(double)a4 targetTimestamp:(double)a5
{
  _NSCustomTextRenderingDisplayLinkInfo *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NSCustomTextRenderingDisplayLinkInfo;
  result = -[_NSCustomTextRenderingDisplayLinkInfo init](&v9, sel_init);
  if (result)
  {
    result->_timestamp = a3;
    result->_duration = a4;
    result->_targetTimestamp = a5;
  }
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)duration
{
  return self->_duration;
}

- (double)targetTimestamp
{
  return self->_targetTimestamp;
}

@end
