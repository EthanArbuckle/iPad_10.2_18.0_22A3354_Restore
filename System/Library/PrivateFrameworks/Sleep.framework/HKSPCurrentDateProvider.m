@implementation HKSPCurrentDateProvider

void __HKSPCurrentDateProvider_block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ED05F1B8;
  qword_1ED05F1B8 = (uint64_t)&__block_literal_global_10;

}

uint64_t __HKSPCurrentDateProvider_block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

@end
