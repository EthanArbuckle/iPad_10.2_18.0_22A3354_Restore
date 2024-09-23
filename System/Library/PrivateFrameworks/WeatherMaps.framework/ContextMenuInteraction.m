@implementation ContextMenuInteraction

- (_TtC11WeatherMaps22ContextMenuInteraction)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  sub_1DBEABDA0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22ContextMenuInteraction_strongDelegate));
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22ContextMenuInteraction_weatherDataSource);
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22ContextMenuInteraction_weatherDelegate);
}

@end
