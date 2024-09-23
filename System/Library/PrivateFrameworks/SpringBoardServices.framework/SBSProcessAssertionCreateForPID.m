@implementation SBSProcessAssertionCreateForPID

void __SBSProcessAssertionCreateForPID_block_invoke(uint64_t a1)
{
  _QWORD block[4];
  int v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __SBSProcessAssertionCreateForPID_block_invoke_2;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v2 = *(_DWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __SBSProcessAssertionCreateForPID_block_invoke_2(uint64_t a1)
{
  int v1;
  CFMutableArrayRef Mutable;
  __CFArray *v3;
  CFIndex Count;
  unint64_t v5;
  _DWORD *ValueAtIndex;
  _DWORD *v7;
  CFIndex v8;
  CFIndex v9;
  CFIndex i;
  _QWORD *v11;
  void (*v12)(_QWORD *, _QWORD);

  v1 = *(_DWORD *)(a1 + 32);
  if (v1)
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    if (Mutable)
    {
      v3 = Mutable;
      pthread_mutex_lock(&sAssertionArrayLock);
      if (sAssertionArray)
      {
        Count = CFArrayGetCount((CFArrayRef)sAssertionArray);
        if (Count >= 1)
        {
          v5 = Count + 1;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)sAssertionArray, v5 - 2);
            if (ValueAtIndex[20] == v1)
            {
              v7 = ValueAtIndex;
              CFArrayAppendValue(v3, ValueAtIndex);
              CFArrayRemoveValueAtIndex((CFMutableArrayRef)sAssertionArray, v5 - 2);
              *((_BYTE *)v7 + 84) = 0;
            }
            --v5;
          }
          while (v5 > 1);
        }
      }
      pthread_mutex_unlock(&sAssertionArrayLock);
      v8 = CFArrayGetCount(v3);
      if (v8 >= 1)
      {
        v9 = v8;
        for (i = 0; i != v9; ++i)
        {
          v11 = CFArrayGetValueAtIndex(v3, i);
          v12 = (void (*)(_QWORD *, _QWORD))v11[11];
          if (v12)
            v12(v11, v11[12]);
        }
      }
      CFRelease(v3);
    }
  }
}

@end
