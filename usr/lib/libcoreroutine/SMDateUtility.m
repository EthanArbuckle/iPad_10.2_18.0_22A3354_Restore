@implementation SMDateUtility

+ (id)date
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

@end
