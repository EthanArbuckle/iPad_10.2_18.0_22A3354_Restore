@implementation PIRAWTempTintSampler

- (PIRAWTempTintSampler)initWithComposition:(id)a3 responseQueue:(id)a4
{
  PIRAWTempTintSampler *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PIRAWTempTintSampler;
  v4 = -[NUTagColorSampler initWithComposition:tag:responseQueue:](&v7, sel_initWithComposition_tag_responseQueue_, a3, CFSTR("/RAW/SushiLevel1"), a4);
  objc_msgSend(MEMORY[0x1E0D52068], "sRGBLinearColorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUColorSampler setColorSpace:](v4, "setColorSpace:", v5);

  return v4;
}

- (NSString)tag
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/Master%@"), CFSTR("/RAW/SushiLevel1"));
}

- (id)_pipelineFilters
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  +[PIPipelineFilters sourceFilterNoOrientation](PIPipelineFilters, "sourceFilterNoOrientation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  +[PIPipelineFilters sushiLevel1Filter](PIPipelineFilters, "sushiLevel1Filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
