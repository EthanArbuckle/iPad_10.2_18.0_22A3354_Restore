@implementation TUNotifyOfReplyWithMessage

uint64_t (*__TUNotifyOfReplyWithMessage_block_invoke())(_QWORD, _QWORD, _QWORD)
{
  uint64_t (*result)(_QWORD, _QWORD, _QWORD);

  result = (uint64_t (*)(_QWORD, _QWORD, _QWORD))CUTWeakLinkSymbol();
  TUNotifyOfReplyWithMessage__BBDataProviderSendMessage = result;
  return result;
}

@end
