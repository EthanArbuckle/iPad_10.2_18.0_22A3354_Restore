@implementation SBSystemNotesInteractionSettings

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSystemNotesInteractionSettings;
  -[SBPIPInteractionSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[SBPIPInteractionSettings setShouldStashOnTransitionToSwitcher:](self, "setShouldStashOnTransitionToSwitcher:", 1);
  -[SBPIPInteractionSettings setShouldUnstashOnTransitionFromSwitcher:](self, "setShouldUnstashOnTransitionFromSwitcher:", 1);
  -[SBPIPInteractionSettings setShouldStashOnTransitionToHomescreen:](self, "setShouldStashOnTransitionToHomescreen:", 1);
  -[SBPIPInteractionSettings setShouldUnstashOnTransitionFromHomescreen:](self, "setShouldUnstashOnTransitionFromHomescreen:", 0);
  -[SBPIPInteractionSettings setShouldStashOnAppToAppTransitions:](self, "setShouldStashOnAppToAppTransitions:", 0);
  -[SBPIPInteractionSettings setUsesKeyboards:](self, "setUsesKeyboards:", 1);
  -[SBPIPInteractionSettings setKeyboardDismissesOnTransitionToHomescreen:](self, "setKeyboardDismissesOnTransitionToHomescreen:", 1);
  -[SBPIPInteractionSettings setKeyboardDismissesOnOutsideUserInteractionOnHomescreen:](self, "setKeyboardDismissesOnOutsideUserInteractionOnHomescreen:", 1);
  -[SBPIPInteractionSettings setKeyboardDismissesOnOutsideUserInteractionOutsideHomescreen:](self, "setKeyboardDismissesOnOutsideUserInteractionOutsideHomescreen:", 0);
  -[SBSystemNotesInteractionSettings setDelayBeforeUserInteractionDismissesThumbnail:](self, "setDelayBeforeUserInteractionDismissesThumbnail:", 3.0);
  -[SBPIPInteractionSettings setPanGestureEnabled:](self, "setPanGestureEnabled:", 1);
  -[SBPIPInteractionSettings setEdgeResizeGestureEnabled:](self, "setEdgeResizeGestureEnabled:", 1);
  -[SBPIPInteractionSettings setPinchGestureEnabled:](self, "setPinchGestureEnabled:", 1);
  -[SBPIPInteractionSettings setRotationGestureEnabled:](self, "setRotationGestureEnabled:", 1);
  -[SBPIPInteractionSettings setStashingEnabled:](self, "setStashingEnabled:", 1);
  -[SBPIPInteractionSettings setFreePositioning:](self, "setFreePositioning:", 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v3, "setName:", CFSTR("Region Update Behavior"));
  objc_msgSend(v3, "setBehaviorType:", 2);
  objc_msgSend(v3, "setDampingRatio:", 0.9);
  objc_msgSend(v3, "setResponse:", 0.55);
  -[SBPIPInteractionSettings setRegionUpdateFluidBehavior:](self, "setRegionUpdateFluidBehavior:", v3);

}

+ (id)settingsControllerModule
{
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
  objc_super v20;
  _QWORD v21[3];
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D83070];
  v4 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:action:", CFSTR("Restore Defaults"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v7, CFSTR("Restore Default Values"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Delay Before Outside User Interaction Dismisses Thumbnail"), CFSTR("delayBeforeUserInteractionDismissesThumbnail"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.0, 10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83070];
  v22 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v12, CFSTR("User Interaction Dismissal Behavior"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___SBSystemNotesInteractionSettings;
  objc_msgSendSuper2(&v20, sel_settingsControllerModule);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83070], "submoduleWithModule:childSettingsKeyPath:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D83070];
  v21[0] = v8;
  v21[1] = v13;
  v21[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moduleWithTitle:contents:", CFSTR("Interaction Settings"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (double)delayBeforeUserInteractionDismissesThumbnail
{
  return self->_delayBeforeUserInteractionDismissesThumbnail;
}

- (void)setDelayBeforeUserInteractionDismissesThumbnail:(double)a3
{
  self->_delayBeforeUserInteractionDismissesThumbnail = a3;
}

@end
