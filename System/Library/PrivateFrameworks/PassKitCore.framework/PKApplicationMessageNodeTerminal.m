@implementation PKApplicationMessageNodeTerminal

- (PKApplicationMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
