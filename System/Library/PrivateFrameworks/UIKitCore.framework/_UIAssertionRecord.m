@implementation _UIAssertionRecord

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setInitialState:(BOOL)a3
{
  self->_initialState = a3;
}

- (int64_t)activeAssertionCount
{
  return self->_activeAssertionCount;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setActiveAssertionCount:(int64_t)a3
{
  self->_activeAssertionCount = a3;
}

- (BOOL)initialState
{
  return self->_initialState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
