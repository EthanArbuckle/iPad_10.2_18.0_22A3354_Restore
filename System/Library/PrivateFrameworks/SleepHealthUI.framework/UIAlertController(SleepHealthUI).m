@implementation UIAlertController(SleepHealthUI)

+ (uint64_t)hksp_notificationsWontFireAlertControllerWithLocalizedTitle:()SleepHealthUI localizedDismiss:completion:
{
  return objc_msgSend(MEMORY[0x1E0DC3450], "notificationsWontFireAlertControllerWithLocalizedTitle:localizedDismiss:completion:");
}

@end
