@implementation REMAccountsListDataView.Invocation.PolymorphicListItem

- (REMObjectID)remObjectID
{
  return (REMObjectID *)objc_msgSend((id)(*(_QWORD *)self->modelObject & 0x7FFFFFFFFFFFFFFFLL), "remObjectID");
}

@end
