@implementation AWDCoreRoutineMapItem(LearnedLocationEngine)

- (void)initWithMapItem:()LearnedLocationEngine
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (!objc_msgSend(v4, "source"))
  {
    v6 = 0;
    goto LABEL_33;
  }
  if ((objc_msgSend(v4, "source") & 1) != 0)
    objc_msgSend(v5, "addMapItemSources:", 1);
  if ((objc_msgSend(v4, "source") & 2) != 0)
    objc_msgSend(v5, "addMapItemSources:", 12);
  if ((objc_msgSend(v4, "source") & 4) != 0)
    objc_msgSend(v5, "addMapItemSources:", 2);
  if ((objc_msgSend(v4, "source") & 8) != 0)
    objc_msgSend(v5, "addMapItemSources:", 4);
  if ((objc_msgSend(v4, "source") & 0x10) != 0)
    objc_msgSend(v5, "addMapItemSources:", 5);
  if ((objc_msgSend(v4, "source") & 0x40) != 0)
    objc_msgSend(v5, "addMapItemSources:", 7);
  if ((objc_msgSend(v4, "source") & 0x80) != 0)
    objc_msgSend(v5, "addMapItemSources:", 8);
  if ((objc_msgSend(v4, "source") & 0x100) != 0)
    objc_msgSend(v5, "addMapItemSources:", 9);
  if ((objc_msgSend(v4, "source") & 0x200) != 0)
    objc_msgSend(v5, "addMapItemSources:", 10);
  if ((objc_msgSend(v4, "source") & 0x400) != 0)
    objc_msgSend(v5, "addMapItemSources:", 11);
  if ((objc_msgSend(v4, "source") & 0x800) != 0)
    objc_msgSend(v5, "addMapItemSources:", 13);
  if ((objc_msgSend(v4, "source") & 0x1000) != 0)
    objc_msgSend(v5, "addMapItemSources:", 14);
  if ((objc_msgSend(v4, "source") & 0x2000) != 0)
    objc_msgSend(v5, "addMapItemSources:", 15);
  if ((objc_msgSend(v4, "source") & 0x4000) != 0)
    objc_msgSend(v5, "addMapItemSources:", 16);
  if ((objc_msgSend(v4, "source") & 0x8000) != 0)
  {
    v6 = 17;
LABEL_33:
    objc_msgSend(v5, "addMapItemSources:", v6);
  }
  objc_msgSend(v5, "setHasMuid:", objc_msgSend(v4, "validMUID"));

  return v5;
}

@end
