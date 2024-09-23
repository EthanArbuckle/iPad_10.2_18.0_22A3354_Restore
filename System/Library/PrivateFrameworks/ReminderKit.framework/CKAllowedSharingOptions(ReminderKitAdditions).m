@implementation CKAllowedSharingOptions(ReminderKitAdditions)

+ (id)rem_remindersAllowedSharingOptions
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BA8]), "initWithAllowedParticipantPermissionOptions:allowedParticipantAccessOptions:", 2, 2);
}

@end
