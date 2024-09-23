@implementation SBHardwareButtonHintPrototypeSettings

- (void)setDefaultValues
{
  SBFFluidBehaviorSettings *intelligentEdgeLightKeylineStyleBehaviorSettings;
  CAFrameRateRange v4;

  self->_lockDropletHeight = 140.0;
  self->_lockDropletWidth = 50.0;
  self->_lockInitialProtrusionFromEdge = 0.0;
  self->_lockFlattenedProtrusionFromEdge = 5.0;
  self->_lockPresentedProtrusionFromEdge = 5.0;
  self->_lockInitialCornerRadius = 21.0;
  self->_lockFlattenedCornerRadius = 21.0;
  self->_lockPresentedCornerRadius = 21.0;
  self->_lockInitialDropletRadius = 8.0;
  self->_lockFlattenedDropletRadius = 8.0;
  self->_lockPresentedDropletRadius = 8.0;
  self->_volumeDropletHeight = 100.0;
  self->_volumeDropletWidth = 50.0;
  self->_volumeInitialProtrusionFromEdge = 0.0;
  self->_volumeFlattenedProtrusionFromEdge = 5.0;
  self->_volumePresentedProtrusionFromEdge = 5.0;
  self->_volumeInitialCornerRadius = 21.0;
  self->_volumeFlattenedCornerRadius = 21.0;
  self->_volumePresentedCornerRadius = 21.0;
  self->_volumeInitialDropletRadius = 8.0;
  self->_volumeFlattenedDropletRadius = 8.0;
  self->_volumePresentedDropletRadius = 8.0;
  self->_staccatoDropletHeight = 80.0;
  self->_staccatoDropletWidth = 50.0;
  self->_staccatoInitialProtrusionFromEdge = 0.0;
  self->_staccatoFlattenedProtrusionFromEdge = 5.0;
  self->_staccatoPresentedProtrusionFromEdge = 5.0;
  self->_staccatoInitialCornerRadius = 21.0;
  self->_staccatoFlattenedCornerRadius = 21.0;
  self->_staccatoPresentedCornerRadius = 21.0;
  self->_staccatoInitialDropletRadius = 6.0;
  self->_staccatoFlattenedDropletRadius = 6.0;
  self->_staccatoPresentedDropletRadius = 6.0;
  self->_cameraCaptureDropletHeight = 137.0;
  self->_cameraCaptureDropletWidth = 50.0;
  self->_cameraCaptureInitialProtrusionFromEdge = 0.0;
  self->_cameraCaptureFlattenedProtrusionFromEdge = 5.0;
  self->_cameraCapturePresentedProtrusionFromEdge = 5.0;
  self->_cameraCaptureInitialCornerRadius = 21.0;
  self->_cameraCaptureFlattenedCornerRadius = 21.0;
  self->_cameraCapturePresentedCornerRadius = 21.0;
  self->_cameraCaptureInitialDropletRadius = 8.0;
  self->_cameraCaptureFlattenedDropletRadius = 8.0;
  self->_cameraCapturePresentedDropletRadius = 8.0;
  self->_allButtonKeylineWidth = 1.5;
  -[SBFFluidBehaviorSettings _setDefaultButtonHintGeometryFastValues](self->_centerXBehaviorSettings, "_setDefaultButtonHintGeometryFastValues");
  -[SBFFluidBehaviorSettings setName:](self->_centerXBehaviorSettings, "setName:", CFSTR("centerX"));
  -[SBFFluidBehaviorSettings _setDefaultButtonHintGeometryFastValues](self->_centerYBehaviorSettings, "_setDefaultButtonHintGeometryFastValues");
  -[SBFFluidBehaviorSettings setName:](self->_centerYBehaviorSettings, "setName:", CFSTR("centerY"));
  -[SBFFluidBehaviorSettings _setDefaultButtonHintGeometryFastValues](self->_containerWidthBehaviorSettings, "_setDefaultButtonHintGeometryFastValues");
  -[SBFFluidBehaviorSettings setName:](self->_containerWidthBehaviorSettings, "setName:", CFSTR("containerWidth"));
  -[SBFFluidBehaviorSettings _setDefaultButtonHintGeometryFastValues](self->_containerHeightBehaviorSettings, "_setDefaultButtonHintGeometryFastValues");
  -[SBFFluidBehaviorSettings setName:](self->_containerHeightBehaviorSettings, "setName:", CFSTR("containerHeight"));
  -[SBFFluidBehaviorSettings setDefaultValues](self->_intelligentEdgeLightKeylineStyleBehaviorSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_intelligentEdgeLightKeylineStyleBehaviorSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_intelligentEdgeLightKeylineStyleBehaviorSettings, "setResponse:", 0.2);
  -[SBFFluidBehaviorSettings setBehaviorType:](self->_intelligentEdgeLightKeylineStyleBehaviorSettings, "setBehaviorType:", 1);
  intelligentEdgeLightKeylineStyleBehaviorSettings = self->_intelligentEdgeLightKeylineStyleBehaviorSettings;
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](intelligentEdgeLightKeylineStyleBehaviorSettings, "setFrameRateRange:highFrameRateReason:", 1114149, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
  -[SBFFluidBehaviorSettings setName:](self->_intelligentEdgeLightKeylineStyleBehaviorSettings, "setName:", CFSTR("intelligentEdgeLightHardKeylineStyle"));
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[6];
  _QWORD v70[6];
  _QWORD v71[11];
  _QWORD v72[11];
  _QWORD v73[11];
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  v3 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:action:", CFSTR("Restore Defaults"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v6);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Droplet Height"), CFSTR("lockDropletHeight"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v63;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Droplet Width"), CFSTR("lockDropletWidth"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v59;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Protrusion From Edge"), CFSTR("lockInitialProtrusionFromEdge"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v56;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Flattened Protrusion From Edge"), CFSTR("lockFlattenedProtrusionFromEdge"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v7;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Presented Protrusion From Edge"), CFSTR("lockPresentedProtrusionFromEdge"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v73[4] = v8;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Corner Radius"), CFSTR("lockInitialCornerRadius"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v73[5] = v9;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Flattened Corner Radius"), CFSTR("lockFlattenedCornerRadius"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73[6] = v10;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Presented Corner Radius"), CFSTR("lockPresentedCornerRadius"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v73[7] = v11;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Droplet Radius"), CFSTR("lockInitialDropletRadius"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v73[8] = v12;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Flattened Droplet Radius"), CFSTR("lockFlattenedDropletRadius"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v73[9] = v13;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Presented Droplet Radius"), CFSTR("lockPresentedDropletRadius"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v73[10] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "sectionWithRows:title:", v15, CFSTR("Lock Button"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Droplet Height"), CFSTR("volumeDropletHeight"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v60;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Droplet Width"), CFSTR("volumeDropletWidth"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v57;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Protrusion From Edge"), CFSTR("volumeInitialProtrusionFromEdge"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v54;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Flattened Protrusion From Edge"), CFSTR("volumeFlattenedProtrusionFromEdge"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v16;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Presented Protrusion From Edge"), CFSTR("volumePresentedProtrusionFromEdge"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v17;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Corner Radius"), CFSTR("volumeInitialCornerRadius"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v18;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Flattened Corner Radius"), CFSTR("volumeFlattenedCornerRadius"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v72[6] = v19;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Presented Corner Radius"), CFSTR("volumePresentedCornerRadius"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v72[7] = v20;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Droplet Radius"), CFSTR("volumeInitialDropletRadius"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v72[8] = v21;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Flattened Droplet Radius"), CFSTR("volumeFlattenedDropletRadius"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v72[9] = v22;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Presented Droplet Radius"), CFSTR("volumePresentedDropletRadius"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v72[10] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "sectionWithRows:title:", v24, CFSTR("Volume Button"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Droplet Height"), CFSTR("staccatoDropletHeight"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v58;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Droplet Width"), CFSTR("staccatoDropletWidth"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v55;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Protrusion From Edge"), CFSTR("staccatoInitialProtrusionFromEdge"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v53;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Flattened Protrusion From Edge"), CFSTR("staccatoFlattenedProtrusionFromEdge"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v25;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Presented Protrusion From Edge"), CFSTR("staccatoPresentedProtrusionFromEdge"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v26;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Corner Radius"), CFSTR("staccatoInitialCornerRadius"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v27;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Flattened Corner Radius"), CFSTR("staccatoFlattenedCornerRadius"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v28;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Presented Corner Radius"), CFSTR("staccatoPresentedCornerRadius"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v71[7] = v29;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Initial Droplet Radius"), CFSTR("staccatoInitialDropletRadius"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v71[8] = v30;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Flattened Droplet Radius"), CFSTR("staccatoFlattenedDropletRadius"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v71[9] = v31;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Presented Droplet Radius"), CFSTR("staccatoPresentedDropletRadius"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v71[10] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "sectionWithRows:title:", v33, CFSTR("Staccato Button"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Keyline Width"), CFSTR("allButtonKeylineWidth"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v35;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Center X Behavior Settings"), CFSTR("centerXBehaviorSettings"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v36;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Center Y Behavior Settings"), CFSTR("centerYBehaviorSettings"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v37;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Container Width Behavior Settings"), CFSTR("containerWidthBehaviorSettings"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v38;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Container Height Behavior Settings"), CFSTR("containerHeightBehaviorSettings"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v39;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Intelligent Edge Light Keyline Style Behavior Settings"), CFSTR("intelligentEdgeLightKeylineStyleBehaviorSettings"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v70[5] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sectionWithRows:title:", v41, CFSTR("Settings for All Buttons"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 20;
  do
  {
    v45 = (void *)MEMORY[0x1E0D83008];
    objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "rowWithTitle:action:", CFSTR("Restore Defaults"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v47);

    --v44;
  }
  while (v44);
  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v43, CFSTR("Workaround Keyboard Bug"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)MEMORY[0x1E0D83070];
  v69[0] = v68;
  v69[1] = v67;
  v69[2] = v65;
  v69[3] = v62;
  v69[4] = v42;
  v69[5] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 6);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "moduleWithTitle:contents:", CFSTR("Hardware Button Hint"), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return v51;
}

- (double)lockDropletHeight
{
  return self->_lockDropletHeight;
}

- (void)setLockDropletHeight:(double)a3
{
  self->_lockDropletHeight = a3;
}

- (double)lockDropletWidth
{
  return self->_lockDropletWidth;
}

- (void)setLockDropletWidth:(double)a3
{
  self->_lockDropletWidth = a3;
}

- (double)lockInitialProtrusionFromEdge
{
  return self->_lockInitialProtrusionFromEdge;
}

- (void)setLockInitialProtrusionFromEdge:(double)a3
{
  self->_lockInitialProtrusionFromEdge = a3;
}

- (double)lockFlattenedProtrusionFromEdge
{
  return self->_lockFlattenedProtrusionFromEdge;
}

- (void)setLockFlattenedProtrusionFromEdge:(double)a3
{
  self->_lockFlattenedProtrusionFromEdge = a3;
}

- (double)lockPresentedProtrusionFromEdge
{
  return self->_lockPresentedProtrusionFromEdge;
}

- (void)setLockPresentedProtrusionFromEdge:(double)a3
{
  self->_lockPresentedProtrusionFromEdge = a3;
}

- (double)lockInitialCornerRadius
{
  return self->_lockInitialCornerRadius;
}

- (void)setLockInitialCornerRadius:(double)a3
{
  self->_lockInitialCornerRadius = a3;
}

- (double)lockFlattenedCornerRadius
{
  return self->_lockFlattenedCornerRadius;
}

- (void)setLockFlattenedCornerRadius:(double)a3
{
  self->_lockFlattenedCornerRadius = a3;
}

- (double)lockPresentedCornerRadius
{
  return self->_lockPresentedCornerRadius;
}

- (void)setLockPresentedCornerRadius:(double)a3
{
  self->_lockPresentedCornerRadius = a3;
}

- (double)lockInitialDropletRadius
{
  return self->_lockInitialDropletRadius;
}

- (void)setLockInitialDropletRadius:(double)a3
{
  self->_lockInitialDropletRadius = a3;
}

- (double)lockFlattenedDropletRadius
{
  return self->_lockFlattenedDropletRadius;
}

- (void)setLockFlattenedDropletRadius:(double)a3
{
  self->_lockFlattenedDropletRadius = a3;
}

- (double)lockPresentedDropletRadius
{
  return self->_lockPresentedDropletRadius;
}

- (void)setLockPresentedDropletRadius:(double)a3
{
  self->_lockPresentedDropletRadius = a3;
}

- (double)volumeDropletHeight
{
  return self->_volumeDropletHeight;
}

- (void)setVolumeDropletHeight:(double)a3
{
  self->_volumeDropletHeight = a3;
}

- (double)volumeDropletWidth
{
  return self->_volumeDropletWidth;
}

- (void)setVolumeDropletWidth:(double)a3
{
  self->_volumeDropletWidth = a3;
}

- (double)volumeInitialProtrusionFromEdge
{
  return self->_volumeInitialProtrusionFromEdge;
}

- (void)setVolumeInitialProtrusionFromEdge:(double)a3
{
  self->_volumeInitialProtrusionFromEdge = a3;
}

- (double)volumeFlattenedProtrusionFromEdge
{
  return self->_volumeFlattenedProtrusionFromEdge;
}

- (void)setVolumeFlattenedProtrusionFromEdge:(double)a3
{
  self->_volumeFlattenedProtrusionFromEdge = a3;
}

- (double)volumePresentedProtrusionFromEdge
{
  return self->_volumePresentedProtrusionFromEdge;
}

- (void)setVolumePresentedProtrusionFromEdge:(double)a3
{
  self->_volumePresentedProtrusionFromEdge = a3;
}

- (double)volumeInitialCornerRadius
{
  return self->_volumeInitialCornerRadius;
}

- (void)setVolumeInitialCornerRadius:(double)a3
{
  self->_volumeInitialCornerRadius = a3;
}

- (double)volumeFlattenedCornerRadius
{
  return self->_volumeFlattenedCornerRadius;
}

- (void)setVolumeFlattenedCornerRadius:(double)a3
{
  self->_volumeFlattenedCornerRadius = a3;
}

- (double)volumePresentedCornerRadius
{
  return self->_volumePresentedCornerRadius;
}

- (void)setVolumePresentedCornerRadius:(double)a3
{
  self->_volumePresentedCornerRadius = a3;
}

- (double)volumeInitialDropletRadius
{
  return self->_volumeInitialDropletRadius;
}

- (void)setVolumeInitialDropletRadius:(double)a3
{
  self->_volumeInitialDropletRadius = a3;
}

- (double)volumeFlattenedDropletRadius
{
  return self->_volumeFlattenedDropletRadius;
}

- (void)setVolumeFlattenedDropletRadius:(double)a3
{
  self->_volumeFlattenedDropletRadius = a3;
}

- (double)volumePresentedDropletRadius
{
  return self->_volumePresentedDropletRadius;
}

- (void)setVolumePresentedDropletRadius:(double)a3
{
  self->_volumePresentedDropletRadius = a3;
}

- (double)staccatoDropletHeight
{
  return self->_staccatoDropletHeight;
}

- (void)setStaccatoDropletHeight:(double)a3
{
  self->_staccatoDropletHeight = a3;
}

- (double)staccatoDropletWidth
{
  return self->_staccatoDropletWidth;
}

- (void)setStaccatoDropletWidth:(double)a3
{
  self->_staccatoDropletWidth = a3;
}

- (double)staccatoInitialProtrusionFromEdge
{
  return self->_staccatoInitialProtrusionFromEdge;
}

- (void)setStaccatoInitialProtrusionFromEdge:(double)a3
{
  self->_staccatoInitialProtrusionFromEdge = a3;
}

- (double)staccatoFlattenedProtrusionFromEdge
{
  return self->_staccatoFlattenedProtrusionFromEdge;
}

- (void)setStaccatoFlattenedProtrusionFromEdge:(double)a3
{
  self->_staccatoFlattenedProtrusionFromEdge = a3;
}

- (double)staccatoPresentedProtrusionFromEdge
{
  return self->_staccatoPresentedProtrusionFromEdge;
}

- (void)setStaccatoPresentedProtrusionFromEdge:(double)a3
{
  self->_staccatoPresentedProtrusionFromEdge = a3;
}

- (double)staccatoInitialCornerRadius
{
  return self->_staccatoInitialCornerRadius;
}

- (void)setStaccatoInitialCornerRadius:(double)a3
{
  self->_staccatoInitialCornerRadius = a3;
}

- (double)staccatoFlattenedCornerRadius
{
  return self->_staccatoFlattenedCornerRadius;
}

- (void)setStaccatoFlattenedCornerRadius:(double)a3
{
  self->_staccatoFlattenedCornerRadius = a3;
}

- (double)staccatoPresentedCornerRadius
{
  return self->_staccatoPresentedCornerRadius;
}

- (void)setStaccatoPresentedCornerRadius:(double)a3
{
  self->_staccatoPresentedCornerRadius = a3;
}

- (double)staccatoInitialDropletRadius
{
  return self->_staccatoInitialDropletRadius;
}

- (void)setStaccatoInitialDropletRadius:(double)a3
{
  self->_staccatoInitialDropletRadius = a3;
}

- (double)staccatoFlattenedDropletRadius
{
  return self->_staccatoFlattenedDropletRadius;
}

- (void)setStaccatoFlattenedDropletRadius:(double)a3
{
  self->_staccatoFlattenedDropletRadius = a3;
}

- (double)staccatoPresentedDropletRadius
{
  return self->_staccatoPresentedDropletRadius;
}

- (void)setStaccatoPresentedDropletRadius:(double)a3
{
  self->_staccatoPresentedDropletRadius = a3;
}

- (double)cameraCaptureDropletHeight
{
  return self->_cameraCaptureDropletHeight;
}

- (void)setCameraCaptureDropletHeight:(double)a3
{
  self->_cameraCaptureDropletHeight = a3;
}

- (double)cameraCaptureDropletWidth
{
  return self->_cameraCaptureDropletWidth;
}

- (void)setCameraCaptureDropletWidth:(double)a3
{
  self->_cameraCaptureDropletWidth = a3;
}

- (double)cameraCaptureInitialProtrusionFromEdge
{
  return self->_cameraCaptureInitialProtrusionFromEdge;
}

- (void)setCameraCaptureInitialProtrusionFromEdge:(double)a3
{
  self->_cameraCaptureInitialProtrusionFromEdge = a3;
}

- (double)cameraCaptureFlattenedProtrusionFromEdge
{
  return self->_cameraCaptureFlattenedProtrusionFromEdge;
}

- (void)setCameraCaptureFlattenedProtrusionFromEdge:(double)a3
{
  self->_cameraCaptureFlattenedProtrusionFromEdge = a3;
}

- (double)cameraCapturePresentedProtrusionFromEdge
{
  return self->_cameraCapturePresentedProtrusionFromEdge;
}

- (void)setCameraCapturePresentedProtrusionFromEdge:(double)a3
{
  self->_cameraCapturePresentedProtrusionFromEdge = a3;
}

- (double)cameraCaptureInitialCornerRadius
{
  return self->_cameraCaptureInitialCornerRadius;
}

- (void)setCameraCaptureInitialCornerRadius:(double)a3
{
  self->_cameraCaptureInitialCornerRadius = a3;
}

- (double)cameraCaptureFlattenedCornerRadius
{
  return self->_cameraCaptureFlattenedCornerRadius;
}

- (void)setCameraCaptureFlattenedCornerRadius:(double)a3
{
  self->_cameraCaptureFlattenedCornerRadius = a3;
}

- (double)cameraCapturePresentedCornerRadius
{
  return self->_cameraCapturePresentedCornerRadius;
}

- (void)setCameraCapturePresentedCornerRadius:(double)a3
{
  self->_cameraCapturePresentedCornerRadius = a3;
}

- (double)cameraCaptureInitialDropletRadius
{
  return self->_cameraCaptureInitialDropletRadius;
}

- (void)setCameraCaptureInitialDropletRadius:(double)a3
{
  self->_cameraCaptureInitialDropletRadius = a3;
}

- (double)cameraCaptureFlattenedDropletRadius
{
  return self->_cameraCaptureFlattenedDropletRadius;
}

- (void)setCameraCaptureFlattenedDropletRadius:(double)a3
{
  self->_cameraCaptureFlattenedDropletRadius = a3;
}

- (double)cameraCapturePresentedDropletRadius
{
  return self->_cameraCapturePresentedDropletRadius;
}

- (void)setCameraCapturePresentedDropletRadius:(double)a3
{
  self->_cameraCapturePresentedDropletRadius = a3;
}

- (double)allButtonKeylineWidth
{
  return self->_allButtonKeylineWidth;
}

- (void)setAllButtonKeylineWidth:(double)a3
{
  self->_allButtonKeylineWidth = a3;
}

- (SBFFluidBehaviorSettings)centerXBehaviorSettings
{
  return self->_centerXBehaviorSettings;
}

- (void)setCenterXBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_centerXBehaviorSettings, a3);
}

- (SBFFluidBehaviorSettings)centerYBehaviorSettings
{
  return self->_centerYBehaviorSettings;
}

- (void)setCenterYBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_centerYBehaviorSettings, a3);
}

- (SBFFluidBehaviorSettings)containerWidthBehaviorSettings
{
  return self->_containerWidthBehaviorSettings;
}

- (void)setContainerWidthBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_containerWidthBehaviorSettings, a3);
}

- (SBFFluidBehaviorSettings)containerHeightBehaviorSettings
{
  return self->_containerHeightBehaviorSettings;
}

- (void)setContainerHeightBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_containerHeightBehaviorSettings, a3);
}

- (SBFFluidBehaviorSettings)intelligentEdgeLightKeylineStyleBehaviorSettings
{
  return self->_intelligentEdgeLightKeylineStyleBehaviorSettings;
}

- (void)setIntelligentEdgeLightKeylineStyleBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_intelligentEdgeLightKeylineStyleBehaviorSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intelligentEdgeLightKeylineStyleBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_containerHeightBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_containerWidthBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_centerYBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_centerXBehaviorSettings, 0);
}

@end
