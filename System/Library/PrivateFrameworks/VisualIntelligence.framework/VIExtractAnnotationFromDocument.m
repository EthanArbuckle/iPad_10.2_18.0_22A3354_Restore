@implementation VIExtractAnnotationFromDocument

VITextAnnotation *___VIExtractAnnotationFromDocument_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  VITextAnnotation *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  int v14;
  double v15;
  VITextAnnotation *v16;

  v2 = a2;
  v3 = [VITextAnnotation alloc];
  objc_msgSend(v2, "getTranscript");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v2, "confidence");
  v14 = v13;

  LODWORD(v15) = v14;
  v16 = -[VITextAnnotation initWithText:normalizedBoundingBox:confidence:](v3, "initWithText:normalizedBoundingBox:confidence:", v4, v6, v8, v10, v12, v15);

  return v16;
}

@end
