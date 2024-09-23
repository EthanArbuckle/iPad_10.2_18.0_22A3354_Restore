@implementation Feature

+ (id)fetchRequest
{
  return (id)objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x1E0C97B48], a2, (uint64_t)CFSTR("Feature"));
}

@end
