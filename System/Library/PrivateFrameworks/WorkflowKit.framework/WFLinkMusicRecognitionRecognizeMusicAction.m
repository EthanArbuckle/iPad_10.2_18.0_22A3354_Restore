@implementation WFLinkMusicRecognitionRecognizeMusicAction

- (id)sessionKitToastDurationsPerRunSourceDefinition
{
  uint64_t v2;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC84B0];
  v4[0] = *MEMORY[0x1E0DC8450];
  v4[1] = v2;
  v5[0] = &unk_1E7B8B2C0;
  v5[1] = &unk_1E7B8B2C0;
  v4[2] = *MEMORY[0x1E0DC84A8];
  v5[2] = &unk_1E7B8B2D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
