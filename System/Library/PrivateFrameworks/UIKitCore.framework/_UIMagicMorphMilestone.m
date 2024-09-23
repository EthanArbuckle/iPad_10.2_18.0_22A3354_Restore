@implementation _UIMagicMorphMilestone

- (double)value
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____UIMagicMorphMilestone_value);
}

- (id)action
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)&self->property[OBJC_IVAR____UIMagicMorphMilestone_action];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIMagicMorphMilestone_action);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_18530A69C;
  v5[3] = &block_descriptor_52;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (_UIMagicMorphMilestone)init
{
  _UIMagicMorphMilestone *result;

  result = (_UIMagicMorphMilestone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
