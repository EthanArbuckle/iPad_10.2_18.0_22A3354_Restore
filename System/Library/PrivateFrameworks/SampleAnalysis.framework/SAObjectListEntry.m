@implementation SAObjectListEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
}

@end
