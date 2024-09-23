@implementation EmptyStateView

- (NSString)title
{
  return (NSString *)sub_10017D200((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps14EmptyStateView_titleLabel);
}

- (void)setTitle:(id)a3
{
  sub_10017D298((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC4Maps14EmptyStateView_titleLabel);
}

- (NSString)subtitle
{
  return (NSString *)sub_10017D200((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps14EmptyStateView_subtitleLabel);
}

- (void)setSubtitle:(id)a3
{
  sub_10017D298((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC4Maps14EmptyStateView_subtitleLabel);
}

- (NSAttributedString)attributedSubtitle
{
  return (NSAttributedString *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Maps14EmptyStateView_subtitleLabel), "attributedText");
}

- (void)setAttributedSubtitle:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps14EmptyStateView_subtitleLabel), "setAttributedText:", a3);
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC4Maps14EmptyStateView_image));
}

- (void)setImage:(id)a3
{
  sub_10017D51C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC4Maps14EmptyStateView_image, (void (*)(void *))sub_10017D39C);
}

- (UIButton)button
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC4Maps14EmptyStateView_button));
}

- (void)setButton:(id)a3
{
  sub_10017D51C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC4Maps14EmptyStateView_button, sub_10017D580);
}

- (NSString)disclosureTitle
{
  return (NSString *)sub_10009F538((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureTitle);
}

- (void)setDisclosureTitle:(id)a3
{
  sub_10017DF4C((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureTitle, (void (*)(uint64_t))sub_10017DD84);
}

- (NSString)disclosureSubtitle
{
  return (NSString *)sub_10009F538((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureSubtitle);
}

- (void)setDisclosureSubtitle:(id)a3
{
  sub_10017DF4C((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureSubtitle, (void (*)(uint64_t))sub_10017DFC4);
}

- (id)disclosureAction
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction))
    return 0;
  v2 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction];
  v5[4] = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction);
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_1001BB8D4;
  v5[3] = &unk_1011A7278;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setDisclosureAction:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_1011A7260, 24, 7);
    v4[2] = v5;
    v6 = sub_1000268B4;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction);
  v9 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction);
  v8 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_10000BF74(v9, v8);
}

- (_TtC4Maps14EmptyStateView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps14EmptyStateView *)sub_10017E19C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps14EmptyStateView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10017F420();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureModel;
  v4 = type metadata accessor for UIListContentConfiguration(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC4Maps14EmptyStateView_imageConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC4Maps14EmptyStateView_noImageConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC4Maps14EmptyStateView__bottomVerticalConstraints));

  swift_bridgeObjectRelease(*(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureSubtitle]);
  sub_10000BF74(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction]);
}

- (void)_pressedDisclosureCell
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC4Maps14EmptyStateView *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction);
  if (v2)
  {
    v3 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction];
    v5 = self;
    v4 = sub_10000C128((uint64_t)v2, v3);
    v2(v4);
    sub_10000BF74((uint64_t)v2, v3);

  }
}

@end
