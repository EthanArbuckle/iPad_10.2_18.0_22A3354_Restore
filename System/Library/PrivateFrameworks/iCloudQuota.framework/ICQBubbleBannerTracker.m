@implementation ICQBubbleBannerTracker

+ (ICQBubbleBannerTracker)shared
{
  if (qword_1EFA5BAD0 != -1)
    swift_once();
  return (ICQBubbleBannerTracker *)(id)qword_1EFA5BAD8;
}

- (void)trackLastDisplayedAtTheTop:(id)a3 date:(id)a4 reason:(id)a5
{
  sub_1CDF1BF48(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, 0);
}

- (void)trackLastDismissed:(id)a3 date:(id)a4 reason:(id)a5
{
  sub_1CDF1BF48(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, 1);
}

- (BOOL)account:(id)a3 shouldDisplay:(id)a4 forReason:(id)a5 dismissedInSession:(BOOL)a6 supressUntil:(double)a7
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  ICQBubbleBannerTracker *v21;
  uint64_t v22;
  char v23;
  uint64_t v25;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5ADB0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1CDF32A54();
    v15 = sub_1CDF32A78();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  else
  {
    v16 = sub_1CDF32A78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v14, 1, 1, v16);
  }
  v17 = sub_1CDF32D24();
  v19 = v18;
  v20 = a3;
  v21 = self;
  v23 = sub_1CDF1C330(v20, a7, v22, v17, v19, a6);

  swift_bridgeObjectRelease();
  sub_1CDF16A0C((uint64_t)v14, &qword_1EFA5ADB0);
  return v23 & 1;
}

- (id)account:(id)a3 lastUpdated:(id)a4 decayUntil:(double)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  ICQBubbleBannerTracker *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5ADB0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1CDF32D24();
  v13 = v12;
  v14 = a3;
  v15 = self;
  sub_1CDF1D434(v14, v11, v13, v10, *(uint64_t *)&a5);

  swift_bridgeObjectRelease();
  v16 = sub_1CDF32A78();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16) != 1)
  {
    v18 = (void *)sub_1CDF32A3C();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v16);
  }
  return v18;
}

- (ICQBubbleBannerTracker)init
{
  ICQBubbleBannerTracker *result;

  result = (ICQBubbleBannerTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
