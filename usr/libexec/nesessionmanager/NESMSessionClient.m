@implementation NESMSessionClient

- (id)description
{
  return self->_description;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
