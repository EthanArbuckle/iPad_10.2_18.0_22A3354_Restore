@implementation WeatherMapURLCache

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC11WeatherMaps18WeatherMapURLCache *v11;
  uint64_t v12;

  v6 = sub_1DBFF63D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DBFF63A0();
  v10 = a3;
  v11 = self;
  sub_1DBF8673C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)cachedResponseForRequest:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11WeatherMaps18WeatherMapURLCache *v8;
  id v9;
  uint64_t v11;

  v4 = sub_1DBFF63D0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DBFF63A0();
  v8 = self;
  v9 = sub_1DBF86998();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4
{
  id v6;
  id v7;
  _TtC11WeatherMaps18WeatherMapURLCache *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DBF86AF4((uint64_t)v6, v7);

}

- (void)getCachedResponseForDataTask:(NSURLSessionDataTask *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSURLSessionDataTask *v8;
  _TtC11WeatherMaps18WeatherMapURLCache *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1DBF87194((uint64_t)&unk_1F0334A68, (uint64_t)v7);
}

- (_TtC11WeatherMaps18WeatherMapURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 diskPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a5)
  {
    v7 = sub_1DBFF81A0();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  return (_TtC11WeatherMaps18WeatherMapURLCache *)sub_1DBF87270(a3, a4, v7, v9);
}

- (_TtC11WeatherMaps18WeatherMapURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 directoryURL:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF9B78);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1DBFF676C();
    v11 = sub_1DBFF6784();
    v12 = 0;
  }
  else
  {
    v11 = sub_1DBFF6784();
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v10, v12, 1, v11);
  return (_TtC11WeatherMaps18WeatherMapURLCache *)sub_1DBF87368(a3, a4, (uint64_t)v10);
}

- (_TtC11WeatherMaps18WeatherMapURLCache)init
{
  return (_TtC11WeatherMaps18WeatherMapURLCache *)sub_1DBF87540();
}

@end
