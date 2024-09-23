@implementation TimeseriesInternal

- (id)runChangeDetectionWithEvents:(id)a3 test:(id)a4 lastRun:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TimeseriesInternal *v14;
  void *v15;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_222C389E0();
  sub_222C2DFE8(0, &qword_255771AF0);
  v11 = sub_222C3898C();
  if (a5)
  {
    sub_222C3895C();
    v12 = sub_222C38968();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 0, 1, v12);
  }
  else
  {
    v13 = sub_222C38968();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
  }
  v14 = self;
  Timeseries.runChangeDetection(events:test:lastRun:)(v10, v11, (uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_222C280C8((uint64_t)v9, &qword_2557717E8);
  v15 = (void *)sub_222C38980();
  swift_bridgeObjectRelease();
  return v15;
}

- (id)runBinomialTestTimeseriesWithSamples:(id)a3 sampleTimestamps:(id)a4 chunkMethod:(id)a5 minimumSampleSize:(id)a6 lastTimestampPreviousTest:(id)a7 significanceLevel:(id)a8 pHypothesis:(id)a9 error:(id *)a10
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  TimeseriesInternal *v26;
  void *v27;
  _QWORD v29[2];
  TimeseriesInternal *v30;

  v29[1] = a10;
  v30 = self;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222C2DFE8(0, &qword_255771AF8);
  v16 = sub_222C389E0();
  v17 = sub_222C38968();
  v18 = sub_222C389E0();
  v19 = sub_222C389B0();
  v21 = v20;
  if (a7)
  {
    sub_222C3895C();
    v22 = 0;
  }
  else
  {
    v22 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v15, v22, 1, v17);
  v23 = a6;
  v24 = a8;
  v25 = a9;
  v26 = v30;
  Timeseries.runBinomialTestTimeseries(samples:sampleTimestamps:chunkMethod:minimumSampleSize:lastTimestampPreviousTest:significanceLevel:pHypothesis:)(v16, v18, v19, v21, a6, v15, v24, v25);
  sub_222C280C8((uint64_t)v15, &qword_2557717E8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_222C2DFE8(0, &qword_255771B78);
  v27 = (void *)sub_222C389D4();
  swift_bridgeObjectRelease();
  return v27;
}

- (id)runZTestBinomialProportionsTimeseriesWithSamples:(id)a3 sampleTimestamps:(id)a4 chunkMethod:(id)a5 minimumSampleSize:(id)a6 lastTimestampPreviousTest:(id)a7 significanceLevel:(id)a8 error:(id *)a9
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  TimeseriesInternal *v25;
  void *v26;
  id *v28;

  v28 = a9;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222C2DFE8(0, &qword_255771AF8);
  v16 = sub_222C389E0();
  v17 = sub_222C38968();
  v18 = sub_222C389E0();
  v19 = sub_222C389B0();
  v21 = v20;
  if (a7)
  {
    sub_222C3895C();
    v22 = 0;
  }
  else
  {
    v22 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v15, v22, 1, v17);
  v23 = a6;
  v24 = a8;
  v25 = self;
  Timeseries.runZTestBinomialProportionsTimeseries(samples:sampleTimestamps:chunkMethod:minimumSampleSize:lastTimestampPreviousTest:significanceLevel:)(v16, v18, v19, v21, a6, (uint64_t)v15, v24);
  sub_222C280C8((uint64_t)v15, &qword_2557717E8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_222C2DFE8(0, &qword_255771B70);
  v26 = (void *)sub_222C389D4();
  swift_bridgeObjectRelease();
  return v26;
}

- (TimeseriesInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Timeseries();
  return -[TimeseriesInternal init](&v3, sel_init);
}

@end
