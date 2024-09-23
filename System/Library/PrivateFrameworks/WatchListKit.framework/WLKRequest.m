@implementation WLKRequest

- (NSString)caller
{
  return self->_caller;
}

- (void)setCaller:(id)a3
{
  objc_storeStrong((id *)&self->_caller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caller, 0);
}

@end
