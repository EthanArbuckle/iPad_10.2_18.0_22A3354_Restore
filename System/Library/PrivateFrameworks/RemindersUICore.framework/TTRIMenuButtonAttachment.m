@implementation TTRIMenuButtonAttachment

- (_TtC15RemindersUICore24TTRIMenuButtonAttachment)init
{
  void *v3;
  _TtC15RemindersUICore24TTRIMenuButtonAttachment *v4;

  swift_beginAccess();
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  v3 = (void *)sub_1B4906A34();
  swift_bridgeObjectRelease();
  v4 = -[TTRIMenuButtonAttachment initWithData:ofType:](self, sel_initWithData_ofType_, 0, v3);

  return v4;
}

- (_TtC15RemindersUICore24TTRIMenuButtonAttachment)initWithData:(id)a3 ofType:(id)a4
{
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  if (!a3)
  {
    v13 = a4;
    v9 = 0xF000000000000000;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    v12 = 0;
    return (_TtC15RemindersUICore24TTRIMenuButtonAttachment *)TTRIMenuButtonAttachment.init(data:ofType:)((uint64_t)v5, v9, v10, v12);
  }
  v6 = a4;
  v7 = v5;
  v5 = (void *)sub_1B4903710();
  v9 = v8;

  if (!a4)
    goto LABEL_5;
LABEL_3:
  v10 = sub_1B4906A64();
  v12 = v11;

  return (_TtC15RemindersUICore24TTRIMenuButtonAttachment *)TTRIMenuButtonAttachment.init(data:ofType:)((uint64_t)v5, v9, v10, v12);
}

- (_TtC15RemindersUICore24TTRIMenuButtonAttachment)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B422BA44();
}

- (double)lineLayoutPadding
{
  objc_class *ObjectType;
  void *v4;
  _TtC15RemindersUICore24TTRIMenuButtonAttachment *v5;
  id v6;
  _QWORD *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_defaultMetrics);
  v7 = (Class *)((char *)&v5->super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore24TTRIMenuButtonAttachment_traitCollection);
  swift_beginAccess();
  objc_msgSend(v6, sel_scaledValueForValue_compatibleWithTraitCollection_, *v7, 2.0);
  v9 = v8;

  v13.receiver = v5;
  v13.super_class = ObjectType;
  -[TTRIMenuButtonAttachment lineLayoutPadding](&v13, sel_lineLayoutPadding);
  v11 = v10;

  if (v9 > v11)
    return v9;
  else
    return v11;
}

- (void)setLineLayoutPadding:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[TTRIMenuButtonAttachment setLineLayoutPadding:](&v4, sel_setLineLayoutPadding_, a3);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRIMenuButtonAttachment_traitCollection));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRIMenuButtonAttachment_textColor));
}

@end
