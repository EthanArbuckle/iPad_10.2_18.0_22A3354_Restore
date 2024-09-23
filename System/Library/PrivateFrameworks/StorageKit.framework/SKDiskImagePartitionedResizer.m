@implementation SKDiskImagePartitionedResizer

- (id)resizeStateMachine:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[11];

  v26[10] = *MEMORY[0x24BDAC8D0];
  -[SKDiskImageResizerBase limits](self, "limits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[SKDiskResizerBase disk](self, "disk");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend((id)v6, "isSupportedWholeDisk:", v8);

  if ((v6 & 1) != 0)
  {
    transitionEntrySEL((uint64_t)CFSTR("kImageResize"), (uint64_t)kGrowEvent, (uint64_t)sel_imageResize_, (uint64_t)CFSTR("kMoveRecovery"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v25;
    transitionEntrySEL((uint64_t)CFSTR("kMoveRecovery"), (uint64_t)kGrowEvent, (uint64_t)sel_moveRecovery_, (uint64_t)CFSTR("kVolumeResize"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v24;
    transitionEntrySEL((uint64_t)CFSTR("kVolumeResize"), (uint64_t)kGrowEvent, (uint64_t)sel_volumeResize_, (uint64_t)kDoneGrow);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v23;
    endTransitionEntrySEL((uint64_t)kDoneGrow, (uint64_t)kGrowEvent, (uint64_t)sel_fitToSize_);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v22;
    transitionEntrySEL((uint64_t)kDoneGrow, (uint64_t)kShrinkEvent, (uint64_t)sel_volumeResize_, (uint64_t)CFSTR("kMoveRecovery"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[4] = v9;
    transitionEntrySEL((uint64_t)CFSTR("kVolumeResize"), (uint64_t)kShrinkEvent, (uint64_t)sel_volumeResize_, (uint64_t)CFSTR("kMoveRecovery"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[5] = v10;
    transitionEntrySEL((uint64_t)CFSTR("kMoveRecovery"), (uint64_t)kShrinkEvent, (uint64_t)sel_moveRecovery_, (uint64_t)CFSTR("kImageResize"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[6] = v11;
    transitionEntrySEL((uint64_t)CFSTR("kImageResize"), (uint64_t)kShrinkEvent, (uint64_t)sel_imageResize_, (uint64_t)kDoneShrink);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[7] = v12;
    endTransitionEntrySEL((uint64_t)kDoneShrink, (uint64_t)kShrinkEvent, (uint64_t)sel_fitToSize_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[8] = v13;
    transitionEntrySEL((uint64_t)kDoneShrink, (uint64_t)kGrowEvent, (uint64_t)sel_imageResize_, (uint64_t)CFSTR("kMoveRecovery"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[9] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:](SKStateTransitionTable, "tableWithTransitionEntries:selectorTarget:", v15, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", kGrowEvent))
      v18 = CFSTR("kImageResize");
    else
      v18 = CFSTR("kVolumeResize");
    -[SKDiskResizerBase eventFromSize](self, "eventFromSize", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKStateMachine machineWithStateTransitionTable:startState:startEvent:](SKStateMachine, "machineWithStateTransitionTable:startState:startEvent:", v16, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    return v20;
  }
  else
  {
    +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 45, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
