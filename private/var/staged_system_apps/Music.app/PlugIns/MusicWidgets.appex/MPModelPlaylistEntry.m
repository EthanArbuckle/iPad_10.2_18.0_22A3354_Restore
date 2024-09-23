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
  return (NSString *)sub_1002B4E38(self, (uint64_t)a2, (void (*)(void))sub_1002B4864);
}

@end
