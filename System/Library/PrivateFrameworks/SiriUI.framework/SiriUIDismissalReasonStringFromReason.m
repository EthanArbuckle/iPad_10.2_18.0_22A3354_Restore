@implementation SiriUIDismissalReasonStringFromReason

void __SiriUIDismissalReasonStringFromReason_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24D7EF448;
  v2[1] = &unk_24D7EF460;
  v3[0] = CFSTR("User");
  v3[1] = CFSTR("System");
  v2[2] = &unk_24D7EF478;
  v2[3] = &unk_24D7EF490;
  v3[2] = CFSTR("IdleTimer");
  v3[3] = CFSTR("IncomingPhoneCall");
  v2[4] = &unk_24D7EF4A8;
  v2[5] = &unk_24D7EF4C0;
  v3[4] = CFSTR("PunchOut");
  v3[5] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SiriUIDismissalReasonStringFromReason_reasonStrings;
  SiriUIDismissalReasonStringFromReason_reasonStrings = v0;

}

@end
