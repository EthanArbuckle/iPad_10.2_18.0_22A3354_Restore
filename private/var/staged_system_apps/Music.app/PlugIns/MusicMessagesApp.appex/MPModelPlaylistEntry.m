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
  return (NSString *)sub_100234080(self, (uint64_t)a2, (void (*)(void))sub_100233AAC);
}

@end
