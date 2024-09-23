@implementation TTParagraphStyle(TTParagraphStylePersistenceAdditions)

- (void)initWithData:()TTParagraphStylePersistenceAdditions .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B4A39000, log, OS_LOG_TYPE_ERROR, "TTParagraphStyle protobuf corrupt.", v1, 2u);
}

- (void)saveToArchive:()TTParagraphStylePersistenceAdditions .cold.1()
{
  __assert_rtn("set_writingdirection", "topotext.pb.h", 4437, "::topotext::AttributeRun_WritingDirection_IsValid(value)");
}

- (void)saveToArchive:()TTParagraphStylePersistenceAdditions .cold.2()
{
  __assert_rtn("set_alignment", "topotext.pb.h", 4412, "::topotext::ParagraphStyle_Alignment_IsValid(value)");
}

@end
