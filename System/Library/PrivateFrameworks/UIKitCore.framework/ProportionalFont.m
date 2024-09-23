@implementation ProportionalFont

void __ProportionalFont_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7A950;
  qword_1ECD7A950 = v0;

}

@end
