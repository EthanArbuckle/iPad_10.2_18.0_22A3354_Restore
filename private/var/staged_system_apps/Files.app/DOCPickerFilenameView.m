@implementation DOCPickerFilenameView

- (_TtC5Files16DOCPickerContext)pickerContext
{
  return (_TtC5Files16DOCPickerContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                 + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_pickerContext));
}

- (void)setPickerContext:(id)a3
{
  void *v4;
  _TtC5Files21DOCPickerFilenameView *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_pickerContext);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_pickerContext) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_1000D8284();
}

- (NSArray)tags
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags, v6, 0, 0);
  v3 = *v2;
  sub_10004F2F0(0, (unint64_t *)&unk_1006565A0, DOCTag_ptr);
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setTags:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  _TtC5Files21DOCPickerFilenameView *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char v13[24];

  v5 = sub_10004F2F0(0, (unint64_t *)&unk_1006565A0, DOCTag_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags, v13, 1, 0);
  v8 = *v7;
  *v7 = v6;
  v9 = self;
  swift_bridgeObjectRelease(v8);
  v12 = sub_1000D6F84(v10, v11);
  objc_msgSend(v12, "setNeedsUpdateConfiguration");

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtC5Files21DOCPickerFilenameView *v5;

  v4 = a3;
  v5 = self;
  sub_1000D6A50(v4, (uint64_t)v5);

}

- (void)textFieldDidChange:(id)a3
{
  id v4;
  _TtC5Files21DOCPickerFilenameView *v5;

  v4 = a3;
  v5 = self;
  sub_1000D6B74(v4);

}

- (UIButton)tagButton
{
  _TtC5Files21DOCPickerFilenameView *v2;
  uint64_t v3;
  id v4;

  v2 = self;
  v4 = sub_1000D6F84((uint64_t)v2, v3);

  return (UIButton *)v4;
}

- (void)setTagButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___tagButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___tagButton) = (Class)a3;
  v3 = a3;

}

- (_TtC5Files21DOCPickerFilenameView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000D9960();
}

- (void)layoutSubviews
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCPickerFilenameView(0);
  v2 = v6.receiver;
  -[DOCPickerFilenameView layoutSubviews](&v6, "layoutSubviews");
  sub_1000D6C9C();
  v5 = sub_1000D6F84(v3, v4);
  objc_msgSend(v5, "setNeedsUpdateConfiguration", v6.receiver, v6.super_class);

}

- (_TtC5Files21DOCPickerFilenameView)initWithFrame:(CGRect)a3
{
  _TtC5Files21DOCPickerFilenameView *result;

  result = (_TtC5Files21DOCPickerFilenameView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCPickerFilenameView", 27, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_delegate);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags));
  sub_1000DA034((uint64_t)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_metrics);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___stackedThumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___filenameButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___filenameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___filenameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView____lazy_storage___tagButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_activeConstraints));

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_presentingViewController);
}

- (void)tagEditor:(id)a3 userDidSelectTag:(id)a4
{
  _QWORD *v7;
  id v8;
  _TtC5Files21DOCPickerFilenameView *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _BYTE v16[24];

  v7 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags, v16, 33, 0);
  v8 = a4;
  swift_unknownObjectRetain(a3);
  v9 = self;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v9);
  v11 = *(_QWORD *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v10 = *(_QWORD *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v11 >= v10 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, v11 + 1, 1);
  v12 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v8);
  specialized Array._endMutation()(v12);
  v13 = swift_endAccess(v16);
  v15 = sub_1000D6F84(v13, v14);
  objc_msgSend(v15, "setNeedsUpdateConfiguration");
  swift_unknownObjectRelease(a3);

}

- (void)tagEditor:(id)a3 userDidDeselectTag:(id)a4
{
  uint64_t *v7;
  id v8;
  _TtC5Files21DOCPickerFilenameView *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _BYTE v18[24];

  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files21DOCPickerFilenameView_tags, v18, 33, 0);
  v8 = a4;
  swift_unknownObjectRetain(a3);
  v9 = self;
  v10 = sub_1000D9B74(v7, (uint64_t)v8);
  v11 = v10;
  v12 = *v7;
  if ((unint64_t)*v7 >> 62)
  {
    if (v12 < 0)
      v17 = *v7;
    else
      v17 = v12 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v7);
    v13 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease(v12);
    if (v13 >= v11)
      goto LABEL_3;
  }
  else
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13 >= v10)
    {
LABEL_3:
      sub_10045BBD8(v11, v13);
      v14 = swift_endAccess(v18);
      v16 = sub_1000D6F84(v14, v15);
      objc_msgSend(v16, "setNeedsUpdateConfiguration");
      swift_unknownObjectRelease(a3);

      return;
    }
  }
  __break(1u);
}

@end
