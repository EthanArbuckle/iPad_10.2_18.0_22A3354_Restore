@implementation ArticleSharingActivityOptionsProvider

- (int64_t)articleActivityOptionsForHeadline:(id)a3
{
  char v3;

  __swift_project_boxed_opaque_existential_1(self->featureAvailability, *(_QWORD *)&self->featureAvailability[24]);
  swift_unknownObjectRetain();
  swift_retain();
  v3 = sub_1DC400BEC();
  swift_unknownObjectRelease();
  swift_release();
  if ((v3 & 1) != 0)
    return 124;
  else
    return 88;
}

@end
