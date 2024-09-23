@implementation NSError(PXAudioSession)

+ (uint64_t)px_audioSessionErrorWithCode:()PXAudioSession
{
  return objc_msgSend(a1, "px_audioSessionErrorWithCode:userInfo:", a3, 0);
}

+ (id)px_audioSessionErrorWithCode:()PXAudioSession underlyingError:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  v7 = [v5 alloc];
  v11 = *MEMORY[0x1E0CB3388];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("PXAudioSessionErrorDomain"), a3, v8);
  return v9;
}

+ (id)px_audioSessionErrorWithCode:()PXAudioSession userInfo:
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithDomain:code:userInfo:", CFSTR("PXAudioSessionErrorDomain"), a3, v6);

  return v7;
}

@end
