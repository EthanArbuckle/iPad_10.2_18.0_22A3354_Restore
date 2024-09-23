@implementation ContextMenuInteractionDelegate

- (_TtC11WeatherMaps30ContextMenuInteractionDelegate)init
{
  return (_TtC11WeatherMaps30ContextMenuInteractionDelegate *)sub_1DBEE5FC0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11WeatherMaps30ContextMenuInteractionDelegate_currentPreviewViewController));
  sub_1DBEE7684((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps30ContextMenuInteractionDelegate_location);
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC11WeatherMaps30ContextMenuInteractionDelegate *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1DBEE6190();

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v5;

  sub_1DBEE75B0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, v5, sub_1DBEE6494);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC11WeatherMaps30ContextMenuInteractionDelegate *v8;
  char *v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = sub_1DBEE6588(v7, x, y);

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC11WeatherMaps30ContextMenuInteractionDelegate *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1DBEE7168(v6, v7);

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC11WeatherMaps30ContextMenuInteractionDelegate *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1DBEE7168(v6, v7);

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v5;

  sub_1DBEE75B0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, v5, (void (*)(id))sub_1DBEE7450);
}

@end
