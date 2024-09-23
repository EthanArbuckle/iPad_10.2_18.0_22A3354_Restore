@implementation AMFDRDataApTicketPopulate

CFURLRef __AMFDRDataApTicketPopulate_block_invoke()
{
  CFURLRef result;

  result = _AMFDRDataApTicketCopyURL();
  AMFDRDataApTicketPopulate_apticketUrlCached = (uint64_t)result;
  return result;
}

@end
