@implementation UIKBRegularExpressionForEmail

void ___UIKBRegularExpressionForEmail_block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!qword_1ECD7F2B8)
  {
    v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"), 1, 0);
    v1 = (void *)qword_1ECD7F2B8;
    qword_1ECD7F2B8 = v0;

  }
}

@end
