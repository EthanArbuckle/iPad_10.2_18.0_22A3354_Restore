@implementation CKShareParticipant

void __67__CKShareParticipant_WBSUICKShareParticipantExtras__safari_contact__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  v1 = objc_alloc_init(MEMORY[0x1E0C97470]);
  objc_msgSend(v1, "descriptorForRequiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)safari_contact_keyDescriptors;
  safari_contact_keyDescriptors = v3;

}

@end
