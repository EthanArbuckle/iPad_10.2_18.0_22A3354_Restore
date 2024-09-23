@implementation UIKBRTFingerDetectionFingerFeedbackView

void __78___UIKBRTFingerDetectionFingerFeedbackView_centerOn_withRadius_andIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];
  _QWORD v3[14];

  v3[13] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E1A991C8;
  v2[1] = &unk_1E1A990A8;
  v3[0] = CFSTR("?");
  v3[1] = CFSTR("L?");
  v2[2] = &unk_1E1A99138;
  v2[3] = &unk_1E1A99108;
  v3[2] = CFSTR("R?");
  v3[3] = CFSTR("LL");
  v2[4] = &unk_1E1A990F0;
  v2[5] = &unk_1E1A990D8;
  v3[4] = CFSTR("LR");
  v3[5] = CFSTR("LM");
  v2[6] = &unk_1E1A990C0;
  v2[7] = &unk_1E1A99120;
  v3[6] = CFSTR("LI");
  v3[7] = CFSTR("LT");
  v2[8] = &unk_1E1A991B0;
  v2[9] = &unk_1E1A99150;
  v3[8] = CFSTR("RT");
  v3[9] = CFSTR("RI");
  v2[10] = &unk_1E1A99168;
  v2[11] = &unk_1E1A99180;
  v3[10] = CFSTR("RM");
  v3[11] = CFSTR("RR");
  v2[12] = &unk_1E1A99198;
  v3[12] = CFSTR("RL");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7AD68;
  qword_1ECD7AD68 = v0;

}

@end
