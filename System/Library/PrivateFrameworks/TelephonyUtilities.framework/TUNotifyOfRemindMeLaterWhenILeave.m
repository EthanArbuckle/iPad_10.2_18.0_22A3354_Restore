@implementation TUNotifyOfRemindMeLaterWhenILeave

uint64_t (*__TUNotifyOfRemindMeLaterWhenILeave_block_invoke())(_QWORD, _QWORD, _QWORD)
{
  uint64_t (*result)(_QWORD, _QWORD, _QWORD);

  result = (uint64_t (*)(_QWORD, _QWORD, _QWORD))CUTWeakLinkSymbol();
  TUNotifyOfRemindMeLaterWhenILeave__BBDataProviderSendMessage = result;
  return result;
}

@end
