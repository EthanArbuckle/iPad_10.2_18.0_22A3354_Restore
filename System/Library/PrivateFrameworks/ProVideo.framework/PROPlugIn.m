@implementation PROPlugIn

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)a1;
  if ((id)objc_opt_class() == a1)
    v4 = (objc_class *)objc_opt_class();
  return NSAllocateObject(v4, 0, a3);
}

- (PROPlugIn)initWithDictionary:(id)a3 bundle:(id)a4 delegate:(id)a5
{
  void *v5;
  uint64_t v6;
  NSString *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  v7 = NSStringFromSelector(a2);
  objc_msgSend(v5, "raise:format:", v6, CFSTR("*** Bad news! %@ send to abstract class %@!"), v7, objc_opt_class());
  return 0;
}

- (id)bundle
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)infoDictionary
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)delegate
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)plugInInstance
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)sharedPlugInInstance
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (Class)plugInClass
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)className
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (__CFUUID)uuid
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)group
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)displayName
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)helpURL
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)version
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)infoString
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)implementedProtocols
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)pluginKitPlug
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (BOOL)isBlocked
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)blockedLookupKey
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)apiUsedByPlugInForProtocol:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
  return 0;
}

- (void)setDelegate:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (BOOL)isEqualToPlugIn:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
  return 0;
}

- (BOOL)is3rdParty
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (void)setIsBlocked:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (void)setBlockedLookupKey:(id)a3 pluginName:(id)a4 version:(id)a5
{
  void *v5;
  uint64_t v6;
  NSString *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  v7 = NSStringFromSelector(a2);
  objc_msgSend(v5, "raise:format:", v6, CFSTR("*** Bad news! %@ send to abstract class %@!"), v7, objc_opt_class());
}

@end
