@implementation UserInterfaceString

void __UserInterfaceString_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1EA0B9A18;
  v2[1] = &unk_1EA0B99E8;
  v3[0] = CFSTR("phone");
  v3[1] = CFSTR("pad");
  v2[2] = &unk_1EA0B9A00;
  v2[3] = &unk_1EA0B9A30;
  v3[2] = CFSTR("tv");
  v3[3] = CFSTR("carPlay");
  v2[4] = &unk_1EA0B9A48;
  v3[4] = CFSTR("mac");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)UserInterfaceString_userInterfaceStrings;
  UserInterfaceString_userInterfaceStrings = v0;

}

@end
