@implementation TVREventHaptic

- (void)playSelectionEventHaptic
{
  UISelectionFeedbackGenerator *v3;
  UISelectionFeedbackGenerator *selectionFeedbackGenerator;
  _QWORD block[5];

  if (!self->_selectionFeedbackGenerator)
  {
    v3 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x24BEBD940]);
    selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
    self->_selectionFeedbackGenerator = v3;

    -[UISelectionFeedbackGenerator prepare](self->_selectionFeedbackGenerator, "prepare");
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__TVREventHaptic_playSelectionEventHaptic__block_invoke;
  block[3] = &unk_24DE2C198;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __42__TVREventHaptic_playSelectionEventHaptic__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "selectionChanged");
}

- (void)playImpactEventHaptic
{
  UIImpactFeedbackGenerator *v3;
  UIImpactFeedbackGenerator *impactFeedbackGenerator;
  _QWORD block[5];

  if (!self->_impactFeedbackGenerator)
  {
    v3 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD670]), "initWithStyle:", 0);
    impactFeedbackGenerator = self->_impactFeedbackGenerator;
    self->_impactFeedbackGenerator = v3;

    -[UIImpactFeedbackGenerator prepare](self->_impactFeedbackGenerator, "prepare");
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__TVREventHaptic_playImpactEventHaptic__block_invoke;
  block[3] = &unk_24DE2C198;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __39__TVREventHaptic_playImpactEventHaptic__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "impactOccurred");
}

- (void)playSuccessEventHaptic
{
  UINotificationFeedbackGenerator *v3;
  UINotificationFeedbackGenerator *notificationFeedbackGenerator;
  _QWORD block[5];

  if (!self->_notificationFeedbackGenerator)
  {
    v3 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x24BEBD7B8]);
    notificationFeedbackGenerator = self->_notificationFeedbackGenerator;
    self->_notificationFeedbackGenerator = v3;

    -[UINotificationFeedbackGenerator prepare](self->_notificationFeedbackGenerator, "prepare");
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__TVREventHaptic_playSuccessEventHaptic__block_invoke;
  block[3] = &unk_24DE2C198;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __40__TVREventHaptic_playSuccessEventHaptic__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "notificationOccurred:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
}

@end
