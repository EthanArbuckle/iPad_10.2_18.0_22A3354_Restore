@implementation SDTraceAdd

void __SDTraceAdd_block_invoke()
{
  SDTrace *v0;
  void *v1;
  SDTrace *v2;
  void *v3;
  SDTrace *v4;
  void *v5;

  v0 = -[SDTrace initWithTitle:]([SDTrace alloc], "initWithTitle:", CFSTR("SDQuery"));
  v1 = (void *)qword_253DBDE70;
  qword_253DBDE70 = (uint64_t)v0;

  v2 = -[SDTrace initWithTitle:]([SDTrace alloc], "initWithTitle:", CFSTR("IndexQuery"));
  v3 = (void *)qword_253DBDE78;
  qword_253DBDE78 = (uint64_t)v2;

  v4 = -[SDTrace initWithTitle:]([SDTrace alloc], "initWithTitle:", CFSTR("Index"));
  v5 = (void *)qword_253DBDE80;
  qword_253DBDE80 = (uint64_t)v4;

}

@end
