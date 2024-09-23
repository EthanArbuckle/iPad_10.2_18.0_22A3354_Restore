@implementation NSBlockOperation

+ (id)named:(id)a3 withBlock:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", a4));
  objc_msgSend(v6, "setName:", v5);

  return v6;
}

@end
