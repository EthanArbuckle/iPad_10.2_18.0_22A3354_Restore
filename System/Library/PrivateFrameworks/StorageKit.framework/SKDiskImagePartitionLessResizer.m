@implementation SKDiskImagePartitionLessResizer

- (id)resizeStateMachine:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[9];

  v24[8] = *MEMORY[0x24BDAC8D0];
  -[SKDiskResizerBase disk](self, "disk");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    -[SKDiskResizerBase disk](self, "disk");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", kSKDiskTypeHFS[0]);

    if ((v8 & 1) == 0)
    {
      +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 45, a3);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  transitionEntrySEL((uint64_t)CFSTR("kImageResize"), (uint64_t)kGrowEvent, (uint64_t)sel_imageResize_, (uint64_t)CFSTR("kVolumeResize"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v23;
  transitionEntrySEL((uint64_t)CFSTR("kVolumeResize"), (uint64_t)kGrowEvent, (uint64_t)sel_volumeResize_, (uint64_t)kDoneGrow);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  endTransitionEntry((uint64_t)kDoneGrow, (uint64_t)kGrowEvent);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  transitionEntrySEL((uint64_t)kDoneGrow, (uint64_t)kShrinkEvent, (uint64_t)sel_volumeResize_, (uint64_t)CFSTR("kImageResize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  transitionEntrySEL((uint64_t)CFSTR("kVolumeResize"), (uint64_t)kShrinkEvent, (uint64_t)sel_volumeResize_, (uint64_t)CFSTR("kImageResize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v12;
  transitionEntrySEL((uint64_t)CFSTR("kImageResize"), (uint64_t)kShrinkEvent, (uint64_t)sel_imageResize_, (uint64_t)kDoneShrink);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v13;
  endTransitionEntry((uint64_t)kDoneShrink, (uint64_t)kShrinkEvent);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v14;
  transitionEntrySEL((uint64_t)kDoneShrink, (uint64_t)kGrowEvent, (uint64_t)sel_imageResize_, (uint64_t)CFSTR("kVolumeResize"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:](SKStateTransitionTable, "tableWithTransitionEntries:selectorTarget:", v16, self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", kGrowEvent))
    v19 = CFSTR("kImageResize");
  else
    v19 = CFSTR("kVolumeResize");
  -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKStateMachine machineWithStateTransitionTable:startState:startEvent:](SKStateMachine, "machineWithStateTransitionTable:startState:startEvent:", v17, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
