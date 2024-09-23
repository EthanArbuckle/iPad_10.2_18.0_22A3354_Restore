@implementation UIFeedbackBackBoardHIDPattern

void __44___UIFeedbackBackBoardHIDPattern_hidRequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
  v4 = a2;
  objc_msgSend(v4, "setPattern:", v3);
  objc_msgSend(v4, "setDeviceType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  objc_msgSend(v4, "setSenderID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(v4, "setPowerSourceID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(v4, "setTimestamp:", mach_absolute_time());

}

@end
