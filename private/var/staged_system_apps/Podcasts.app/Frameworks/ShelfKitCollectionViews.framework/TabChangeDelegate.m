@implementation TabChangeDelegate

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC23ShelfKitCollectionViews17TabChangeDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_9D31C(v6, v7);

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC23ShelfKitCollectionViews17TabChangeDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_9E6BC();

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void (*v5)(id, _BOOL8);
  _BOOL8 v6;
  uint64_t v9;
  id v10;
  id v11;
  _TtC23ShelfKitCollectionViews17TabChangeDelegate *v12;

  v5 = *(void (**)(id, _BOOL8))((char *)&self->super.isa
                                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_navigationStackUpdateHandler);
  if (v5)
  {
    v6 = a5;
    v9 = *(_QWORD *)&self->storeDataProvider[OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_navigationStackUpdateHandler];
    v10 = a3;
    v11 = a4;
    v12 = self;
    sub_2C690((uint64_t)v5, v9);
    v5(v10, v6);
    sub_1D618((uint64_t)v5, v9);

  }
}

- (_TtC23ShelfKitCollectionViews17TabChangeDelegate)init
{
  _TtC23ShelfKitCollectionViews17TabChangeDelegate *result;

  result = (_TtC23ShelfKitCollectionViews17TabChangeDelegate *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.TabChangeDelegate", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_metricsPipeline;
  v4 = type metadata accessor for MetricsPipeline(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_storeDataProvider));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_navigationItem);
  sub_1D618(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_navigationStackUpdateHandler), *(_QWORD *)&self->storeDataProvider[OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_navigationStackUpdateHandler]);
  sub_1D618(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_tabChangeUpdateHandler), *(_QWORD *)&self->storeDataProvider[OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_tabChangeUpdateHandler]);
}

@end
