@implementation WFActionViewModel

- (void)dealloc
{
  WFActionViewModel *v2;

  v2 = self;
  ActionViewModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_60_6();
  OUTLINED_FUNCTION_60_6();
  sub_22682FA08(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFActionViewModel_parameterSummary), *(_QWORD *)&self->action[OBJC_IVAR___WFActionViewModel_parameterSummary], *(_QWORD *)&self->observingParameters[OBJC_IVAR___WFActionViewModel_parameterSummary], *(_QWORD *)&self->visibleParameters[OBJC_IVAR___WFActionViewModel_parameterSummary]);
  OUTLINED_FUNCTION_60_6();
  OUTLINED_FUNCTION_60_6();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558734E8);
  OUTLINED_FUNCTION_38_11(v3);
  OUTLINED_FUNCTION_42_17(OBJC_IVAR___WFActionViewModel__isExpanded);
  OUTLINED_FUNCTION_42_17(OBJC_IVAR___WFActionViewModel__showOutput);
  v4 = (char *)self + OBJC_IVAR___WFActionViewModel__resourceError;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255881E40);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255881E38);
  OUTLINED_FUNCTION_38_11(v6);
  OUTLINED_FUNCTION_42_17(OBJC_IVAR___WFActionViewModel__accessResourcesAllowingMultipleAccounts);
  swift_release();
  swift_release();
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v6;
  WFActionViewModel *v7;

  sub_22688E220();
  v6 = a3;
  v7 = self;
  sub_22682AB88();

  swift_bridgeObjectRelease();
}

- (void)actionIconDidChange:(id)a3
{
  id v4;
  WFActionViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_22682AEA4();

}

- (void)actionNameDidChange:(id)a3
{
  id v4;
  WFActionViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_22682AF04();

}

- (void)actionVisibleParametersDidChange:(id)a3
{
  id v4;
  WFActionViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_22682AF64();

}

- (void)actionOutputDetailsDidChange:(id)a3
{
  id v4;
  WFActionViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_22682B1BC();

}

- (void)actionReloadAuxiliaryButton:(id)a3
{
  id v4;
  WFActionViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_22682B21C();

}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4;
  WFActionViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_22682B4D8();

}

- (void)resourcesDidChange:(id)a3
{
  id v4;
  WFActionViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_22682B7AC();

}

- (void)favoritesDidChange
{
  WFActionViewModel *v2;

  v2 = self;
  sub_22682B99C();

}

- (void)pasteboardDidChange
{
  WFActionViewModel *v2;

  v2 = self;
  sub_22682BA88();

}

- (WFActionViewModel)init
{
  ActionViewModel.init()();
}

@end
