@implementation PKBannerHandleResponse

+ (PKBannerHandleResponse)createWithResult:(uint64_t)a1
{
  PKBannerHandleResponse *result;
  objc_super v4;

  objc_opt_self();
  result = [PKBannerHandleResponse alloc];
  if (result)
  {
    v4.receiver = result;
    v4.super_class = (Class)PKBannerHandleResponse;
    result = (PKBannerHandleResponse *)objc_msgSendSuper2(&v4, sel_init);
    if (result)
      result->_result = a2;
  }
  return result;
}

- (PKBannerHandleResponse)init
{

  return 0;
}

- (int64_t)result
{
  return self->_result;
}

@end
