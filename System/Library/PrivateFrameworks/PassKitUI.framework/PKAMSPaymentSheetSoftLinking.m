@implementation PKAMSPaymentSheetSoftLinking

+ (void)softLink
{
  if (LoadAppleMediaServicesUIPaymentSheets_loadPredicate[0] != -1)
    dispatch_once(LoadAppleMediaServicesUIPaymentSheets_loadPredicate, &__block_literal_global_26);
}

@end
