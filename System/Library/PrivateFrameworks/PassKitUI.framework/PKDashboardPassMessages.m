@implementation PKDashboardPassMessages

+ (id)identifier
{
  return CFSTR("passMessages");
}

- (NSOrderedSet)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
  objc_storeStrong((id *)&self->_messages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);
}

@end
