@implementation VMUObjectLabelHandlerInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
}

@end
