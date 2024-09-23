@implementation CNContact(WBSUICKShareParticipantExtras)

- (id)safari_shareParticipantIdentifier
{
  return objc_getAssociatedObject(a1, &shareParticipantIdentifierKey);
}

- (void)safari_setShareParticipantIdentifier:()WBSUICKShareParticipantExtras
{
  objc_setAssociatedObject(a1, &shareParticipantIdentifierKey, a3, (void *)3);
}

@end
