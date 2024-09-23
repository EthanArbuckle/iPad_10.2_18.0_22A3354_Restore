@implementation SummaryMetricGridView

- (_TtC9SeymourUI21SummaryMetricGridView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21SummaryMetricGridView *)sub_22B49D8A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SummaryMetricGridView();
  v4 = a3;
  v5 = v6.receiver;
  -[SummaryMetricGridView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  sub_22B49E104();

}

- (_TtC9SeymourUI21SummaryMetricGridView)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  _TtC9SeymourUI21SummaryMetricGridView *result;
  uint64_t v16;

  v5 = sub_22BA799E0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_reuseIdentifier);
  v10 = a3;
  sub_22BA799D4();
  v11 = sub_22BA799B0();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *v9 = v11;
  v9[1] = v13;
  v14 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_metrics) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_metricViews) = v14;

  result = (_TtC9SeymourUI21SummaryMetricGridView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_collectionView), sel_contentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_collectionView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_metrics))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9SeymourUI21SummaryMetricGridView *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_22BA79C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79BCC();
  v10 = a3;
  v11 = self;
  sub_22B49E448(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

@end
