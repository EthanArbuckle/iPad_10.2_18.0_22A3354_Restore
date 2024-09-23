@implementation WFMutableWorkflowUser

- (NSString)email
{
  return self->email;
}

- (void)setEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)fullName
{
  return self->fullName;
}

- (void)setFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)twitter
{
  return self->twitter;
}

- (void)setTwitter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)websiteURL
{
  return self->websiteURL;
}

- (void)setWebsiteURL:(id)a3
{
  objc_storeStrong((id *)&self->websiteURL, a3);
}

- (NSURL)profileImageURL
{
  return self->profileImageURL;
}

- (void)setProfileImageURL:(id)a3
{
  objc_storeStrong((id *)&self->profileImageURL, a3);
}

- (int64_t)mainIdentity
{
  return self->mainIdentity;
}

- (void)setMainIdentity:(int64_t)a3
{
  self->mainIdentity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->profileImageURL, 0);
  objc_storeStrong((id *)&self->websiteURL, 0);
  objc_storeStrong((id *)&self->twitter, 0);
  objc_storeStrong((id *)&self->fullName, 0);
  objc_storeStrong((id *)&self->email, 0);
}

@end
