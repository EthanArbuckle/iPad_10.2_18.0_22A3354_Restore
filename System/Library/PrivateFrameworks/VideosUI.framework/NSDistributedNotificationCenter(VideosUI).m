@implementation NSDistributedNotificationCenter(VideosUI)

- (void)vui_postNotificationName:()VideosUI object:userInfo:
{
  id v9;
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  const char *v17;
  id v18;

  if (a5)
  {
    v9 = a4;
    v10 = a3;
    v11 = (id)objc_msgSend(a5, "mutableCopy");
  }
  else
  {
    v12 = (objc_class *)MEMORY[0x1E0C99E08];
    v13 = a4;
    v14 = a3;
    v11 = objc_alloc_init(v12);
  }
  v18 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", getpid());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("sendingPID"));

  objc_msgSend(a1, "postNotificationName:object:userInfo:deliverImmediately:", a3, a4, v18, 1);
  v16 = objc_retainAutorelease(a3);
  v17 = (const char *)objc_msgSend(v16, "cStringUsingEncoding:", 4);

  notify_post(v17);
}

+ (uint64_t)vui_wasSentByDifferentProcess:()VideosUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithUnsignedInteger:", getpid());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sendingPID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToNumber:", v6) ^ 1;
  return v7;
}

@end
