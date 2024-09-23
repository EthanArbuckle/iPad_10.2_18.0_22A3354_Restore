@implementation ODCurareEvaluationAndReportingModuleInternal

- (ODCurareEvaluationAndReportingModuleInternal)initWithBundleIdentifier:(id)a3 dataProviderInstance:(id)a4 evaluationInstance:(id)a5 personalizationInstance:(id)a6 pruningPolicy:(id)a7 error:(id *)a8
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v12 = sub_2272E1EC0();
  v14 = v13;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v15 = a7;
  return (ODCurareEvaluationAndReportingModuleInternal *)ODCurareEvaluationAndReportingModule.init(bundleIdentifier:dataProviderInstance:evaluationInstance:personalizationInstance:pruningPolicy:)(v12, v14, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7);
}

- (id)getSelectedModelAndReturnError:(id *)a3
{
  ODCurareEvaluationAndReportingModuleInternal *v4;
  ODCurareCandidateModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = self;
  ODCurareEvaluationAndReportingModule.getSelectedModel()(v5);
  v8 = v7;

  if (v6)
  {
    if (a3)
    {
      v9 = (void *)sub_2272E1C74();

      v10 = v9;
      v8 = 0;
      *a3 = v9;
    }
    else
    {

      v8 = 0;
    }
  }
  return v8;
}

- (id)trainAndEvaluateModelsWithCandidateModels:(id)a3 personalizationPolicy:(id)a4 modelSelectionPolicy:(id)a5 error:(id *)a6
{
  uint64_t v10;
  objc_class *v11;
  NSArray *v12;
  ODCurareEvaluationAndReportingModuleInternal *v13;
  NSNumber v14;
  NSNumber v15;
  void *v16;
  id v17;
  uint64_t v19;
  ODCurarePersonalizationPolicy v20;

  sub_2272A2DF0(0, &qword_253F8AAE0);
  v10 = sub_2272E1F98();
  v11 = (objc_class *)a4;
  v12 = (NSArray *)a5;
  v13 = self;
  v20.super.isa = v11;
  v20._hyperparameterSelectionPolicy = v12;
  v14.super.super.isa = ODCurareEvaluationAndReportingModule.trainAndEvaluateModels(candidateModels:personalizationPolicy:modelSelectionPolicy:)((Swift::OpaquePointer)v10, v20, *(ODCurareModelSelectionPolicy *)(&v19 - 3)).super.super.isa;
  swift_bridgeObjectRelease();

  if (v15.super.super.isa)
  {
    if (a6)
    {
      v16 = (void *)sub_2272E1C74();

      v17 = v16;
      v14.super.super.isa = 0;
      *a6 = v16;
    }
    else
    {

      v14.super.super.isa = 0;
    }
  }
  return v14.super.super.isa;
}

- (id)evaluateDefaultModelWithDefaultModelPath:(id)a3 modelConfiguration:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  ODCurareEvaluationAndReportingModuleInternal *v12;
  void *v13;
  uint64_t v15;

  v7 = sub_2272E1D40();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2272E1D1C();
  v11 = a4;
  v12 = self;
  v13 = (void *)ODCurareEvaluationAndReportingModule.evaluateDefaultModel(defaultModelPath:modelConfiguration:)((uint64_t)v10, a4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (id)trainAndEvaluateAdaptedModelsWithAdaptableModelPath:(id)a3 modelConfiguration:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  ODCurareEvaluationAndReportingModuleInternal *v12;
  void *v13;
  uint64_t v15;

  v7 = sub_2272E1D40();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2272E1D1C();
  v11 = a4;
  v12 = self;
  v13 = (void *)ODCurareEvaluationAndReportingModule.trainAndEvaluateAdaptedModels(adaptableModelPath:modelConfiguration:)((uint64_t)v12, a4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (BOOL)generatePETReportAndReturnError:(id *)a3
{
  ODCurareEvaluationAndReportingModuleInternal *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = self;
  ODCurareEvaluationAndReportingModule.generatePETReport()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)sub_2272E1C74();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
  }
  return v5 == 0;
}

- (id)getEvaluationResults
{
  ODCurareEvaluationAndReportingModuleInternal *v2;
  void *v3;

  v2 = self;
  ODCurareEvaluationAndReportingModule.getEvaluationResults()();

  v3 = (void *)sub_2272E1E54();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)dealloc
{
  ODCurareEvaluationAndReportingModuleInternal *v2;
  objc_super v3;

  v2 = self;
  swift_bridgeObjectRetain();
  sub_2272DE980();
  swift_bridgeObjectRelease();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ODCurareEvaluationAndReportingModule();
  -[ODCurareEvaluationAndReportingModuleInternal dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_temporaryDirectory;
  v4 = sub_2272E1D40();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_frameworkExecutionDate;
  v6 = sub_2272E1E0C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_2272A2550((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_frameworkPersonalizationDate, &qword_253F8A738);
  sub_2272A2550((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_lastPersonalizationSampleDate, &qword_253F8A738);
  sub_2272A2550((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_frameworkEvaluationDate, &qword_253F8A738);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_modelStore);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_defaultModelEvaluationSummary));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_frameworkExecutionMetadata));
  sub_2272A2550((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_frameworkExecutionSelectedModelURL, &qword_253F8A720);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_metadataStore);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_modelEvaluationSummaryStore);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_personalizationResult));
  sub_2272A2550((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_personalizedModelPath, &qword_253F8A720);
  swift_bridgeObjectRelease();
}

- (ODCurareEvaluationAndReportingModuleInternal)init
{
  ODCurareEvaluationAndReportingModuleInternal *result;

  result = (ODCurareEvaluationAndReportingModuleInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
