@implementation CoachingView

- (void)coachingOverlayViewWillActivate:(id)a3
{
  id v4;
  _TtC7Measure12CoachingView *v5;

  v4 = a3;
  v5 = self;
  sub_100041620();

}

- (void)coachingOverlayViewDidDeactivate:(id)a3
{
  uint64_t (*v4)(_BYTE *, __n128);
  id v5;
  _TtC7Measure12CoachingView *v6;
  __n128 v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t v9;
  Swift::String v10;
  _BYTE v11[32];

  v4 = *(uint64_t (**)(_BYTE *, __n128))(**(_QWORD **)((char *)self + qword_10047D5B0) + 400);
  v5 = a3;
  v6 = self;
  v7 = swift_retain();
  v8 = (void (*)(_BYTE *, _QWORD))v4(v11, v7);
  *(_BYTE *)(v9 + 3) = 0;
  v8(v11, 0);
  -[CoachingView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0, swift_release().n128_f64[0]);
  if (qword_10047AA88 != -1)
    swift_once(&qword_10047AA88, sub_1000E14D8);
  v10._object = (void *)0x80000001003D9E00;
  v10._countAndFlagsBits = 0xD00000000000001DLL;
  Log.default(_:isPrivate:)(v10, 0);

}

- (void)coachingOverlayViewDidRequestSessionReset:(id)a3
{
  id v4;
  _TtC7Measure12CoachingView *v5;

  v4 = a3;
  v5 = self;
  sub_100041730();

}

@end
