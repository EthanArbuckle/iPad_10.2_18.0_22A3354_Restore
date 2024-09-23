@implementation UISlotId

void __28___UISlotId_snapshotContext__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", CFSTR("SnapshotContext"), *MEMORY[0x1E0CD2A20]);
  objc_msgSend(v2, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD2A40]);
  objc_msgSend(MEMORY[0x1E0CD2720], "remoteContextWithOptions:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7F938;
  qword_1ECD7F938 = v0;

}

@end
