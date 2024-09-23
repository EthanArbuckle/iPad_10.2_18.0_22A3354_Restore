@implementation ParameterValuePickerModel

- (void)_reload
{
  _TtC14WorkflowEditor25ParameterValuePickerModel *v2;

  v2 = self;
  sub_2266C65D8();

}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4;
  _TtC14WorkflowEditor25ParameterValuePickerModel *v5;

  v4 = a3;
  v5 = self;
  sub_2266C88CC(v4);

}

- (_TtC14WorkflowEditor25ParameterValuePickerModel)init
{
  sub_2266C8D80();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255875138);
  OUTLINED_FUNCTION_2_12(v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255875140);
  OUTLINED_FUNCTION_2_12(v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255875148);
  OUTLINED_FUNCTION_2_12(v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558735A0);
  OUTLINED_FUNCTION_2_12(v6);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_29_4(OBJC_IVAR____TtC14WorkflowEditor25ParameterValuePickerModel_onSelectedStateChange);
  OUTLINED_FUNCTION_29_4(OBJC_IVAR____TtC14WorkflowEditor25ParameterValuePickerModel_onSelectMagicVariable);
  OUTLINED_FUNCTION_29_4(OBJC_IVAR____TtC14WorkflowEditor25ParameterValuePickerModel_onCancel);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor25ParameterValuePickerModel_defaultCollection));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor25ParameterValuePickerModel_reloadDebouncer));
}

@end
