@implementation BadgeSymbolFont

void __BadgeSymbolFont_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 16.0, *(double *)off_1E167DC78);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7A930;
  qword_1ECD7A930 = v0;

}

@end
