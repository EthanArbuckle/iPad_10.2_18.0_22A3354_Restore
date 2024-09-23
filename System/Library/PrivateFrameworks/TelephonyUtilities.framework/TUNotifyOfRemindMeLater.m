@implementation TUNotifyOfRemindMeLater

uint64_t (*__TUNotifyOfRemindMeLater_block_invoke())(_QWORD, _QWORD, _QWORD)
{
  uint64_t (*result)(_QWORD, _QWORD, _QWORD);

  result = (uint64_t (*)(_QWORD, _QWORD, _QWORD))CUTWeakLinkSymbol();
  TUNotifyOfRemindMeLater__BBDataProviderSendMessage = result;
  return result;
}

@end
