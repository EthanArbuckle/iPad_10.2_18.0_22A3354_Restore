@implementation MonospaceFont

void __MonospaceFont_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(off_1E167A828, "monospacedDigitSystemFontOfSize:weight:", 16.0, *(double *)off_1E167DC70);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7A940;
  qword_1ECD7A940 = v0;

}

@end
