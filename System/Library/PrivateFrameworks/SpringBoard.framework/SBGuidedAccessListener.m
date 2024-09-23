@implementation SBGuidedAccessListener

+ (id)sharedGuidedAccessListener
{
  _QWORD block[5];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SBGuidedAccessListener_sharedGuidedAccessListener__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGuidedAccessListener_onceToken != -1)
    dispatch_once(&sharedGuidedAccessListener_onceToken, block);
  return (id)sharedGuidedAccessListener___sharedGuidedAccessListener;
}

void __52__SBGuidedAccessListener_sharedGuidedAccessListener__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGuidedAccessListener___sharedGuidedAccessListener;
  sharedGuidedAccessListener___sharedGuidedAccessListener = (uint64_t)v1;

}

- (SBGuidedAccessListener)init
{
  SBGuidedAccessListener *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBGuidedAccessListener;
  v2 = -[SBGuidedAccessListener init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_guidedAccessWasActivated, *MEMORY[0x1E0DDE0F0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_guidedAccessWasDeactivated, *MEMORY[0x1E0DDE0F8], 0);

  }
  return v2;
}

- (void)guidedAccessWasActivated
{
  id v2;

  self->_isGuidedAccessActive = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SBGuidedAccessActivationChangedNotification"), 0);

}

- (void)guidedAccessWasDeactivated
{
  id v2;

  self->_isGuidedAccessActive = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SBGuidedAccessActivationChangedNotification"), 0);

}

- (BOOL)isGuidedAccessActive
{
  return self->_isGuidedAccessActive;
}

- (void)setIsGuidedAccessActive:(BOOL)a3
{
  self->_isGuidedAccessActive = a3;
}

@end
