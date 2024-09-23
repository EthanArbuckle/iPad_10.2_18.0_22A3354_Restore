@implementation VIStreamingSession

- (VIStreamingSession)init
{
  VIStreamingSession *v2;
  uint64_t v3;
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VIStreamingSession;
  v2 = -[VIStreamingSession init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    compatService = v2->_compatService;
    v2->_compatService = (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *)v3;

  }
  return v2;
}

- (VIStreamingSession)initWithCompatService:(id)a3
{
  id v5;
  VIStreamingSession *v6;
  VIStreamingSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIStreamingSession;
  v6 = -[VIStreamingSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_compatService, a3);

  return v7;
}

- (id)parseWithRequest:(id)a3 error:(id *)a4
{
  _TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *compatService;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VIStreamingParseResult *v12;

  compatService = self->_compatService;
  v6 = a3;
  objc_msgSend(v6, "frame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "normalizedRegionOfInterest");
  -[VisualIntelligenceServiceCompatible detectWithImage:regionOfInterest:error:](compatService, "detectWithImage:regionOfInterest:error:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)VICompactMapArray(v10, &__block_literal_global_0);
  v12 = -[VIStreamingParseResult initWithDetectedObjects:]([VIStreamingParseResult alloc], "initWithDetectedObjects:", v11);

  return v12;
}

VIStreamingDetectedObject *__45__VIStreamingSession_parseWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  VIStreamingDetectedObject *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  VIStreamingDetectedObject *v13;

  v2 = a2;
  v3 = [VIStreamingDetectedObject alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = -[VIStreamingDetectedObject initWithObjectUUID:normalizedBoundingBox:domainKey:glyphName:displayLabel:](v3, "initWithObjectUUID:normalizedBoundingBox:domainKey:glyphName:displayLabel:", v4, CFSTR("com.apple.argos.domain_key.book"), CFSTR("book.closed.fill"), CFSTR("result"), v6, v8, v10, v12);
  return v13;
}

- (id)extractSignalsWithRequest:(id)a3 error:(id *)a4
{
  VIImageRegion *v4;
  VIImageRegion *v5;
  VIStreamingSignalExtractionResult *v6;

  v4 = [VIImageRegion alloc];
  v5 = -[VIImageRegion initWithRegionOfInterest:domainInfo:](v4, "initWithRegionOfInterest:domainInfo:", MEMORY[0x1E0C9AA60], *(double *)&VIIdentityRect, unk_1EFEA9B60, *(double *)&qword_1EFEA9B68, unk_1EFEA9B70);
  v6 = -[VIStreamingSignalExtractionResult initWithImageRegion:payload:]([VIStreamingSignalExtractionResult alloc], "initWithImageRegion:payload:", v5, 0);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatService, 0);
}

@end
