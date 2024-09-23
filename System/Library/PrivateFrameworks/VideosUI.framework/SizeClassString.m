@implementation SizeClassString

void __SizeClassString_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1EA0B99E8;
  v2[1] = &unk_1EA0B9A00;
  v3[0] = CFSTR("compact");
  v3[1] = CFSTR("regular");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SizeClassString_sizeClassStrings;
  SizeClassString_sizeClassStrings = v0;

}

@end
