@implementation _TVRTextField

- (RTIInputSystemSourceSession)_rtiSourceSession
{
  return self->_rtiSourceSession;
}

- (void)set_rtiSourceSession:(id)a3
{
  objc_storeStrong((id *)&self->_rtiSourceSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtiSourceSession, 0);
}

@end
