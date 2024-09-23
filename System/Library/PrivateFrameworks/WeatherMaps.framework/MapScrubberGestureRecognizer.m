@implementation MapScrubberGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1DBFB3BF4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_1DBFB38CC);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1DBFB3BF4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_1DBFB3A0C);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1DBFB3BF4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_1DBFB3B48);
}

- (_TtC11WeatherMaps28MapScrubberGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1DBFF8B18();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC11WeatherMaps28MapScrubberGestureRecognizer *)sub_1DBFB3DC0((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps28MapScrubberGestureRecognizer_feedbackGenerator));
}

@end
