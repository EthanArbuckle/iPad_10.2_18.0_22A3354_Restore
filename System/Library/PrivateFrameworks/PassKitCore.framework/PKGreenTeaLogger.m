@implementation PKGreenTeaLogger

uint64_t __PKGreenTeaLogger_block_invoke()
{
  uint64_t result;

  result = ct_green_tea_logger_create();
  qword_1ECF226E0 = result;
  return result;
}

@end
