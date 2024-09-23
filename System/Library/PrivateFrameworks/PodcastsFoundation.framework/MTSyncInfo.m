@implementation MTSyncInfo

+ (id)predicateForHasNoInverseRelation
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL && %K == NULL && %K == NULL"), CFSTR("episode"), CFSTR("playlist"), CFSTR("podcast"));
}

+ (id)predicateForIsCurrentlySyncable:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("%K == %@");
  else
    v3 = CFSTR("%K != %@");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v3, CFSTR("syncability"), &unk_1E5538C18);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
