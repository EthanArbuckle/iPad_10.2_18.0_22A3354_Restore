@implementation ActionTabSwitch

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI15ActionTabSwitch *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1D9AE011C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1D9F5E518((uint64_t)v9, v6, v7);
  sub_1D97B50A8((uint64_t)v6);

}

- (_TtC8VideosUI15ActionTabSwitch)init
{
  sub_1D9F5E6C0();
}

- (void).cxx_destruct
{

}

@end
