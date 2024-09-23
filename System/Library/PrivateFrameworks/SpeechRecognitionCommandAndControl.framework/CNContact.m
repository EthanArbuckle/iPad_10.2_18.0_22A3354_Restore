@implementation CNContact

void __51__CNContact_VoiceDial__callNumberWithLabeledValue___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((a2 & 1) == 0)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDD17C8];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("DialMessage.DialingErrorAt"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", *(_QWORD *)(a1 + 32), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@%@"), 0, v5, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayMessageString:type:announcementCompletion:", v6, 0, 0);

  }
}

void __54__CNContact_VoiceDial__faceTimeEmailWithLabeledValue___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((a2 & 1) == 0)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDD17C8];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("DialMessage.FaceTimeErrorAt"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", *(_QWORD *)(a1 + 32), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@%@"), 0, v5, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayMessageString:type:announcementCompletion:", v6, 0, 0);

  }
}

@end
