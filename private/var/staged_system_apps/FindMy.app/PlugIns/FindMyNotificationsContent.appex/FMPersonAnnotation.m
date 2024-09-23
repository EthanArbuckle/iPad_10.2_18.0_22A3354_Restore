@implementation FMPersonAnnotation

- (void).cxx_destruct
{
  sub_1000071F0((uint64_t)self + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_person, &qword_10001AA28);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_personImage));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_updateQueue));
}

@end
