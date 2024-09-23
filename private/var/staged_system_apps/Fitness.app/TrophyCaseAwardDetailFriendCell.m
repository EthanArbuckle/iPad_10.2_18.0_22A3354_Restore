@implementation TrophyCaseAwardDetailFriendCell

- (_TtC10FitnessApp31TrophyCaseAwardDetailFriendCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp31TrophyCaseAwardDetailFriendCell *)sub_1004D8F14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp31TrophyCaseAwardDetailFriendCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004DA070();
}

- (void)prepareForReuse
{
  _TtC10FitnessApp31TrophyCaseAwardDetailFriendCell *v2;

  v2 = self;
  sub_1004D9E10();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseAwardDetailFriendCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseAwardDetailFriendCell_avatarImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseAwardDetailFriendCell_fallbackAvatarView));
}

@end
