@implementation QueryClient

- (_TtC11WorkoutCore11QueryClient)init
{
  _TtC11WorkoutCore11QueryClient *result;

  result = (_TtC11WorkoutCore11QueryClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  return (id)WOWorkoutServerInterface();
}

- (void)connectionInvalidated
{
  uint64_t v2;
  _TtC11WorkoutCore11QueryClient *v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *oslog;

  v2 = qword_25598D160;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_22874C5D4();
  __swift_project_value_buffer(v4, (uint64_t)qword_255992D40);
  oslog = sub_22874C5BC();
  v5 = sub_22874CB44();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22858A000, oslog, v5, "healthd connection invalidated", v6, 2u);
    MEMORY[0x22E2B4580](v6, -1, -1);
  }

}

@end
