@implementation BKStandardItemsCacheManager

+ (void)prewarm
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (qword_1009CE408 != -1)
    swift_once(&qword_1009CE408, sub_10006B6D0);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100048F64(v0, (uint64_t)qword_1009E1C98);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.info.getter(v2);
  if (os_log_type_enabled(v2, v3))
  {
    v4 = swift_slowAlloc(22, -1);
    v5 = swift_slowAlloc(64, -1);
    v12 = v5;
    *(_DWORD *)v4 = 136315394;
    v11 = sub_100040F58(0x286D726177657270, 0xE900000000000029, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v4 + 4, v4 + 12);
    *(_WORD *)(v4 + 12) = 2080;
    v11 = sub_100040F58(0xD000000000000019, 0x8000000100738ED0, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v4 + 14, v4 + 22);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s %s prewarm start", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy(v5, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1, -1);
    swift_slowDealloc(v4, -1, -1);
  }

  if (qword_1009CEBA8 != -1)
    v6 = swift_once(&qword_1009CEBA8, sub_100068CE4);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.info.getter(v7);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc(22, -1);
    v10 = swift_slowAlloc(64, -1);
    v12 = v10;
    *(_DWORD *)v9 = 136315394;
    v11 = sub_100040F58(0x286D726177657270, 0xE900000000000029, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v9 + 4, v9 + 12);
    *(_WORD *)(v9 + 12) = 2080;
    v11 = sub_100040F58(0xD000000000000019, 0x8000000100738ED0, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v9 + 14, v9 + 22);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s %s prewarm end", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy(v10, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }

}

- (BKStandardItemsCacheManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StandardItemsCacheManager();
  return -[BKStandardItemsCacheManager init](&v3, "init");
}

@end
