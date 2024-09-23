@implementation ODCurareInterfaceModuleInternal

- (ODCurareInterfaceModuleInternal)initWithBundleIdentifier:(id)a3 evaluationInstance:(id)a4 personalizationInstance:(id)a5 pruningPolicy:(id)a6 error:(id *)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v10 = sub_2272E1EC0();
  v12 = v11;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v13 = a6;
  return (ODCurareInterfaceModuleInternal *)ODCurareInterfaceModule.init(bundleIdentifier:evaluationInstance:personalizationInstance:pruningPolicy:)(v10, v12, (uint64_t)a4, (uint64_t)a5, a6);
}

- (id)personalizeModelsWithPersonalizableModels:(id)a3 personalizationPolicy:(id)a4 error:(id *)a5
{
  uint64_t v8;
  objc_class *v9;
  ODCurareInterfaceModuleInternal *v10;
  NSNumber v11;
  NSNumber v12;
  void *v13;
  id v14;
  ODCurarePersonalizationPolicy v16;

  sub_2272A2DF0(0, &qword_253F8AAE0);
  v8 = sub_2272E1F98();
  v9 = (objc_class *)a4;
  v10 = self;
  v16.super.isa = v9;
  v11.super.super.isa = ODCurareInterfaceModule.personalizeModels(personalizableModels:personalizationPolicy:)((Swift::OpaquePointer)v8, v16).super.super.isa;
  swift_bridgeObjectRelease();

  if (v12.super.super.isa)
  {
    if (a5)
    {
      v13 = (void *)sub_2272E1C74();

      v14 = v13;
      v11.super.super.isa = 0;
      *a5 = v13;
    }
    else
    {

      v11.super.super.isa = 0;
    }
  }
  return v11.super.super.isa;
}

- (id)evaluateModelsWithEvaluationModels:(id)a3 error:(id *)a4
{
  uint64_t v6;
  ODCurareInterfaceModuleInternal *v7;
  NSNumber v8;
  NSNumber v9;
  void *v10;
  id v11;

  sub_2272A2DF0(0, &qword_253F8AAE0);
  v6 = sub_2272E1F98();
  v7 = self;
  v8.super.super.isa = ODCurareInterfaceModule.evaluateModels(evaluationModels:)((Swift::OpaquePointer)v6).super.super.isa;
  swift_bridgeObjectRelease();

  if (v9.super.super.isa)
  {
    if (a4)
    {
      v10 = (void *)sub_2272E1C74();

      v11 = v10;
      v8.super.super.isa = 0;
      *a4 = v10;
    }
    else
    {

      v8.super.super.isa = 0;
    }
  }
  return v8.super.super.isa;
}

- (id)getSelectedModelWithDefaultModel:(id)a3 selectionPolicy:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  ODCurareInterfaceModuleInternal *v11;
  ODCurareCandidateModel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = self;
  ODCurareInterfaceModule.getSelectedModel(defaultModel:selectionPolicy:)(v12, (ODCurareCandidateModel_optional *)a3, (ODCurareModelSelectionPolicy_optional *)a4);
  v15 = v14;

  if (v13)
  {
    if (a5)
    {
      v16 = (void *)sub_2272E1C74();

      v17 = v16;
      v15 = 0;
      *a5 = v16;
    }
    else
    {

      v15 = 0;
    }
  }
  return v15;
}

- (BOOL)generateCAReportAndReturnError:(id *)a3
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  ODCurareInterfaceModuleInternal *v9;

  v3 = *((_BYTE *)&self->super.isa + OBJC_IVAR___ODCurareInterfaceModuleInternal_shouldReportFailure);
  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ODCurareInterfaceModuleInternal_clientBundleIdentifier);
  v5 = *(_QWORD *)&self->evaluationInstance[OBJC_IVAR___ODCurareInterfaceModuleInternal_clientBundleIdentifier];
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ODCurareInterfaceModuleInternal_modelStore);
  v7 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ODCurareInterfaceModuleInternal_metadataStore);
  v8 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ODCurareInterfaceModuleInternal_modelEvaluationSummaryStore);
  v9 = self;
  sub_2272CC420(v4, v5, v6, v7, v8, v3);

  return 1;
}

- (ODCurareInterfaceModuleInternal)init
{
  ODCurareInterfaceModuleInternal *result;

  result = (ODCurareInterfaceModuleInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_temporaryDirectory;
  v4 = sub_2272E1D40();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_frameworkExecutionDate;
  v6 = sub_2272E1E0C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_2272A2550((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_frameworkPersonalizationDate, &qword_253F8A738);
  sub_2272A2550((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_lastPersonalizationSampleDate, &qword_253F8A738);
  sub_2272A2550((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_frameworkEvaluationDate, &qword_253F8A738);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ODCurareInterfaceModuleInternal_defaultModelEvaluationSummary));

  sub_2272A2550((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_frameworkExecutionSelectedModelURL, &qword_253F8A720);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_modelStore);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_metadataStore);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_modelEvaluationSummaryStore);
}

@end
