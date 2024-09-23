@implementation QuickReplyView

+ (double)defaultHeight
{
  swift_getObjCClassMetadata(a1);
  swift_getObjCClassMetadata(a1);
  return static QuickReplyView.defaultHeight.getter();
}

+ (double)innerVerticalPadding
{
  swift_getObjCClassMetadata(a1);
  swift_getObjCClassMetadata(a1);
  return static QuickReplyView.innerVerticalPadding.getter();
}

+ (double)horizontalPadding
{
  swift_getObjCClassMetadata(a1);
  swift_getObjCClassMetadata(a1);
  return static QuickReplyView.horizontalPadding.getter();
}

+ (double)cornerRadius
{
  swift_getObjCClassMetadata(a1);
  swift_getObjCClassMetadata(a1);
  return static QuickReplyView.cornerRadius.getter();
}

- (_TtP10MobileMail22QuickReplyViewDelegate_)delegate
{
  _TtC10MobileMail14QuickReplyView *v2;
  id v5;

  v2 = self;
  v5 = (id)QuickReplyView.delegate.getter();

  return (_TtP10MobileMail22QuickReplyViewDelegate_ *)v5;
}

- (void)setDelegate:(id)a3
{
  _TtC10MobileMail14QuickReplyView *v4;

  swift_unknownObjectRetain(a3);
  v4 = self;
  QuickReplyView.delegate.setter((uint64_t)a3);

}

- (double)horizontalInset
{
  _TtC10MobileMail14QuickReplyView *v2;
  double v5;

  v2 = self;
  v5 = QuickReplyView.horizontalInset.getter();

  return v5;
}

- (void)setHorizontalInset:(double)a3
{
  _TtC10MobileMail14QuickReplyView *v3;

  v3 = self;
  QuickReplyView.horizontalInset.setter(a3);

}

- (double)topInset
{
  _TtC10MobileMail14QuickReplyView *v2;
  double v5;

  v2 = self;
  v5 = QuickReplyView.topInset.getter();

  return v5;
}

- (void)setTopInset:(double)a3
{
  _TtC10MobileMail14QuickReplyView *v3;

  v3 = self;
  QuickReplyView.topInset.setter(a3);

}

- (double)bottomInset
{
  _TtC10MobileMail14QuickReplyView *v2;
  double v5;

  v2 = self;
  v5 = QuickReplyView.bottomInset.getter();

  return v5;
}

- (void)setBottomInset:(double)a3
{
  _TtC10MobileMail14QuickReplyView *v3;

  v3 = self;
  QuickReplyView.bottomInset.setter(a3);

}

- (UIView)animationSourceView
{
  _TtC10MobileMail14QuickReplyView *v2;
  id v5;

  v2 = self;
  v5 = QuickReplyView.animationSourceView.getter();

  return (UIView *)v5;
}

- (BOOL)isComposing
{
  _TtC10MobileMail14QuickReplyView *v2;
  BOOL v5;

  v2 = self;
  v5 = QuickReplyView.isComposing.getter();

  return _convertBoolToObjCBool(_:)(v5) & 1;
}

- (UIView)contentView
{
  _TtC10MobileMail14QuickReplyView *v2;
  id v5;

  v2 = self;
  v5 = QuickReplyView.contentView.getter();

  return (UIView *)v5;
}

- (void)setContentView:(id)a3
{
  id v4;
  _TtC10MobileMail14QuickReplyView *v5;

  v4 = a3;
  v5 = self;
  QuickReplyView.contentView.setter(a3);

}

- (_TtC10MobileMail14QuickReplyView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail14QuickReplyView *)QuickReplyView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail14QuickReplyView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100310EF8();
}

- (void)layoutSubviews
{
  _TtC10MobileMail14QuickReplyView *v2;

  v2 = self;
  QuickReplyView.layoutSubviews()();

}

- (void)prepareForReuse
{
  _TtC10MobileMail14QuickReplyView *v2;

  v2 = self;
  QuickReplyView.prepareForReuse()();

}

