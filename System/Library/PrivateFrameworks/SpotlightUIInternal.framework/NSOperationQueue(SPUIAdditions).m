@implementation NSOperationQueue(SPUIAdditions)

- (uint64_t)logStateOperationCountGreaterThan:()SPUIAdditions
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__NSOperationQueue_SPUIAdditions__logStateOperationCountGreaterThan___block_invoke;
  v4[3] = &unk_24F9D5CA0;
  v4[4] = a1;
  v4[5] = a3;
  return objc_msgSend(a1, "addOperationWithBlock:", v4);
}

@end
