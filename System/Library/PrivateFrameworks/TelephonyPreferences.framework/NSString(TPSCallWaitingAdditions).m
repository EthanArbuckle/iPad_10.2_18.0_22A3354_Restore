@implementation NSString(TPSCallWaitingAdditions)

+ (id)tps_stringWithTPSCallWaitingState:()TPSCallWaitingAdditions
{
  if (a3 > 2)
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", off_1EA2CD868[a3]);
}

@end
