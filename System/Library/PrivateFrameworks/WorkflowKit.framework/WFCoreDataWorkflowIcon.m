@implementation WFCoreDataWorkflowIcon

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("ShortcutIcon"));
}

@end
