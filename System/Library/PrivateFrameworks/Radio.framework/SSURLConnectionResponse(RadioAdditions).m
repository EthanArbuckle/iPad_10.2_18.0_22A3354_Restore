@implementation SSURLConnectionResponse(RadioAdditions)

- (id)radio_decompressedBodyData
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "URLResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bodyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "radio_decompressedDataWithBodyData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
