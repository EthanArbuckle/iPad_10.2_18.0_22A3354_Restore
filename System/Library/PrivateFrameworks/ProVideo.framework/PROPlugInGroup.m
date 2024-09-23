@implementation PROPlugInGroup

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)a1;
  if ((id)objc_opt_class() == a1)
    v4 = (objc_class *)objc_opt_class();
  return NSAllocateObject(v4, 0, a3);
}

- (PROPlugInGroup)initWithUUID:(__CFUUID *)a3 name:(id)a4 bundle:(id)a5
{
  void *v6;
  uint64_t v7;
  NSString *v8;
  PROPlugInGroup *v9;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  v8 = NSStringFromSelector(a2);
  objc_msgSend(v6, "raise:format:", v7, CFSTR("*** Bad news! %@ send to abstract class %@!"), v8, objc_opt_class());
  v9 = self;
  return 0;
}

- (void)addPlugIn:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (void)removePlugIn:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (id)name
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

- (id)plugIns
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

- (id)plugInsForProtocols:(id)a3
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

@end
