@implementation PUAudioMixModeCollectionViewCell

- (_TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell *)sub_1AAC15C4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isSelected
{
  _TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AAC15E6C((SEL *)&selRef_isSelected);

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  _TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell *v4;

  v4 = self;
  sub_1AAC15EEC(a3, (SEL *)&selRef_setSelected_);

}

- (BOOL)isHighlighted
{
  _TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AAC15E6C((SEL *)&selRef_isHighlighted);

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell *v4;

  v4 = self;
  sub_1AAC15EEC(a3, (SEL *)&selRef_setHighlighted_);

}

- (void)layoutSubviews
{
  _TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell *v2;

  v2 = self;
  sub_1AAC16030();

}

- (_TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAC164B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivateP33_8BF9023972CBF50D2A1FAA417D58CBA832PUAudioMixModeCollectionViewCell_labelBackground));
}

@end
