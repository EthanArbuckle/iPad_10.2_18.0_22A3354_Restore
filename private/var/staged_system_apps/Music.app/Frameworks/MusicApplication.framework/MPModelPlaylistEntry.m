@implementation MPModelPlaylistEntry

- (MPModelObject)innermostModelObject
{
  MPModelPlaylistEntry *v2;
  id v3;

  v2 = self;
  v3 = MPModelPlaylistEntry.innermostModelObject.getter();

  return (MPModelObject *)v3;
}

- (NSString)shortDescription
{
  return (NSString *)sub_D9B75C(self, (uint64_t)a2, (void (*)(void))sub_D9B188);
}

@end
