@implementation OSASandboxExtensionForUserSubmissionDirectory

id __OSASandboxExtensionForUserSubmissionDirectory_block_invoke(uint64_t a1)
{
  const char *v2;
  const char *v3;
  const __CFString *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = getprogname();
  v3 = v2;
  v4 = *(const __CFString **)(a1 + 32);
  v5 = CFSTR("<unknown>");
  if (v4)
    v6 = v4;
  else
    v6 = CFSTR("<unknown>");
  v9[0] = CFSTR("bugType");
  v9[1] = CFSTR("progName");
  v10[0] = v6;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)

  return v7;
}

@end
