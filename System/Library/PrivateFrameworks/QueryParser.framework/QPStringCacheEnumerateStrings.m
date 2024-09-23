@implementation QPStringCacheEnumerateStrings

void __QPStringCacheEnumerateStrings_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Completion;
  int Length;
  uint64_t v7;
  int v8;
  const char *v9;
  const char *v10;
  CFStringRef v11;
  CFStringRef v12;
  uint64_t v13;
  uint64_t Payload;

  if (SITrieCompletionGetPayload())
  {
    Completion = SITrieCompletionGetCompletion();
    Length = SITrieCompletionGetLength();
    v7 = 0;
    if (Length)
    {
      while (1)
      {
        v8 = *(unsigned __int8 *)(Completion + v7++);
        if (v8 == 58)
          break;
        if (Length == v7)
          return;
      }
    }
    if (v7 != Length)
    {
      v9 = (const char *)(Completion + v7);
      if (Completion)
        v10 = v9;
      else
        v10 = "";
      v11 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, 0x8000100u);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)(a1 + 32);
        Payload = SITrieCompletionGetPayload();
        (*(void (**)(uint64_t, CFStringRef, uint64_t, uint64_t))(v13 + 16))(v13, v12, Payload, a3);
        CFRelease(v12);
      }
    }
  }
}

@end
