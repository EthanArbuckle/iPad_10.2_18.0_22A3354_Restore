@implementation SBSEventObserverInitialize

void __SBSEventObserverInitialize_block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  const char *string;
  void *v6;
  id v7;
  void *v8;
  xpc_object_t xdict;

  xdict = a2;
  v3 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
  v4 = xdict;
  if (v3)
  {
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]);
    v4 = xdict;
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", string, 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.springboardservices.eventobserver.internal")) & 1) != 0)
      {
        objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.springboardservices.eventobserver.internal"), "length"));
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = v6;
      }
      v8 = v7;

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v4 = xdict;
    }
  }

}

@end
