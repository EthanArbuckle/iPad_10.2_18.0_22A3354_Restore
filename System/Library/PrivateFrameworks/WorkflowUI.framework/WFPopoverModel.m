@implementation WFPopoverModel

- (void)displayFileActivityWith:(id)a3
{
  id v4;
  WFPopoverModel *v5;

  v4 = a3;
  v5 = self;
  sub_2200EF2C0();

}

- (WFPopoverModel)init
{
  PopoverModel.init()();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540A2A88);
  OUTLINED_FUNCTION_101_0(v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540A2A78);
  OUTLINED_FUNCTION_101_0(v4);
  v5 = (char *)self + OBJC_IVAR___WFPopoverModel__fileActivityModel;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540A2A58);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
