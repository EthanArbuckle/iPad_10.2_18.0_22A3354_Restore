@implementation TPKTipContentTableViewCell

- (TPKContentView)tipView
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___TPKTipContentTableViewCell_tipView);
  swift_beginAccess();
  return (TPKContentView *)*v2;
}

- (void)setTipView:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.isa + OBJC_IVAR___TPKTipContentTableViewCell_tipView);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (TPKContentView)tipContentView
{
  TPKTipContentTableViewCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_248A98C8C();

  return (TPKContentView *)v3;
}

- (void)prepareForReuse
{
  char *v2;
  id *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TPKTipContentTableViewCell();
  v2 = (char *)v5.receiver;
  -[TPKTipContentTableViewCell prepareForReuse](&v5, sel_prepareForReuse);
  v3 = (id *)&v2[OBJC_IVAR___TPKTipContentTableViewCell_tipView];
  swift_beginAccess();
  if (*v3)
  {
    objc_msgSend(*v3, sel_removeFromSuperview);
    v4 = *v3;
  }
  else
  {
    v4 = 0;
  }
  *v3 = 0;

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  TPKTipContentTableViewCell *v8;
  void *v9;
  objc_class *v10;
  objc_super v11;

  v4 = sub_248A9BFBC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248A9BFB0();
  v8 = self;
  v9 = (void *)sub_248A9BFA4();
  v10 = (objc_class *)type metadata accessor for TPKTipContentTableViewCell();
  v11.receiver = v8;
  v11.super_class = v10;
  -[TPKTipContentTableViewCell _bridgedUpdateConfigurationUsingState:](&v11, sel__bridgedUpdateConfigurationUsingState_, v9);

  -[TPKTipContentTableViewCell setDirectionalLayoutMargins:](v8, sel_setDirectionalLayoutMargins_, *MEMORY[0x24BEBD250], *(double *)(MEMORY[0x24BEBD250] + 8), *(double *)(MEMORY[0x24BEBD250] + 16), *(double *)(MEMORY[0x24BEBD250] + 24));
  -[TPKTipContentTableViewCell setSeparatorInset:](v8, sel_setSeparatorInset_, *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)setContent:(id)a3 contentController:(id)a4
{
  id v6;
  id v7;
  TPKTipContentTableViewCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_248A98F30(v6, v7);

}

- (TPKTipContentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  TPKTipContentTableViewCell *v7;
  objc_super v9;

  if (a4)
  {
    sub_248A9C5C8();
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___TPKTipContentTableViewCell_tipView) = 0;
    v6 = (void *)sub_248A9C5A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___TPKTipContentTableViewCell_tipView) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TPKTipContentTableViewCell();
  v7 = -[TPKTipContentTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, v6);

  return v7;
}

- (TPKTipContentTableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___TPKTipContentTableViewCell_tipView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TPKTipContentTableViewCell();
  return -[TPKTipContentTableViewCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{

}

@end
