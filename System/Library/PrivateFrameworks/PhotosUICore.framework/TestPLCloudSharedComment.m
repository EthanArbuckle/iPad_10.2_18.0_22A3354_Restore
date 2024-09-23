@implementation TestPLCloudSharedComment

- (id)isMyComment
{
  return &unk_1E53EED00;
}

- (id)commenterEmail
{
  return CFSTR("Mock.User@test.com");
}

- (id)commenterFirstName
{
  return CFSTR("Mock");
}

- (id)commenterLastName
{
  return CFSTR("User");
}

- (id)commenterFullName
{
  return CFSTR("Mock User");
}

- (id)commentText
{
  return CFSTR("Mock comment");
}

@end
