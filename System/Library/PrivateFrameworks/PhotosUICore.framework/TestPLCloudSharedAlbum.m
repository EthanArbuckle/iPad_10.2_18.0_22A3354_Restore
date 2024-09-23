@implementation TestPLCloudSharedAlbum

- (id)localizedTitle
{
  return CFSTR("Mock Shared Album");
}

- (id)cloudOwnerDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4
{
  return CFSTR("Mock User");
}

- (BOOL)cloudOwnerIsWhitelisted
{
  return 1;
}

- (id)cloudOwnerEmail
{
  return CFSTR("test@test.com");
}

- (id)cloudOwnerFirstName
{
  return CFSTR("Johnny");
}

- (id)cloudOwnerLastName
{
  return CFSTR("Appleseed");
}

- (id)cloudGUID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
