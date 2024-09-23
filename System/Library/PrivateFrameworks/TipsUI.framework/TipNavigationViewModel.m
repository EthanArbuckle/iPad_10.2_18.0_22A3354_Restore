@implementation TipNavigationViewModel

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR___TipNavigationViewModel__currentTip;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___TipNavigationViewModel__tips;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (TipNavigationViewModel)init
{
  return (TipNavigationViewModel *)TipNavigationViewModel.init()();
}

- (TPSTip)currentTip
{
  TipNavigationViewModel *v3;
  id v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_20CFCC668();
  swift_release();
  swift_release();

  return (TPSTip *)v5;
}

- (void)setCurrentTip:(id)a3
{
  id v5;
  TipNavigationViewModel *v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v5 = a3;
  v6 = self;
  sub_20CFCC674();
}

- (NSArray)tips
{
  TipNavigationViewModel *v3;
  void *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_20CFCC668();
  swift_release();
  swift_release();

  sub_20CFBB55C();
  v4 = (void *)sub_20CFCD184();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (void)setTips:(id)a3
{
  TipNavigationViewModel *v4;

  sub_20CFBB55C();
  sub_20CFCD190();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_20CFCC674();
}

- (int64_t)currentTipIndex
{
  TipNavigationViewModel *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_20CFCB2B8();

  return v3;
}

- (BOOL)canGoBack
{
  TipNavigationViewModel *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_20CFCB55C();

  return v3;
}

- (BOOL)canGoNext
{
  TipNavigationViewModel *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL result;
  unint64_t v6;

  v2 = self;
  v3 = sub_20CFCB2B8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_20CFCD3D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }

  result = swift_bridgeObjectRelease();
  if (!__OFSUB__(v4, 1))
    return v3 < v4 - 1;
  __break(1u);
  return result;
}

- (void)goBack
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  TipNavigationViewModel *v5;

  v5 = self;
  v2 = sub_20CFCB2B8();
  v3 = __OFSUB__(v2, 1);
  v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    sub_20CFCB8C8(v4);

  }
}

- (void)goNext
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  TipNavigationViewModel *v5;

  v5 = self;
  v2 = sub_20CFCB2B8();
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    sub_20CFCB8C8(v4);

  }
}

- (void)selectTipAtIndex:(int64_t)a3
{
  TipNavigationViewModel *v4;

  v4 = self;
  sub_20CFCB8C8(a3);

}

- (void)updateSelectedTip:(id)a3 forceUpdate:(BOOL)a4
{
  TipNavigationViewModel *v7;
  id v8;

  v8 = a3;
  v7 = self;
  sub_20CFCBB10(a3, a4);

}

@end
