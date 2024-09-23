@implementation NSRunLoop(RCDisplayLinkAdditions)

- (uint64_t)rc_runUntilNextDisplayLinkEventWithTimeout:()RCDisplayLinkAdditions
{
  id v4;
  double Current;
  double v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__NSRunLoop_RCDisplayLinkAdditions__rc_runUntilNextDisplayLinkEventWithTimeout___block_invoke;
  v9[3] = &unk_1E769D6E8;
  v9[4] = &v10;
  v4 = (id)objc_msgSend(MEMORY[0x1E0CD2730], "rc_displayWithFramesPerSecond:handlerBlock:", 0, v9);
  objc_msgSend(v4, "addToRunLoop:forMode:", a1, *MEMORY[0x1E0C99860]);
  Current = CFAbsoluteTimeGetCurrent();
  do
  {
    objc_msgSend(a1, "runUntilDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.05));
    if (*((_BYTE *)v11 + 24))
      break;
    v6 = CFAbsoluteTimeGetCurrent();
  }
  while (a2 < 0.0 || v6 - Current <= a2);
  objc_msgSend(v4, "invalidate");

  v7 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

@end
