@implementation PKUniqueAddressField

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSString)invalidText
{
  return self->_invalidText;
}

- (void)setInvalidText:(id)a3
{
  objc_storeStrong((id *)&self->_invalidText, a3);
}

- (BOOL)formatIsInvalid
{
  return self->_formatIsInvalid;
}

- (void)setFormatIsInvalid:(BOOL)a3
{
  self->_formatIsInvalid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidText, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
