@implementation PKPaginatedAccountWebServiceResponse

+ (id)responseWithData:(id)a3 account:(id)a4 request:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:account:request:", v9, v8, v7);

  return v10;
}

@end
