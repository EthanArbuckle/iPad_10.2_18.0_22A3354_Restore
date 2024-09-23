@implementation UGCSuggestionViewModel

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (NSDate)visitDate
{
  return self->_visitDate;
}

- (void)setVisitDate:(id)a3
{
  objc_storeStrong((id *)&self->_visitDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitDate, 0);
}

@end
