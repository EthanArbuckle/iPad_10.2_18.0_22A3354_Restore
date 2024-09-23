@implementation SMSendValidityUtilities

+ (id)sendMessageFailureAlertCannotSendTitle
{
  return +[SMSendValidityUtilitiesInternal sendMessageFailureAlertCannotSendTitle](SMSendValidityUtilitiesInternal, "sendMessageFailureAlertCannotSendTitle");
}

+ (id)sendMessageFailureAlertOKButtonText
{
  return +[SMSendValidityUtilitiesInternal sendMessageFailureAlertOKButtonText](SMSendValidityUtilitiesInternal, "sendMessageFailureAlertOKButtonText");
}

+ (id)sendValidityAlertMessageForSMError:(int64_t)a3
{
  return +[SMSendValidityUtilitiesInternal sendValidityAlertMessageFor:](SMSendValidityUtilitiesInternal, "sendValidityAlertMessageFor:", a3);
}

@end
