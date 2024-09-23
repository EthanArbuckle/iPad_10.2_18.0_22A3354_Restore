@implementation IsSystemSoundEnabled

void __IsSystemSoundEnabled_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  if (qword_1ECD7E478 != -1)
    dispatch_once(&qword_1ECD7E478, &__block_literal_global_417_0);
  v0 = (id)qword_1ECD7E470;
  objc_opt_self();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObserver:forKeyPath:options:context:", v1, CFSTR("keyboard-audio"), 0, _KVOContext);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_invalidateSystemSoundEnablement, CFSTR("UIApplicationResumedNotification"), 0);

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_invalidateSystemSoundEnablement, CFSTR("UIApplicationResumedEventsOnlyNotification"), 0);

}

@end
