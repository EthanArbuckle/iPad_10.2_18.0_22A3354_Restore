@implementation WFParameterHostingView

- (WFParameterHostingView)initWithFrame:(CGRect)a3
{
  return (WFParameterHostingView *)ParameterHostingView.init(frame:)();
}

- (WFParameterHostingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_226842960();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  WFParameterHostingView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_2268429EC();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)configureViewWithParameter:(id)a3 state:(id)a4 processing:(BOOL)a5 shouldFocus:(BOOL)a6 variableProvider:(id)a7 updateBlock:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  void *v14;
  uint64_t v15;
  id v16;
  WFParameterHostingView *v17;

  v9 = a6;
  v10 = a5;
  v14 = _Block_copy(a8);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  v16 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v17 = self;
  sub_226842A64(v16, (uint64_t)a4, v10, v9, (uint64_t)a7, (uint64_t)sub_226843CD0, v15);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

- (void)configureConfigurationUIViewWithParameter:(id)a3 state:(id)a4 processing:(BOOL)a5 shouldFocus:(BOOL)a6 variableProvider:(id)a7 widgetFamily:(int64_t)a8 fillProvider:(id)a9 overridingCellBackgroundColor:(id)a10 updateBlock:(id)aBlock
{
  void *v18;
  id v19;
  id v20;
  WFParameterHostingView *v21;
  id v22;
  id v23;
  WFParameterHostingView *v24;
  uint64_t v25;
  _OWORD v26[2];

  v18 = _Block_copy(aBlock);
  if (a9)
  {
    v19 = a3;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v20 = a10;
    v21 = self;
    swift_unknownObjectRetain();
    sub_22688E904();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v26, 0, sizeof(v26));
    v22 = a3;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v23 = a10;
    v24 = self;
  }
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v18;
  sub_226842B7C(a3, (uint64_t)a4, a5, a6, (uint64_t)a7, a8, (uint64_t)v26, a10, (uint64_t)sub_226843948, v25);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  sub_226674E94((uint64_t)v26, (uint64_t *)&unk_255872590);
}

- (void)attachToParentViewController:(id)a3
{
  id v5;
  WFParameterHostingView *v6;

  v5 = a3;
  v6 = self;
  sub_226843608(a3);

}

- (void)detachFromParentViewController
{
  WFParameterHostingView *v2;

  v2 = self;
  sub_226843664();

}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
