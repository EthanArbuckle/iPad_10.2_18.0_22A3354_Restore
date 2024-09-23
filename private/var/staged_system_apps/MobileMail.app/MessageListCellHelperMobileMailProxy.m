@implementation MessageListCellHelperMobileMailProxy

- (BOOL)isMessageListCellObject:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(MessageListCollectionViewCell);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (BOOL)showToCCIndicators
{
  return sub_100039DC8(0);
}

- (MUIAddressListFormatter)addressListFormatter
{
  return (MUIAddressListFormatter *)+[MessageListCellHelperMobileMailProxy addressListFormatter](MessageListCellHelperMobileMailProxy, "addressListFormatter");
}

+ (id)sharedApplicationProxy
{
  if (qword_1005A9F48 != -1)
    dispatch_once(&qword_1005A9F48, &stru_10051EFB0);
  return (id)qword_1005A9F40;
}

+ (id)addressListFormatter
{
  if (qword_1005A9F38 != -1)
    dispatch_once(&qword_1005A9F38, &stru_10051EF90);
  return (id)qword_1005A9F30;
}

@end
