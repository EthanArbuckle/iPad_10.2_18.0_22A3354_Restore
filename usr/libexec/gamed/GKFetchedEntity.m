@implementation GKFetchedEntity

- (NSString)debugDescription
{
  return (NSString *)sub_10018E29C(self, (uint64_t)a2, (void (*)(void))sub_100189F8C);
}

- (GKFetchedEntity)init
{
  sub_10018A0EC();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKFetchedEntity_entity));
}

@end
