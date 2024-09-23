@implementation MapsFavoritesSuggestor

- (id)initFromResourceDepot:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MapsFavoritesSuggestor();
  return -[MapsFavoritesSuggestor init](&v4, "init");
}

- (char)suggestShortcutsOfType:(int64_t)a3 handler:(id)a4
{
  void (**v5)(void *, Class, _QWORD);
  _TtC4Maps22MapsFavoritesSuggestor *v6;
  Class isa;

  v5 = (void (**)(void *, Class, _QWORD))_Block_copy(a4);
  sub_10000E4BC(0, &qword_10149AA08, MapsSuggestionsShortcut_ptr);
  v6 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v5[2](v5, isa, 0);

  _Block_release(v5);
  return 1;
}

- (_TtC4Maps22MapsFavoritesSuggestor)init
{
  _TtC4Maps22MapsFavoritesSuggestor *result;

  result = (_TtC4Maps22MapsFavoritesSuggestor *)_swift_stdlib_reportUnimplementedInitializer("Maps.MapsFavoritesSuggestor", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
