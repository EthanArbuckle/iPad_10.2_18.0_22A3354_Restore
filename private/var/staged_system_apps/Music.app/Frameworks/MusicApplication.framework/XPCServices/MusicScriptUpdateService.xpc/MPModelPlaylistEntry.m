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
  return (NSString *)sub_100214CCC(self, (uint64_t)a2, (void (*)(void))sub_1002146F8);
}

@end
