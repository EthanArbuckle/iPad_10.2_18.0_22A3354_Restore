@implementation UITextCheckerPerformPostEditingOnSend

void __UITextCheckerPerformPostEditingOnSend_block_invoke()
{
  if (qword_1ECD7B3C8 != -1)
    dispatch_once(&qword_1ECD7B3C8, &__block_literal_global_435);
  if (byte_1ECD7B2FD == 1)
  {
    if (_os_feature_enabled_impl())
      byte_1ECD7B2FC = 1;
  }
}

@end
