@implementation PXPhotoKitAssetActionManager(AdditionalActionPerformersHook)

- (uint64_t)px_registerAdditionalPerformerClasses
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&off_1EED3AF50;
  objc_msgSendSuper2(&v3, sel_px_registerAdditionalPerformerClasses);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7C0D0]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7C0E8]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7BFB8]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7BFC0]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7C088]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7C0C8]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7BFD8]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7BFF8]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7BFF0]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7BFE8]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7BFE0]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7BF80]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7BF90]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7BFA8]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7BF88]);
  objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7C018]);
  return objc_msgSend(a1, "registerPerformerClass:forType:", objc_opt_class(), *MEMORY[0x1E0D7C050]);
}

@end
