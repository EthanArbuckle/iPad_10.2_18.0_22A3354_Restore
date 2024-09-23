@implementation PPReusableContextWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctx, 0);
}

@end
