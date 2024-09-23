@implementation TTSRuleGroup

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(unint64_t)a3
{
  self->_startIndex = a3;
}

- (unint64_t)endIndex
{
  return self->_endIndex;
}

- (void)setEndIndex:(unint64_t)a3
{
  self->_endIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