- (void)resetWithReason:(int64_t)a3
{
  _TtC10MobileMail14QuickReplyView *v3;

  v3 = self;
  QuickReplyView.resetWithReason(_:)(a3);

}

- (void)updatePlaceholderWithMessage:(id)a3
{
  id v4;
  _TtC10MobileMail14QuickReplyView *v5;

  v4 = a3;
  v5 = self;
  QuickReplyView.updatePlaceholder(message:)(a3);

}

- (void)addComposeView:(id)a3
{
  id v4;
  _TtC10MobileMail14QuickReplyView *v5;

  v4 = a3;
  v5 = self;
  QuickReplyView.addComposeView(_:)((UIView)a3);

}

- (void)setQuickReplyPlaceholderLabelState:(BOOL)a3
{
  _TtC10MobileMail14QuickReplyView *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)(a3);
  sub_100314474(v4 & 1);

}

- (void)updateQuickReplySendButtonTopOffset:(double)a3
{
  _TtC10MobileMail14QuickReplyView *v3;

  v3 = self;
  QuickReplyView.updateQuickReplySendButtonTopOffset(_:)(a3);

}

- (void)animationContext:(id)a3
{
  _TtC10MobileMail14QuickReplyView *v4;
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a3);
  v4 = self;
  v6 = swift_allocObject(&unk_10052CB08, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  QuickReplyView.animationContext(_:)((void (*)(_QWORD))sub_10031A2F8, v6);
  swift_release();

}

- (id)contentViewSnapshot
{
  _TtC10MobileMail14QuickReplyView *v2;
  id v5;

  v2 = self;
  v5 = (id)QuickReplyView.contentViewSnapshot()();

  return v5;
}

- (void)showSnapshot
{
  _TtC10MobileMail14QuickReplyView *v2;

  v2 = self;
  QuickReplyView.showSnapshot()();

}

- (void)removeSnapshotIfNeeded
{
  _TtC10MobileMail14QuickReplyView *v2;

  v2 = self;
  QuickReplyView.removeSnapshotIfNeeded()();

}

- (void)didTapContentView:(id)a3
{
  id v4;
  _TtC10MobileMail14QuickReplyView *v5;

  v4 = a3;
  v5 = self;
  sub_100318710((uint64_t)a3);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v4;
  _TtC10MobileMail14QuickReplyView *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC10MobileMail14QuickReplyView *v11;

  v11 = self;
  v10 = a3;
  v9 = type metadata accessor for Notification(0, a2);
  v7 = *(_QWORD *)(v9 - 8);
  v6 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (uint64_t)&v6 - v6;
  v4 = (id)__chkstk_darwin(v10);
  v5 = self;
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(v10);
  sub_100319248(v8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);

}

- (void).cxx_destruct
{
  sub_100221900((uint64_t)self + OBJC_IVAR____TtC10MobileMail14QuickReplyView_delegate);
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_sendButtonTopConstraint));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_contentViewLeadingConstraint));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_contentViewTrailingConstraint));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_contentViewTopConstraint));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_contentViewBottomConstraint));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_composeView));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10MobileMail14QuickReplyView_snapshot));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___contentView));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___placeholderLabel));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___sendButton));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___expandButton));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___buttonStackView));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___tapGesture));
}

- (UIButton)quickReplySendButton
{
  _TtC10MobileMail14QuickReplyView *v2;
  Class v5;

  v2 = self;
  v5 = QuickReplyView.quickReplySendButton.getter();

  return (UIButton *)v5;
}

- (UIButton)quickReplyExpandButton
{
  _TtC10MobileMail14QuickReplyView *v2;
  Class v5;

  v2 = self;
  v5 = QuickReplyView.quickReplyExpandButton.getter();

  return (UIButton *)v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  id v6;
  _TtC10MobileMail14QuickReplyView *v7;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = self;
  v12 = (id)QuickReplyView.pointerInteraction(_:styleFor:)((UIPointerInteraction)a3, (UIPointerRegion)a4);

  return v12;
}

@end
